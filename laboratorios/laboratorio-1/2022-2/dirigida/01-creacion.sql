-- Creacion de tablas de base de datos

-- 1. Crear la tabla EMPLEADOS con los campos especificados.

CREATE TABLE empleados (
    dni        NUMBER(8) NOT NULL,
    name       VARCHAR2(10) NOT NULL,
    apellido1  VARCHAR2(15) NOT NULL,
    apellido2  VARCHAR2(15),
    salario    NUMBER(5),
    direcc1    VARCHAR2(25),
    ciudad     VARCHAR2(20),
    municipio  VARCHAR2(20),
    cod_postal VARCHAR2(5),
    sexo       CHAR(1),
    fecha_nac  DATE,
    CONSTRAINT pk_empleados PRIMARY KEY ( dni )
);

-- 2. Crear la tabla DEPARTAMENTOS con los campos especificados.
CREATE TABLE departamentos (
    dpto_cod    NUMBER(5) NOT NULL,
    nombre_dpt  VARCHAR2(30) NOT NULL,
    jefe        NUMBER(8),
    presupuesto NUMBER(6) NOT NULL,
    pres_actual NUMBER(6),
    CONSTRAINT pk_departamentos PRIMARY KEY ( dpto_cod )
);

-- 3. Crear la tabla UNIVERSIDADES con los campos especificados.
CREATE TABLE universidades (
    univ_cod    NUMBER(5) NOT NULL,
    nombre_univ VARCHAR2(25) NOT NULL,
    ciudad      VARCHAR2(20),
    municipio   VARCHAR2(20),
    cod_postal  VARCHAR2(5),
    CONSTRAINT pk_universidades PRIMARY KEY ( univ_cod )
);

-- 4. Crear la tabla TRABAJOS con los campos especificados.
CREATE TABLE trabajos (
    trabajo_cod NUMBER(5) NOT NULL,
    nombre_trab VARCHAR2(20) NOT NULL UNIQUE,
    salario_min NUMBER(5) NOT NULL,
    salario_max NUMBER(5) NOT NULL,
    CONSTRAINT pk_trabajos PRIMARY KEY ( trabajo_cod )
);