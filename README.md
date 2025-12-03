# Instrucciones de Poblado de Base de Datos Ticketmaster

Este documento detalla el orden correcto de ejecución de los scripts SQL para poblar la base de datos de Ticketmaster con información simulada, incluyendo catálogos, clientes, eventos futuros y un historial de ventas para 2025.

## Requisitos Previos

- Tener creada la base de datos y el esquema (tablas) definidos.
- Ejecutar los scripts en el orden estricto que se presenta a continuación para evitar errores de integridad referencial (llaves foráneas).

## Orden de Ejecución

Todos los scripts se encuentran en la carpeta `inserts/`.

### 1. Catálogos Base e Infraestructura

Estos scripts crean la estructura fundamental: categorías, recintos, artistas y eventos base.

1.  `1_categorias-subcategorias-cs.sql` - Carga categorías, subcategorías y cargos por servicio.
2.  `2_inmubles-plano.sql` - Define los inmuebles (estadios, teatros) y sus planos base.
3.  `3_artistas.sql` - Catálogo de artistas.
4.  `4_grupo-evento.sql` - Grupos de eventos (ej. "Gira 2024").
5.  `5_evento.sql` - Definición de eventos principales.
6.  `6_plano-evento.sql` - Asocia planos a los eventos.

### 2. Clientes y Métodos de Pago

Generación de usuarios y sus formas de pago.

7.  `7_clientes.sql` - Inserta clientes simulados.
8.  `8_carteras.sql` - Crea las billeteras digitales para los clientes.
9.  `9_metodo_pago.sql` - Asocia métodos de pago (tarjetas) a las carteras.
10. `10_tarjetas.sql` - Detalles específicos de tarjetas (si aplica).
11. `11_cliente-cartera.sql` - Vincula oficialmente los clientes con sus carteras principales.

### 3. Eventos Futuros y Asientos

Carga de eventos para 2027 y la masiva generación de asientos.

12. `12. eventos-2027.sql` - Eventos programados para el futuro lejano.
13. **Carpeta `13_seccion-asientos...`** - **IMPORTANTE:** Ejecutar todos los archivos dentro de esta carpeta (ej. `13_asiento1.sql`, `13_asiento2.sql`, etc.). Estos scripts generan millones de asientos y sus precios. Pueden tardar en ejecutarse.

### 4. Datos Complementarios

Promociones y contenido generado por usuarios.

14. `14_promocion.sql` - Campañas y descuentos.
15. `15_reseñas-dires-tarjetasregalo.sql` - Reseñas de eventos, direcciones y tarjetas de regalo.

### 5. Historial y Simulación de Ventas

Generación de transacciones y boletos vendidos.

16. `17_eventos_2025_full.sql` - **Historial 2025:** Crea eventos pasados (2025), configura su infraestructura y simula ventas cerradas ("Sold Out") para generar un historial de transacciones realista.
17. `16_simulador_venta.sql` - **Simulador de Ventas:** Ejecuta una simulación masiva de compras sobre los eventos y asientos disponibles (creados en el paso 13), generando carritos, transacciones y boletos en tiempo real.

---

## Notas Adicionales

- **Idempotencia:** La mayoría de los scripts de catálogos usan `ON CONFLICT DO NOTHING`, por lo que pueden re-ejecutarse sin duplicar información estática.
- **Rendimiento:** Los scripts de asientos (Paso 13) y el simulador de ventas (Paso 17) manejan grandes volúmenes de datos. Tenga paciencia durante su ejecución.
