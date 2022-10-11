-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2022-10-10 10:15:11 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLESPACE inf246_v207 
--  WARNING: Tablespace has no data files defined 
 LOGGING ONLINE
    EXTENT MANAGEMENT LOCAL AUTOALLOCATE
FLASHBACK ON;

CREATE USER a20185048 IDENTIFIED BY ACCOUNT UNLOCK ;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE a20185048.cliente (
    cocliente   NUMBER(8) NOT NULL,
    razonsocial VARCHAR2(60 BYTE) NOT NULL,
    idzona      NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE inf246_v207 LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX a20185048.cliente_pk ON
    a20185048.cliente (
        cocliente
    ASC )
        TABLESPACE inf246_v207 PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE a20185048.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY ( cocliente )
        USING INDEX a20185048.cliente_pk;

CREATE TABLE a20185048.docventa (
    cocliente        NUMBER(8) NOT NULL,
    nrodocumento     NUMBER(10) NOT NULL,
    fecha            DATE NOT NULL,
    monto            NUMBER NOT NULL,
    id_vendedor_zona NUMBER(8) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE inf246_v207 LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX a20185048.docventa_pk ON
    a20185048.docventa (
        nrodocumento
    ASC )
        TABLESPACE inf246_v207 PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE a20185048.docventa
    ADD CONSTRAINT docventa_pk PRIMARY KEY ( nrodocumento )
        USING INDEX a20185048.docventa_pk;

CREATE TABLE a20185048.docventaxproducto (
    nrodocumento             NUMBER(8) NOT NULL,
    coproducto               NUMBER(8) NOT NULL,
    cantidad                 NUMBER(8, 2) NOT NULL,
    subtotal                 NUMBER(8, 2) NOT NULL,
    precio_unitario_producto NUMBER(8, 2) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE inf246_v207 LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

COMMENT ON COLUMN a20185048.docventaxproducto.precio_unitario_producto IS
    'Precio unitario del producto en el instante de la venta.';

CREATE UNIQUE INDEX a20185048.docventaxproducto_pk ON
    a20185048.docventaxproducto (
        nrodocumento
    ASC,
        coproducto
    ASC )
        TABLESPACE inf246_v207 PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE a20185048.docventaxproducto
    ADD CONSTRAINT docventaxproducto_pk PRIMARY KEY ( nrodocumento,
                                                      coproducto )
        USING INDEX a20185048.docventaxproducto_pk;

CREATE TABLE a20185048.producto (
    coproducto NUMBER(8) NOT NULL,
    nombre     VARCHAR2(60 BYTE) NOT NULL,
    precio     NUMBER(8, 2) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE inf246_v207 LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX a20185048.producto_pk ON
    a20185048.producto (
        coproducto
    ASC )
        TABLESPACE inf246_v207 PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE a20185048.producto
    ADD CONSTRAINT producto_pk PRIMARY KEY ( coproducto )
        USING INDEX a20185048.producto_pk;

CREATE TABLE a20185048.vendedor (
    idvendedor      NUMBER(8) NOT NULL,
    nombres         VARCHAR2(60 BYTE) NOT NULL,
    appaterno       VARCHAR2(60 BYTE) NOT NULL,
    nrodocidentidad VARCHAR2(10 BYTE) NOT NULL,
    idzona          NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE inf246_v207 LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX a20185048.vendedor__idx ON
    a20185048.vendedor (
        idzona
    ASC )
        TABLESPACE inf246_v207 PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX a20185048.vendedor_pk ON
    a20185048.vendedor (
        idvendedor
    ASC )
        TABLESPACE inf246_v207 PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE a20185048.vendedor
    ADD CONSTRAINT vendedor_pk PRIMARY KEY ( idvendedor )
        USING INDEX a20185048.vendedor_pk;

CREATE TABLE vendedor_zona (
    id_vendedor_zona NUMBER NOT NULL,
    id_vendedor      NUMBER(8) NOT NULL,
    id_zona          NUMBER NOT NULL
)
LOGGING;

COMMENT ON COLUMN vendedor_zona.id_vendedor_zona IS
    'Identificador del vendedor en esta zona.';

COMMENT ON COLUMN vendedor_zona.id_vendedor IS
    'Identificador del vendedor.';

COMMENT ON COLUMN vendedor_zona.id_zona IS
    'Identificador de la zona.';

ALTER TABLE vendedor_zona ADD CONSTRAINT vendedor_zona_pk PRIMARY KEY ( id_vendedor_zona );

CREATE TABLE zona (
    id_zona NUMBER NOT NULL,
    nombre  VARCHAR2(100 BYTE) NOT NULL
)
LOGGING;

COMMENT ON COLUMN zona.id_zona IS
    'Identificador de la zona.';

ALTER TABLE zona ADD CONSTRAINT zona_pk PRIMARY KEY ( id_zona );

ALTER TABLE a20185048.docventa
    ADD CONSTRAINT docventa_cliente_fk FOREIGN KEY ( cocliente )
        REFERENCES a20185048.cliente ( cocliente )
    NOT DEFERRABLE;

ALTER TABLE a20185048.docventa
    ADD CONSTRAINT docventa_vendedor_zona_fk FOREIGN KEY ( id_vendedor_zona )
        REFERENCES vendedor_zona ( id_vendedor_zona )
    NOT DEFERRABLE;

ALTER TABLE a20185048.docventaxproducto
    ADD CONSTRAINT docventaxproducto_docventa_fk FOREIGN KEY ( nrodocumento )
        REFERENCES a20185048.docventa ( nrodocumento )
    NOT DEFERRABLE;

ALTER TABLE a20185048.docventaxproducto
    ADD CONSTRAINT docventaxproducto_producto_fk FOREIGN KEY ( coproducto )
        REFERENCES a20185048.producto ( coproducto )
    NOT DEFERRABLE;

ALTER TABLE vendedor_zona
    ADD CONSTRAINT vendedor_zona_vendedor_fk FOREIGN KEY ( id_vendedor )
        REFERENCES a20185048.vendedor ( idvendedor )
    NOT DEFERRABLE;

ALTER TABLE vendedor_zona
    ADD CONSTRAINT vendedor_zona_zona_fk FOREIGN KEY ( id_zona )
        REFERENCES zona ( id_zona )
    NOT DEFERRABLE;

ALTER TABLE a20185048.cliente
    ADD CONSTRAINT zona_fk FOREIGN KEY ( idzona )
        REFERENCES zona ( id_zona )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             6
-- ALTER TABLE                             14
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
-- CREATE TABLESPACE                        1
-- CREATE USER                              1
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
-- WARNINGS                                 1
