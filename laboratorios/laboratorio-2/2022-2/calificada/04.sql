-- Pregunta 4
-- Mostrar el monto total de las ordenes de compra, agrupados por mes y ano.
-- Ademas, el monto debe considerar el IGV ya registrado en la orden de compra.
SELECT
    to_char(o.fecha_registro, 'Month "of" YYYY') AS mes,
    SUM(o.monto_total + o.monto_igv)             AS monto_orden
FROM
    sp_orden_compra o
GROUP BY
    to_char(o.fecha_registro, 'Month "of" YYYY')
ORDER BY
    2 DESC;