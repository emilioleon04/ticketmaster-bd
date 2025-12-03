-- 2025 FULL STACK: Eventos, Infraestructura y Ventas Cerradas
BEGIN;

INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Apodaca Group', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Festivales%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Final Liga MX Apertura 2025 (Ida)', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Futbol%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Katy Perry', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Stray Kids', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Insomniac', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Electronica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Shakira', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'OCESA Festivales', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Festivales%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Twenty One Pilots', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Rock/Metal%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Luis Miguel Tour 2025', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Oasis Live 25', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Rock/Metal%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Green Day', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Rock/Metal%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Alejandro Fernández', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Folclor/Popular%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Justin Timberlake', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Caifanes en Concierto', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Rock/Metal%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Flow Fest 2025', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Festivales%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Liga MX', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Beisbol%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Ha*Ash', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Incubus', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Rock/Metal%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Chayanne', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Formula 1', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Automovilismo%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Olivia Rodrigo', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Pop/Romantica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Play-In Liga MX Apertura 2025', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Futbol%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Liga MX', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Futbol%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'Kygo World Tour', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Electronica%' LIMIT 1 ON CONFLICT DO NOTHING;
INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT 'NFL', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%Americano%' LIMIT 1 ON CONFLICT DO NOTHING;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gran Premio F1 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('ABB FIA Formula E Mexico City E-Prix 2025 - Grada 1', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-11 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Formula 1' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gran Premio F1 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-11 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gran Premio F1 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('ABB FIA Formula E Mexico City E-Prix 2025 - Grada 2', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-11 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Formula 1' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gran Premio F1 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-11 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gran Premio F1 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('ABB FIA Formula E Mexico City E-Prix 2025 - Foro Sol Norte', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-11 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Formula 1' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gran Premio F1 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-11 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gran Premio F1 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('ABB FIA Formula E Mexico City E-Prix 2025 - Foro Sol Sur', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-11 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Formula 1' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gran Premio F1 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-11 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gran Premio F1 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('ABB FIA Formula E Mexico City E-Prix 2025 - Platino Plus', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-11 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Formula 1' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gran Premio F1 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-11 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 1 (Recta Principal)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 1 (Recta Principal)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 1 (Recta Principal)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 1 (Recta Principal)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 2 (Recta Principal)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 2 (Recta Principal)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 2 (Recta Principal)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 2 (Recta Principal)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 3 (Complejo Moises Solana)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 3 (Complejo Moises Solana)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 3 (Complejo Moises Solana)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 3 (Complejo Moises Solana)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 4 (Complejo Moises Solana)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 4 (Complejo Moises Solana)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 4 (Complejo Moises Solana)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 4 (Complejo Moises Solana)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 5 (Complejo Moises Solana)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 5 (Complejo Moises Solana)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 5 (Complejo Moises Solana)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 5 (Complejo Moises Solana)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 6 (Recorte Rebaque)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 6 (Recorte Rebaque)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 6 (Recorte Rebaque)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 6 (Recorte Rebaque)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 7 (Zona del Estadio)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 7 (Zona del Estadio)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 7 (Zona del Estadio)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 7 (Zona del Estadio)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 8 (Zona del Estadio)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 8 (Zona del Estadio)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 8 (Zona del Estadio)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 8 (Zona del Estadio)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 9 (Zona del Estadio)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 9 (Zona del Estadio)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 9 (Zona del Estadio)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 9 (Zona del Estadio)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 10 (Zona del Estadio)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 10 (Zona del Estadio)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 10 (Zona del Estadio)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 10 (Zona del Estadio)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 11 (Zona del Estadio)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 11 (Zona del Estadio)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 11 (Zona del Estadio)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 11 (Zona del Estadio)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 14 (Foro Sol Sur)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 14 (Foro Sol Sur)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 14 (Foro Sol Sur)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 14 (Foro Sol Sur)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Grada 15 (Foro Sol Norte)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Grada 15 (Foro Sol Norte)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Grada 15 (Foro Sol Norte)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Grada 15 (Foro Sol Norte)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Sky Box VIP', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Sky Box VIP', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Sky Box VIP' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Sky Box VIP' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: F1 Gran Premio CDMX 2025 - Paddock Club', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('F1 Gran Premio CDMX 2025 - Paddock Club', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-26 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'F1 Gran Premio CDMX 2025 - Paddock Club' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: F1 Gran Premio CDMX 2025 - Paddock Club' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-26 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Kygo World Tour', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Kygo World Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-25 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Kygo World Tour' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Kygo World Tour' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Palacio de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-25 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Twenty One Pilots', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Twenty One Pilots: The Clancy Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-02-20 20:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Twenty One Pilots' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Twenty One Pilots' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-02-20 20:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Chayanne', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Chayanne: Bailemos Otra Vez', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-02-27 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Chayanne' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Chayanne' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Palacio de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-02-27 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Shakira', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Shakira: Las Mujeres Ya No Lloran', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-03-19 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Shakira' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Shakira' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-03-19 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Incubus', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Incubus: Morning View Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-03-20 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Incubus' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Incubus' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Arena Ciudad de Mexico%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-03-20 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Olivia Rodrigo', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Olivia Rodrigo: Guts Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-04-02 20:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Olivia Rodrigo' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Olivia Rodrigo' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-04-02 20:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Katy Perry', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Katy Perry: The Lifetimes Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-04-25 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Katy Perry' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Katy Perry' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Arena Ciudad de Mexico%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-04-25 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Ha*Ash', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Ha*Ash: Haashville Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-05-15 20:30:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Ha*Ash' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Ha*Ash' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Auditorio Nacional%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-05-15 20:30:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Caifanes en Concierto', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Caifanes en Concierto', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-06-21 20:30:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Caifanes en Concierto' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Caifanes en Concierto' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Auditorio Nacional%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-06-21 20:30:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Oasis Live 25', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Oasis Live 25', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-09-12 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Oasis Live 25' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Oasis Live 25' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-09-12 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Alejandro Fernández', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Alejandro Fernández: De Rey a Rey', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-25 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Alejandro Fernández' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Alejandro Fernández' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Plaza de Toros México%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-25 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Luis Miguel Tour 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Luis Miguel Tour 2025', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-10 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Luis Miguel Tour 2025' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Luis Miguel Tour 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-10 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Justin Timberlake', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Justin Timberlake: Forget Tomorrow', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-02-07 21:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Justin Timberlake' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Justin Timberlake' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Palacio de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-02-07 21:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Stray Kids', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Stray Kids: World Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-04-12 20:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Stray Kids' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Stray Kids' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-04-12 20:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Green Day', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Green Day: The Saviors Tour', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-11-15 20:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Green Day' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Green Day' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-11-15 20:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: EDC México 2025 (Abono General)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('EDC México 2025 (Abono General)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-02-21 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'EDC México 2025 (Abono General)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: EDC México 2025 (Abono General)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-02-21 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Vive Latino 2025 (Abono General)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Vive Latino 2025 (Abono General)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-03-15 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Vive Latino 2025 (Abono General)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Vive Latino 2025 (Abono General)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio GNP Seguros%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-03-15 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Tecate Pal Norte 2025 (Abono General)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Tecate Pal Norte 2025 (Abono General)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-04-04 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Tecate Pal Norte 2025 (Abono General)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Tecate Pal Norte 2025 (Abono General)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Parque Fundidora%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-04-04 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Corona Capital 2025 (Abono General)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Corona Capital 2025 (Abono General)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-11-14 14:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Corona Capital 2025 (Abono General)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Corona Capital 2025 (Abono General)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-11-14 14:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Flow Fest 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Flow Fest 2025', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-11-23 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Flow Fest 2025' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Flow Fest 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Autodromo Hnos. Rodriguez%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-11-23 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Cruz Azul vs Pachuca (J1 Clausura)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-18 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Ciudad de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-18 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Pumas UNAM vs Rayados (J2 Clausura)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-01-26 12:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Olimpico Universitario%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-01-26 12:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Pumas UNAM vs Chivas (J4 Clausura)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-02-09 12:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Olimpico Universitario%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-02-09 12:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Cruz Azul vs America (Clásico Joven)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-02-22 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Ciudad de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-02-22 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Rayados vs Chivas', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-03-01 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio BBVA%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-03-01 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Rayados vs Tigres (Clásico Regio)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-04-12 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio BBVA%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-04-12 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Pumas UNAM vs America (Clásico Capitalino)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-04-20 12:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Olimpico Universitario%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-04-20 12:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 1500;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('America vs Chivas (Clásico Nacional)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-09-14 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Ciudad de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-09-14 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 12000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Cruz Azul vs Chivas (Apertura)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-09-27 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Ciudad de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-09-27 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 800;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Rayados vs Cruz Azul (Apertura)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-10-04 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio BBVA%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-10-04 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Pumas UNAM vs Tigres (Apertura)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-11-02 12:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Olimpico Universitario%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-11-02 12:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Play-In Liga MX Apertura 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Play-In Liga MX Apertura 2025', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-11-20 20:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Play-In Liga MX Apertura 2025' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Play-In Liga MX Apertura 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Ciudad de los Deportes%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-11-20 20:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Gira 2025: Final Liga MX Apertura 2025 (Ida)', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('Final Liga MX Apertura 2025 (Ida)', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-12-11 20:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Final Liga MX Apertura 2025 (Ida)' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Gira 2025: Final Liga MX Apertura 2025 (Ida)' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio BBVA%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-12-11 20:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('Torneo 2025', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 3000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('MLB Mexico City Series: Dodgers vs Padres', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-04-27 13:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'Liga MX' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'Torneo 2025' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Alfredo Harp Helú%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-04-27 13:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('NFL International Series', 'Evento Oficial') ON CONFLICT DO NOTHING;

DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := 5000;
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('NFL Mexico Game 2025', 'Venta Cerrada 2025', 'FINALIZADO', 'https://img.ticketm.net/generic_2025.jpg', '2025-11-17 19:00:00',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = 'NFL' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = 'NFL International Series' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT 'https://img.ticketm.net/generic_2025.jpg', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%Estadio Azteca%' LIMIT 1) LIMIT 1), 1), v_evento_id
    RETURNING plano_evento_id INTO v_plano_evento_id;

    INSERT INTO lista_precio (nombre, fase_venta, codigo, precio_base, paquete_precio, cargo_servicio_id, evento_id)
    VALUES ('Venta Final', 'Liquidación', NULL, v_precio_base, FALSE, (SELECT cargo_servicio_id FROM cargo_servicio LIMIT 1), v_evento_id)
    RETURNING lista_precio_id INTO v_lista_precio_id;

    FOR i IN 1..2 LOOP
        INSERT INTO seccion (nombre, pasillo, acceso_puerta, plano_evento_id)
        VALUES ('Sección Histórica ' || i, 'P-1', 'A', v_plano_evento_id)
        RETURNING seccion_id INTO v_seccion_id;

        j := 1;
        WHILE j <= 30 LOOP
            v_cliente_id := floor(random() * 2442 + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '2025-11-17 19:00:00', NULL, v_metodo_id)
                RETURNING transaccion_id INTO v_transaccion_id;

                INSERT INTO detalle_pago (monto, transaccion_id, metodo_id) VALUES (v_total_orden, v_transaccion_id, v_metodo_id);

                FOR k IN 1..v_cantidad_boletos LOOP
                    INSERT INTO asiento (fila, numero, disponible, seccion_id, detalle_carrito_id)
                    VALUES ('A', (j + k - 1)::TEXT, FALSE, v_seccion_id, NULL)
                    RETURNING asiento_id INTO v_asiento_id;

                    INSERT INTO asiento_precio (asiento_id, lista_precio_id) VALUES (v_asiento_id, v_lista_precio_id);

                    INSERT INTO detalle_transaccion (precio_base, cargo_servicio, total, transaccion_id)
                    VALUES (v_precio_base, v_precio_base * 0.24, v_precio_base * 1.24, v_transaccion_id)
                    RETURNING detalle_txn_id INTO v_detalle_txn_id;

                    INSERT INTO boleto (folio, codigo_barras, hash_seguridad, token_digital, asiento_id, detalle_txn_id, cliente_actual_id)
                    VALUES ('HIST-' || v_transaccion_id || '-' || k, md5(random()::text), 'hash', 'token', v_asiento_id, v_detalle_txn_id, v_cliente_id);
                END LOOP;
            END IF;
            j := j + v_cantidad_boletos;
        END LOOP;
    END LOOP;
END $$;

COMMIT;
