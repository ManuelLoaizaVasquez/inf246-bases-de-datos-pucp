-- Pregunta 3
-- Inciso a
SELECT
    m.descripcionmed   AS "Descripcion del Medicamento",
    SUM(d.preciototal) AS "Monto Total de Ventas"
FROM
         ee1_medicamento m
    INNER JOIN ee1_detalle_venta d ON d.idmedicamento = m.idmedicamento
    INNER JOIN ee1_venta         v ON v.idventa = d.idventa
WHERE
    m.descripcionmed LIKE '%FORTE%'
    AND '04' <= to_char(v.fechaventa, 'MM')
    AND to_char(v.fechaventa, 'MM') <= '09'
GROUP BY
    m.descripcionmed
ORDER BY
    2 DESC;
    
-- Inciso b
SELECT
    p.idproveedor         AS "Código del Proveedor",
    p.razonsocial         AS "Razón Social del Proveedor",
    COUNT(pxs.idsucursal) AS "Número de Sucursales"
FROM
         ee1_proveedor p
    INNER JOIN ee1_proveedorxsucursal pxs ON pxs.idproveedor = p.idproveedor
WHERE
    pxs.activo = 'A'
GROUP BY
    p.idproveedor,
    p.razonsocial
HAVING
    COUNT(pxs.idsucursal) > 2
ORDER BY
    1;
    
-- Inciso c
SELECT
    v.idvendedor                                           AS "Código de Vendedor",
    v.nombres
    || ' '
    || v.apepaterno
    || decode(v.apematerno, NULL, '', ' ' || v.apematerno) AS "Nombre Completo",
    SUM(nvl(t.montototal, 0))                              AS "Monto total",
    COUNT(t.idventa)                                       AS "Número de ventas"
FROM
         ee1_vendedor v
    INNER JOIN ee1_venta t ON t.idvendedor = v.idvendedor
WHERE
    to_char(sysdate, 'MM') - 1 = to_char(t.fechaventa, 'MM')
    OR to_char(sysdate, 'MM') = '01'
    AND to_char(t.fechaventa, 'MM') = '12'
GROUP BY
    v.idvendedor,
    v.nombres
    || ' '
    || v.apepaterno
    || decode(v.apematerno, NULL, '', ' ' || v.apematerno)
HAVING SUM(nvl(t.montototal, 0)) > 1000
       AND COUNT(t.idventa) > 10
ORDER BY
    3 DESC;