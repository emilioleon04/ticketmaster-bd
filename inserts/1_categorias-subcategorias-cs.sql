-- PASO 1: CATÁLOGOS
BEGIN;

-- 1. CATEGORÍAS
INSERT INTO categoria (nombre_categoria) VALUES 
('Conciertos y Festivales'),
('Teatro y Cultura'),
('Deportes'),
('Familiares'),
('Especiales')
ON CONFLICT DO NOTHING;

-- 2. SUBCATEGORÍAS (Por Lotes)
-- Subcategorías de Conciertos y Festivales
INSERT INTO subcategoria (nombre_subcategoria, categoria_id) VALUES 
('Cabaret', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Festivales', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Rock/Metal', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Infantil', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Flamenco/Tango', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Oldies/Trova', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Urbanos', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Comedia', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Folclor/Popular', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Pop/Romantica', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Internacional', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Electronica', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Jazz/Instrumental', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1)),
('Reggae', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Conciertos y Festivales' LIMIT 1))
ON CONFLICT DO NOTHING;

-- Subcategorías de Teatro y Cultura
INSERT INTO subcategoria (nombre_subcategoria, categoria_id) VALUES 
('Ballet/Danza', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Musicales', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Espectaculo', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Performance', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Obras de Teatro', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Belleza/Moda', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Exhibiciones', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Voces/Coros', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Drama', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Festivales Culturales', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Ensamble/Musica Clasica', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1)),
('Orquestas/Opera', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Teatro y Cultura' LIMIT 1))
ON CONFLICT DO NOTHING;

-- Subcategorías de Deportes
INSERT INTO subcategoria (nombre_subcategoria, categoria_id) VALUES 
('Automovilismo', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Toros', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Deportes Extremos', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Americano', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Rodeo', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Handball', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Artes Marciales Mixtas', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Tenis', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Box/Lucha Libre', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Beisbol', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Equestre', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1)),
('Futbol', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Deportes' LIMIT 1))
ON CONFLICT DO NOTHING;

-- Subcategorías de Familiares
INSERT INTO subcategoria (nombre_subcategoria, categoria_id) VALUES 
('On Ice', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Campamentos/Tours', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Parque de diversiones', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Circos/Espectaculo Infantil', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Magia', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Espacios Infantiles', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Ferias/Festivales', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Acuarios/Parques Acuaticos', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1)),
('Absurdo/Busqueda/Farsa', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Familiares' LIMIT 1))
ON CONFLICT DO NOTHING;

-- Subcategorías de Especiales
INSERT INTO subcategoria (nombre_subcategoria, categoria_id) VALUES 
('Certificados de regalo', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Seminarios/Conferencias', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Hotel', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Especiales', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Sorteos', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Expo/Convencion', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Campamentos', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Guias', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Restaurantes', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Paquete Comida/Cena', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Audiovisual/Cine', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Merchandise', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Cupones', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Estacionamiento', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Donaciones', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1)),
('Audio Tours', (SELECT categoria_id FROM categoria WHERE nombre_categoria = 'Especiales' LIMIT 1))
ON CONFLICT DO NOTHING;

-- 3. CARGOS
INSERT INTO cargo_servicio (porcentaje, limite) VALUES (0.24, 2500.00) ON CONFLICT DO NOTHING;

-- 4. BENEFICIOS
INSERT INTO beneficio (nombre, descripcion) VALUES 
('Early Entry', 'Acceso a Early Entry'),
('Soundcheck', 'Acceso a Soundcheck'),
('Meet & Greet', 'Acceso a Meet & Greet'),
('Laminado VIP', 'Acceso a Laminado VIP'),
('Poster Firmado', 'Acceso a Poster Firmado'),
('Estacionamiento', 'Acceso a Estacionamiento'),
('Barra Libre', 'Acceso a Barra Libre'),
('Asiento Acojinado', 'Acceso a Asiento Acojinado')
ON CONFLICT DO NOTHING;

COMMIT;
