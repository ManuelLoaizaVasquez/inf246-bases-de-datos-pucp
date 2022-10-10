-- 2. Uso de fechas

-- a. Identificar los libros que fueron solicitados durante los meses
-- de mayo y septiembre.
SELECT
    l.cod_libro AS codigo,
    l.titulo,
    lp.fecha_solicitud
FROM
    libro          l,
    libro_prestado lp
WHERE
    ( to_char(lp.fecha_solicitud, 'MM') = '05'
      OR to_char(lp.fecha_solicitud) = '09' )
    AND l.cod_libro = lp.cod_libro
ORDER BY
    3;

-- b. Identidicar los libros que tienen menos de 7 anos de publicacion.
SELECT DISTINCT
    l.titulo,
    l.anho_publica
FROM
    libro l
WHERE
    l.anho_publica >= (to_char(SYSDATE, 'YYYY') - 7)
ORDER BY
    2;