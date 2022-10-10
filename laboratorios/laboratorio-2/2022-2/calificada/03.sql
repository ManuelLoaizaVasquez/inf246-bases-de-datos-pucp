-- Pregunta 3
-- Listar las ordenes de produccion que se emitieron en el mes de julio.
-- Para esto debe mostrar la fecha de registro, el producto solicitado en la
-- orden y el precio estimado del producto.

SELECT
    o.id_orden AS numero_orden,
    o.fecha_registro,
    p.nombre AS producto,
    m.nombre AS motivo,
    p.precio AS precio_producto
FROM
    sp_motivo m,
    sp_orden_produccion o,
    sp_detalle_producto d,
    sp_producto p
WHERE
    o.id_orden = d.id_orden
    AND d.id_producto = p.id_producto
    AND m.id_motivo = o.motivo
    AND TO_CHAR(o.fecha_registro, 'MM') = '07'
ORDER BY
    1,
    2,
    3,
    5;