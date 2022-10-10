-- Pregunta 2
-- Se require obtener la cantidad de ordenes de compra registradas hace dos
-- meses y la cantidad de insumos adquieridos en dichas ordenes.
-- El resultado debera mostrar la fecha de registro, el nombre del insumo
-- y la cantidad solicitada.
SELECT
    o.fecha_registro,
    i.nombre   AS insumo,
    d.cantidad AS cantidad
FROM
         sp_orden_compra o
    INNER JOIN sp_detalle_compra d ON d.id_orden = o.id_orden
    INNER JOIN sp_insumo         i ON i.id_insumo = d.id_insumo
WHERE
    o.fecha_registro >= add_months(sysdate, - 2);