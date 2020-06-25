-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2020-04-27 21:08:22 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE sb_agencia (
    id_agencia    NUMBER NOT NULL,
    nombre        VARCHAR2(40) NOT NULL,
    direccion     VARCHAR2(50) NOT NULL,
    id_distrito   NUMBER NOT NULL
);

COMMENT ON COLUMN sb_agencia.id_agencia IS
    'Identificador de la agencia.';

COMMENT ON COLUMN sb_agencia.nombre IS
    'Nombre de la agencia.';

COMMENT ON COLUMN sb_agencia.direccion IS
    'Dirección de la agencia.';

COMMENT ON COLUMN sb_agencia.id_distrito IS
    'Identificador del distrito donde está ubicada la agencia.';

ALTER TABLE sb_agencia ADD CONSTRAINT sb_agencia_pk PRIMARY KEY ( id_agencia );

CREATE TABLE sb_banco (
    id_banco   NUMBER NOT NULL,
    nombre     VARCHAR2(40) NOT NULL
);

COMMENT ON COLUMN sb_banco.id_banco IS
    'Identificador del banco.';

COMMENT ON COLUMN sb_banco.nombre IS
    'Nombre del banco.';

ALTER TABLE sb_banco ADD CONSTRAINT sb_banco_pk PRIMARY KEY ( id_banco );

CREATE TABLE sb_cliente (
    id_cliente    NUMBER NOT NULL,
    ape_paterno   VARCHAR2(20) NOT NULL,
    ape_materno   VARCHAR2(20) NOT NULL,
    nombre        VARCHAR2(20) NOT NULL,
    dni           VARCHAR2(8) NOT NULL,
    sexo          VARCHAR2(1) NOT NULL,
    direccion     VARCHAR2(50),
    telefono      VARCHAR2(10),
    email         VARCHAR2(30),
    id_distrito   NUMBER
);

COMMENT ON COLUMN sb_cliente.id_cliente IS
    'Identificador del cliente.';

COMMENT ON COLUMN sb_cliente.ape_paterno IS
    'Apellido paterno del cliente.';

COMMENT ON COLUMN sb_cliente.ape_materno IS
    'Apellido materno del cliente.';

COMMENT ON COLUMN sb_cliente.nombre IS
    'Nombre del cliente.';

COMMENT ON COLUMN sb_cliente.dni IS
    'DNI del cliente.';

COMMENT ON COLUMN sb_cliente.sexo IS
    'Sexo del cliente (M o F).';

COMMENT ON COLUMN sb_cliente.direccion IS
    'Dirección del cliente.';

COMMENT ON COLUMN sb_cliente.telefono IS
    'Teléfono fijo o celular del cliente.';

COMMENT ON COLUMN sb_cliente.email IS
    'Correo electrónico del cliente.';

COMMENT ON COLUMN sb_cliente.id_distrito IS
    'Identificador del distrito donde vive el cliente.';

ALTER TABLE sb_cliente ADD CONSTRAINT sb_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE sb_cliente_cuenta (
    id_cliente   NUMBER NOT NULL,
    id_cuenta    NUMBER NOT NULL
);

COMMENT ON COLUMN sb_cliente_cuenta.id_cliente IS
    'Identificador del cliente dueño de la cuenta.';

COMMENT ON COLUMN sb_cliente_cuenta.id_cuenta IS
    'Identificador de la cuenta que pertenece al cliente.';

ALTER TABLE sb_cliente_cuenta ADD CONSTRAINT sb_cli_cue_pk PRIMARY KEY ( id_cliente,
                                                                         id_cuenta );

CREATE TABLE sb_cuenta (
    id_cuenta        NUMBER NOT NULL,
    numero           VARCHAR2(20) NOT NULL,
    moneda           VARCHAR2(1) NOT NULL,
    fecha_apertura   DATE NOT NULL,
    saldo            NUMBER NOT NULL,
    id_agencia       NUMBER NOT NULL
);

COMMENT ON COLUMN sb_cuenta.id_cuenta IS
    'Identificador de la cuenta.';

COMMENT ON COLUMN sb_cuenta.numero IS
    'Número de la cuenta.';

COMMENT ON COLUMN sb_cuenta.moneda IS
    'Moneda: S = Soles D = Dólares.';

COMMENT ON COLUMN sb_cuenta.fecha_apertura IS
    'Fecha de apertura de la cuenta.';

COMMENT ON COLUMN sb_cuenta.saldo IS
    'Saldo actual de la cuenta.';

COMMENT ON COLUMN sb_cuenta.id_agencia IS
    'Identificador de la agencia donde se apertura la cuenta.';

ALTER TABLE sb_cuenta ADD CONSTRAINT sb_cuenta_pk PRIMARY KEY ( id_cuenta );

CREATE TABLE sb_cuota (
    id_cuota            NUMBER NOT NULL,
    id_prestamo         NUMBER NOT NULL,
    num_cuota           NUMBER NOT NULL,
    fecha_vencimiento   DATE NOT NULL,
    fecha_pago          DATE,
    monto_pago          NUMBER,
    estado              NUMBER(1) NOT NULL,
    id_agencia          NUMBER
);

COMMENT ON COLUMN sb_cuota.id_cuota IS
    'Identificador de la cuota.';

COMMENT ON COLUMN sb_cuota.id_prestamo IS
    'Identificador del préstamo.';

COMMENT ON COLUMN sb_cuota.num_cuota IS
    'Número de cuota.';

COMMENT ON COLUMN sb_cuota.fecha_vencimiento IS
    'Fecha de vencimiento de la cuota.';

COMMENT ON COLUMN sb_cuota.fecha_pago IS
    'Fecha en que se paga la cuota.';

COMMENT ON COLUMN sb_cuota.monto_pago IS
    'Monto pagado por la cuota.';

COMMENT ON COLUMN sb_cuota.estado IS
    'Estado del pago de la cuota.
0: No pagada
1: Pagada a tiempo
2: Pagada con mora';

COMMENT ON COLUMN sb_cuota.id_agencia IS
    'Identificador de la agencia donde se realiza el pago.';

ALTER TABLE sb_cuota ADD CONSTRAINT sb_cuota_pk PRIMARY KEY ( id_cuota );

CREATE TABLE sb_deposito_retiro (
    id_dep_ret   NUMBER NOT NULL,
    tipo         VARCHAR2(1) NOT NULL,
    id_cuenta    NUMBER NOT NULL,
    monto        NUMBER NOT NULL,
    moneda       VARCHAR2(1) NOT NULL,
    fecha_hora   DATE NOT NULL,
    id_agencia   NUMBER NOT NULL
);

COMMENT ON COLUMN sb_deposito_retiro.id_dep_ret IS
    'Identificador del depósito o retiro.';

COMMENT ON COLUMN sb_deposito_retiro.tipo IS
    'D = Depósito, R = Retiro.';

COMMENT ON COLUMN sb_deposito_retiro.id_cuenta IS
    'Identificador de la cuenta en la que se realizó el depósito o retiro.';

COMMENT ON COLUMN sb_deposito_retiro.monto IS
    'Monto del depósito o retiro.';

COMMENT ON COLUMN sb_deposito_retiro.moneda IS
    'Moneda en la que se realiza el depósito o retiro. S = Soles, D = Dólares.';

COMMENT ON COLUMN sb_deposito_retiro.fecha_hora IS
    'Fecha y hora en que se realiza el depósito o retiro.';

COMMENT ON COLUMN sb_deposito_retiro.id_agencia IS
    'Identificador de la agencia donde se realiza el depósito o retiro.';

ALTER TABLE sb_deposito_retiro ADD CONSTRAINT sb_dep_ret_pk PRIMARY KEY ( id_dep_ret );

CREATE TABLE sb_distrito (
    id_distrito    NUMBER NOT NULL,
    nombre         VARCHAR2(20) NOT NULL,
    id_provincia   NUMBER NOT NULL
);

COMMENT ON COLUMN sb_distrito.id_distrito IS
    'Identificador del distrito.';

COMMENT ON COLUMN sb_distrito.nombre IS
    'Identificador de la provincia a la que pertenece el distrito.';

COMMENT ON COLUMN sb_distrito.id_provincia IS
    'Identificador de la provincia a la que pertenece el distrito.';

ALTER TABLE sb_distrito ADD CONSTRAINT sb_distrito_pk PRIMARY KEY ( id_distrito );

CREATE TABLE sb_prestamo (
    id_prestamo   NUMBER NOT NULL,
    monto         NUMBER NOT NULL,
    moneda        VARCHAR2(1) NOT NULL,
    fecha         DATE NOT NULL,
    plazo         NUMBER NOT NULL,
    interes       NUMBER NOT NULL,
    id_cliente    NUMBER NOT NULL,
    id_agencia    NUMBER NOT NULL,
    cuota         NUMBER
);

COMMENT ON COLUMN sb_prestamo.id_prestamo IS
    'Identificador del préstamo.';

COMMENT ON COLUMN sb_prestamo.monto IS
    'Monto del préstamo.';

COMMENT ON COLUMN sb_prestamo.moneda IS
    'Moneda del préstamo. S = Soles, D = Dólares.';

COMMENT ON COLUMN sb_prestamo.fecha IS
    'Fecha en que se otorga el préstamo.';

COMMENT ON COLUMN sb_prestamo.plazo IS
    'Plazo del préstamo en meses.';

COMMENT ON COLUMN sb_prestamo.interes IS
    'Porcentaje de interés mensual.';

COMMENT ON COLUMN sb_prestamo.id_cliente IS
    'Identificador del cliente al que se le otorga el préstamo.';

COMMENT ON COLUMN sb_prestamo.id_agencia IS
    'Identificador de la agencia en que se tramitó el préstamo.';

COMMENT ON COLUMN sb_prestamo.cuota IS
    'Monto de cuota mensual.';

ALTER TABLE sb_prestamo ADD CONSTRAINT sb_prestamo_pk PRIMARY KEY ( id_prestamo );

CREATE TABLE sb_provincia (
    id_provincia   NUMBER NOT NULL,
    nombre         VARCHAR2(20) NOT NULL,
    id_region      NUMBER NOT NULL
);

COMMENT ON COLUMN sb_provincia.id_provincia IS
    'Identificador de la provincia.';

COMMENT ON COLUMN sb_provincia.nombre IS
    'Nombre de la provincia.';

COMMENT ON COLUMN sb_provincia.id_region IS
    'Identificador de la región a la que pertenece la provincia.';

ALTER TABLE sb_provincia ADD CONSTRAINT sb_provincia_pk PRIMARY KEY ( id_provincia );

CREATE TABLE sb_region (
    id_region   NUMBER NOT NULL,
    nombre      VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN sb_region.id_region IS
    'Identificador de la región.';

COMMENT ON COLUMN sb_region.nombre IS
    'Nombre de la región.';

ALTER TABLE sb_region ADD CONSTRAINT sb_region_pk PRIMARY KEY ( id_region );

CREATE TABLE sb_tarjeta (
    id_tarjeta   NUMBER NOT NULL,
    numero       VARCHAR2(16) NOT NULL,
    estado       NUMBER NOT NULL,
    id_cliente   NUMBER NOT NULL
);

COMMENT ON COLUMN sb_tarjeta.id_tarjeta IS
    'Identificador de la tarjeta.';

COMMENT ON COLUMN sb_tarjeta.numero IS
    'Número de la tarjeta.';

COMMENT ON COLUMN sb_tarjeta.estado IS
    '0 = Inactiva, 1 = Activa.';

COMMENT ON COLUMN sb_tarjeta.id_cliente IS
    'Identificador del cliente dueño de la tarjeta.';

ALTER TABLE sb_tarjeta ADD CONSTRAINT sb_tarjeta_pk PRIMARY KEY ( id_tarjeta );

CREATE TABLE sb_tarjeta_cuenta (
    id_tarjeta   NUMBER NOT NULL,
    id_cuenta    NUMBER NOT NULL
);

COMMENT ON COLUMN sb_tarjeta_cuenta.id_tarjeta IS
    'Identificador de la tarjeta.';

COMMENT ON COLUMN sb_tarjeta_cuenta.id_cuenta IS
    'Identificador de la cuenta.';

ALTER TABLE sb_tarjeta_cuenta ADD CONSTRAINT sb_tar_cue_pk PRIMARY KEY ( id_cuenta,
                                                                         id_tarjeta );

CREATE TABLE sb_transferencia (
    id_transferencia     NUMBER NOT NULL,
    id_cuenta_origen     NUMBER NOT NULL,
    num_cuenta_destino   NUMBER NOT NULL,
    id_banco             NUMBER NOT NULL,
    monto                NUMBER NOT NULL,
    moneda               VARCHAR2(1) NOT NULL,
    fecha_hora           DATE NOT NULL,
    id_agencia           NUMBER
);

COMMENT ON COLUMN sb_transferencia.id_transferencia IS
    'Identificador de la transferencia.';

COMMENT ON COLUMN sb_transferencia.id_cuenta_origen IS
    'Identificador de la cuenta desde la que se realiza la transferencia.';

COMMENT ON COLUMN sb_transferencia.num_cuenta_destino IS
    'Número de la cuenta que recibe la transferencia.';

COMMENT ON COLUMN sb_transferencia.id_banco IS
    'Identificador del banco al que pertenece la cuenta destino.';

COMMENT ON COLUMN sb_transferencia.monto IS
    'Monto de la transferencia.';

COMMENT ON COLUMN sb_transferencia.moneda IS
    'Moneda en la que se realiza la transferencia. S = Soles, D = Dólares.';

COMMENT ON COLUMN sb_transferencia.fecha_hora IS
    'Fecha y hora en que se realiza la transferencia.';

COMMENT ON COLUMN sb_transferencia.id_agencia IS
    'Identificador de la agencia donde se realiza. Si se queda en NULL significa que la transferencia se realizó vía aplicativo móvil.'
    ;

ALTER TABLE sb_transferencia ADD CONSTRAINT sb_transferencia_pk PRIMARY KEY ( id_transferencia );

ALTER TABLE sb_agencia
    ADD CONSTRAINT sb_agencia_distrito_fk FOREIGN KEY ( id_distrito )
        REFERENCES sb_distrito ( id_distrito );

ALTER TABLE sb_cliente_cuenta
    ADD CONSTRAINT sb_cli_cue_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES sb_cliente ( id_cliente );

ALTER TABLE sb_cliente_cuenta
    ADD CONSTRAINT sb_cli_cue_cuenta_fk FOREIGN KEY ( id_cuenta )
        REFERENCES sb_cuenta ( id_cuenta );

ALTER TABLE sb_cliente
    ADD CONSTRAINT sb_cliente_distrito_fk FOREIGN KEY ( id_distrito )
        REFERENCES sb_distrito ( id_distrito );

ALTER TABLE sb_cuenta
    ADD CONSTRAINT sb_cuenta_agencia_fk FOREIGN KEY ( id_agencia )
        REFERENCES sb_agencia ( id_agencia );

ALTER TABLE sb_cuota
    ADD CONSTRAINT sb_cuota_agencia_fk FOREIGN KEY ( id_agencia )
        REFERENCES sb_agencia ( id_agencia );

ALTER TABLE sb_cuota
    ADD CONSTRAINT sb_cuota_prestamo_fk FOREIGN KEY ( id_prestamo )
        REFERENCES sb_prestamo ( id_prestamo );

ALTER TABLE sb_deposito_retiro
    ADD CONSTRAINT sb_dep_ret_agencia_fk FOREIGN KEY ( id_agencia )
        REFERENCES sb_agencia ( id_agencia );

ALTER TABLE sb_deposito_retiro
    ADD CONSTRAINT sb_dep_ret_cuenta_fk FOREIGN KEY ( id_cuenta )
        REFERENCES sb_cuenta ( id_cuenta );

ALTER TABLE sb_distrito
    ADD CONSTRAINT sb_distrito_provincia_fk FOREIGN KEY ( id_provincia )
        REFERENCES sb_provincia ( id_provincia );

ALTER TABLE sb_prestamo
    ADD CONSTRAINT sb_prestamo_agencia_fk FOREIGN KEY ( id_agencia )
        REFERENCES sb_agencia ( id_agencia );

ALTER TABLE sb_prestamo
    ADD CONSTRAINT sb_prestamo_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES sb_cliente ( id_cliente );

ALTER TABLE sb_provincia
    ADD CONSTRAINT sb_provincia_region_fk FOREIGN KEY ( id_region )
        REFERENCES sb_region ( id_region );

ALTER TABLE sb_tarjeta_cuenta
    ADD CONSTRAINT sb_tar_cue_cuenta_fk FOREIGN KEY ( id_cuenta )
        REFERENCES sb_cuenta ( id_cuenta );

ALTER TABLE sb_tarjeta_cuenta
    ADD CONSTRAINT sb_tar_cue_tarjeta_fk FOREIGN KEY ( id_tarjeta )
        REFERENCES sb_tarjeta ( id_tarjeta );

ALTER TABLE sb_tarjeta
    ADD CONSTRAINT sb_tarjeta_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES sb_cliente ( id_cliente );

ALTER TABLE sb_transferencia
    ADD CONSTRAINT sb_transferencia_agencia_fk FOREIGN KEY ( id_agencia )
        REFERENCES sb_agencia ( id_agencia );

ALTER TABLE sb_transferencia
    ADD CONSTRAINT sb_transferencia_banco_fk FOREIGN KEY ( id_banco )
        REFERENCES sb_banco ( id_banco );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             33
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

-- PREGUNTA 1 (1 PUNTO)
-- AGREGAR LA TABLA SB_TIPO_CAMBIO CON LAS COLUMNAS DADAS
CREATE TABLE SB_TIPO_CAMBIO (
    ID_TIPO_CAMBIO NUMBER NOT NULL,
    MONEDA VARCHAR2(1) NOT NULL,
    FECHA DATE NOT NULL,
    TC_COMPRA NUMBER NOT NULL,
    TC_VENTA NUMBER NOT NULL,
    PRIMARY KEY (ID_TIPO_CAMBIO)
);

-- PREGUNTA 2 (1 PUNTO)
-- AGREGAR LAS SIGUIENTES COLUMNAS EN LAS TABLAS DE BASE DE DATOS RESPECTIVAS
ALTER TABLE SB_CUENTA ADD TIPO VARCHAR2(1);
ALTER TABLE SB_TARJETA ADD TIPO VARCHAR2(1);

-- PREGUNTA 3 (1 PUNTO)
-- MODIFICAR EL TAMANIO DE LA COLUMNA NOMBRE DE LA TABLA SB_PROVINCIA DE 20 A 30
ALTER TABLE SB_PROVINCIA MODIFY NOMBRE VARCHAR2(30);
-- AGREGAR LLAVE FORANEA
ALTER TABLE SB_TRANSFERENCIA ADD FOREIGN KEY (ID_CUENTA_ORIGEN) REFERENCES SB_CUENTA (ID_CUENTA);

-- EJECUTAR EL SCRIPT CON LOS INSERTS
-- tabla sb_region
insert into sb_region (id_region, nombre) values(1, 'Cajamarca');
insert into sb_region (id_region, nombre) values(2, 'Ancash');
insert into sb_region (id_region, nombre) values(3, 'Ayacucho');
insert into sb_region (id_region, nombre) values(4, 'Arequipa');
insert into sb_region (id_region, nombre) values(5, 'Cuzco');
insert into sb_region (id_region, nombre) values(6, 'Ucayali');
insert into sb_region (id_region, nombre) values(7, 'Lima');
insert into sb_region (id_region, nombre) values(8, 'Loreto');
insert into sb_region (id_region, nombre) values(9, 'Huanuco');
insert into sb_region (id_region, nombre) values(10, 'Puno');
insert into sb_region (id_region, nombre) values(11, 'Lambayeque');

-- tabla sb_provincia
insert into sb_provincia (id_provincia, nombre, id_region) values (1, 'San Miguel', 1);
insert into sb_provincia (id_provincia, nombre, id_region) values (2, 'Carlos Fermin Fitzcarrald', 2);
insert into sb_provincia (id_provincia, nombre, id_region) values (3, 'La Mar', 3);
insert into sb_provincia (id_provincia, nombre, id_region) values (4, 'Camana', 4);
insert into sb_provincia (id_provincia, nombre, id_region) values (5, 'Espinar', 5);
insert into sb_provincia (id_provincia, nombre, id_region) values (6, 'Padre Abad', 6);
insert into sb_provincia (id_provincia, nombre, id_region) values (7, 'Lima', 7);
insert into sb_provincia (id_provincia, nombre, id_region) values (8, 'Ucayali', 8);
insert into sb_provincia (id_provincia, nombre, id_region) values (9, 'Ambo', 9);
insert into sb_provincia (id_provincia, nombre, id_region) values (10, 'Chucuito', 10);
insert into sb_provincia (id_provincia, nombre, id_region) values (11, 'Canhete', 7);
insert into sb_provincia (id_provincia, nombre, id_region) values (12, 'Huaral', 7);
insert into sb_provincia (id_provincia, nombre, id_region) values (13, 'El Collao', 10);
insert into sb_provincia (id_provincia, nombre, id_region) values (14, 'Chiclayo', 11);

-- Tabla sb_Distrito
insert into sb_distrito (id_distrito, nombre, id_provincia) values (1, 'San Isidro', 7);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (2, 'La Victoria', 7);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (3, 'San Miguel', 7);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (4, 'San Luis', 7);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (5, 'San Luis', 2);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (6, 'San Miguel', 1);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (7, 'San Luis', 11);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (8, 'La Victoria', 14);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (9, 'San Miguel', 3);
insert into sb_distrito (id_distrito, nombre, id_provincia) values (10, 'Condoroma', 5);

-- Tabla sb_Banco 
insert into sb_banco (id_banco, nombre) values (1, 'Banco de Debito - BDP');
insert into sb_banco (id_banco, nombre) values (2, 'Banco Departamental - BDVA');
insert into sb_banco (id_banco, nombre) values (3, 'Banco Inferbank');

-- Tabla sb_Agencia 
insert into sb_agencia (id_agencia, nombre, direccion, id_distrito) VALUES (1, 'Agencia Rivera Navarrete', 'Av. R. Rivera Navarrete 1504', 1);
insert into sb_agencia (id_agencia, nombre, direccion, id_distrito) VALUES (2, 'Agencia Aviacion', 'Av. Aviacion 294', 2);
insert into sb_agencia (id_agencia, nombre, direccion, id_distrito) VALUES (3, 'Agencia Open Plaza', 'Av. la Marina 2355', 3);
insert into sb_agencia (id_agencia, nombre, direccion, id_distrito) VALUES (4, 'Agencia La Romana', 'Jr. Los Colibies 117', 9);
insert into sb_agencia (id_agencia, nombre, direccion, id_distrito) VALUES (5, 'Agencia Espinar', 'Av. El Sol 248', 4);
insert into sb_agencia (id_agencia, nombre, direccion, id_distrito) VALUES (6, 'Agencia Las Musas', 'Paseo Musas Reales', 8);

-- Tabla sb_Cliente
insert into sb_cliente (id_cliente, ape_paterno, ape_materno, nombre, dni, sexo, direccion, telefono, email, id_distrito) values (1, 'TORRES', 'SALAZAR', 'ROMINA ISABEL', '40894715', 'F', 'Av. Paseo de la Republica 1578', '3695522', 'rtorres@chimail.pe', 3);
insert into sb_cliente (id_cliente, ape_paterno, ape_materno, nombre, dni, sexo, direccion, telefono, email, id_distrito) values (2, 'BENAVIDES', 'QUISPE', 'RAUL CARLOS', '00478547', 'M', 'Calle Las Palmeras 389', '', 'rbenavides@coldmail.com', 3);
insert into sb_cliente (id_cliente, ape_paterno, ape_materno, nombre, dni, sexo, direccion, id_distrito) values (3, 'CRUZ', 'RAMOS', 'MARIA DEL CARMEN', '45330178', 'F', 'Av. Brasil 1678', 5);
insert into sb_cliente (id_cliente, ape_paterno, ape_materno, nombre, dni, sexo, direccion, id_distrito) values (4, 'NESTOR', 'UBILLUZ', 'FELIPE', '05930128', 'M', 'Calle B 112', 7);

-- tabla sb_tarjeta
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(1, '455799991478', 1, 1);
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(2, '3468102686931132', 1, 2);
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(3, '8530786586', 1, 3);
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(4, '3468387283452460', 0, 1);
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(5, '1700786329', 1, 1);
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(6, '570891345726', 1, 2);
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(7, '1347089517296', 1, 4);
insert into sb_tarjeta (id_tarjeta, numero, estado, id_cliente) values(8, '760829541759', 0, 4);

-- Tabla sb_cuenta
insert into sb_cuenta (id_cuenta, numero, moneda, fecha_apertura, saldo, id_agencia, tipo) values (1, '001698742175963', 'S', to_date('15/06/2019', 'dd/mm/yyyy'), 16980, 4, 'A');
insert into sb_cuenta (id_cuenta, numero, moneda, fecha_apertura, saldo, id_agencia, tipo) values (2, '001649613132551', 'S', to_date('04/07/2019', 'dd/mm/yyyy'), 28827, 4, 'M');
insert into sb_cuenta (id_cuenta, numero, moneda, fecha_apertura, saldo, id_agencia, tipo) values (3, '553497217321', 'S', to_date('23/01/2018', 'dd/mm/yyyy'), 3964, 3, 'C');
insert into sb_cuenta (id_cuenta, numero, moneda, fecha_apertura, saldo, id_agencia, tipo) values (4, '005541735719378', 'D', to_date('12/04/2018', 'dd/mm/yyyy'), 1595, 4, 'A');
insert into sb_cuenta (id_cuenta, numero, moneda, fecha_apertura, saldo, id_agencia, tipo) values (5, '6732184363905', 'D', to_date('31/07/2019', 'dd/mm/yyyy'), 1656, 4, 'C');

-- tabla sb_cliente_cuenta
insert into sb_cliente_cuenta (id_cliente, id_cuenta) values (1, 3);
insert into sb_cliente_cuenta (id_cliente, id_cuenta) values (2, 1);
insert into sb_cliente_cuenta (id_cliente, id_cuenta) values (3, 4);
insert into sb_cliente_cuenta (id_cliente, id_cuenta) values (4, 2);
insert into sb_cliente_cuenta (id_cliente, id_cuenta) values (1, 2);

-- tabla sb_tarjeta_cuenta
insert into sb_tarjeta_cuenta (id_tarjeta, id_cuenta) values (1, 3);
insert into sb_tarjeta_cuenta (id_tarjeta, id_cuenta) values (2, 5);
insert into sb_tarjeta_cuenta (id_tarjeta, id_cuenta) values (3, 4);
insert into sb_tarjeta_cuenta (id_tarjeta, id_cuenta) values (5, 2);
insert into sb_tarjeta_cuenta (id_tarjeta, id_cuenta) values (6, 1);

-- tabla sb_prestamo
insert into sb_prestamo (id_prestamo, monto, moneda, fecha, plazo, interes, id_cliente, id_agencia, cuota) values (1, 5000, 'S', to_date('15/03/2020', 'dd/mm/yyyy'), 20, 6, 1, 3, 250);
insert into sb_prestamo (id_prestamo, monto, moneda, fecha, plazo, interes, id_cliente, id_agencia, cuota) values (2, 50000, 'S', to_date('12/04/2020', 'dd/mm/yyyy'), 25, 9, 4, 6, 2000);
insert into sb_prestamo (id_prestamo, monto, moneda, fecha, plazo, interes, id_cliente, id_agencia, cuota) values (3, 15000, 'D', to_date('03/11/2019', 'dd/mm/yyyy'), 60, 15, 3, 2, 250);

-- tabla sb_cuota
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,fecha_pago,monto_pago,estado,id_agencia) values (1,3,1,TO_DATE('30/11/2019', 'dd/mm/yyyy'), to_date('29/11/2019', 'dd/mm/yyyy'), 250, 1, 3);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,fecha_pago,monto_pago,estado,id_agencia) values (2,3,2,TO_DATE('30/12/2019', 'dd/mm/yyyy'), to_date('03/01/2020', 'dd/mm/yyyy'), 287.5, 2, 3);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,fecha_pago,monto_pago,estado,id_agencia) values (3,3,3,TO_DATE('30/01/2020', 'dd/mm/yyyy'), to_date('30/01/2020', 'dd/mm/yyyy'), 250, 1, 4);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,fecha_pago,monto_pago,estado,id_agencia) values (5,3,5,TO_DATE('28/02/2020', 'dd/mm/yyyy'), to_date('27/02/2020', 'dd/mm/yyyy'), 250, 1, 2);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,fecha_pago,monto_pago,estado,id_agencia) values (6,3,6,TO_DATE('30/03/2020', 'dd/mm/yyyy'), to_date('30/03/2020', 'dd/mm/yyyy'), 250, 1, 1);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (7,3,7,TO_DATE('30/04/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (8,3,8,TO_DATE('30/05/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (9,3,9,TO_DATE('30/06/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (10,3,10,TO_DATE('30/07/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (11,3,10,TO_DATE('30/08/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (12,3,10,TO_DATE('30/09/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (13,3,10,TO_DATE('30/10/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (14,3,10,TO_DATE('30/11/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (15,3,10,TO_DATE('30/12/2020', 'dd/mm/yyyy'), 0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (16,2,1,to_date('05/05/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (17,2,2,to_date('05/06/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (18,2,3,to_date('05/07/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (19,2,4,to_date('05/08/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (20,2,5,to_date('05/09/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (21,2,6,to_date('05/10/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (22,2,7,to_date('05/11/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (23,2,8,to_date('05/12/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (24,1,1,to_date('03/04/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (25,1,2,to_date('03/05/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (26,1,3,to_date('03/06/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (27,1,4,to_date('03/07/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (28,1,5,to_date('03/08/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (29,1,6,to_date('03/09/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (30,1,7,to_date('03/10/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (31,1,8,to_date('03/11/2020', 'dd/mm/yyyy'),0);
insert into sb_cuota(id_cuota,id_prestamo,num_cuota,fecha_vencimiento,estado) values (32,1,9,to_date('03/12/2020', 'dd/mm/yyyy'),0);

-- tabla sb_deposito_retiro
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (1, 'D', 2, 5000, 'S', to_date('25/07/2019 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (2, 'D', 2, 5000, 'S', to_date('25/08/2019 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (3, 'D', 2, 5000, 'S', to_date('25/09/2019 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (4, 'D', 2, 5000, 'S', to_date('25/10/2019 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (5, 'D', 2, 5000, 'S', to_date('25/11/2019 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (6, 'R', 2, 11473, 'S', to_date('20/12/2019 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (7, 'D', 2, 5000, 'S', to_date('22/12/2020 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (8, 'D', 2, 5000, 'S', to_date('25/02/2020 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (9, 'D', 2, 5000, 'S', to_date('25/03/2020 11:45', 'dd/mm/yyyy hh24:mi'), 3);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (10, 'D', 1, 2200, 'S', to_date('30/07/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (11, 'D', 1, 2200, 'S', to_date('30/08/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (12, 'R', 1, 1300, 'S', to_date('18/09/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (13, 'D', 1, 2200, 'S', to_date('30/09/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (14, 'D', 1, 2200, 'S', to_date('30/11/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (15, 'R', 1, 1920, 'S', to_date('22/12/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (16, 'D', 1, 2200, 'S', to_date('30/12/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (17, 'D', 1, 2200, 'S', to_date('30/01/2020 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (18, 'D', 1, 2200, 'S', to_date('28/02/2020 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (19, 'D', 1, 2200, 'S', to_date('30/03/2020 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (20, 'R', 1, 2000, 'S', to_date('30/04/2020 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (21, 'D', 1, 2200, 'S', to_date('30/06/2020 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (22, 'D', 5, 100, 'D', to_date('29/08/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (23, 'R', 5, 50, 'D', to_date('29/09/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (24, 'D', 5, 100, 'D', to_date('29/10/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (25, 'D', 5, 100, 'D', to_date('29/11/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (26, 'R', 5, 66, 'D', to_date('20/12/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (27, 'D', 5, 100, 'D', to_date('29/12/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (28, 'D', 5, 100, 'D', to_date('28/02/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (29, 'R', 5, 100, 'D', to_date('29/03/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_deposito_retiro (id_dep_ret, tipo, id_cuenta, monto, moneda, fecha_hora, id_agencia) values (30, 'D', 5, 372, 'S', to_date('29/03/2019 13:00', 'dd/mm/yyyy HH24:MI'), 1);

-- tabla sb_transferencia
insert into sb_transferencia (id_transferencia, id_cuenta_origen, num_cuenta_destino, id_banco, monto, moneda, fecha_hora, id_agencia) values(1, 1, '6732184363905', 1, 1300, 'S', to_date('18/09/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_transferencia (id_transferencia, id_cuenta_origen, num_cuenta_destino, id_banco, monto, moneda, fecha_hora, id_agencia) values(2, 3, '001698742175963', 1, 200, 'S', to_date('20/06/2019 17:00', 'dd/mm/yyyy HH24:MI'), 1);
insert into sb_transferencia (id_transferencia, id_cuenta_origen, num_cuenta_destino, id_banco, monto, moneda, fecha_hora, id_agencia) values(3, 3, '001649613132551', 2, 300, 'S', to_date('18/07/2019 17:00', 'dd/mm/yyyy HH24:MI'), 2);
insert into sb_transferencia (id_transferencia, id_cuenta_origen, num_cuenta_destino, id_banco, monto, moneda, fecha_hora, id_agencia) values(4, 4, '553497217321', 3, 1000,  'S', to_date('25/01/2018 17:00', 'dd/mm/yyyy HH24:MI'), 4);
insert into sb_transferencia (id_transferencia, id_cuenta_origen, num_cuenta_destino, id_banco, monto, moneda, fecha_hora, id_agencia) values(5, 4, '005541735719378', 3, 400, 'D', to_date('18/04/2018 17:00', 'dd/mm/yyyy HH24:MI'), 2);
insert into sb_transferencia (id_transferencia, id_cuenta_origen, num_cuenta_destino, id_banco, monto, moneda, fecha_hora, id_agencia) values(6, 4, '6732184363905', 3, 1000, 'D', to_date('06/08/2019 17:00', 'dd/mm/yyyy HH24:MI'), 4);

-- PREGUNTA 4 (1 PUNTO)
-- AGREGAR LOS SIGUIENTES DATOS A LA TABLA SB_TIPO_CAMBIO
INSERT INTO SB_TIPO_CAMBIO (ID_TIPO_CAMBIO, MONEDA, FECHA, TC_COMPRA, TC_VENTA) VALUES (1, 'D', TO_DATE('12/04/2018', 'DD/MM/YYYY'), 3.19, 3.17);
INSERT INTO SB_TIPO_CAMBIO (ID_TIPO_CAMBIO, MONEDA, FECHA, TC_COMPRA, TC_VENTA) VALUES (2, 'D', TO_DATE('31/07/2019', 'DD/MM/YYYY'), 3.39, 3.38);
INSERT INTO SB_TIPO_CAMBIO (ID_TIPO_CAMBIO, MONEDA, FECHA, TC_COMPRA, TC_VENTA) VALUES (3, 'E', TO_DATE('31/07/2019', 'DD/MM/YYYY'), 4.41, 4.39);
INSERT INTO SB_TIPO_CAMBIO (ID_TIPO_CAMBIO, MONEDA, FECHA, TC_COMPRA, TC_VENTA) VALUES (4, 'E', TO_DATE('30/04/2020', 'DD/MM/YYYY'), 4.51, 4.46);
SELECT * FROM SB_TIPO_CAMBIO;

-- PREGUNTA 5 (2 PUNTOS)
-- INCREMENTE EN 5 DOLARES LAS CUENTAS CORRIENTES CUYO SALDO ESTA EN DOLARES
SELECT * FROM SB_CUENTA;
UPDATE SB_CUENTA
SET SALDO = SALDO + 5
WHERE TIPO = 'C' AND MONEDA = 'D';

-- PREGUNTA 6 (2 PUNTOS)
-- MOTRAR NOMBRE COMPLETO DE LOS CLIENTES, NOMBRE COMPLETO DEL DISTRITO DONDE VIVEN, NUMEROS DE TARJETA AOSCIADOS A ESTOS CLIENTES
SELECT
C.APE_PATERNO || ' ' || C.APE_MATERNO || ', ' || C.NOMBRE AS NOMBRE_COMPLETO,
D.NOMBRE || ' - ' || P.NOMBRE AS DISTRITO_PROVINCIA,
T.NUMERO
FROM SB_CLIENTE C, SB_DISTRITO D, SB_PROVINCIA P, SB_TARJETA T
WHERE C.ID_DISTRITO = D.ID_DISTRITO AND D.ID_PROVINCIA = P.ID_PROVINCIA AND C.ID_CLIENTE = T.ID_CLIENTE;

-- PREGUNTA 7 (2 PUNTOS)
-- MOSTRAR EL NOMBRE COMPLETO Y NUMERO DE TARJETA ACTIVA DE LOS CLIENTES QUE TIENEN CUENTA MANCOMUNADA
SELECT
C.APE_PATERNO || ' ' || C.APE_MATERNO || ', ' || C.NOMBRE AS NOMBRE_COMPLETO, T.NUMERO
FROM SB_CLIENTE C, SB_TARJETA T, SB_CUENTA CU, SB_CLIENTE_CUENTA CC
WHERE C.ID_CLIENTE = T.ID_CLIENTE AND T.ESTADO = 1 AND CU.TIPO = 'M' AND C.ID_CLIENTE = CC.ID_CLIENTE AND CU.ID_CUENTA = CC.ID_CUENTA;

-- PREGUNTA 8 (2 PUNTOS)
-- COMPLETAR LA INFORMACION FALTANTE DE LOS DE LOS CLIENTES INDICADOS A CONTINUACION SEGUN LOS DATOS DE LA TABLA
SELECT * FROM SB_CLIENTE;

UPDATE SB_CLIENTE
SET TELEFONO = 965410015, EMAIL = 'RTORRES@GMAIL.COM'
WHERE DNI = 40894715;

UPDATE SB_CLIENTE
SET TELEFONO = 980753911, EMAIL = 'RBENAVIDES@COLDMAIL.COM'
WHERE DNI = 00478547;

UPDATE SB_CLIENTE
SET TELEFONO = 930555741, EMAIL = 'MCRUZ@GEMAIL.COM'
WHERE DNI = 45330178;

UPDATE SB_CLIENTE
SET TELEFONO = 910178332, EMAIL = 'FNESTOR@GEMAIL.COM'
WHERE DNI = 05930128;

-- PREGUNTA 9 (2 PUNTOS)
-- MOSTRAR FECHA Y HORA (FORMATO RESPECTIVO), Y EL MONTO, DE LOS RETIROS EN SOLES MAYORES O IGUALES A 1000, EN LAS AGENCIAS
-- UBICADAS EN SAN MIGUEL. MUESTRE LOS DATOS ORDENADAMENTE POR LA FECHA Y HORA DE LA MAS RECIENTE A LA MAS ANTIGUA
SELECT TO_CHAR(DR.FECHA_HORA, 'DD/MM/YYYY HH24:MI') AS FECHA_HORA, DR.MONTO AS MONTO
FROM SB_DEPOSITO_RETIRO DR, SB_AGENCIA A, SB_DISTRITO D
WHERE DR.MONEDA = 'S' AND DR.TIPO = 'R' AND (DR.MONTO >= 1000)
AND DR.ID_AGENCIA = A.ID_AGENCIA AND A.ID_DISTRITO = D.ID_DISTRITO AND D.NOMBRE LIKE 'San Miguel'
ORDER BY DR.FECHA_HORA DESC;

-- PREGUNTA 10 (3 PUNTOS)
-- MOSTRAR EL NOMBRE COMPLETO, FECHA DE VENCIMIENTO Y EL MONTO A PAGAR (DEBE AGREGAR EL INTERES AL VALOR DE LA CUOTA) DE LOS
-- CLIENTES QUE TIENEN CUOTAS PENDIENTES DE PAGO DE ABRIL 2020
SELECT CLI.APE_PATERNO || ' ' || CLI.APE_MATERNO || ', ' || CLI.NOMBRE AS NOMBRE_COMPLETO,
TO_CHAR(CUO.FECHA_VENCIMIENTO, 'DD/MM/YYYY') AS FECHA_VENCIMIENTO,
PRES.CUOTA * (1 + PRES.INTERES / 100) AS MONTO
FROM SB_CLIENTE CLI, SB_CUOTA CUO, SB_PRESTAMO PRES
WHERE CUO.ID_PRESTAMO = PRES.ID_PRESTAMO AND PRES.ID_CLIENTE = CLI.ID_CLIENTE
AND CUO.FECHA_VENCIMIENTO BETWEEN TO_DATE('01/04/2020', 'DD/MM/YYYY') AND TO_DATE('30/04/2020', 'DD/MM/YYYY');

-- PREGUNTA 11 (3 PUNTOS)
-- MOSTRAR EL NUMERO DE CUENTA Y EL SALDO EN SOLES DE LAS CLIENTES MUJERES CUYO DNI EMPIEZA EN 4, Y CUYAS CUENTAS ESTEN
-- ORIGINALMENTE EN DOLARES. USE EL TIPO DE CAMBIO DE VENTA ACORDE A LA FECHA DE APERTURA DE LA CUENTA
SELECT CU.NUMERO AS NUMERO, (CU.SALDO * TC.TC_VENTA) AS SALDO_SOLES
FROM SB_CLIENTE CLI, SB_CUENTA CU, SB_CLIENTE_CUENTA CLI_CU, SB_TIPO_CAMBIO TC
WHERE CLI.ID_CLIENTE = CLI_CU.ID_CLIENTE AND CU.ID_CUENTA = CLI_CU.ID_CUENTA
AND CLI.SEXO = 'F' AND CLI.DNI LIKE '4%' AND CU.MONEDA = 'D'
AND CU.MONEDA = TC.MONEDA AND CU.FECHA_APERTURA = TC.FECHA;

-- PREGUNTA 12 (1 PUNTO)
-- ELIMINAR LOS DEPOSITOS EN SOLES CUYO MONTO SEA MENOR A 500
DELETE FROM SB_DEPOSITO_RETIRO
WHERE TIPO = 'D' AND MONEDA = 'S' AND MONTO < 500;

-- RELACION DE TABLAS COMO AYUDA
SELECT * FROM SB_CLIENTE;
SELECT * FROM SB_CUENTA;
SELECT * FROM SB_TRANSFERENCIA;
SELECT * FROM SB_DEPOSITO_RETIRO;
SELECT * FROM SB_PRESTAMO;
SELECT * FROM SB_TARJETA;
SELECT * FROM SB_CUOTA;
SELECT * FROM SB_DISTRITO;
SELECT * FROM SB_PROVINCIA;
SELECT * FROM SB_CLIENTE_CUENTA;
SELECT * FROM SB_AGENCIA;
SELECT * FROM SB_TIPO_CAMBIO;