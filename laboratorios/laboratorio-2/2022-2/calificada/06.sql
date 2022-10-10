-- Pregunta 6
-- Listar las unidades en que se debe comprar cada insumo para el calzado.

SELECT
    i.nombre       AS insumo,
    u.nombre       AS unidad,
    d.denominacion AS dimension
FROM
         sp_insumo i
    INNER JOIN sp_unidad_divisoria u ON i.id_unidad = u.id_unidad
    INNER JOIN sp_dimension        d ON u.id_dimension = d.id_dimension
ORDER BY
    3 ASC;