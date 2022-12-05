CREATE TABLE pp_estado_transferencia (
    id_estado_transferencia NUMBER NOT NULL,
    id_transferencia        NUMBER NOT NULL,
    descripcion             VARCHAR2(100 BYTE) NOT NULL,
    fecha_registro          DATE NOT NULL,
    estado_anterior         CHAR(1 BYTE) NULL,
    estado_actual           CHAR(1 BYTE) NULL
);

ALTER TABLE pp_estado_transferencia ADD CONSTRAINT pp_est_tr_pk PRIMARY KEY ( id_estado_transferencia );