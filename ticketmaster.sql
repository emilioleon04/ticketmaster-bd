-- =========================================================
-- 1. Tablas Base y Catálogos
-- =========================================================

CREATE TABLE inmueble (
    inmueble_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    capacidad INTEGER,
    direccion VARCHAR(255),
    pais VARCHAR(100),
    codigo_postal VARCHAR(20),
    municipio_alcaldia VARCHAR(100),
    prefijo VARCHAR(50)
);

CREATE TABLE grupo_evento (
    grupo_id SERIAL PRIMARY KEY,
    nombre_grupo VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE categoria (
    categoria_id SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);

CREATE TABLE subcategoria (
    subcategoria_id SERIAL PRIMARY KEY,
    nombre_subcategoria VARCHAR(100),
    categoria_id INTEGER REFERENCES categoria(categoria_id)
);

CREATE TABLE artista_organizacion (
    artista_org_id SERIAL PRIMARY KEY,
    nombre_artista_org VARCHAR(255),
    subcategoria_id INTEGER REFERENCES subcategoria(subcategoria_id)
);

CREATE TABLE cargo_servicio (
    cargo_servicio_id SERIAL PRIMARY KEY,
    porcentaje DECIMAL(5,2),
    limite DECIMAL(10,2)
);

CREATE TABLE beneficio (
    beneficio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE promocion (
    promocion_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    tipo VARCHAR(50),
    valor DECIMAL(10,2),
    limite_uso INTEGER,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP
);

-- =========================================================
-- 2. Gestión de Eventos y Mapas
-- =========================================================

CREATE TABLE evento (
    evento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    status VARCHAR(50),
    cartel VARCHAR(255),
    fecha_hora TIMESTAMP,
    grupo_evento_id INTEGER REFERENCES grupo_evento(grupo_id),
    artista_org_id INTEGER REFERENCES artista_organizacion(artista_org_id)
);

CREATE TABLE plano (
    plano_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    mapa VARCHAR(255),
    inmueble_id INTEGER REFERENCES inmueble(inmueble_id)
);

CREATE TABLE plano_evento (
    plano_evento_id SERIAL PRIMARY KEY,
    mapa VARCHAR(255),
    plano_id INTEGER REFERENCES plano(plano_id),
    evento_id INTEGER REFERENCES evento(evento_id)
);

CREATE TABLE seccion (
    seccion_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    pasillo VARCHAR(50),
    acceso_puerta VARCHAR(50),
    plano_evento_id INTEGER REFERENCES plano_evento(plano_evento_id)
);

-- =========================================================
-- 3. Precios y Paquetes
-- =========================================================

CREATE TABLE lista_precio (
    lista_precio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    fase_venta VARCHAR(100),
    codigo VARCHAR(50),
    precio_base DECIMAL(10,2),
    paquete_precio BOOLEAN DEFAULT FALSE,
    cargo_servicio_id INTEGER REFERENCES cargo_servicio(cargo_servicio_id),
    evento_id INTEGER REFERENCES evento(evento_id)
);

CREATE TABLE paquete (
    paquete_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    costo_adicional DECIMAL(10,2) DEFAULT 0.00,
    lista_precio_id INTEGER REFERENCES lista_precio(lista_precio_id)
);

CREATE TABLE detalle_paquete (
    paquete_detalle_id SERIAL PRIMARY KEY,
    cantidad INTEGER,
    paquete_id INTEGER REFERENCES paquete(paquete_id),
    beneficio_id INTEGER REFERENCES beneficio(beneficio_id)
);

CREATE TABLE precio_promocion (
    precio_promocion_id SERIAL PRIMARY KEY,
    tope_descuento DECIMAL(10,2),
    cantidad_max INTEGER,
    activo BOOLEAN DEFAULT TRUE,
    promocion_id INTEGER REFERENCES promocion(promocion_id),
    lista_precio_id INTEGER REFERENCES lista_precio(lista_precio_id)
);

-- =========================================================
-- 4. Clientes, Perfiles y Pagos (Herencia)
-- =========================================================

CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo_electronico VARCHAR(255) UNIQUE NOT NULL,
    num_telefono VARCHAR(20),
    pais VARCHAR(100),
    codigo_postal VARCHAR(20),
    contrasena VARCHAR(255)
);

CREATE TABLE cartera (
    cartera_id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES cliente(cliente_id)
);

-- PADRE (Método Pago)
CREATE TABLE metodo_pago (
    metodo_id SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL, 
    cartera_id INTEGER REFERENCES cartera(cartera_id)
);

-- HIJO 1: Tarjeta Bancaria
CREATE TABLE tarjeta (
    metodo_id INTEGER PRIMARY KEY REFERENCES metodo_pago(metodo_id),
    numero_tarjeta VARCHAR(20),
    pais VARCHAR(100),
    codigo_postal VARCHAR(20),
    cvv VARCHAR(4),
    nombre_titular VARCHAR(255),
    ciudad VARCHAR(100),
    direccion VARCHAR(255),
    direccion2 VARCHAR(255),
    fecha_expiracion DATE
);

-- HIJO 2: Gift Card
CREATE TABLE tarjeta_regalo (
    metodo_id INTEGER PRIMARY KEY REFERENCES metodo_pago(metodo_id),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    saldo DECIMAL(10,2),
    saldo_restante DECIMAL(10,2)
);

CREATE TABLE direccion_facturacion (
    facturacion_id SERIAL PRIMARY KEY,
    direccion VARCHAR(255),
    direccion2 VARCHAR(255),
    pais VARCHAR(100),
    ciudad VARCHAR(100),
    codigo_postal VARCHAR(20),
    cartera_id INTEGER REFERENCES cartera(cartera_id)
);

ALTER TABLE cliente ADD COLUMN cartera_id INTEGER REFERENCES cartera(cartera_id);

CREATE TABLE favorito (
    cliente_id INTEGER REFERENCES cliente(cliente_id),
    artista_org_id INTEGER REFERENCES artista_organizacion(artista_org_id),
    PRIMARY KEY (cliente_id, artista_org_id)
);

CREATE TABLE resena (
    resena_id SERIAL PRIMARY KEY,
    calificacion INTEGER CHECK (calificacion BETWEEN 1 AND 5),
    nombre_autor VARCHAR(100),
    titulo VARCHAR(255),
    descripcion TEXT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    artista_org_id INTEGER REFERENCES artista_organizacion(artista_org_id)
);

-- =========================================================
-- 5. Carrito y Transacciones
-- =========================================================

CREATE TABLE carrito (
    carrito_id SERIAL PRIMARY KEY,
    total DECIMAL(10,2) DEFAULT 0,
    estatus VARCHAR(50),
    cargo_procesamiento DECIMAL(10,2),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP
);

CREATE TABLE cupon (
    cupon_id SERIAL PRIMARY KEY,
    codigo VARCHAR(50),
    descripcion TEXT,
    tipo VARCHAR(50),
    valor DECIMAL(10,2),
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    limite_uso INTEGER,
    limite_uso_cliente INTEGER,
    activo BOOLEAN DEFAULT TRUE,
    aplica_total BOOLEAN DEFAULT FALSE
);

CREATE TABLE detalle_carrito (
    detalle_carrito_id SERIAL PRIMARY KEY,
    precio_base DECIMAL(10,2),
    cargo_servicio DECIMAL(10,2),
    precio_paquete DECIMAL(10,2),
    total DECIMAL(10,2),
    carrito_id INTEGER REFERENCES carrito(carrito_id),
    cupon_id INTEGER REFERENCES cupon(cupon_id)
);

ALTER TABLE cupon ADD COLUMN detalle_carrito_id INTEGER REFERENCES detalle_carrito(detalle_carrito_id);

CREATE TABLE transaccion (
    transaccion_id SERIAL PRIMARY KEY,
    total DECIMAL(10,2),
    estatus VARCHAR(50),
    cargo_procesamiento DECIMAL(10,2),
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    carrito_id INTEGER REFERENCES carrito(carrito_id),
    metodo_pago INTEGER REFERENCES metodo_pago(metodo_id)
);

CREATE TABLE detalle_transaccion (
    detalle_txn_id SERIAL PRIMARY KEY,
    precio_base DECIMAL(10,2),
    cargo_servicio DECIMAL(10,2),
    precio_paquete DECIMAL(10,2),
    total DECIMAL(10,2),
    transaccion_id INTEGER REFERENCES transaccion(transaccion_id)
);

CREATE TABLE detalle_pago (
    detalle_pago_id SERIAL PRIMARY KEY,
    monto DECIMAL(10,2) NOT NULL,
    transaccion_id INTEGER REFERENCES transaccion(transaccion_id),
    metodo_id INTEGER REFERENCES metodo_pago(metodo_id)
);

-- =========================================================
-- 6. Boletaje y Asientos
-- =========================================================

CREATE TABLE asiento (
    asiento_id SERIAL PRIMARY KEY,
    fila VARCHAR(50),
    numero VARCHAR(50),
    disponible BOOLEAN DEFAULT TRUE,
    seccion_id INTEGER REFERENCES seccion(seccion_id),
    detalle_carrito_id INTEGER REFERENCES detalle_carrito(detalle_carrito_id)
);

CREATE TABLE asiento_precio (
    asiento_precio_id SERIAL PRIMARY KEY,
    asiento_id INTEGER REFERENCES asiento(asiento_id),
    lista_precio_id INTEGER REFERENCES lista_precio(lista_precio_id)
);

CREATE TABLE boleto (
    boleto_id SERIAL PRIMARY KEY,
    folio VARCHAR(100) UNIQUE,
    codigo_barras VARCHAR(255),
    hash_seguridad VARCHAR(512),
    token_digital VARCHAR(512),
    asiento_id INTEGER REFERENCES asiento(asiento_id),
    detalle_txn_id INTEGER REFERENCES detalle_transaccion(detalle_txn_id),
    cliente_actual_id INTEGER REFERENCES cliente(cliente_id)
);

CREATE TABLE transferencia_boleto (
    transferencia_id SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50),
    boleto_id INTEGER REFERENCES boleto(boleto_id),
    origen_id INTEGER REFERENCES cliente(cliente_id),
    destino_id INTEGER REFERENCES cliente(cliente_id)
);