-- Sentencias SQL para manipulacion de datos

-- 1. Insertar los siguientes datos en la tabla CARGOS.
INSERT INTO cargos (
    cargo_cod,
    nombre_cargo,
    salario_min,
    salario_max
) VALUES (
    '001',
    'ADMINISTRATIVO',
    900,
    1000
);

INSERT INTO cargos (
    cargo_cod,
    nombre_cargo,
    salario_min,
    salario_max
) VALUES (
    '002',
    'CONTABLE',
    900,
    1000
);

INSERT INTO cargos (
    cargo_cod,
    nombre_cargo,
    salario_min,
    salario_max
) VALUES (
    '003',
    'INGENIERO TECNICO',
    1000,
    1200
);

INSERT INTO cargos (
    cargo_cod,
    nombre_cargo,
    salario_min,
    salario_max
) VALUES (
    '004',
    'INGENIERO',
    1200,
    1800
);

-- 2. Ejecutar el script de inserciones de datos proporcionados.

-- 3. Realice una consulta que muestre los nombres y apellidos de los
-- empleados cuyo apellido paterno empiece con R.
SELECT
    nombre,
    apellido1,
    apellido2
FROM
    empleados
WHERE
    apellido1 LIKE 'R%';

-- 4. Realice una consulta que muestre los nombres y el salario
-- aumentado en 5% de los empleados que cobran menos de 1600.
SELECT
    nombre,
    salario * 1.05 AS nuevo_salario
FROM
    empleados
WHERE
    salario < 1600;

-- 5. Realice una consulta que muestre los nombres, apellidos concatenados y
-- separados por un espacio en blanco, fecha de inicio de trabajo y fecha de
-- fin de trabajo.
SELECT
    nombre,
    apellido1
    || ' '
    || apellido2 AS apellido,
    fecha_inicio,
    fecha_fin
FROM
    empleados,
    historial_laboral
WHERE
    historial_laboral.empleado_dni = empleados.dni;

-- 6. Ejecutar una consulta que muestre el historial laboral del empleado cuyo
-- DNI es 12345. En esta consulta debe mostrar el nombre del puesto, asi como
-- el rango salarial (sueldo minimo y sueldo maximo).
SELECT
    c.nombre_cargo,
    c.salario_min,
    c.salario_max
FROM
    cargos            c,
    historial_laboral h
WHERE
        h.empleado_dni = 12345
    AND h.cargo_cod = c.cargo_cod;

-- 7. Actualizar el salario aumentando en 10% el de los empleados cuya fecha
-- de inicio este entre 01/01/2002 y 31/12/2004.
UPDATE historial_salarial
SET
    salario = salario * 1.10
WHERE
    fecha_comienzo BETWEEN TO_DATE('01/01/2002', 'DD/MM/YYYY') AND TO_DATE('31/12/2004', 'DD/MM/YYYY');