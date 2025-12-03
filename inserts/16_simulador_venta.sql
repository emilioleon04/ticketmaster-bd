DO $$ 
DECLARE
    -- CONFIGURACIÓN
    NUM_ORDENES CONSTANT INTEGER := 5000; -- Ventas masivas
    
    -- CONSTANTES
    FIXED_CARGO NUMERIC := 50.00;
    PCT_SERVICIO NUMERIC := 0.24;
    TOPE_SERVICIO NUMERIC := 2500.00;
    
    -- Variables de control
    v_total_boletos INTEGER;
BEGIN
    RAISE NOTICE '--- INICIANDO MOTOR DE VENTAS TURBO (Pre-asignación de IDs) ---';

    -- ==================================================================
    -- 1. GENERAR ÓRDENES EN MEMORIA CON IDs PRE-ASIGNADOS
    -- ==================================================================
    -- Creamos una tabla temporal con todos los IDs ya listos.
    -- Esto elimina la necesidad de "RETURNING INTO variable".
    
    CREATE TEMPORARY TABLE temp_ordenes AS
    SELECT 
        generate_series(1, NUM_ORDENES) as id_interno,
        -- Reservamos IDs reales de la base de datos de una vez
        nextval('carrito_carrito_id_seq') as carrito_real_id,
        nextval('transaccion_transaccion_id_seq') as transaccion_real_id,
        
        -- Datos aleatorios
        floor(random() * 2442 + 1)::INT as cliente_id,
        floor(random() * 4 + 1)::INT as num_boletos,
        NULL::INT as metodo_pago_id
    ;

    -- Asignar método de pago válido (borrar los que no tengan)
    UPDATE temp_ordenes t
    SET metodo_pago_id = (
        SELECT mp.metodo_id 
        FROM metodo_pago mp 
        JOIN cartera c ON mp.cartera_id = c.cartera_id 
        WHERE c.cliente_id = t.cliente_id 
        LIMIT 1
    );
    DELETE FROM temp_ordenes WHERE metodo_pago_id IS NULL;

    SELECT sum(num_boletos) INTO v_total_boletos FROM temp_ordenes;
    RAISE NOTICE ' > Procesando % asientos para % órdenes...', v_total_boletos, (SELECT count(*) FROM temp_ordenes);

    -- ==================================================================
    -- 2. ASIGNAR ASIENTOS Y PRE-CALCULAR DETALLES
    -- ==================================================================
    -- Aquí también reservamos el ID del detalle_transaccion de una vez
    
    CREATE TEMPORARY TABLE temp_detalle_venta AS
    WITH asientos_disponibles AS (
        -- Tomamos los asientos necesarios (sin orden aleatorio pesado para velocidad)
        SELECT 
            a.asiento_id,
            lp.precio_base,
            COALESCE(p.costo_adicional, 0.00) as costo_paquete,
            ROW_NUMBER() OVER () as rn
        FROM asiento a
        JOIN asiento_precio ap ON a.asiento_id = ap.asiento_id
        JOIN lista_precio lp ON ap.lista_precio_id = lp.lista_precio_id
        LEFT JOIN paquete p ON lp.lista_precio_id = p.lista_precio_id
        WHERE a.disponible = TRUE
        LIMIT v_total_boletos
    ),
    ordenes_expandidas AS (
        -- Expandimos las órdenes: Si la orden 1 quiere 3 boletos, creamos 3 filas
        SELECT 
            id_interno,
            carrito_real_id,
            transaccion_real_id,
            cliente_id,
            ROW_NUMBER() OVER (ORDER BY id_interno) as rn
        FROM temp_ordenes, generate_series(1, num_boletos)
    )
    SELECT 
        oe.carrito_real_id,
        oe.transaccion_real_id,
        oe.cliente_id,
        ad.asiento_id,
        ad.precio_base,
        ad.costo_paquete,
        -- Reservamos ID para el detalle de transacción
        nextval('detalle_transaccion_detalle_txn_id_seq') as detalle_txn_real_id,
        -- Cálculos por boleto
        LEAST((ad.precio_base + ad.costo_paquete) * PCT_SERVICIO, TOPE_SERVICIO) as cargo_calc,
        (ad.precio_base + ad.costo_paquete) as subtotal_calc
    FROM asientos_disponibles ad
    JOIN ordenes_expandidas oe ON ad.rn = oe.rn;

    -- ==================================================================
    -- 3. CALCULAR TOTALES POR ORDEN
    -- ==================================================================
    CREATE TEMPORARY TABLE temp_totales_orden AS
    SELECT 
        carrito_real_id,
        SUM(subtotal_calc + cargo_calc) + FIXED_CARGO as gran_total
    FROM temp_detalle_venta
    GROUP BY carrito_real_id;

    -- ==================================================================
    -- 4. INSERCIONES MASIVAS (EL GOLPE FINAL)
    -- ==================================================================
    
    -- A. Carrito
    INSERT INTO carrito (carrito_id, total, estatus, cargo_procesamiento, fecha_creacion)
    SELECT t.carrito_real_id, tt.gran_total, 'COMPLETADO', FIXED_CARGO, NOW()
    FROM temp_ordenes t
    JOIN temp_totales_orden tt ON t.carrito_real_id = tt.carrito_real_id;

    -- B. Detalle Carrito
    INSERT INTO detalle_carrito (precio_base, cargo_servicio, precio_paquete, total, carrito_id)
    SELECT precio_base, cargo_calc, costo_paquete, (subtotal_calc + cargo_calc), carrito_real_id
    FROM temp_detalle_venta;

    -- C. Actualizar Asientos (Ocupar)
    -- Nota: No ligamos el detalle_carrito_id exacto por velocidad en este batch, 
    -- solo marcamos como NO disponible.
    UPDATE asiento 
    SET disponible = FALSE 
    WHERE asiento_id IN (SELECT asiento_id FROM temp_detalle_venta);

    -- D. Transacción
    INSERT INTO transaccion (transaccion_id, total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
    SELECT t.transaccion_real_id, tt.gran_total, 'APROBADO', FIXED_CARGO, NOW(), t.carrito_real_id, t.metodo_pago_id
    FROM temp_ordenes t
    JOIN temp_totales_orden tt ON t.carrito_real_id = tt.carrito_real_id;

    -- E. Detalle Transacción (Usando el ID reservado)
    INSERT INTO detalle_transaccion (detalle_txn_id, precio_base, cargo_servicio, precio_paquete, total, transaccion_id)
    SELECT detalle_txn_real_id, precio_base, cargo_calc, costo_paquete, (subtotal_calc + cargo_calc), transaccion_real_id
    FROM temp_detalle_venta;

    -- F. Pago
    INSERT INTO detalle_pago (monto, transaccion_id, metodo_id)
    SELECT tt.gran_total, t.transaccion_real_id, t.metodo_pago_id
    FROM temp_ordenes t
    JOIN temp_totales_orden tt ON t.carrito_real_id = tt.carrito_real_id;

    -- G. Boleto (¡Aquí usamos todos los IDs pre-calculados!)
    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
    SELECT 
        'TKT-' || transaccion_real_id || '-' || asiento_id,
        md5(random()::text),
        sha256(random()::text::bytea),
        md5(random()::text),
        asiento_id,
        detalle_txn_real_id,
        cliente_id
    FROM temp_detalle_venta;

    -- Limpieza
    DROP TABLE temp_ordenes;
    DROP TABLE temp_detalle_venta;
    DROP TABLE temp_totales_orden;

    RAISE NOTICE '¡ÉXITO! Ventas masivas generadas en segundos.';
END $$;