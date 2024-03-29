ALTER SESSION SET nls_date_format = 'DD/MM/YYYY';

INSERT INTO ce_tipo_documento VALUES (
    1,
    'DNI',
    'A'
);

INSERT INTO ce_tipo_documento VALUES (
    2,
    'CARNE EXTRANJERIA',
    'A'
);

INSERT INTO ce_categoria_producto VALUES (
    1,
    'LINEA BLANCA',
    'A'
);

INSERT INTO ce_categoria_producto VALUES (
    2,
    'MODA',
    'A'
);

INSERT INTO ce_categoria_producto VALUES (
    3,
    'CELULARES',
    'A'
);

INSERT INTO ce_categoria_producto VALUES (
    4,
    'TELEVISORES',
    'A'
);

INSERT INTO ce_marca_producto VALUES (
    1,
    'SAMSUNG',
    'COREA DEL SUR',
    'A'
);

INSERT INTO ce_marca_producto VALUES (
    2,
    'APPLE',
    'ESTADOS UNIDOS',
    'A'
);

INSERT INTO ce_marca_producto VALUES (
    3,
    'LG',
    'COREA DEL SUR',
    'A'
);

INSERT INTO ce_marca_producto VALUES (
    4,
    'ADIDAS',
    'ALEMANIA',
    'A'
);

INSERT INTO ce_marca_producto VALUES (
    5,
    'MOTOROLLA',
    'ESTADOS UNIDOS',
    'A'
);

/*************************/

INSERT INTO ce_ubigeo VALUES (
    '020000',
    'ANCASH',
    '000000'
);--DEPARTAMENTO, 000000 NO EXISTE
INSERT INTO ce_ubigeo VALUES (
    '020100',
    'HUARAZ',
    '020000'
);--PROVINCIA

INSERT INTO ce_ubigeo VALUES (
    '020101',
    'HUARAZ',
    '020100'
);--DISTRITO
INSERT INTO ce_ubigeo VALUES (
    '020102',
    'COCHABAMBA',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020103',
    'COLCABAMBA',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020104',
    'HUANCHAY',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020105',
    'INDEPENDENCIA',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020106',
    'JANGAS',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020107',
    'LA LIBERTAD',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020108',
    'OLLEROS',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020109',
    'PAMPAS',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020110',
    'PARIACOTO',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020111',
    'PIRA',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020112',
    'TARICA',
    '020100'
);

INSERT INTO ce_ubigeo VALUES (
    '020200',
    'AIJA',
    '020000'
);--PROVINCIA

INSERT INTO ce_ubigeo VALUES (
    '020201',
    'AIJA',
    '020200'
);--DISTRITO
INSERT INTO ce_ubigeo VALUES (
    '020202',
    'CORIS',
    '020200'
);

INSERT INTO ce_ubigeo VALUES (
    '020203',
    'HUACLLAN',
    '020200'
);

INSERT INTO ce_ubigeo VALUES (
    '020204',
    'LA MERCED',
    '020200'
);

INSERT INTO ce_ubigeo VALUES (
    '020205',
    'SUCCHA',
    '020200'
);

/******************************/


INSERT INTO ce_cliente VALUES (
    1,
    'CILLIANI',
    'DELGADO',
    'BECKER',
    1,
    '42525748',
    TO_DATE('1984-02-10', 'YYYY-MM-DD'),
    '986475225',
    'BCILLIANI@GMAIL.COM',
    'BCILLIANI84',
    'A'
);

INSERT INTO ce_cliente VALUES (
    2,
    'AVENDALLO',
    'GARCIA',
    'MARIA LUISA',
    1,
    '41315781',
    TO_DATE('1982-05-02', 'YYYY-MM-DD'),
    '996584112',
    'AAVENDALLO@OUTLOOK.COM',
    'P3PU3NIO5',
    'A'
);

INSERT INTO ce_cliente VALUES (
    3,
    'MENDIETA',
    'JERI',
    'OSWALDO',
    1,
    '07859521',
    TO_DATE('1970-04-10', 'YYYY-MM-DD'),
    '815475002',
    'OMENDIETA@YAHOO.COM',
    '07859521_',
    'A'
);

INSERT INTO ce_cliente VALUES (
    4,
    'CASTILLO',
    'ALIAGA',
    'OMAR',
    2,
    '105874569521457',
    TO_DATE('2000-12-18', 'YYYY-MM-DD'),
    '911852410',
    'TURISTA1@GMAIL.COM',
    'TST123',
    'A'
);

INSERT INTO ce_cliente VALUES (
    5,
    'SMITH',
    'ROB',
    'DUST',
    2,
    '123456715482014',
    TO_DATE('1977-02-10', 'YYYY-MM-DD'),
    '922222121',
    'DUST11@GMAIL.COM',
    'DUST11',
    'A'
);

INSERT INTO ce_direccion VALUES (
    1,
    1,
    'JIRON MARIANO NECOCHEA 667',
    'C',
    '020101',
    'CUADRA 71 AV UNIVERSITARIA',
    'A'
);

INSERT INTO ce_direccion VALUES (
    2,
    1,
    'AV BRASIL 1024 DPTO 401',
    'D',
    '020101',
    'CUADRA 10 AV BRASIL',
    'A'
);

INSERT INTO ce_direccion VALUES (
    3,
    2,
    'CALLE LOS GLADIOLOS 541',
    'C',
    '020101',
    'GRIFO LOS GLADIOLOS',
    'A'
);

INSERT INTO ce_direccion VALUES (
    4,
    2,
    'JIRON INDEPENDENCIA 440 DPTO 301',
    'D',
    '020101',
    'CUADRA 3 AV UNIVERSITARIA',
    'A'
);

INSERT INTO ce_direccion VALUES (
    5,
    3,
    'AV LOS CONTRUCTORES 120',
    'C',
    '020101',
    'CUADRA 1 AV CONSTRUCTORES',
    'A'
);

INSERT INTO ce_direccion VALUES (
    6,
    4,
    'AV PRECURSORES 124',
    'C',
    '020101',
    'COSTADO APRQUE DE LAS LEYENDAS',
    'A'
);

INSERT INTO ce_direccion VALUES (
    7,
    5,
    'AV PERSHING 1050',
    'C',
    '020101',
    'RESIDENCIAL SAN FELIPE',
    'A'
); 

/******************************/


INSERT INTO ce_proveedor VALUES (
    1,
    'LEEASE SAC',
    '20101329255',
    '+51 91234589',
    'email@gmail.com',
    'password123',
    'I'
);

INSERT INTO ce_proveedor VALUES (
    2,
    'SANSUNG SAC',
    '20201329255',
    '+51 91234589',
    'email@gmail.com',
    'password123',
    'A'
);

INSERT INTO ce_proveedor VALUES (
    3,
    'APPLE SAC',
    '20603329255',
    '+51 91234589',
    'email@gmail.com',
    'password123',
    'A'
);

INSERT INTO ce_proveedor VALUES (
    4,
    'LG SAC',
    '20401329255',
    '+51 91234589',
    'email@gmail.com',
    'password123',
    'A'
);

INSERT INTO ce_proveedor VALUES (
    5,
    'MOTOROLA SAC',
    '20501329255',
    '+51 91234589',
    'email@gmail.com',
    'password123',
    'I'
);

INSERT INTO ce_proveedor VALUES (
    6,
    'ADIDAS SAC',
    '20501329255',
    '+51 91234589',
    'email@gmail.com',
    'password123',
    'A'
);

INSERT INTO ce_proveedor VALUES (
    7,
    'RUNNING SAC',
    '20501329255',
    '+51 91234589',
    'email@gmail.com',
    'password123',
    'A'
);

/******************************/


INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    1,
    1,
    1,
    'REFRIGERADORA SAMSUNG NO FROST',
    'RANGO DE CAPACIDAD (LITROS) 251 A 350 LT',
    'A',
    1050,
    15,
    2
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    2,
    1,
    3,
    'REFRIGERADORA LG NO FROST',
    'RANGO DE CAPACIDAD (LITROS) 249 A 320 LT',
    'A',
    1050,
    10,
    4
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    3,
    1,
    3,
    'REFRIGERADORA LG 617L',
    'CAPACIDAD NETA (L) 617',
    'A',
    2150,
    2,
    4
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    4,
    3,
    1,
    'CELULAR SAMSUNG GALAXY S20',
    'CELULAR SAMSUNG GALAXY S20 FE SM 6.5" FULL HD+128GB 12MP+12MP+8MP+32MP - AZUL',
    'A',
    2500,
    5,
    2
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    5,
    3,
    2,
    'CELULAR IPHONE 13',
    'IPHONE 13 6.1" 128GB 12MP + 12MP - AZUL MEDIANOCHE',
    'A',
    3000,
    7,
    3
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    6,
    3,
    2,
    'CELULAR IPHONE 12',
    'IPHONE 12 6.1" 128GB 12MP + 12MP - BLANCO',
    'A',
    2870,
    2,
    3
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    7,
    3,
    3,
    'CELULAR LG K62',
    'LG K62 6.6" 128GB 48MP+5MP+2MP+2MP - BLANCO',
    'A',
    1050,
    8,
    4
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    8,
    3,
    1,
    'CELULAR GALAXY Z FOLD2',
    'SAMSUNG GALAXY Z FOLD2 7.6" 256GB 12GB NEGRO',
    'A',
    3050,
    9,
    2
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    9,
    4,
    1,
    'TELEVISOR SAMSUNG UHD 4K',
    'TELEVISOR SAMSUNG UHD 4K 55" SMART TV UN55AU7000GXPE',
    'A',
    6550,
    20,
    2
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    10,
    4,
    1,
    'TELEVISOR SAMSUNG NEO QLED 4K',
    'TELEVISOR SAMSUNG NEO QLED 4K MINI LED 55" SMART TV QN55QN85AAGXPE',
    'A',
    10050,
    15,
    2
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    11,
    4,
    3,
    'TELEVISOR LG LED UHD 4K',
    'TELEVISOR LG LED UHD 4K 65" SMART TV 65UP7750PSB CON THINQ AI',
    'A',
    10050,
    7,
    4
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    12,
    4,
    3,
    'TELEVISOR LG NANOCELL',
    'TELEVISOR LG NANOCELL ULTRA HD 4K 70" SMART TV 70NANO75SPA (2021)',
    'A',
    3150,
    10,
    4
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    13,
    2,
    4,
    'CAMISETA ADIDAS',
    'CAMISETA ADIDAS DE VISITANTE REAL AMDRID 2022 PARA HOMBRE GA7215',
    'A',
    150,
    9,
    6
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    14,
    2,
    4,
    'ZAPATILLAS RUNNING ',
    'ZAPATILLAS RUNNING ADIDAS HOMBRE RUN FALCON 2.0',
    'A',
    250,
    100,
    7
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    15,
    2,
    4,
    'ZAPATILLAS ADIDAS PREDATOR',
    'ZAPATILLAS ADIDAS UNISEX PREDATOR EDGE.4 FLEXIBLE',
    'A',
    200,
    20,
    6
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    16,
    2,
    4,
    'POLERA ADIDAS',
    'POLERA ADIDAS PARA HOMBRE ESSENTIALS',
    'A',
    105,
    15,
    6
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    17,
    3,
    5,
    'MOTO G50',
    'SMARTPHONE MOTOG50 5G',
    'A',
    900,
    15,
    5
);

INSERT INTO ce_producto (
    id_producto,
    id_categoria,
    id_marca,
    nombre,
    descripcion,
    estado,
    precio,
    stock,
    id_proveedor
) VALUES (
    18,
    3,
    5,
    'MOTOG PLUS',
    'SMARTPHONE MOTOG PLUS 5G',
    'A',
    800,
    5,
    5
);

INSERT INTO ce_descuento VALUES (
    1,
    1,
    0.25,
    '01/04/2022',
    '31/12/2022'
);

INSERT INTO ce_descuento VALUES (
    2,
    5,
    0.25,
    '01/05/2022',
    '15/05/2022'
);

INSERT INTO ce_descuento VALUES (
    3,
    6,
    0.30,
    '16/05/2022',
    '01/06/2022'
);

INSERT INTO ce_descuento VALUES (
    4,
    7,
    0.50,
    '27/02/2022',
    '31/03/2022'
);

INSERT INTO ce_descuento VALUES (
    5,
    2,
    0.35,
    '01/04/2022',
    '31/12/2022'
);

INSERT INTO ce_descuento VALUES (
    6,
    10,
    0.50,
    '01/05/2022',
    '15/05/2022'
);

INSERT INTO ce_medio_pago VALUES (
    1,
    'EFECTIVO',
    'A'
);

INSERT INTO ce_medio_pago VALUES (
    2,
    'VISA',
    'A'
);

INSERT INTO ce_medio_pago VALUES (
    3,
    'MASTERCARD',
    'A'
);

INSERT INTO ce_pedido VALUES (
    1,
    '122958214777001-2022',
    1,
    1,
    TO_TIMESTAMP('2022-05-01', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-05-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-05-18', 'YYYY-MM-DD'),
    100,
    18,
    118,
    'R',
    1
);

INSERT INTO ce_pedido VALUES (
    2,
    '122958214777002-2022',
    1,
    2,
    TO_TIMESTAMP('2022-04-01', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-04-09', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-04-15', 'YYYY-MM-DD'),
    55,
    9.9,
    64.9,
    'R',
    2
);

INSERT INTO ce_pedido VALUES (
    3,
    '122958214777003-2022',
    2,
    3,
    TO_TIMESTAMP('2022-01-01', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-01-03', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-01-10', 'YYYY-MM-DD'),
    20,
    3.6,
    23.6,
    'R',
    2
);

INSERT INTO ce_pedido VALUES (
    4,
    '122958214777004-2022',
    2,
    4,
    TO_TIMESTAMP('2022-10-01', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-10-03', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-10-03', 'YYYY-MM-DD'),
    35,
    6.3,
    41.3,
    'R',
    3
);

INSERT INTO ce_pedido VALUES (
    5,
    '122958214777005-2022',
    3,
    5,
    TO_TIMESTAMP('2022-03-15', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-03-17', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2022-03-18', 'YYYY-MM-DD'),
    35,
    6.3,
    41.3,
    'R',
    2
);

INSERT INTO ce_pedido VALUES (
    6,
    '122958214777002-2021',
    3,
    5,
    TO_TIMESTAMP('2021-03-12', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2021-03-15', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2021-03-15', 'YYYY-MM-DD'),
    50,
    9,
    59,
    'R',
    3
);

INSERT INTO ce_pedido_detalle VALUES (
    1,
    1,
    4,
    2,
    5000,
    'A'
);

INSERT INTO ce_pedido_detalle VALUES (
    2,
    5,
    10,
    1,
    10050,
    'A'
);