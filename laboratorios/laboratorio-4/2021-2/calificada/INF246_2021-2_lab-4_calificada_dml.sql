-- PP_REGION
INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '010000',
    'Cajamarca'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '020000',
    'Ancash'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '030000',
    'Ayacucho'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '040000',
    'Arequipa'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '050000',
    'Cuzco'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '060000',
    'Ucayali'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '080000',
    'Loreto'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '090000',
    'Huanuco'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '140000',
    'Lambayeque'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '150000',
    'Lima'
);

INSERT INTO pp_region (
    id_region,
    nombre
) VALUES (
    '210000',
    'Puno'
);

-- PP_PROVINCIA
INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '010100',
    'San Miguel',
    '010000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '020200',
    'Carlos F Fitzcarrald',
    '020000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '030300',
    'La Mar',
    '030000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '040400',
    'Camana',
    '040000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '050500',
    'Espinar',
    '050000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '060600',
    'Padre Abad',
    '060000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '150700',
    'Lima',
    '150000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '080800',
    'Ucayali',
    '080000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '090900',
    'Ambo',
    '090000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '151100',
    'Canhete',
    '150000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '150600',
    'Huaral',
    '150000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '210500',
    'El Collao',
    '210000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '140100',
    'Chiclayo',
    '140000'
);

INSERT INTO pp_provincia (
    id_provincia,
    nombre,
    id_region
) VALUES (
    '140200',
    'Ferrenhafe',
    '140000'
);

-- PP_DISTRITO
INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '150701',
    'San Isidro',
    '150700'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '150702',
    'La Victoria',
    '150700'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '150703',
    'San Miguel',
    '150700'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '150704',
    'San Luis',
    '150700'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '020205',
    'San Luis',
    '020200'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '010106',
    'San Miguel',
    '010100'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '151107',
    'San Luis',
    '151100'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '140106',
    'La Victoria',
    '140100'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '030309',
    'San Miguel',
    '030300'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '050510',
    'Condoroma',
    '050500'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '150711',
    'Brenha',
    '150700'
);

INSERT INTO pp_distrito (
    id_distrito,
    nombre,
    id_provincia
) VALUES (
    '140203',
    'Incahuasi',
    '140200'
);

-- PP_CLIENTE
INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    1,
    'Prado',
    'Nunez',
    'Laura Sofia',
    'D',
    '07914423',
    TO_DATE('23/10/1979', 'dd/mm/yyyy'),
    'Av. Paseo de la Republica 1578',
    'Frente al supermercado',
    '150701',
    '441851',
    'lprado@jotmail.com',
    TO_DATE('31/03/2004', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    2,
    'Olarte',
    'Timo',
    'Leonardo Manuel',
    'D',
    '07231165',
    TO_DATE('05/03/1976', 'dd/mm/yyyy'),
    'Calle Las Palmeras 389',
    'A dos cuadras del mercado',
    '020205',
    '994100259',
    'lolarte@ymail.com',
    TO_DATE('18/02/2005', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    3,
    'Zuñiga',
    'Cuya',
    'Sergio Miguel',
    'R',
    '19875128601',
    TO_DATE('12/09/1982', 'dd/mm/yyyy'),
    'Av. Brasil 1678',
    'Al costado de la iglesia de los Mormones',
    '150711',
    '953781458',
    'szcuya@yucy.com',
    TO_DATE('09/07/2012', 'dd/mm/yyyy'),
    'B'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    4,
    'Hidalguez',
    'Garcia',
    'Lourdes',
    'P',
    '000000607371597',
    TO_DATE('05/10/1989', 'dd/mm/yyyy'),
    'Calle B 112',
    'Frente al colegio nacional',
    '140106',
    '998200124',
    'lhgarcia@yaju.es',
    TO_DATE('12/07/2009', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    5,
    'Martinez',
    'Fiestas',
    'Zarela Rosa',
    'P',
    '000007958412',
    TO_DATE('03/03/1994', 'dd/mm/yyyy'),
    'Jr. Los Músicos 287',
    'A dos casas de la veterinaria',
    '050510',
    '4708547',
    'zmfiestas@ymail.com',
    TO_DATE('04/12/2011', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    6,
    'Bejar',
    'Flores',
    'Luis Rafael',
    'D',
    '06325841',
    TO_DATE('18/06/1972', 'dd/mm/yyyy'),
    'Calle Lavalle 715',
    'Al lado de la ferretería',
    '010106',
    '4853698',
    'lbejar@jotmeil.com',
    TO_DATE('06/11/2017', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    7,
    'Soto',
    'Cerna',
    'Joaquin',
    'P',
    '000000849318',
    TO_DATE('29/11/1998', 'dd/mm/yyyy'),
    'Av. La Marina 1587',
    'Frente al parque principal',
    '150703',
    '6780015',
    'jsoto@jotmeil.com',
    TO_DATE('21/09/2015', 'dd/mm/yyyy'),
    'B'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    8,
    'Perez',
    'Olivares',
    'Catalina Isabel',
    'C',
    '000109745519',
    TO_DATE('19/04/1999', 'dd/mm/yyyy'),
    'Av. Faucett 156',
    'A la espalda del concesionario de autos',
    '150703',
    '977710687',
    'capeolv@yimeil.com',
    TO_DATE('17/06/2004', 'dd/mm/yyyy'),
    'E'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    9,
    'Pastor',
    'Uceda',
    'José Rafael',
    'R',
    '09711873284',
    TO_DATE('09/07/1992', 'dd/mm/yyyy'),
    'Jr. Los Proceres 845',
    'Al lado del chifa',
    '150703',
    '984441002',
    'jrpastor@yimeil.com',
    TO_DATE('02/03/2010', 'dd/mm/yyyy'),
    'B'
);

INSERT INTO pp_cliente (
    id_cliente,
    apellido_paterno,
    apellido_materno,
    nombres,
    tipo_documento,
    numero_documento,
    fecha_nacimiento,
    direccion,
    referencia,
    ubigeo,
    telefono_contacto,
    correo_electronico,
    fecha_creacion,
    estado
) VALUES (
    10,
    'Izquierdo',
    'Galloso',
    'Clark',
    'O',
    '000004578510136',
    TO_DATE('14/08/1983', 'dd/mm/yyyy'),
    'Calle Soria 110',
    'Hay un kiosko en la esquina',
    '140203',
    '966183741',
    'clizqg@yucy.cl',
    TO_DATE('16/10/2011', 'dd/mm/yyyy'),
    'V'
);

-- PP_CLASIFICACION_CUENTA
INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    1,
    'Cuenta Ganadora',
    'Canjea premios al instante, sin sorteos.',
    0.15,
    5,
    3.5,
    750,
    'S'
);

INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    2,
    'Cuenta Proveedor',
    'Sin costo de mantenimiento siempre que recibas pagos como proveedor así como cobranzas y adelantos de letras y facturas',
    0.08,
    25,
    7.5,
    5000,
    'P'
);

INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    3,
    'Cuenta Digital',
    'Ahorra sin pagar mantenimiento',
    0.01,
    99,
    5,
    500,
    'N'
);

INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    4,
    'Cuenta Free',
    'Es la cuenta de ahorros que te permite realizar operaciones ilimitadas, sin costo en todo el Perú desde nuestra red y retiros, sin comisiones, en el exterior desde cajeros automáticos de bancos aliados.'
    ,
    0.02,
    3,
    4.95,
    500,
    'P'
);

INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    5,
    'Cuenta Premio',
    'Podrás ganar 1 millón de soles',
    0.1,
    9,
    12.5,
    750,
    'S'
);

INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    6,
    'Cuenta Kids',
    'Es una cuenta creada para que los menores de edad aprendan a ahorrar y a usar su dinero de manera responsable, con la asesoría de un adulto.'
    ,
    0.12,
    3,
    7.5,
    1000,
    'P'
);

INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    7,
    'Cuenta Ilimitada',
    'Operaciones ilimitadas  por todos los canales',
    0.06,
    99,
    5,
    1000,
    'S'
);

INSERT INTO pp_clasificacion_cuenta (
    id_clasificacion,
    nombre,
    descripcion,
    tasa_interes,
    num_libre,
    costo_transaccion,
    limite_transferencia,
    beneficio_banco
) VALUES (
    8,
    'Cuenta Sueldo',
    'Cuenta únicamente para recibir tu sueldo de tu empleador actual',
    0.04,
    25,
    6.5,
    750,
    'P'
);

-- PP_CUENTA_BANCARIA
INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    1,
    '001698742175963',
    '001698742175963856',
    1,
    'C',
    6,
    TO_DATE('13/10/2008', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    2,
    '001649613132551',
    '001649613132551862',
    5,
    'C',
    2,
    TO_DATE('19/06/2017', 'dd/mm/yyyy'),
    'E'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    3,
    '553497217321',
    '55349721732114',
    7,
    'A',
    5,
    TO_DATE('23/10/2009', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    4,
    '005541735719378',
    '005541735719378876',
    2,
    'A',
    1,
    TO_DATE('05/01/2006', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    5,
    '6732184363905',
    '6732184363905',
    9,
    'A',
    3,
    TO_DATE('01/12/2010', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    6,
    '8749479486487',
    '8749479486487',
    3,
    'A',
    8,
    TO_DATE('18/03/2012', 'dd/mm/yyyy'),
    'B'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    7,
    '132651467203',
    '132651467203',
    8,
    'C',
    4,
    TO_DATE('27/09/2011', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    8,
    '46412318312',
    '46412318312',
    10,
    'C',
    7,
    TO_DATE('30/04/2016', 'dd/mm/yyyy'),
    'B'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    9,
    '486231053630',
    '486231053630',
    4,
    'C',
    2,
    TO_DATE('25/06/2010', 'dd/mm/yyyy'),
    'E'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    10,
    '89898742165',
    '89898742165',
    6,
    'C',
    3,
    TO_DATE('11/08/2017', 'dd/mm/yyyy'),
    'B'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    11,
    '563789159528',
    '563789159528',
    1,
    'A',
    5,
    TO_DATE('13/09/2009', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    12,
    '671526763413',
    '671526763413',
    7,
    'C',
    1,
    TO_DATE('29/08/2017', 'dd/mm/yyyy'),
    'V'
);

INSERT INTO pp_cuenta_bancaria (
    id_cuenta,
    numero_cuenta,
    codigo_interbancario,
    id_cliente,
    tipo_cuenta,
    id_clasificacion,
    fecha_registro,
    estado
) VALUES (
    13,
    '079348573427',
    '079348573427',
    4,
    'C',
    8,
    TO_DATE('16/11/2014', 'dd/mm/yyyy'),
    'V'
);

-- PP_TARJETA_BANCARIA
INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    1,
    '4557158794112007',
    11,
    'F',
    TO_DATE('15/09/2014', 'dd/mm/yyyy'),
    TO_DATE('01/10/2021', 'dd/mm/yyyy'),
    'V',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    2,
    '4042786215468318',
    8,
    'V',
    TO_DATE('03/05/2016', 'dd/mm/yyyy'),
    TO_DATE('15/11/2021', 'dd/mm/yyyy'),
    'V',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    3,
    '3984185453835787',
    5,
    'V',
    TO_DATE('01/10/2021', 'dd/mm/yyyy'),
    TO_DATE('01/10/2028', 'dd/mm/yyyy'),
    'P',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    4,
    '3678458755219683',
    1,
    'A',
    TO_DATE('01/11/2008', 'dd/mm/yyyy'),
    TO_DATE('01/11/2015', 'dd/mm/yyyy'),
    'A',
    'I'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    5,
    '3478915992140058',
    7,
    'F',
    TO_DATE('01/10/2011', 'dd/mm/yyyy'),
    TO_DATE('01/10/2018', 'dd/mm/yyyy'),
    'B',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    6,
    '3971258010645685',
    13,
    'A',
    TO_DATE('20/11/2014', 'dd/mm/yyyy'),
    TO_DATE('01/12/2021', 'dd/mm/yyyy'),
    'V',
    'I'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    7,
    '4387184165731970',
    10,
    'V',
    TO_DATE('15/08/2017', 'dd/mm/yyyy'),
    TO_DATE('12/12/2021', 'dd/mm/yyyy'),
    'V',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    8,
    '4187511208719641',
    2,
    'V',
    TO_DATE('25/06/2017', 'dd/mm/yyyy'),
    TO_DATE('01/07/2024', 'dd/mm/yyyy'),
    'V',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    9,
    '3268439815618481',
    6,
    'F',
    TO_DATE('25/03/2012', 'dd/mm/yyyy'),
    TO_DATE('01/04/2019', 'dd/mm/yyyy'),
    'A',
    'I'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    10,
    '3778964518973189',
    3,
    'A',
    TO_DATE('25/03/2012', 'dd/mm/yyyy'),
    TO_DATE('01/04/2019', 'dd/mm/yyyy'),
    'B',
    'I'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    11,
    '3812348176808923',
    9,
    'A',
    TO_DATE('01/07/2010', 'dd/mm/yyyy'),
    TO_DATE('11/10/2021', 'dd/mm/yyyy'),
    'A',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    12,
    '3534265845259864',
    12,
    'F',
    TO_DATE('01/09/2017', 'dd/mm/yyyy'),
    TO_DATE('05/01/2022', 'dd/mm/yyyy'),
    'V',
    'A'
);

INSERT INTO pp_tarjeta_bancaria (
    id_tarjeta,
    numero_tarjeta,
    id_cuenta,
    ubicacion,
    fecha_emision,
    fecha_vencimiento,
    estado,
    compras_internet
) VALUES (
    13,
    '3945579643525352',
    4,
    'V',
    TO_DATE('01/10/2021', 'dd/mm/yyyy'),
    TO_DATE('01/10/2028', 'dd/mm/yyyy'),
    'P',
    'I'
);

-- PP_TRANSFERENCIA
INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    1,
    6,
    2,
    325.75,
    'por servicios',
    TO_DATE('29/06/2021', 'dd/mm/yyyy'),
    TO_DATE('30/06/2021', 'dd/mm/yyyy'),
    'C'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    2,
    8,
    1,
    179,
    'para contrato',
    TO_DATE('20/07/2021', 'dd/mm/yyyy'),
    TO_DATE('20/07/2021', 'dd/mm/yyyy'),
    'A'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    3,
    12,
    6,
    3781,
    'pago estudios',
    TO_DATE('27/09/2021', 'dd/mm/yyyy'),
    NULL,
    'P'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    4,
    1,
    8,
    6312,
    'Por prestamo',
    TO_DATE('26/09/2021', 'dd/mm/yyyy'),
    NULL,
    'P'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    5,
    7,
    12,
    589.95,
    'servicios',
    TO_DATE('08/06/2021', 'dd/mm/yyyy'),
    TO_DATE('09/06/2021', 'dd/mm/yyyy'),
    'C'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    6,
    2,
    7,
    321.99,
    'para la casa',
    TO_DATE('15/04/2021', 'dd/mm/yyyy'),
    TO_DATE('15/04/2021', 'dd/mm/yyyy'),
    'C'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    7,
    1,
    6,
    490,
    'para reparaciones',
    TO_DATE('13/07/2021', 'dd/mm/yyyy'),
    TO_DATE('13/07/2021', 'dd/mm/yyyy'),
    'A'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    8,
    6,
    8,
    762,
    'por servicios',
    TO_DATE('21/08/2021', 'dd/mm/yyyy'),
    TO_DATE('21/08/2021', 'dd/mm/yyyy'),
    'A'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    9,
    6,
    8,
    1150,
    'por servicios',
    TO_DATE('21/08/2021', 'dd/mm/yyyy'),
    TO_DATE('27/08/2021', 'dd/mm/yyyy'),
    'A'
);

INSERT INTO pp_transferencia (
    id_transferencia,
    cuenta_origen,
    cuenta_destino,
    monto_transferido,
    mensaje,
    fecha_transaccion,
    fecha_confirmacion,
    estado
) VALUES (
    10,
    6,
    8,
    2000,
    'por contratos',
    TO_DATE('21/08/2021', 'dd/mm/yyyy'),
    TO_DATE('29/08/2021', 'dd/mm/yyyy'),
    'A'
);

COMMIT;