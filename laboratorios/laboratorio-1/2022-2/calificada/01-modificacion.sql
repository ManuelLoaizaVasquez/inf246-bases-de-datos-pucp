-- Parte 1: Modificacion del modelo

-- Pregunta 1

-- Acapite A
ALTER TABLE sp_insumo RENAME COLUMN unidad_divisoria TO id_unidad;

-- Acapite B
CREATE TABLE sp_dimension (
    id_dimension CHAR(1 BYTE) NOT NULL,
    denominacion VARCHAR2(40) NOT NULL,
    CONSTRAINT pk_id_dimension PRIMARY KEY ( id_dimension )
);

-- Acapite C
CREATE TABLE sp_unidad_divisoria (
    id_unidad    VARCHAR2(50 BYTE) NOT NULL,
    nombre       VARCHAR2(50 BYTE) NOT NULL,
    id_dimension CHAR(1 BYTE) NOT NULL,
    CONSTRAINT pk_id_unidad PRIMARY KEY ( id_unidad ),
    CONSTRAINT fk_id_dimension FOREIGN KEY ( id_dimension )
        REFERENCES sp_dimension ( id_dimension )
);

-- Acapite D
ALTER TABLE sp_insumo
    ADD CONSTRAINT fk_id_unidad FOREIGN KEY ( id_unidad )
        REFERENCES sp_unidad_divisoria ( id_unidad );

-- Pregunta 2

-- Acapite A
ALTER TABLE sp_producto RENAME COLUMN tipo TO id_tipo;

-- Acapite B
CREATE TABLE sp_tipo_producto (
    id_tipo NUMBER NOT NULL,
    nombre  VARCHAR2(100 BYTE) NOT NULL,
    CONSTRAINT pk_id_tipo PRIMARY KEY ( id_tipo )
);

-- Acapite C
ALTER TABLE sp_tipo_producto
    ADD CONSTRAINT fk_id_tipo FOREIGN KEY ( id_tipo )
        REFERENCES sp_tipo_producto ( id_tipo );

-- Pregunta 3
RENAME sp_compra_insumo TO sp_detalle_compra;

RENAME sp_compra_producto TO sp_detalle_producto;

-- Pregunta 4
ALTER TABLE sp_insumo MODIFY
    estado CHAR(1 BYTE);

ALTER TABLE sp_matriz_insumo MODIFY
    cantidad NUMBER(6, 2);

ALTER TABLE sp_detalle_compra MODIFY
    cantidad NUMBER(6, 2);

ALTER TABLE sp_orden_compra MODIFY
    fecha_autorizacion null;

ALTER TABLE sp_orden_compra MODIFY
    fecha_entrega null;

ALTER TABLE sp_orden_produccion MODIFY
    fecha_autorizacion null;

ALTER TABLE sp_orden_produccion MODIFY
    fecha_fin null;

ALTER TABLE sp_detalle_producto MODIFY
    merma DEFAULT 0;

-- Pregunta 5
ALTER TABLE sp_producto ADD stock NUMBER NOT NULL;