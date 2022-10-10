-- Pregunta 5
-- Empleando subconsultas, indentificar el producto que requiere la mayor
-- cantidad de insumos.

SELECT
    p.nombre           AS producto,
    COUNT(m.id_matriz) AS numero_insumos
FROM
         sp_producto p
    INNER JOIN sp_matriz_insumo m ON m.id_producto = p.id_producto
GROUP BY
    p.nombre
HAVING
    COUNT(m.id_matriz) = (
        SELECT
            MAX(COUNT(m.id_matriz))
        FROM
                 sp_producto p
            INNER JOIN sp_matriz_insumo m ON m.id_producto = p.id_producto
        GROUP BY
            p.id_producto
    );