-- Pregunta 1
-- Los productos o calzados se clasifican en tipo de productos.
-- Por lo tanto, se requiere saber la cantidad de insumos empleados en la
-- fabricacion de cada tipo de producto.
-- En el resultado debera mostrar los insumos empleados por cada tipo de
-- producto y sus cantidades.

SELECT
    t.nombre           AS nombre_tipo_producto,
    i.nombre           AS nombre_insumo,
    COUNT(m.id_matriz) AS total
FROM
    sp_tipo_producto t,
    sp_insumo        i,
    sp_matriz_insumo m,
    sp_producto      p
WHERE
        t.id_tipo = p.id_tipo
    AND p.id_producto = m.id_producto
    AND m.id_insumo = i.id_insumo
GROUP BY
    t.nombre,
    i.nombre
ORDER BY
    1,
    2,
    3;