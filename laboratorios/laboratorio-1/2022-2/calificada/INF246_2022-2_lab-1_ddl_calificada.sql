-- Pregunta 1

-- Estructura
CREATE TABLE sp_insumo (
    id_insumo        NUMBER NOT NULL,
    nombre           VARCHAR2(50 BYTE) NOT NULL,
    tipo_material    VARCHAR2(30 BYTE) NOT NULL,
    unidad_divisoria VARCHAR2(5 BYTE) NOT NULL,
    precio           NUMBER(7, 2) NOT NULL,
    stock            NUMBER NOT NULL,
    estado           CHAR(6 BYTE) NOT NULL
);
-- Llave primaria
ALTER TABLE sp_insumo ADD CONSTRAINT sp_insumo_pk PRIMARY KEY ( id_insumo );

-- Pregunta 2

-- Estructura
CREATE TABLE sp_producto (
    id_producto NUMBER NOT NULL,
    nombre      VARCHAR2(50 BYTE) NOT NULL,
    tipo        NUMBER NOT NULL,
    precio      NUMBER(6, 2) NOT NULL,
    estado      CHAR(1 BYTE) NOT NULL
);
-- Llave primaria
ALTER TABLE sp_producto ADD CONSTRAINT sp_producto_pk PRIMARY KEY ( id_producto );

-- Pregunta 3

-- Estructura
CREATE TABLE sp_matriz_insumo (
    id_matriz    NUMBER NOT NULL,
    id_producto  NUMBER NOT NULL,
    id_insumo    NUMBER NOT NULL,
    cantidad     NUMBER NOT NULL,
    ultima_modif TIMESTAMP NOT NULL
);
-- Llave primaria
ALTER TABLE sp_matriz_insumo ADD CONSTRAINT sp_matriz_insumo_pk PRIMARY KEY ( id_matriz );
-- Llave foránea
ALTER TABLE sp_matriz_insumo
    ADD CONSTRAINT mat_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES sp_producto ( id_producto );

ALTER TABLE sp_matriz_insumo
    ADD CONSTRAINT mat_ins_fk FOREIGN KEY ( id_insumo )
        REFERENCES sp_insumo ( id_insumo );

-- Pregunta 4
-- Tabla principal SP_ORDEN_COMPRA
-- Estructura
CREATE TABLE sp_orden_compra (
    id_orden           NUMBER NOT NULL,
    monto_total        NUMBER(6, 2) NOT NULL,
    monto_igv          VARCHAR2(20 BYTE) NOT NULL,
    fecha_registro     TIMESTAMP NOT NULL,
    fecha_autorizacion TIMESTAMP NOT NULL,
    fecha_entrega      TIMESTAMP NOT NULL,
    estado             CHAR(1 BYTE) NOT NULL
);
-- Llave primaria
ALTER TABLE sp_orden_compra ADD CONSTRAINT sp_orden_compra_pk PRIMARY KEY ( id_orden );

-- Tabla auxiliar SP_COMPRA_INSUMO
-- Estructura
CREATE TABLE sp_compra_insumo (
    id_compra NUMBER NOT NULL,
    id_orden  NUMBER NOT NULL,
    id_insumo NUMBER NOT NULL,
    cantidad  NUMBER NOT NULL
);
-- Llave primaria
ALTER TABLE sp_compra_insumo ADD CONSTRAINT sp_compra_insumo_pk PRIMARY KEY ( id_compra );
-- Llave foránea
ALTER TABLE sp_compra_insumo
    ADD CONSTRAINT com_ord_fk FOREIGN KEY ( id_orden )
        REFERENCES sp_orden_compra ( id_orden );

ALTER TABLE sp_compra_insumo
    ADD CONSTRAINT com_ins_fk FOREIGN KEY ( id_insumo )
        REFERENCES sp_insumo ( id_insumo );

-- Pregunta 5

-- Tabla principal SP_ORDEN_PRODUCCION
-- Estructura
CREATE TABLE sp_orden_produccion (
    id_orden           NUMBER NOT NULL,
    motivo             CHAR(1 BYTE) NOT NULL,
    fecha_registro     TIMESTAMP NOT NULL,
    fecha_autorizacion TIMESTAMP NOT NULL,
    fecha_fin          TIMESTAMP NOT NULL,
    estado             CHAR(1 BYTE) NOT NULL
);
-- Llave primaria
ALTER TABLE sp_orden_produccion ADD CONSTRAINT sp_orden_produccion_pk PRIMARY KEY ( id_orden );

-- Tabla auxiliar SP_COMPRA_PRODUCTO
-- Estructura
CREATE TABLE sp_compra_producto (
    id_compra   NUMBER NOT NULL,
    id_orden    NUMBER NOT NULL,
    id_producto NUMBER NOT NULL,
    unidades    NUMBER NOT NULL,
    merma       NUMBER NOT NULL
);
-- Llave primaria
ALTER TABLE sp_compra_producto ADD CONSTRAINT sp_compra_producto_pk PRIMARY KEY ( id_compra );
-- Llave foránea
ALTER TABLE sp_compra_producto
    ADD CONSTRAINT pro_ord_fk FOREIGN KEY ( id_orden )
        REFERENCES sp_orden_produccion ( id_orden );

ALTER TABLE sp_compra_producto
    ADD CONSTRAINT pro_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES sp_producto ( id_producto );