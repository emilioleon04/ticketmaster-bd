BEGIN;

-- 1. CATEGORÍAS
INSERT INTO categoria (nombre_categoria) VALUES 
('Conciertos y Festivales'),
('Teatro y Cultura'),        
('Deportes'),                
('Familiares'),             
('Especiales')               
ON CONFLICT DO NOTHING;

-- 2. SUBCATEGORÍAS
INSERT INTO subcategoria (nombre_subcategoria, categoria_id) VALUES 
('Cabaret', 1),
('Festivales', 1),
('Rock/Metal', 1),
('Infantil', 1),
('Flamenco/Tango', 1),
('Oldies/Trova', 1),
('Urbanos', 1),
('Comedia', 1),
('Folclor/Popular', 1),
('Pop/Romantica', 1),
('Internacional', 1),
('Electronica', 1),
('Jazz/Instrumental', 1),
('Reggae', 1),
('Ballet/Danza', 2),
('Musicales', 2),
('Espectaculo', 2),
('Performance', 2),
('Obras de Teatro', 2),
('Belleza/Moda', 2),
('Exhibiciones', 2),
('Voces/Coros', 2),
('Drama', 2),
('Festivales Culturales', 2),
('Ensamble/Musica Clasica', 2),
('Orquestas/Opera', 2),
('Automovilismo', 3),
('Toros', 3),
('Deportes Extremos', 3),
('Americano', 3),
('Rodeo', 3),
('Handball', 3),
('Artes Marciales Mixtas', 3),
('Tenis', 3),
('Box/Lucha Libre', 3),
('Beisbol', 3),
('Equestre', 3),
('Futbol', 3),
('On Ice', 4),
('Campamentos/Tours', 4),
('Parque de diversiones', 4),
('Circos/Espectaculo Infantil', 4),
('Magia', 4),
('Espacios Infantiles', 4),
('Ferias/Festivales', 4),
('Acuarios/Parques Acuaticos', 4),
('Absurdo/Busqueda/Farsa', 4),
('Certificados de regalo', 5),
('Seminarios/Conferencias', 5),
('Hotel', 5),
('Especiales', 5),
('Sorteos', 5),
('Expo/Convencion', 5),
('Campamentos', 5),
('Guias', 5),
('Restaurantes', 5),
('Paquete Comida/Cena', 5),
('Audiovisual/Cine', 5),
('Merchandise', 5),
('Cupones', 5),
('Estacionamiento', 5),
('Donaciones', 5),
('Audio Tours', 5)
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
