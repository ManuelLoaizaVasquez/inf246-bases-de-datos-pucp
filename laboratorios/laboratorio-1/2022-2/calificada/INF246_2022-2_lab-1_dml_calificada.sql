/* Inserción de insumos */

INSERT INTO sp_dimension (
    id_dimension,
    denominacion
) VALUES (
    'l',
    'Longitud'
);

INSERT INTO sp_dimension (
    id_dimension,
    denominacion
) VALUES (
    'm',
    'Masa'
);

INSERT INTO sp_dimension (
    id_dimension,
    denominacion
) VALUES (
    'v',
    'Volumen'
);

INSERT INTO sp_dimension (
    id_dimension,
    denominacion
) VALUES (
    'c',
    'Cantidad'
);

INSERT INTO sp_unidad_divisoria (
    id_unidad,
    nombre,
    id_dimension
) VALUES (
    'ft2',
    'Pulgada cuadrada',
    'l'
);

INSERT INTO sp_unidad_divisoria (
    id_unidad,
    nombre,
    id_dimension
) VALUES (
    'gal',
    'Galón',
    'v'
);

INSERT INTO sp_unidad_divisoria (
    id_unidad,
    nombre,
    id_dimension
) VALUES (
    'unid',
    'Unidad',
    'c'
);

INSERT INTO sp_unidad_divisoria (
    id_unidad,
    nombre,
    id_dimension
) VALUES (
    'par',
    'Par',
    'c'
);

INSERT INTO sp_insumo (
    id_insumo,
    nombre,
    tipo_material,
    id_unidad,
    precio,
    stock,
    estado
) VALUES (
    1,
    'Cuero nacional',
    'Cuero',
    'ft2',
    0.96,
    529.30,
    'A'
);

INSERT INTO sp_insumo (
    id_insumo,
    nombre,
    tipo_material,
    id_unidad,
    precio,
    stock,
    estado
) VALUES (
    2,
    'Cuero argentino',
    'Cuero',
    'ft2',
    1.27,
    128.95,
    'A'
);

INSERT INTO sp_insumo (
    id_insumo,
    nombre,
    tipo_material,
    id_unidad,
    precio,
    stock,
    estado
) VALUES (
    3,
    'Pegamento ',
    'Adhesivo',
    'gal',
    8.60,
    30.00,
    'A'
);

INSERT INTO sp_insumo (
    id_insumo,
    nombre,
    tipo_material,
    id_unidad,
    precio,
    stock,
    estado
) VALUES (
    4,
    'Tachuelas plastificadas',
    'Plástico',
    'par',
    0.15,
    85,
    'A'
);

INSERT INTO sp_insumo (
    id_insumo,
    nombre,
    tipo_material,
    id_unidad,
    precio,
    stock,
    estado
) VALUES (
    5,
    'Plantillas plastificadas',
    'Plástico',
    'par',
    2.50,
    100,
    'A'
);

/* Inserción de productos */

INSERT INTO sp_tipo_producto (
    id_tipo,
    nombre
) VALUES (
    1,
    'Zapatillas'
);

INSERT INTO sp_tipo_producto (
    id_tipo,
    nombre
) VALUES (
    2,
    'Zapato'
);

INSERT INTO sp_tipo_producto (
    id_tipo,
    nombre
) VALUES (
    3,
    'Mocasines'
);

INSERT INTO sp_tipo_producto (
    id_tipo,
    nombre
) VALUES (
    4,
    'Botines'
);

INSERT INTO sp_producto (
    id_producto,
    nombre,
    id_tipo,
    precio,
    estado,
    stock
) VALUES (
    1,
    'Zapatilla Outdoor Caballero Talla 40',
    1,
    76.50,
    'A',
    20
);

INSERT INTO sp_producto (
    id_producto,
    nombre,
    id_tipo,
    precio,
    estado,
    stock
) VALUES (
    2,
    'Zapato Caballero Talla 41',
    2,
    90.50,
    'A',
    5
);

INSERT INTO sp_producto (
    id_producto,
    nombre,
    id_tipo,
    precio,
    estado,
    stock
) VALUES (
    3,
    'Mocasín Caballero Talla 41',
    3,
    95.50,
    'A',
    0
);

INSERT INTO sp_producto (
    id_producto,
    nombre,
    id_tipo,
    precio,
    estado,
    stock
) VALUES (
    4,
    'Botín Dama Talla 39',
    4,
    110.50,
    'A',
    10
);

INSERT INTO sp_producto (
    id_producto,
    nombre,
    id_tipo,
    precio,
    estado,
    stock
) VALUES (
    5,
    'Zapatilla Outdoor Dama Talla 38',
    1,
    74.50,
    'A',
    15
);

/* Inserción de matriz de insumos */

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    1,
    1,
    1,
    0.75,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    2,
    1,
    3,
    0.90,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    3,
    1,
    4,
    15.00,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    4,
    2,
    1,
    0.70,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    5,
    2,
    3,
    0.90,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    6,
    2,
    5,
    12.00,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    7,
    3,
    2,
    0.95,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    8,
    3,
    3,
    0.90,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    9,
    4,
    2,
    1.20,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    10,
    4,
    4,
    10.00,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    11,
    4,
    5,
    3.00,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    12,
    5,
    1,
    1.50,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

INSERT INTO sp_matriz_insumo (
    id_matriz,
    id_producto,
    id_insumo,
    cantidad,
    ultima_modif
) VALUES (
    13,
    5,
    3,
    0.90,
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD')
);

/* Inserción de orden de compra */

INSERT INTO sp_orden_compra (
    id_orden,
    monto_total,
    monto_igv,
    fecha_registro,
    fecha_autorizacion,
    fecha_entrega,
    estado
) VALUES (
    1,
    223.0,
    40.14,
    TO_TIMESTAMP('2022-09-04', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    'A'
);

INSERT INTO sp_orden_compra (
    id_orden,
    monto_total,
    monto_igv,
    fecha_registro,
    fecha_autorizacion,
    fecha_entrega,
    estado
) VALUES (
    2,
    1088.0,
    195.84,
    TO_TIMESTAMP('2022-09-08', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    'A'
);

INSERT INTO sp_detalle_compra (
    id_compra,
    id_orden,
    id_insumo,
    cantidad
) VALUES (
    1,
    1,
    1,
    100.0
);

INSERT INTO sp_detalle_compra (
    id_compra,
    id_orden,
    id_insumo,
    cantidad
) VALUES (
    2,
    1,
    2,
    100.0
);

INSERT INTO sp_detalle_compra (
    id_compra,
    id_orden,
    id_insumo,
    cantidad
) VALUES (
    3,
    2,
    3,
    5.0
);

INSERT INTO sp_detalle_compra (
    id_compra,
    id_orden,
    id_insumo,
    cantidad
) VALUES (
    4,
    2,
    4,
    300.0
);

INSERT INTO sp_detalle_compra (
    id_compra,
    id_orden,
    id_insumo,
    cantidad
) VALUES (
    5,
    2,
    5,
    400.0
);


/* Inserción de orden de compra */

INSERT INTO sp_orden_produccion (
    id_orden,
    motivo,
    fecha_registro,
    fecha_autorizacion,
    fecha_fin,
    estado
) VALUES (
    1,
    'P',
    TO_TIMESTAMP('2022-07-04', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    'A'
);

INSERT INTO sp_orden_produccion (
    id_orden,
    motivo,
    fecha_registro,
    fecha_autorizacion,
    fecha_fin,
    estado
) VALUES (
    2,
    'E',
    TO_TIMESTAMP('2022-07-18', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    'A'
);

INSERT INTO sp_orden_produccion (
    id_orden,
    motivo,
    fecha_registro,
    fecha_autorizacion,
    fecha_fin,
    estado
) VALUES (
    3,
    'P',
    TO_TIMESTAMP('2022-08-04', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    'A'
);

INSERT INTO sp_orden_produccion (
    id_orden,
    motivo,
    fecha_registro,
    fecha_autorizacion,
    fecha_fin,
    estado
) VALUES (
    4,
    'E',
    TO_TIMESTAMP('2022-08-18', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-09-09', 'YYYY-MM-DD'),
    'A'
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    1,
    1,
    1,
    15
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    2,
    1,
    2,
    85
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    3,
    2,
    3,
    45
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    4,
    2,
    4,
    105
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    5,
    2,
    5,
    80
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    6,
    3,
    1,
    10
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    7,
    3,
    2,
    80
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    8,
    3,
    3,
    40
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    9,
    4,
    4,
    100
);

INSERT INTO sp_detalle_producto (
    id_compra,
    id_orden,
    id_producto,
    unidades
) VALUES (
    10,
    4,
    5,
    75
);