-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2022-10-10 10:42:27 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    dni                VARCHAR2(8 BYTE) NOT NULL,
    nombres            VARCHAR2(200 BYTE) NOT NULL,
    apellido_paterno   VARCHAR2(50 BYTE) NOT NULL,
    apellido_materno   VARCHAR2(50 BYTE),
    correo_electronico VARCHAR2(100 BYTE),
    telefono           VARCHAR2(30 BYTE)
);

COMMENT ON COLUMN cliente.dni IS
    'Documento de Identidad del cliente.';

COMMENT ON COLUMN cliente.nombres IS
    'Nombres del cliente.';

COMMENT ON COLUMN cliente.apellido_paterno IS
    'Apellido paterno del cliente.';

COMMENT ON COLUMN cliente.apellido_materno IS
    'Apellido materno del cliente.';

COMMENT ON COLUMN cliente.correo_electronico IS
    'Correo electrónico del cliente.';

COMMENT ON COLUMN cliente.telefono IS
    'Teléfono del cliente.';

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( dni );

CREATE TABLE detalle_venta (
    id_detalle_venta           NUMBER NOT NULL,
    id_editorial_libro         NUMBER NOT NULL,
    id_venta                   NUMBER NOT NULL,
    monto_subtotal             NUMBER(7, 2) NOT NULL,
    monto_exhibicion           NUMBER(7, 2),
    monto_on_demand            NUMBER(7, 2),
    precio_unitario_exhibicion NUMBER(6, 2) NOT NULL,
    precio_unitario_on_demand  NUMBER(6, 2),
    cantidad_exhibicion        NUMBER,
    cantidad_on_demand         NUMBER
);

ALTER TABLE detalle_venta ADD CONSTRAINT detalle_venta_pk PRIMARY KEY ( id_detalle_venta );

CREATE TABLE editorial (
    id_editorial     NUMBER NOT NULL,
    nombre_editorial VARCHAR2(100 BYTE) NOT NULL,
    telefono         VARCHAR2(50 BYTE) NOT NULL,
    direccion        VARCHAR2(100 BYTE) NOT NULL
);

COMMENT ON COLUMN editorial.id_editorial IS
    'Identificador de la editorial.';

COMMENT ON COLUMN editorial.nombre_editorial IS
    'Nombre de la editorial.';

COMMENT ON COLUMN editorial.telefono IS
    'Teléfono de la editorial.';

COMMENT ON COLUMN editorial.direccion IS
    'Dirección de la editorial, asumimos que tiene una sola y siempre tienen un local al menos.';

ALTER TABLE editorial ADD CONSTRAINT editorial_pk PRIMARY KEY ( id_editorial );

CREATE TABLE editorial_libro (
    id_editorial_libro   NUMBER NOT NULL,
    libro_isbn           VARCHAR2(100 BYTE) NOT NULL,
    id_editorial         NUMBER NOT NULL,
    precio_exhibicion    NUMBER(6, 2) NOT NULL,
    precio_on_demand     NUMBER(6, 2),
    stock                NUMBER NOT NULL,
    disponible_on_demand CHAR(1) NOT NULL
);

ALTER TABLE editorial_libro ADD CONSTRAINT editorial_libro_pk PRIMARY KEY ( id_editorial_libro );

CREATE TABLE libro (
    isbn              VARCHAR2(100 BYTE) NOT NULL,
    titulo            VARCHAR2(200 BYTE) NOT NULL,
    sinopsis          VARCHAR2(2000 BYTE),
    edicion           NUMBER,
    fecha_publicacion DATE NOT NULL
);

COMMENT ON COLUMN libro.isbn IS
    'ISBN del libro siguiendo la norma ISO 2108.';

COMMENT ON COLUMN libro.titulo IS
    'Título del libro.';

COMMENT ON COLUMN libro.sinopsis IS
    'Sinopsis del libro.';

COMMENT ON COLUMN libro.edicion IS
    'Número de edición del libro.';

COMMENT ON COLUMN libro.fecha_publicacion IS
    'Fecha de publicación del libro.';

ALTER TABLE libro ADD CONSTRAINT libro_pk PRIMARY KEY ( isbn );

CREATE TABLE venta (
    id_venta     NUMBER NOT NULL,
    dni          VARCHAR2(8 BYTE) NOT NULL,
    id_editorial NUMBER NOT NULL,
    fecha_venta  TIMESTAMP NOT NULL,
    monto_total  NUMBER(7, 2) NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( id_venta );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_venta
    ADD CONSTRAINT detalle_venta_editorial_libro_fk FOREIGN KEY ( id_editorial_libro )
        REFERENCES editorial_libro ( id_editorial_libro );

ALTER TABLE detalle_venta
    ADD CONSTRAINT detalle_venta_venta_fk FOREIGN KEY ( id_venta )
        REFERENCES venta ( id_venta );

ALTER TABLE editorial_libro
    ADD CONSTRAINT editorial_libro_editorial_fk FOREIGN KEY ( id_editorial )
        REFERENCES editorial ( id_editorial );

ALTER TABLE editorial_libro
    ADD CONSTRAINT editorial_libro_libro_fk FOREIGN KEY ( libro_isbn )
        REFERENCES libro ( isbn );

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk FOREIGN KEY ( dni )
        REFERENCES cliente ( dni );

ALTER TABLE venta
    ADD CONSTRAINT venta_editorial_fk FOREIGN KEY ( id_editorial )
        REFERENCES editorial ( id_editorial );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             12
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
-- ERRORS                                   1
-- WARNINGS                                 0
