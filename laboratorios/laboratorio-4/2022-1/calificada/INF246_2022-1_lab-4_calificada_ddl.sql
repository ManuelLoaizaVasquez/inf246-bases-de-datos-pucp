CREATE TABLE ce_tipo_documento (
    id_tipo_documento NUMBER NOT NULL,
    nombre            VARCHAR2(50 BYTE) NOT NULL,
    estado            CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_tipo_documento ADD CONSTRAINT ce_tipo_documento_pk PRIMARY KEY ( id_tipo_documento );

CREATE TABLE ce_cliente (
    id_cliente         NUMBER NOT NULL,
    apellido_paterno   VARCHAR2(30 BYTE) NOT NULL,
    apellido_materno   VARCHAR2(30 BYTE) NOT NULL,
    nombres            VARCHAR2(50 BYTE) NOT NULL,
    id_tipo_documento  NUMBER NOT NULL,
    numero_documento   VARCHAR2(15 BYTE) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    numero_telefono    VARCHAR2(15 BYTE) NOT NULL,
    correo_electronico VARCHAR2(50 BYTE) NOT NULL,
    contrasena         VARCHAR2(150 BYTE) NOT NULL,
    estado             CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_cliente ADD CONSTRAINT ce_cliente_pk PRIMARY KEY ( id_cliente );

ALTER TABLE ce_cliente
    ADD CONSTRAINT ce_cliente_tipodocumento_fk FOREIGN KEY ( id_tipo_documento )
        REFERENCES ce_tipo_documento ( id_tipo_documento );
        
-------------------
CREATE TABLE ce_ubigeo (
    id_ubigeo       CHAR(6 BYTE) NOT NULL,
    nombre          VARCHAR2(50 BYTE) NOT NULL,
    id_ubigeo_padre CHAR(6 BYTE) NOT NULL
);

ALTER TABLE ce_ubigeo ADD CONSTRAINT ce_ubigeo_pk PRIMARY KEY ( id_ubigeo );
/*ALTER TABLE CE_UBIGEO
    ADD CONSTRAINT ubigeo_padre_fk FOREIGN KEY ( id_ubigeo_padre )
        REFERENCES CE_UBIGEO ( id_ubigeo );*/

CREATE TABLE ce_direccion (
    id_direccion NUMBER NOT NULL,
    id_cliente   NUMBER NOT NULL,
    direccion    VARCHAR2(300 BYTE) NOT NULL,
    tipo         CHAR(1 BYTE),
    id_ubigeo    CHAR(6 BYTE) NOT NULL,
    referencia   VARCHAR2(500 BYTE),
    estado       CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_direccion ADD CONSTRAINT ce_direccion_pk PRIMARY KEY ( id_direccion );

ALTER TABLE ce_direccion
    ADD CONSTRAINT ce_direccion_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES ce_cliente ( id_cliente );

ALTER TABLE ce_direccion
    ADD CONSTRAINT ce_direccion_ubigeo_fk FOREIGN KEY ( id_ubigeo )
        REFERENCES ce_ubigeo ( id_ubigeo );
        
---------------- 
CREATE TABLE ce_categoria_producto (
    id_categoria NUMBER NOT NULL,
    nombre       VARCHAR2(50 BYTE) NOT NULL,
    estado       CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_categoria_producto ADD CONSTRAINT ce_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE ce_marca_producto (
    id_marca    NUMBER NOT NULL,
    nombre      VARCHAR2(50 BYTE) NOT NULL,
    pais_origen VARCHAR2(50 BYTE) NOT NULL,
    estado      CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_marca_producto ADD CONSTRAINT ce_marca_pk PRIMARY KEY ( id_marca );

CREATE TABLE ce_producto (
    id_producto  NUMBER NOT NULL,
    id_categoria NUMBER NOT NULL,
    id_marca     NUMBER NOT NULL,
    precio       NUMBER(10, 2) NOT NULL,
    stock        NUMBER NOT NULL,
    nombre       VARCHAR2(50 BYTE) NOT NULL,
    descripcion  VARCHAR2(250 BYTE) NOT NULL,
    estado       CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_producto ADD CONSTRAINT ce_producto_pk PRIMARY KEY ( id_producto );

ALTER TABLE ce_producto
    ADD CONSTRAINT ce_producto_categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES ce_categoria_producto ( id_categoria );

ALTER TABLE ce_producto
    ADD CONSTRAINT ce_producto_marca_fk FOREIGN KEY ( id_marca )
        REFERENCES ce_marca_producto ( id_marca );

CREATE TABLE ce_descuento (
    id_descuento NUMBER NOT NULL,
    id_producto  NUMBER NOT NULL,
    porcentaje   NUMBER(10, 2),
    fecha_inicio DATE NOT NULL,
    fecha_fin    DATE NOT NULL
);

ALTER TABLE ce_descuento ADD CONSTRAINT ce_descuento_pk PRIMARY KEY ( id_descuento );

ALTER TABLE ce_descuento
    ADD CONSTRAINT ce_descuento_producto_fk FOREIGN KEY ( id_producto )
        REFERENCES ce_producto ( id_producto );
        
------------
CREATE TABLE ce_pedido (
    id_pedido      NUMBER NOT NULL,
    codigo         VARCHAR2(20 BYTE) NOT NULL,
    id_cliente     NUMBER NOT NULL,
    id_direccion   NUMBER NOT NULL,
    fecha_registro TIMESTAMP NOT NULL,
    fecha_envio    TIMESTAMP NOT NULL,
    fecha_entrega  TIMESTAMP NOT NULL,
    subtotal       DECIMAL(8, 2) NOT NULL,
    monto_igv      DECIMAL(8, 2) NOT NULL,
    monto_total    DECIMAL(8, 2) NOT NULL,
    estado         CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_pedido ADD CONSTRAINT ce_pedido_pk PRIMARY KEY ( id_pedido );

ALTER TABLE ce_pedido
    ADD CONSTRAINT ce_pedido_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES ce_cliente ( id_cliente );

ALTER TABLE ce_pedido
    ADD CONSTRAINT ce_pedido_direccion_fk FOREIGN KEY ( id_direccion )
        REFERENCES ce_direccion ( id_direccion );

CREATE TABLE ce_pedido_detalle (
    id_pedido_detalle NUMBER NOT NULL,
    id_pedido         NUMBER NOT NULL,
    id_producto       NUMBER NOT NULL,
    numero_unidades   NUMBER NOT NULL,
    subtotal          DECIMAL(8, 2) NOT NULL,
    estado            CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_pedido_detalle ADD CONSTRAINT ce_pedido_detalle_pk PRIMARY KEY ( id_pedido_detalle );

ALTER TABLE ce_pedido_detalle
    ADD CONSTRAINT ce_pedido_detalle_pedido_fk FOREIGN KEY ( id_pedido )
        REFERENCES ce_pedido ( id_pedido );

ALTER TABLE ce_pedido_detalle
    ADD CONSTRAINT ce_pedido_detalle_producto_fk FOREIGN KEY ( id_producto )
        REFERENCES ce_producto ( id_producto );

CREATE TABLE ce_proveedor (
    id_proveedor       NUMBER NOT NULL,
    razon_social       VARCHAR2(100 BYTE) NOT NULL,
    ruc                VARCHAR2(11 BYTE) NOT NULL,
    numero_telefono    VARCHAR2(15 BYTE) NOT NULL,
    correo_electronico VARCHAR2(50 BYTE) NOT NULL,
    contrasena         VARCHAR2(150 BYTE) NOT NULL,
    estado             CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_proveedor ADD CONSTRAINT ce_proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE ce_medio_pago (
    id_medio_pago NUMBER NOT NULL,
    nombre        VARCHAR2(25 BYTE) NOT NULL,
    estado        CHAR(1 BYTE) NOT NULL
);

ALTER TABLE ce_medio_pago ADD CONSTRAINT ce_medio_pago_pk PRIMARY KEY ( id_medio_pago );

ALTER TABLE ce_producto ADD id_proveedor NUMBER;

ALTER TABLE ce_producto
    ADD FOREIGN KEY ( id_proveedor )
        REFERENCES ce_proveedor ( id_proveedor );

ALTER TABLE ce_pedido ADD id_medio_pago NUMBER DEFAULT ( 1 );

ALTER TABLE ce_pedido
    ADD FOREIGN KEY ( id_medio_pago )
        REFERENCES ce_medio_pago ( id_medio_pago );