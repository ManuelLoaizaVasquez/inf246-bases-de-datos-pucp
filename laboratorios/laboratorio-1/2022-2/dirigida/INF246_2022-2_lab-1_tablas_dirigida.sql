/* tabla estudios */
CREATE TABLE estudios (
    empleado_dni NUMBER(8),
    universidad  NUMBER(5),
    año          NUMBER(4),
    grado        VARCHAR2(5),
    especialidad VARCHAR2(20),
    CONSTRAINT pk_estudios PRIMARY KEY ( empleado_dni,
                                         año,
                                         grado ),
    CONSTRAINT fk_estudios_empleados FOREIGN KEY ( empleado_dni )
        REFERENCES empleados ( dni ),
    CONSTRAINT fk_estudios_universidades FOREIGN KEY ( universidad )
        REFERENCES universidades ( univ_cod )
);
/* tabla historial_laboral */
CREATE TABLE historial_laboral (
    empleado_dni   NUMBER(8),
    cargo_cod      NUMBER(5),
    fecha_inicio   DATE,
    fecha_fin      DATE,
    dpto_cod       NUMBER(5),
    supervisor_dni NUMBER(8),
    CONSTRAINT pk_historial_laboral PRIMARY KEY ( empleado_dni,
                                                  fecha_inicio ),
    CONSTRAINT fk_hlaboral_empleados FOREIGN KEY ( empleado_dni )
        REFERENCES empleados ( dni ),
    CONSTRAINT fk_hlaboral_cargos FOREIGN KEY ( cargo_cod )
        REFERENCES cargos ( cargo_cod ),
    CONSTRAINT fk_hlaboral_departamentos FOREIGN KEY ( dpto_cod )
        REFERENCES departamentos ( dpto_cod ),
    CONSTRAINT fk_hlaboral_supervisor FOREIGN KEY ( supervisor_dni )
        REFERENCES empleados ( dni ),
    CONSTRAINT ck_hlaboral_fechas CHECK ( fecha_fin IS NULL
                                          OR fecha_inicio < fecha_fin )
);
/* tabla historial_salarial */
CREATE TABLE historial_salarial (
    empleado_dni   NUMBER(8),
    salario        NUMBER(5),
    fecha_comienzo DATE,
    fecha_fin      DATE,
    CONSTRAINT pk_historial_salarial PRIMARY KEY ( empleado_dni,
                                                   fecha_comienzo ),
    CONSTRAINT fk_historial_salarial FOREIGN KEY ( empleado_dni )
        REFERENCES empleados ( dni ),
    CONSTRAINT ck_fechas CHECK ( fecha_fin IS NULL
                                 OR fecha_comienzo < fecha_fin )
);

ALTER SESSION SET nls_date_format = 'DD/MM/YYYY';