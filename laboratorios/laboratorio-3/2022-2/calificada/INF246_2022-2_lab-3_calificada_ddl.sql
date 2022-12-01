CREATE TABLE sp_dimension (
    id_dimension CHAR(1 BYTE) NOT NULL,
    denominacion VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE sp_dimension ADD CONSTRAINT sp_dimension_pk PRIMARY KEY ( id_dimension );

CREATE TABLE sp_unidad_divisoria (
    id_unidad    VARCHAR2(50 BYTE) NOT NULL,
    nombre       VARCHAR2(50 BYTE) NOT NULL,
    id_dimension CHAR(1 BYTE) NOT NULL
);

ALTER TABLE sp_unidad_divisoria ADD CONSTRAINT sp_unidad_div_pk PRIMARY KEY ( id_unidad );

ALTER TABLE sp_unidad_divisoria
    ADD CONSTRAINT dimension_fk FOREIGN KEY ( id_dimension )
        REFERENCES sp_dimension ( id_dimension );

CREATE TABLE sp_insumo (
    id_insumo     NUMBER NOT NULL,
    nombre        VARCHAR2(50 BYTE) NOT NULL,
    tipo_material VARCHAR2(30 BYTE) NOT NULL,
    id_unidad     VARCHAR2(5 BYTE) NOT NULL,
    precio        NUMBER(7, 2) NOT NULL,
    stock         NUMBER NOT NULL,
    estado        CHAR(1 BYTE) NOT NULL
);

ALTER TABLE sp_insumo ADD CONSTRAINT sp_insumo_pk PRIMARY KEY ( id_insumo );

ALTER TABLE sp_insumo
    ADD CONSTRAINT unidad_ins_fk FOREIGN KEY ( id_unidad )
        REFERENCES sp_unidad_divisoria ( id_unidad );

CREATE TABLE sp_tipo_producto (
    id_tipo NUMBER NOT NULL,
    nombre  VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE sp_tipo_producto ADD CONSTRAINT sp_tipo_prod_pk PRIMARY KEY ( id_tipo );

CREATE TABLE sp_producto (
    id_producto NUMBER NOT NULL,
    nombre      VARCHAR2(50 BYTE) NOT NULL,
    id_tipo     NUMBER NOT NULL,
    precio      NUMBER(6, 2) NOT NULL,
    estado      CHAR(1 BYTE) NOT NULL,
    stock       NUMBER NOT NULL
);

ALTER TABLE sp_producto ADD CONSTRAINT sp_producto_pk PRIMARY KEY ( id_producto );

ALTER TABLE sp_producto
    ADD CONSTRAINT tipo_prod_fk FOREIGN KEY ( id_tipo )
        REFERENCES sp_tipo_producto ( id_tipo );

CREATE TABLE sp_matriz_insumo (
    id_matriz    NUMBER NOT NULL,
    id_producto  NUMBER NOT NULL,
    id_insumo    NUMBER NOT NULL,
    cantidad     NUMERIC(6, 2) NOT NULL,
    ultima_modif TIMESTAMP NOT NULL
);

ALTER TABLE sp_matriz_insumo ADD CONSTRAINT sp_matriz_insumo_pk PRIMARY KEY ( id_matriz );

ALTER TABLE sp_matriz_insumo
    ADD CONSTRAINT mat_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES sp_producto ( id_producto );

ALTER TABLE sp_matriz_insumo
    ADD CONSTRAINT mat_ins_fk FOREIGN KEY ( id_insumo )
        REFERENCES sp_insumo ( id_insumo );

CREATE TABLE sp_orden_compra (
    id_orden           NUMBER NOT NULL,
    monto_total        NUMBER(6, 2) NOT NULL,
    monto_igv          VARCHAR2(20 BYTE) NOT NULL,
    fecha_registro     TIMESTAMP NOT NULL,
    fecha_autorizacion TIMESTAMP,
    fecha_entrega      TIMESTAMP,
    estado             CHAR(1 BYTE) NOT NULL
);

ALTER TABLE sp_orden_compra ADD CONSTRAINT sp_orden_compra_pk PRIMARY KEY ( id_orden );

CREATE TABLE sp_detalle_compra (
    id_compra NUMBER NOT NULL,
    id_orden  NUMBER NOT NULL,
    id_insumo NUMBER NOT NULL,
    cantidad  NUMERIC(6, 2) NOT NULL
);

ALTER TABLE sp_detalle_compra ADD CONSTRAINT sp_detalle_compra_pk PRIMARY KEY ( id_compra );

ALTER TABLE sp_detalle_compra
    ADD CONSTRAINT com_ord_fk FOREIGN KEY ( id_orden )
        REFERENCES sp_orden_compra ( id_orden );

ALTER TABLE sp_detalle_compra
    ADD CONSTRAINT com_ins_fk FOREIGN KEY ( id_insumo )
        REFERENCES sp_insumo ( id_insumo );

CREATE TABLE sp_motivo (
    id_motivo CHAR(1 BYTE) NOT NULL,
    nombre    VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE sp_motivo ADD CONSTRAINT sp_motivo_pk PRIMARY KEY ( id_motivo );

CREATE TABLE sp_orden_produccion (
    id_orden           NUMBER NOT NULL,
    motivo             CHAR(1 BYTE) NOT NULL,
    fecha_registro     TIMESTAMP NOT NULL,
    fecha_autorizacion TIMESTAMP,
    fecha_fin          TIMESTAMP,
    estado             CHAR(1 BYTE) NOT NULL
);

ALTER TABLE sp_orden_produccion ADD CONSTRAINT sp_orden_produccion_pk PRIMARY KEY ( id_orden );

ALTER TABLE sp_orden_produccion
    ADD CONSTRAINT motivo_ord_fk FOREIGN KEY ( motivo )
        REFERENCES sp_motivo ( id_motivo );

CREATE SEQUENCE sp_orden_produccion_seq;

CREATE TABLE sp_detalle_producto (
    id_compra   NUMBER NOT NULL,
    id_orden    NUMBER NOT NULL,
    id_producto NUMBER NOT NULL,
    unidades    NUMBER NOT NULL,
    merma       NUMBER DEFAULT 0 NOT NULL
);

ALTER TABLE sp_detalle_producto ADD CONSTRAINT sp_detalle_producto_pk PRIMARY KEY ( id_compra );

ALTER TABLE sp_detalle_producto
    ADD CONSTRAINT pro_ord_fk FOREIGN KEY ( id_orden )
        REFERENCES sp_orden_produccion ( id_orden );

ALTER TABLE sp_detalle_producto
    ADD CONSTRAINT pro_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES sp_producto ( id_producto );

CREATE SEQUENCE sp_detalle_producto_seq;