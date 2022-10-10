-- Modificacion de tablas de base de datos

-- 1. Modificar el nombre de la tabla TRABAJOS a CARGOS.
RENAME trabajos TO cargos;

-- 2. Modificar el tamano del campo NAME de la tabla EMPLEADOS
-- para que ahora tenga tamano 40.
ALTER TABLE empleados MODIFY
    name VARCHAR2(40);
    
-- 3. Agregar la columna DIRECC2 de tipo VARCHAR2(20) a la tabla EMPLEADOS.
ALTER TABLE empleados ADD direcc2 VARCHAR2(20);

-- 4. Cambiar el nombre del campo NAME de la tabla EMPLEADOS debiendo llamarse
-- ahora NOMBRE.
ALTER TABLE empleados RENAME COLUMN name TO nombre;

-- 5. Cambiar el nombre de los campos TRABAJO_COD y NOMBRE_TRAB de la tabla
-- CARGOS por los nombres CARGO_COD y NOMBRE_CARGO respectivamente.
ALTER TABLE cargos RENAME COLUMN trabajo_cod TO cargo_cod;

ALTER TABLE cargos RENAME COLUMN nombre_trab TO nombre_cargo;

-- 6. Modificar el tamano del campo SALARIO de la tabla EMPLEADOS de tal forma
-- que ahora tenga tamano 10 y 2 decimales.
ALTER TABLE empleados MODIFY
    salario NUMBER(10, 2);
    
-- 7. Modificar el campo JEFE de la tabla DEPARTAMENTOS para que sea una clave
-- foranea referenciando a la tabla EMPLEADOS mediante su llave primaria DNI.
ALTER TABLE departamentos
    ADD CONSTRAINT jefe_fk FOREIGN KEY ( jefe )
        REFERENCES empleados ( dni );