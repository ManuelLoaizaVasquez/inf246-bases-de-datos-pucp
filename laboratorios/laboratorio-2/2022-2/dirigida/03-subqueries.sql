-- 3. Uso de subconsultas

-- a. Empleando subconsultas, obtener la relacion de libros con su tipo de libro.
SELECT DISTINCT
    l.titulo,
    (
        SELECT
            t.descripcion
        FROM
            tipolibro t
        WHERE
            l.tipo_libro = t.cod_tipo_libro
    ) AS descripcion_tipo_libro
FROM
    libro l
ORDER BY
    1;
    
-- b. Obtener la cantidad de libros que han solicitado los alum
SELECT
    pe.nacionalidad,
    pe.nombres
    || ' '
    || pe.apellido1
    || ' '
    || pe.apellido2 AS nombre,
    (
        SELECT
            COUNT(l.cod_libro)
        FROM
            libro_prestado l
        WHERE
            l.cod_alumno = pe.dni
    )               AS cantidad_libros_solicitados
FROM
    persona pe
WHERE
    pe.nacionalidad <> 'PE';

-- c. Obtener la relacion de libros por biblioteca
-- cuya cantidad de ejemplares supera el promedio de dicha biblioteca
SELECT
    l.titulo        AS titulo,
    b.nombre_biblio AS biblioteca,
    lxb.total_ejemplar
FROM
         libro_biblioteca lxb
    INNER JOIN biblioteca b ON lxb.cod_biblio = b.cod_biblio
    INNER JOIN libro      l ON lxb.cod_libro = l.cod_libro
WHERE
    lxb.total_ejemplar > (
        SELECT
            AVG(lxb2.total_ejemplar)
        FROM
            libro_biblioteca lxb2
        WHERE
            lxb.cod_biblio = lxb2.cod_biblio
        GROUP BY
            lxb2.cod_biblio
    )
ORDER BY
    2,
    1,
    3;