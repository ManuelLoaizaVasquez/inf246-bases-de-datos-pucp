-- Pregunta 4
CREATE OR REPLACE TRIGGER after_insert_detalle_compra AFTER
    INSERT ON sp_detalle_compra
    FOR EACH ROW
BEGIN
    UPDATE sp_orden_compra
    SET
        subtotal = nvl(subtotal, 0) + nvl(:new.subtotal, 0),
        monto_igv = monto_igv + 0.18 * nvl(:new.subtotal, 0),
        monto_total = monto_total + 1.18 * nvl(:new.subtotal, 0)
    WHERE
        id_orden = :new.id_orden;

END;

-- Test case

SELECT
    *
FROM
    sp_orden_compra
WHERE
    id_orden = 1;

INSERT INTO sp_detalle_compra (
    id_compra,
    id_orden,
    id_insumo,
    cantidad,
    subtotal
) VALUES (
    12,
    1,
    5,
    270.0,
    675
);

SELECT
    *
FROM
    sp_orden_compra
WHERE
    id_orden = 1;