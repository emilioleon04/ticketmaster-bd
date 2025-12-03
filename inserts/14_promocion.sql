BEGIN;

-- 1. CATÁLOGO DE PROMOCIONES
INSERT INTO promocion (nombre, descripcion, tipo, valor, limite_uso, fecha_inicio, fecha_fin) SELECT 'Preventa Citibanamex', 'Compra antes que nadie con tarjetas Citibanamex', 'ACCESO', 0.0, 5000, '2025-01-01 00:00:00', '2026-12-31 23:59:59' WHERE NOT EXISTS (SELECT 1 FROM promocion WHERE nombre = 'Preventa Citibanamex');
INSERT INTO promocion (nombre, descripcion, tipo, valor, limite_uso, fecha_inicio, fecha_fin) SELECT '3 Meses sin Intereses', 'Pagando con tarjetas de crédito participantes', 'MSI', 0.0, 5000, '2025-01-01 00:00:00', '2026-12-31 23:59:59' WHERE NOT EXISTS (SELECT 1 FROM promocion WHERE nombre = '3 Meses sin Intereses');
INSERT INTO promocion (nombre, descripcion, tipo, valor, limite_uso, fecha_inicio, fecha_fin) SELECT 'Jueves 2x1', 'Compra 2 boletos al precio de 1', 'DESCUENTO_2X1', 0.5, 5000, '2025-01-01 00:00:00', '2026-12-31 23:59:59' WHERE NOT EXISTS (SELECT 1 FROM promocion WHERE nombre = 'Jueves 2x1');
INSERT INTO promocion (nombre, descripcion, tipo, valor, limite_uso, fecha_inicio, fecha_fin) SELECT 'Descuento Spotify Fans', 'Precio especial para oyentes frecuentes', 'PORCENTAJE', 0.15, 5000, '2025-01-01 00:00:00', '2026-12-31 23:59:59' WHERE NOT EXISTS (SELECT 1 FROM promocion WHERE nombre = 'Descuento Spotify Fans');
INSERT INTO promocion (nombre, descripcion, tipo, valor, limite_uso, fecha_inicio, fecha_fin) SELECT 'Venta Priority', 'Acceso exclusivo socios Priority', 'ACCESO', 0.0, 5000, '2025-01-01 00:00:00', '2026-12-31 23:59:59' WHERE NOT EXISTS (SELECT 1 FROM promocion WHERE nombre = 'Venta Priority');
INSERT INTO promocion (nombre, descripcion, tipo, valor, limite_uso, fecha_inicio, fecha_fin) SELECT 'Promo Buen Fin', '20% de descuento directo', 'PORCENTAJE', 0.2, 5000, '2025-01-01 00:00:00', '2026-12-31 23:59:59' WHERE NOT EXISTS (SELECT 1 FROM promocion WHERE nombre = 'Promo Buen Fin');

-- 2. VINCULACIÓN (Asignar promos a eventos aleatorios)

    -- Asignar 'Preventa Citibanamex' a 300 eventos random
    INSERT INTO precio_promocion (tope_descuento, cantidad_max, activo, promocion_id, lista_precio_id)
    SELECT 0.00, 1000, TRUE, 
           (SELECT promocion_id FROM promocion WHERE nombre = 'Preventa Citibanamex'),
           lista_precio_id
    FROM lista_precio 
    ORDER BY random() 
    LIMIT 300;

    -- Asignar 'Jueves 2x1' a 100 eventos random (para mover inventario)
    INSERT INTO precio_promocion (tope_descuento, cantidad_max, activo, promocion_id, lista_precio_id)
    SELECT 0.00, 50, TRUE, 
           (SELECT promocion_id FROM promocion WHERE nombre = 'Jueves 2x1'),
           lista_precio_id
    FROM lista_precio 
    ORDER BY random() 
    LIMIT 100;

    -- Asignar 'Descuento Spotify' a 150 eventos random
    INSERT INTO precio_promocion (tope_descuento, cantidad_max, activo, promocion_id, lista_precio_id)
    SELECT 500.00, 200, TRUE, 
           (SELECT promocion_id FROM promocion WHERE nombre = 'Descuento Spotify Fans'),
           lista_precio_id
    FROM lista_precio 
    ORDER BY random() 
    LIMIT 150;
    
COMMIT;
