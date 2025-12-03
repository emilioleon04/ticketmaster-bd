import random

# ================= CONFIGURACIÓN =================
YEAR = 2025
NUM_CLIENTES = 2442  

# ==============================================================================
# LISTA 1: AUTOMOVILISMO (Formula 1 y Formula E) - 6 ELEMENTOS POR TUPLA
# ==============================================================================
EVENTOS_RACING = [
    # (Nombre, Recinto, Mes, Dia, Hora, Subcategoria)
    ('ABB FIA Formula E Mexico City E-Prix 2025 - Grada 1', 'Autodromo Hnos. Rodriguez', 1, 11, '13:00:00', 'Automovilismo'),
    ('ABB FIA Formula E Mexico City E-Prix 2025 - Grada 2', 'Autodromo Hnos. Rodriguez', 1, 11, '13:00:00', 'Automovilismo'),
    ('ABB FIA Formula E Mexico City E-Prix 2025 - Foro Sol Norte', 'Autodromo Hnos. Rodriguez', 1, 11, '13:00:00', 'Automovilismo'),
    ('ABB FIA Formula E Mexico City E-Prix 2025 - Foro Sol Sur', 'Autodromo Hnos. Rodriguez', 1, 11, '13:00:00', 'Automovilismo'),
    ('ABB FIA Formula E Mexico City E-Prix 2025 - Platino Plus', 'Autodromo Hnos. Rodriguez', 1, 11, '13:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 1 (Recta Principal)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 2 (Recta Principal)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 3 (Complejo Moises Solana)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 4 (Complejo Moises Solana)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 5 (Complejo Moises Solana)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 6 (Recorte Rebaque)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 7 (Zona del Estadio)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 8 (Zona del Estadio)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 9 (Zona del Estadio)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 10 (Zona del Estadio)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 11 (Zona del Estadio)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 14 (Foro Sol Sur)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Grada 15 (Foro Sol Norte)', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Sky Box VIP', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo'),
    ('F1 Gran Premio CDMX 2025 - Paddock Club', 'Autodromo Hnos. Rodriguez', 10, 26, '14:00:00', 'Automovilismo')
]

# ==============================================================================
# LISTA 2: CONCIERTOS Y DEPORTES - 6 ELEMENTOS POR TUPLA
# ==============================================================================
EVENTOS_VARIOS = [
    ('Kygo World Tour', 'Palacio de los Deportes', 1, 25, '21:00:00', 'Electronica'),
    ('Twenty One Pilots: The Clancy Tour', 'Estadio GNP Seguros', 2, 20, '20:00:00', 'Rock/Metal'),
    ('Chayanne: Bailemos Otra Vez', 'Palacio de los Deportes', 2, 27, '21:00:00', 'Pop/Romantica'),
    ('Shakira: Las Mujeres Ya No Lloran', 'Estadio GNP Seguros', 3, 19, '21:00:00', 'Pop/Romantica'),
    ('Incubus: Morning View Tour', 'Arena Ciudad de Mexico', 3, 20, '21:00:00', 'Rock/Metal'),
    ('Olivia Rodrigo: Guts Tour', 'Estadio GNP Seguros', 4, 2, '20:00:00', 'Pop/Romantica'),
    ('Katy Perry: The Lifetimes Tour', 'Arena Ciudad de Mexico', 4, 25, '21:00:00', 'Pop/Romantica'),
    ('Ha*Ash: Haashville Tour', 'Auditorio Nacional', 5, 15, '20:30:00', 'Pop/Romantica'),
    ('Caifanes en Concierto', 'Auditorio Nacional', 6, 21, '20:30:00', 'Rock/Metal'),
    ('Oasis Live 25', 'Estadio GNP Seguros', 9, 12, '21:00:00', 'Rock/Metal'),
    ('Alejandro Fernández: De Rey a Rey', 'Plaza de Toros México', 10, 25, '21:00:00', 'Folclor/Popular'),
    ('Luis Miguel Tour 2025', 'Estadio GNP Seguros', 10, 10, '21:00:00', 'Pop/Romantica'),
    ('Justin Timberlake: Forget Tomorrow', 'Palacio de los Deportes', 2, 7, '21:00:00', 'Pop/Romantica'),
    ('Stray Kids: World Tour', 'Estadio GNP Seguros', 4, 12, '20:00:00', 'Pop/Romantica'),
    ('Green Day: The Saviors Tour', 'Estadio GNP Seguros', 11, 15, '20:00:00', 'Rock/Metal'),
    ('EDC México 2025 (Abono General)', 'Autodromo Hnos. Rodriguez', 2, 21, '14:00:00', 'Electronica'),
    ('Vive Latino 2025 (Abono General)', 'Estadio GNP Seguros', 3, 15, '13:00:00', 'Festivales'),
    ('Tecate Pal Norte 2025 (Abono General)', 'Parque Fundidora', 4, 4, '14:00:00', 'Festivales'),
    ('Corona Capital 2025 (Abono General)', 'Autodromo Hnos. Rodriguez', 11, 14, '14:00:00', 'Festivales'),
    ('Flow Fest 2025', 'Autodromo Hnos. Rodriguez', 11, 23, '13:00:00', 'Urbanos'),
    ('Cruz Azul vs Pachuca (J1 Clausura)', 'Estadio Ciudad de los Deportes', 1, 18, '19:00:00', 'Futbol'),
    ('Pumas UNAM vs Rayados (J2 Clausura)', 'Estadio Olimpico Universitario', 1, 26, '12:00:00', 'Futbol'),
    ('Pumas UNAM vs Chivas (J4 Clausura)', 'Estadio Olimpico Universitario', 2, 9, '12:00:00', 'Futbol'),
    ('Cruz Azul vs America (Clásico Joven)', 'Estadio Ciudad de los Deportes', 2, 22, '19:00:00', 'Futbol'),
    ('Rayados vs Chivas', 'Estadio BBVA', 3, 1, '19:00:00', 'Futbol'),
    ('Rayados vs Tigres (Clásico Regio)', 'Estadio BBVA', 4, 12, '19:00:00', 'Futbol'),
    ('Pumas UNAM vs America (Clásico Capitalino)', 'Estadio Olimpico Universitario', 4, 20, '12:00:00', 'Futbol'),
    ('America vs Chivas (Clásico Nacional)', 'Estadio Ciudad de los Deportes', 9, 14, '19:00:00', 'Futbol'),
    ('Cruz Azul vs Chivas (Apertura)', 'Estadio Ciudad de los Deportes', 9, 27, '19:00:00', 'Futbol'),
    ('Rayados vs Cruz Azul (Apertura)', 'Estadio BBVA', 10, 4, '19:00:00', 'Futbol'),
    ('Pumas UNAM vs Tigres (Apertura)', 'Estadio Olimpico Universitario', 11, 2, '12:00:00', 'Futbol'),
    ('Play-In Liga MX Apertura 2025', 'Estadio Ciudad de los Deportes', 11, 20, '20:00:00', 'Futbol'),
    ('Final Liga MX Apertura 2025 (Ida)', 'Estadio BBVA', 12, 11, '20:00:00', 'Futbol'),
    ('MLB Mexico City Series: Dodgers vs Padres', 'Estadio Alfredo Harp Helú', 4, 27, '13:00:00', 'Beisbol'),
    ('NFL Mexico Game 2025', 'Estadio Azteca', 11, 17, '19:00:00', 'Americano')
]

def generar_2025_completo():
    f = open("3_eventos_2025_full.sql", "w", encoding="utf-8")
    
    print("--- GENERANDO HISTORIAL COMPLETO 2025 (EVENTOS + VENTAS) ---")
    f.write("-- 2025 FULL STACK: Eventos, Infraestructura y Ventas Cerradas\n")
    f.write("BEGIN;\n\n")

    # 1. Asegurar Artistas (CORREGIDO: LEEMOS LOS 6 VALORES)
    artistas_unicos = set()
    TODOS = EVENTOS_RACING + EVENTOS_VARIOS
    
    # BUCLE CORREGIDO: Desempaquetamos los 6 valores
    for nombre, recinto, mes, dia, hora, subcat in TODOS:
        if "Formula" in nombre or "F1" in nombre: artista = "Formula 1"
        elif "vs" in nombre: artista = "Liga MX"
        elif "MLB" in nombre: artista = "MLB"
        elif "NFL" in nombre: artista = "NFL"
        elif "Vive" in nombre or "Corona" in nombre: artista = "OCESA Festivales"
        elif "EDC" in nombre: artista = "Insomniac"
        elif "Tecate" in nombre: artista = "Apodaca Group"
        else: artista = nombre.split(":")[0].strip()
        artistas_unicos.add((artista, subcat))

    for art, sub in artistas_unicos:
        f.write(f"INSERT INTO artista_organizacion (nombre_artista_org, subcategoria_id) SELECT '{art}', subcategoria_id FROM subcategoria WHERE nombre_subcategoria LIKE '%{sub}%' LIMIT 1 ON CONFLICT DO NOTHING;\n")
    f.write("\n")

    # 2. BUCLE MAESTRO
    count = 0
    for nombre, recinto, mes, dia, hora, subcat in TODOS:
        
        fecha_sql = f"{YEAR}-{mes:02d}-{dia:02d} {hora}"
        if "Formula" in nombre: artista = "Formula 1"; grupo = "Gran Premio F1 2025"
        elif "vs" in nombre: artista = "Liga MX"; grupo = "Torneo 2025"
        elif "MLB" in nombre: artista = "MLB"; grupo = "MLB World Tour"
        elif "NFL" in nombre: artista = "NFL"; grupo = "NFL International Series"
        else: artista = nombre.split(":")[0].strip(); grupo = f"Gira 2025: {artista}"
        
        img = "https://img.ticketm.net/generic_2025.jpg"

        f.write(f"INSERT INTO grupo_evento (nombre_grupo, descripcion) VALUES ('{grupo}', 'Evento Oficial') ON CONFLICT DO NOTHING;\n")

        bloque_sql = f"""
DO $$ 
DECLARE
    v_evento_id INTEGER;
    v_plano_evento_id INTEGER;
    v_lista_precio_id INTEGER;
    v_seccion_id INTEGER;
    v_cliente_id INTEGER;
    v_transaccion_id INTEGER;
    v_metodo_id INTEGER;
    v_precio_base NUMERIC := {random.choice([800, 1500, 3000, 5000, 12000])};
    v_total_orden NUMERIC;
    v_cantidad_boletos INTEGER;
    v_asiento_id INTEGER;
    v_detalle_txn_id INTEGER;
    i INTEGER;
    j INTEGER;
BEGIN
    INSERT INTO evento (nombre, descripcion, status, cartel, fecha_hora, artista_org_id, grupo_evento_id)
    VALUES ('{nombre}', 'Venta Cerrada 2025', 'FINALIZADO', '{img}', '{fecha_sql}',
    (SELECT artista_org_id FROM artista_organizacion WHERE nombre_artista_org = '{artista}' LIMIT 1),
    (SELECT grupo_id FROM grupo_evento WHERE nombre_grupo = '{grupo}' LIMIT 1))
    RETURNING evento_id INTO v_evento_id;

    INSERT INTO plano_evento (mapa, plano_id, evento_id) 
    SELECT '{img}', COALESCE((SELECT plano_id FROM plano WHERE inmueble_id = (SELECT inmueble_id FROM inmueble WHERE nombre ILIKE '%{recinto}%' LIMIT 1) LIMIT 1), 1), v_evento_id
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
            v_cliente_id := floor(random() * {NUM_CLIENTES} + 1)::INT;
            v_cantidad_boletos := floor(random() * 3 + 1)::INT;
            IF (j + v_cantidad_boletos) > 30 THEN v_cantidad_boletos := 30 - j + 1; END IF;

            v_total_orden := (v_precio_base * 1.24 * v_cantidad_boletos) + 50.00;

            SELECT metodo_id INTO v_metodo_id FROM metodo_pago WHERE cartera_id = (SELECT cartera_id FROM cartera WHERE cliente_id = v_cliente_id LIMIT 1) LIMIT 1;
            
            IF v_metodo_id IS NOT NULL THEN
                INSERT INTO transaccion (total, estatus, cargo_procesamiento, fecha_hora, carrito_id, metodo_pago)
                VALUES (v_total_orden, 'APROBADO', 50.00, '{fecha_sql}', NULL, v_metodo_id)
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
"""
        f.write(bloque_sql + "\n")
        count += 1

    f.write("COMMIT;\n")
    f.close()
    print(f"¡Listo! {count} eventos de 2025 generados con ventas completas.")

if __name__ == "__main__":
    generar_2025_completo()