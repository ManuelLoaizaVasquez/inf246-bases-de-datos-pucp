-- Pregunta 5
CREATE OR REPLACE TRIGGER after_update_insumo AFTER
    UPDATE OF precio ON sp_insumo
    FOR EACH ROW
BEGIN
    UPDATE sp_detalle_compra
    SET
        subtotal = cantidad * :new.precio
    WHERE
        id_insumo = :new.id_insumo;

END;

-- Test case
SELECT
    id_compra,
    subtotal
FROM
    sp_detalle_compra
WHERE
    id_insumo = 1;

UPDATE sp_insumo
SET
    precio = 1.13
WHERE
    id_insumo = 1;

SELECT
    id_compra,
    subtotal
FROM
    sp_detalle_compra
WHERE
    id_insumo = 1;