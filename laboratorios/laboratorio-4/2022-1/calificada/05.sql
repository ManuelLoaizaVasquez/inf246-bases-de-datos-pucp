-- Pregunta 5

CREATE OR REPLACE TRIGGER despues_actualizar_precio AFTER
    UPDATE OF precio ON ce_producto
    FOR EACH ROW
BEGIN
    UPDATE ce_pedido_detalle pd
    SET
        pd.subtotal = pd.numero_unidades * :new.precio
    WHERE
        pd.id_producto = :new.id_producto;

END;

-- Test cases
SELECT
    id_pedido_detalle,
    subtotal
FROM
    ce_pedido_detalle
WHERE
    id_producto = 4;

UPDATE ce_producto
SET
    precio = 2000
WHERE
    id_producto = 4;

SELECT
    id_pedido_detalle,
    subtotal
FROM
    ce_pedido_detalle
WHERE
    id_producto = 4;