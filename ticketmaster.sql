-- 1. CATÁLOGOS Y BASE
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
    categoria_id INTEGER -- FK pendiente
);

CREATE TABLE artista_organizacion (
    artista_org_id SERIAL PRIMARY KEY,
    nombre_artista_org VARCHAR(255),
    subcategoria_id INTEGER -- FK pendiente
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

-- 2. EVENTOS
CREATE TABLE evento (
    evento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    status VARCHAR(50),
    cartel VARCHAR(255),
    fecha_hora TIMESTAMP,
    grupo_evento_id INTEGER, -- FK pendiente
    artista_org_id INTEGER   -- FK pendiente
);

CREATE TABLE plano (
    plano_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    mapa VARCHAR(255),
    inmueble_id INTEGER -- FK pendiente
);

CREATE TABLE plano_evento (
    plano_evento_id SERIAL PRIMARY KEY,
    mapa VARCHAR(255),
    plano_id INTEGER, -- FK pendiente
    evento_id INTEGER -- FK pendiente
);

CREATE TABLE seccion (
    seccion_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    pasillo VARCHAR(50),
    acceso_puerta VARCHAR(50),
    plano_evento_id INTEGER -- FK pendiente
);

-- 3. PRECIOS
CREATE TABLE lista_precio (
    lista_precio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    fase_venta VARCHAR(100),
    codigo VARCHAR(50),
    precio_base DECIMAL(10,2),
    paquete_precio BOOLEAN DEFAULT FALSE,
    cargo_servicio_id INTEGER, -- FK pendiente
    evento_id INTEGER          -- FK pendiente
);

CREATE TABLE paquete (
    paquete_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    costo_adicional DECIMAL(10,2) DEFAULT 0.00,
    lista_precio_id INTEGER -- FK pendiente
);

CREATE TABLE detalle_paquete (
    paquete_detalle_id SERIAL PRIMARY KEY,
    cantidad INTEGER,
    paquete_id INTEGER,   -- FK pendiente
    beneficio_id INTEGER  -- FK pendiente
);

CREATE TABLE precio_promocion (
    precio_promocion_id SERIAL PRIMARY KEY,
    tope_descuento DECIMAL(10,2),
    cantidad_max INTEGER,
    activo BOOLEAN DEFAULT TRUE,
    promocion_id INTEGER,   -- FK pendiente
    lista_precio_id INTEGER -- FK pendiente
);

-- 4. CLIENTES Y PAGOS
CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo_electronico VARCHAR(255) UNIQUE NOT NULL,
    num_telefono VARCHAR(20),
    pais VARCHAR(100),
    codigo_postal VARCHAR(20),
    contrasena VARCHAR(255),
    cartera_id INTEGER -- FK Circular pendiente
);

CREATE TABLE cartera (
    cartera_id SERIAL PRIMARY KEY,
    cliente_id INTEGER -- FK pendiente
);

CREATE TABLE metodo_pago (
    metodo_id SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL, 
    cartera_id INTEGER -- FK pendiente
);

CREATE TABLE tarjeta (
    metodo_id INTEGER PRIMARY KEY, -- FK pendiente (Herencia)
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

CREATE TABLE tarjeta_regalo (
    metodo_id INTEGER PRIMARY KEY, -- FK pendiente (Herencia)
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
    cartera_id INTEGER -- FK pendiente
);

CREATE TABLE favorito (
    cliente_id INTEGER,     -- FK pendiente
    artista_org_id INTEGER, -- FK pendiente
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
    artista_org_id INTEGER -- FK pendiente
);

-- 5. CARRITO Y TRANSACCIONES
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
    aplica_total BOOLEAN DEFAULT FALSE,
    detalle_carrito_id INTEGER -- FK pendiente (Circular)
);

CREATE TABLE detalle_carrito (
    detalle_carrito_id SERIAL PRIMARY KEY,
    precio_base DECIMAL(10,2),
    cargo_servicio DECIMAL(10,2),
    precio_paquete DECIMAL(10,2),
    total DECIMAL(10,2),
    carrito_id INTEGER, -- FK pendiente
    cupon_id INTEGER    -- FK pendiente
);

CREATE TABLE transaccion (
    transaccion_id SERIAL PRIMARY KEY,
    total DECIMAL(10,2),
    estatus VARCHAR(50),
    cargo_procesamiento DECIMAL(10,2),
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    carrito_id INTEGER, -- FK pendiente
    metodo_pago INTEGER -- FK pendiente
);

CREATE TABLE detalle_transaccion (
    detalle_txn_id SERIAL PRIMARY KEY,
    precio_base DECIMAL(10,2),
    cargo_servicio DECIMAL(10,2),
    precio_paquete DECIMAL(10,2),
    total DECIMAL(10,2),
    transaccion_id INTEGER -- FK pendiente
);

CREATE TABLE detalle_pago (
    detalle_pago_id SERIAL PRIMARY KEY,
    monto DECIMAL(10,2) NOT NULL,
    transaccion_id INTEGER, -- FK pendiente
    metodo_id INTEGER       -- FK pendiente
);

-- 6. BOLETAJE
CREATE TABLE asiento (
    asiento_id SERIAL PRIMARY KEY,
    fila VARCHAR(50),
    numero VARCHAR(50),
    disponible BOOLEAN DEFAULT TRUE,
    seccion_id INTEGER, -- FK pendiente
    detalle_carrito_id INTEGER -- FK pendiente
);

CREATE TABLE asiento_precio (
    asiento_precio_id SERIAL PRIMARY KEY,
    asiento_id INTEGER, -- FK pendiente
    lista_precio_id INTEGER -- FK pendiente
);

CREATE TABLE boleto (
    boleto_id SERIAL PRIMARY KEY,
    folio VARCHAR(100) UNIQUE,
    codigo_barras VARCHAR(255),
    hash_seguridad VARCHAR(512),
    token_digital VARCHAR(512),
    asiento_id INTEGER, -- FK pendiente
    detalle_txn_id INTEGER, -- FK pendiente
    cliente_actual_id INTEGER -- FK pendiente
);

CREATE TABLE transferencia_boleto (
    transferencia_id SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50),
    boleto_id INTEGER, -- FK pendiente
    origen_id INTEGER, -- FK pendiente
    destino_id INTEGER -- FK pendiente
);

-- CATÁLOGOS
ALTER TABLE subcategoria ADD CONSTRAINT fk_subcat_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id);
ALTER TABLE artista_organizacion ADD CONSTRAINT fk_artista_subcat FOREIGN KEY (subcategoria_id) REFERENCES subcategoria(subcategoria_id);

-- EVENTOS
ALTER TABLE evento ADD CONSTRAINT fk_evento_grupo FOREIGN KEY (grupo_evento_id) REFERENCES grupo_evento(grupo_id);
ALTER TABLE evento ADD CONSTRAINT fk_evento_artista FOREIGN KEY (artista_org_id) REFERENCES artista_organizacion(artista_org_id);
ALTER TABLE plano ADD CONSTRAINT fk_plano_inmueble FOREIGN KEY (inmueble_id) REFERENCES inmueble(inmueble_id);
ALTER TABLE plano_evento ADD CONSTRAINT fk_planoevt_plano FOREIGN KEY (plano_id) REFERENCES plano(plano_id);
ALTER TABLE plano_evento ADD CONSTRAINT fk_planoevt_evento FOREIGN KEY (evento_id) REFERENCES evento(evento_id);
ALTER TABLE seccion ADD CONSTRAINT fk_seccion_planoevt FOREIGN KEY (plano_evento_id) REFERENCES plano_evento(plano_evento_id);

-- PRECIOS
ALTER TABLE lista_precio ADD CONSTRAINT fk_lista_cargo FOREIGN KEY (cargo_servicio_id) REFERENCES cargo_servicio(cargo_servicio_id);
ALTER TABLE lista_precio ADD CONSTRAINT fk_lista_evento FOREIGN KEY (evento_id) REFERENCES evento(evento_id);
ALTER TABLE paquete ADD CONSTRAINT fk_paquete_lista FOREIGN KEY (lista_precio_id) REFERENCES lista_precio(lista_precio_id);
ALTER TABLE detalle_paquete ADD CONSTRAINT fk_detpaq_paquete FOREIGN KEY (paquete_id) REFERENCES paquete(paquete_id);
ALTER TABLE detalle_paquete ADD CONSTRAINT fk_detpaq_beneficio FOREIGN KEY (beneficio_id) REFERENCES beneficio(beneficio_id);
ALTER TABLE precio_promocion ADD CONSTRAINT fk_precioprom_promo FOREIGN KEY (promocion_id) REFERENCES promocion(promocion_id);
ALTER TABLE precio_promocion ADD CONSTRAINT fk_precioprom_lista FOREIGN KEY (lista_precio_id) REFERENCES lista_precio(lista_precio_id);

-- CLIENTES
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_cartera FOREIGN KEY (cartera_id) REFERENCES cartera(cartera_id);
ALTER TABLE cartera ADD CONSTRAINT fk_cartera_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id);
ALTER TABLE metodo_pago ADD CONSTRAINT fk_metodo_cartera FOREIGN KEY (cartera_id) REFERENCES cartera(cartera_id);
ALTER TABLE tarjeta ADD CONSTRAINT fk_tarjeta_padre FOREIGN KEY (metodo_id) REFERENCES metodo_pago(metodo_id);
ALTER TABLE tarjeta_regalo ADD CONSTRAINT fk_regalo_padre FOREIGN KEY (metodo_id) REFERENCES metodo_pago(metodo_id);
ALTER TABLE direccion_facturacion ADD CONSTRAINT fk_dir_cartera FOREIGN KEY (cartera_id) REFERENCES cartera(cartera_id);
ALTER TABLE favorito ADD CONSTRAINT fk_fav_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id);
ALTER TABLE favorito ADD CONSTRAINT fk_fav_artista FOREIGN KEY (artista_org_id) REFERENCES artista_organizacion(artista_org_id);
ALTER TABLE resena ADD CONSTRAINT fk_resena_artista FOREIGN KEY (artista_org_id) REFERENCES artista_organizacion(artista_org_id);

-- VENTAS
ALTER TABLE cupon ADD CONSTRAINT fk_cupon_detalle FOREIGN KEY (detalle_carrito_id) REFERENCES detalle_carrito(detalle_carrito_id);
ALTER TABLE detalle_carrito ADD CONSTRAINT fk_detcarr_carrito FOREIGN KEY (carrito_id) REFERENCES carrito(carrito_id);
ALTER TABLE detalle_carrito ADD CONSTRAINT fk_detcarr_cupon FOREIGN KEY (cupon_id) REFERENCES cupon(cupon_id);
ALTER TABLE transaccion ADD CONSTRAINT fk_txn_carrito FOREIGN KEY (carrito_id) REFERENCES carrito(carrito_id);
ALTER TABLE transaccion ADD CONSTRAINT fk_txn_metodo FOREIGN KEY (metodo_pago) REFERENCES metodo_pago(metodo_id);
ALTER TABLE detalle_transaccion ADD CONSTRAINT fk_dettxn_txn FOREIGN KEY (transaccion_id) REFERENCES transaccion(transaccion_id);
ALTER TABLE detalle_pago ADD CONSTRAINT fk_detpago_txn FOREIGN KEY (transaccion_id) REFERENCES transaccion(transaccion_id);
ALTER TABLE detalle_pago ADD CONSTRAINT fk_detpago_metodo FOREIGN KEY (metodo_id) REFERENCES metodo_pago(metodo_id);

-- BOLETAJE
ALTER TABLE asiento ADD CONSTRAINT fk_asiento_seccion FOREIGN KEY (seccion_id) REFERENCES seccion(seccion_id);
ALTER TABLE asiento ADD CONSTRAINT fk_asiento_detcarr FOREIGN KEY (detalle_carrito_id) REFERENCES detalle_carrito(detalle_carrito_id);
ALTER TABLE asiento_precio ADD CONSTRAINT fk_asientoprecio_asiento FOREIGN KEY (asiento_id) REFERENCES asiento(asiento_id);
ALTER TABLE asiento_precio ADD CONSTRAINT fk_asientoprecio_lista FOREIGN KEY (lista_precio_id) REFERENCES lista_precio(lista_precio_id);
ALTER TABLE boleto ADD CONSTRAINT fk_boleto_asiento FOREIGN KEY (asiento_id) REFERENCES asiento(asiento_id);
ALTER TABLE boleto ADD CONSTRAINT fk_boleto_dettxn FOREIGN KEY (detalle_txn_id) REFERENCES detalle_transaccion(detalle_txn_id);
ALTER TABLE boleto ADD CONSTRAINT fk_boleto_cliente FOREIGN KEY (cliente_actual_id) REFERENCES cliente(cliente_id);
ALTER TABLE transferencia_boleto ADD CONSTRAINT fk_transf_boleto FOREIGN KEY (boleto_id) REFERENCES boleto(boleto_id);
ALTER TABLE transferencia_boleto ADD CONSTRAINT fk_transf_origen FOREIGN KEY (origen_id) REFERENCES cliente(cliente_id);
ALTER TABLE transferencia_boleto ADD CONSTRAINT fk_transf_destino FOREIGN KEY (destino_id) REFERENCES cliente(cliente_id);
