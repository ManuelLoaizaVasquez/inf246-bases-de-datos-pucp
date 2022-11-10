-- Generado por Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   en:        2022-01-31 00:00:11 COT
--   sitio:      Oracle Database 12c
--   tipo:      Oracle Database 12c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE sp_archivo (
    id_archivo      NUMBER NOT NULL,
    id_convocatoria NUMBER NOT NULL,
    id_postulante   NUMBER NOT NULL,
    id_documento    NUMBER NOT NULL,
    nombre          VARCHAR2(100 BYTE) NOT NULL,
    estado          CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN sp_archivo.id_archivo IS
    'Identificador del archivo.';

COMMENT ON COLUMN sp_archivo.id_convocatoria IS
    'Identificador de la convocatoria a la que hace referencia el archivo.';

COMMENT ON COLUMN sp_archivo.id_postulante IS
    'Identificador del postulante que subió el archivo.';

COMMENT ON COLUMN sp_archivo.id_documento IS
    'Identificador del documento requerido al que hace referencia.';

COMMENT ON COLUMN sp_archivo.nombre IS
    'Nombre del archivo que el postulante subió y que se alojará en el servidor del Sistema de Postulación.';

COMMENT ON COLUMN sp_archivo.estado IS
    'Estado del archivo subido por el postulante:
P = Pendiente
A = Aprobado
R = Rechazado';

ALTER TABLE sp_archivo ADD CONSTRAINT sp_archivo_pk PRIMARY KEY ( id_archivo );

CREATE TABLE sp_centro (
    id_centro     NUMBER NOT NULL,
    id_postulante NUMBER NOT NULL,
    nombre        VARCHAR2(100 BYTE) NOT NULL,
    direccion     VARCHAR2(150 BYTE) NOT NULL,
    tipo_centro   CHAR(1 BYTE) NOT NULL,
    fecha_inicio  DATE NOT NULL,
    fecha_fin     DATE NOT NULL
);

COMMENT ON COLUMN sp_centro.id_centro IS
    'Identificador del centro de estudios.';

COMMENT ON COLUMN sp_centro.id_postulante IS
    'Identificador del postulante que estudió en el centro.';

COMMENT ON COLUMN sp_centro.nombre IS
    'Nombre del centro de estudios.';

COMMENT ON COLUMN sp_centro.direccion IS
    'Dirección del centro de estudios.';

COMMENT ON COLUMN sp_centro.tipo_centro IS
    'Tipo de centro de estudios:
C = Colegio
P = Centro pre-universitario';

COMMENT ON COLUMN sp_centro.fecha_inicio IS
    'Fecha de inicio de estudios del postulante en el centro.';

COMMENT ON COLUMN sp_centro.fecha_fin IS
    'Fecha de fin de estudios del postulante en el centro.';

ALTER TABLE sp_centro ADD CONSTRAINT sp_centro_pk PRIMARY KEY ( id_centro );

CREATE TABLE sp_convocatoria (
    id_convocatoria NUMBER NOT NULL,
    id_semestre     NUMBER NOT NULL,
    nombre          VARCHAR2(150 BYTE) NOT NULL,
    descripcion     VARCHAR2(1000 BYTE) NOT NULL,
    fecha_inicio    DATE NOT NULL,
    fecha_fin       DATE NOT NULL,
    estado          CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN sp_convocatoria.id_convocatoria IS
    'Identificador de la convocatoria.';

COMMENT ON COLUMN sp_convocatoria.id_semestre IS
    'Identificador del semestre al que pertenece la convocatoria.';

COMMENT ON COLUMN sp_convocatoria.nombre IS
    'Nombre de la convocatoria.';

COMMENT ON COLUMN sp_convocatoria.descripcion IS
    'Descripción de la convocatoria.';

COMMENT ON COLUMN sp_convocatoria.fecha_inicio IS
    'Fecha de inicio de inscripción a la convocatoria.';

COMMENT ON COLUMN sp_convocatoria.fecha_fin IS
    'Fecha de fin de inscripción a la convocatoria.';

COMMENT ON COLUMN sp_convocatoria.estado IS
    'Estado actual de la convocatoria:
A = Inscripciones abiertas
E = Proceso de evaluación
C = Culminado';

ALTER TABLE sp_convocatoria ADD CONSTRAINT sp_convocatoria_pk PRIMARY KEY ( id_convocatoria );

CREATE TABLE sp_convocatoria_documento (
    id_convocatoria NUMBER NOT NULL,
    id_documento    NUMBER NOT NULL
);

COMMENT ON COLUMN sp_convocatoria_documento.id_convocatoria IS
    'Identificador de la convocatoria.';

COMMENT ON COLUMN sp_convocatoria_documento.id_documento IS
    'Identificador del documento.';

ALTER TABLE sp_convocatoria_documento ADD CONSTRAINT sp_convocatoria_documento_pk PRIMARY KEY ( id_convocatoria,
                                                                                                id_documento );

CREATE TABLE sp_convocatoria_postulante (
    id_convocatoria NUMBER NOT NULL,
    id_postulante   NUMBER NOT NULL,
    estado          CHAR(1 BYTE) NOT NULL
);

COMMENT ON TABLE sp_convocatoria_postulante IS
    'Esta tabla guardará los postulantes que se inscribieron a una convocatoria.';

COMMENT ON COLUMN sp_convocatoria_postulante.id_convocatoria IS
    'Identificador de la convocatoria.';

COMMENT ON COLUMN sp_convocatoria_postulante.id_postulante IS
    'Identificador del postulante.';

COMMENT ON COLUMN sp_convocatoria_postulante.estado IS
    'Estado de la postulación:
A = Aprobado
P = Pendiente
R = Rechazado';

ALTER TABLE sp_convocatoria_postulante ADD CONSTRAINT sp_convocatoria_postulante_pk PRIMARY KEY ( id_convocatoria,
                                                                                                  id_postulante );

CREATE TABLE sp_cuenta (
    id_cuenta   NUMBER NOT NULL,
    banco       VARCHAR2(100 BYTE) NOT NULL,
    tipo_cuenta CHAR(1 BYTE) NOT NULL,
    nro_cuenta  VARCHAR2(50 BYTE) NOT NULL,
    cci         VARCHAR2(50 BYTE) NOT NULL
);

COMMENT ON COLUMN sp_cuenta.id_cuenta IS
    'Identificador de la cuenta bancaria.';

COMMENT ON COLUMN sp_cuenta.banco IS
    'Nombre del banco al que pertenece la cuenta.';

COMMENT ON COLUMN sp_cuenta.tipo_cuenta IS
    'Tipo de cuenta bancaria:
A = Cuenta de ahorros
C = Cuenta corriente';

COMMENT ON COLUMN sp_cuenta.nro_cuenta IS
    'Número de cuenta para transferencias dentro del mismo banco.';

COMMENT ON COLUMN sp_cuenta.cci IS
    'Número de cuenta para transferencias interbancarias.';

ALTER TABLE sp_cuenta ADD CONSTRAINT sp_cuenta_pk PRIMARY KEY ( id_cuenta );

CREATE TABLE sp_documento (
    id_documento NUMBER NOT NULL,
    nombre       VARCHAR2(150 BYTE) NOT NULL,
    descripcion  VARCHAR2(1000 BYTE) NOT NULL
);

COMMENT ON COLUMN sp_documento.id_documento IS
    'Identificador del documento requerido.';

COMMENT ON COLUMN sp_documento.nombre IS
    'Nombre del documento requerido.';

COMMENT ON COLUMN sp_documento.descripcion IS
    'Descripción del documento requerido.';

ALTER TABLE sp_documento ADD CONSTRAINT sp_documento_pk PRIMARY KEY ( id_documento );

CREATE TABLE sp_pago (
    id_pago         CHAR(20 BYTE) NOT NULL,
    id_convocatoria NUMBER NOT NULL,
    id_postulante   NUMBER NOT NULL,
    id_cuenta       NUMBER NOT NULL,
    monto           NUMBER(10, 2) NOT NULL,
    fecha_venc      DATE NOT NULL,
    fecha_pago      DATE,
    estado          CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN sp_pago.id_pago IS
    'Identificador del pago.';

COMMENT ON COLUMN sp_pago.id_convocatoria IS
    'Identificador de la convocatoria a la que hace referencia el pago.';

COMMENT ON COLUMN sp_pago.id_postulante IS
    'Identificador del postulante que realizó el pago.';

COMMENT ON COLUMN sp_pago.id_cuenta IS
    'Identificador de la cuenta bancaria a la que fue depositado el pago.';

COMMENT ON COLUMN sp_pago.monto IS
    'Monto del pago, en soles.';

COMMENT ON COLUMN sp_pago.fecha_venc IS
    'Fecha de vencimiento del pago.';

COMMENT ON COLUMN sp_pago.fecha_pago IS
    'Fecha de realización del pago.';

COMMENT ON COLUMN sp_pago.estado IS
    'Estado del pago:
P = Pendiente
R = Realizado
M = Moroso
A = Anulado';

ALTER TABLE sp_pago ADD CONSTRAINT sp_pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE sp_postulante (
    id_postulante NUMBER NOT NULL,
    id_usuario    NUMBER NOT NULL,
    tipo_doc      CHAR(1 BYTE) NOT NULL,
    nro_doc       VARCHAR2(20 BYTE) NOT NULL,
    fecha_nac     DATE NOT NULL,
    domicilio     VARCHAR2(150 BYTE) NOT NULL,
    telefono      VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON TABLE sp_postulante IS
    'Esta tabla guardará los datos del postulante a la universidad.';

COMMENT ON COLUMN sp_postulante.id_postulante IS
    'Identificador del postulante.';

COMMENT ON COLUMN sp_postulante.id_usuario IS
    'Identificador del usuario asociado al postulante.';

COMMENT ON COLUMN sp_postulante.tipo_doc IS
    'Tipo de documento del postulante:
D = DNI
C = Carné de extranjería';

COMMENT ON COLUMN sp_postulante.nro_doc IS
    'Número del documento del postulante.';

COMMENT ON COLUMN sp_postulante.fecha_nac IS
    'Fecha de nacimiento del postulante.';

COMMENT ON COLUMN sp_postulante.domicilio IS
    'Domicilio del postulante.';

COMMENT ON COLUMN sp_postulante.telefono IS
    'Teléfono fijo o celular del postulante.';

CREATE UNIQUE INDEX sp_postulante__idx ON
    sp_postulante (
        id_usuario
    ASC );

ALTER TABLE sp_postulante ADD CONSTRAINT sp_postulante_pk PRIMARY KEY ( id_postulante );

CREATE TABLE sp_semestre (
    id_semestre  NUMBER NOT NULL,
    nombre       VARCHAR2(50 BYTE) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin    DATE NOT NULL
);

COMMENT ON COLUMN sp_semestre.id_semestre IS
    'Identificador del semestre.';

COMMENT ON COLUMN sp_semestre.nombre IS
    'Nombre del semestre.';

COMMENT ON COLUMN sp_semestre.fecha_inicio IS
    'Fecha de inicio del semestre.';

COMMENT ON COLUMN sp_semestre.fecha_fin IS
    'Fecha de fin del semestre.';

ALTER TABLE sp_semestre ADD CONSTRAINT sp_semestre_pk PRIMARY KEY ( id_semestre );

CREATE TABLE sp_usuario (
    id_usuario   NUMBER NOT NULL,
    correo       VARCHAR2(150 BYTE) NOT NULL,
    contrasenha  VARCHAR2(150 BYTE) NOT NULL,
    nombre       VARCHAR2(100 BYTE) NOT NULL,
    ap_paterno   VARCHAR2(50 BYTE) NOT NULL,
    ap_materno   VARCHAR2(50 BYTE),
    tipo_usuario CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN sp_usuario.id_usuario IS
    'Identificador del usuario.';

COMMENT ON COLUMN sp_usuario.correo IS
    'Correo electrónico del usuario.';

COMMENT ON COLUMN sp_usuario.contrasenha IS
    'Contraseña del usuario.';

COMMENT ON COLUMN sp_usuario.nombre IS
    'Nombre propio del usuario.';

COMMENT ON COLUMN sp_usuario.ap_paterno IS
    'Apellido paterno del usuario.';

COMMENT ON COLUMN sp_usuario.ap_materno IS
    'Apellido materno del usuario.';

COMMENT ON COLUMN sp_usuario.tipo_usuario IS
    'Tipo del usuario:
A = Administrador
P = Postulante
E = Evaluador';

ALTER TABLE sp_usuario ADD CONSTRAINT sp_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE sp_archivo
    ADD CONSTRAINT sp_archivo_sp_convocatoria_fk FOREIGN KEY ( id_convocatoria )
        REFERENCES sp_convocatoria ( id_convocatoria );

ALTER TABLE sp_archivo
    ADD CONSTRAINT sp_archivo_sp_documento_fk FOREIGN KEY ( id_documento )
        REFERENCES sp_documento ( id_documento );

ALTER TABLE sp_archivo
    ADD CONSTRAINT sp_archivo_sp_postulante_fk FOREIGN KEY ( id_postulante )
        REFERENCES sp_postulante ( id_postulante );

ALTER TABLE sp_centro
    ADD CONSTRAINT sp_centro_sp_postulante_fk FOREIGN KEY ( id_postulante )
        REFERENCES sp_postulante ( id_postulante );

ALTER TABLE sp_convocatoria_documento
    ADD CONSTRAINT sp_condoc_sp_convocatoria_fk FOREIGN KEY ( id_convocatoria )
        REFERENCES sp_convocatoria ( id_convocatoria );

ALTER TABLE sp_convocatoria_documento
    ADD CONSTRAINT sp_condoc_sp_documento_fk FOREIGN KEY ( id_documento )
        REFERENCES sp_documento ( id_documento );

ALTER TABLE sp_convocatoria_postulante
    ADD CONSTRAINT sp_conpos_sp_convocatoria_fk FOREIGN KEY ( id_convocatoria )
        REFERENCES sp_convocatoria ( id_convocatoria );

ALTER TABLE sp_convocatoria_postulante
    ADD CONSTRAINT sp_conpos_sp_postulante_fk FOREIGN KEY ( id_postulante )
        REFERENCES sp_postulante ( id_postulante );

ALTER TABLE sp_convocatoria
    ADD CONSTRAINT sp_convocatoria_sp_semestre_fk FOREIGN KEY ( id_semestre )
        REFERENCES sp_semestre ( id_semestre );

ALTER TABLE sp_pago
    ADD CONSTRAINT sp_pago_sp_convocatoria_fk FOREIGN KEY ( id_convocatoria )
        REFERENCES sp_convocatoria ( id_convocatoria );

ALTER TABLE sp_pago
    ADD CONSTRAINT sp_pago_sp_cuenta_fk FOREIGN KEY ( id_cuenta )
        REFERENCES sp_cuenta ( id_cuenta );

ALTER TABLE sp_pago
    ADD CONSTRAINT sp_pago_sp_postulante_fk FOREIGN KEY ( id_postulante )
        REFERENCES sp_postulante ( id_postulante );

ALTER TABLE sp_postulante
    ADD CONSTRAINT sp_postulante_sp_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES sp_usuario ( id_usuario );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             1
-- ALTER TABLE                             24
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
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
