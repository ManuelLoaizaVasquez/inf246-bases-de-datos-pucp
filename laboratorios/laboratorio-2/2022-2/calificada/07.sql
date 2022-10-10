-- Pregunta 7
-- Empleando subconsultas, identificar el insumo que mas se compro en el ultimo
-- mes para la fabricacion de calzados.

SELECT
    i.nombre        AS insumo,
    SUM(d.cantidad) AS cantidad_comprada
FROM
         sp_insumo i
    INNER JOIN sp_detalle_compra d ON d.id_insumo = i.id_insumo
    INNER JOIN sp_orden_compra   o ON o.id_orden = d.id_orden
WHERE
        to_char(o.fecha_registro, 'MM') = to_char(sysdate, 'MM')
    AND to_char(o.fecha_registro, 'YYYY') = to_char(sysdate, 'YYYY')
GROUP BY
    i.nombre
HAVING
    SUM(d.cantidad) = (
        SELECT
            MAX(SUM(d.cantidad))
        FROM
                 sp_insumo i
            INNER JOIN sp_detalle_compra d ON d.id_insumo = i.id_insumo
            INNER JOIN sp_orden_compra   o ON o.id_orden = d.id_orden
        WHERE
                to_char(o.fecha_registro, 'MM') = to_char(sysdate, 'MM')
            AND to_char(o.fecha_registro, 'YYYY') = to_char(sysdate, 'YYYY')
        GROUP BY
            i.nombre
    );