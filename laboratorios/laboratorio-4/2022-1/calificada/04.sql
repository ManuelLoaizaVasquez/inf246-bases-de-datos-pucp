-- Pregunta 4

CREATE OR REPLACE TRIGGER despues_insertar_detalle AFTER
    INSERT ON ce_pedido_detalle
    FOR EACH ROW
DECLARE
    nuevo_subtotal    NUMBER(8, 2);
    nuevo_monto_igv   NUMBER(8, 2);
    nuevo_monto_total NUMBER(8, 2);
BEGIN
    -- Obtenemos el nuevo subtotal
    SELECT
        p.subtotal + :new.subtotal
    INTO nuevo_subtotal
    FROM
        ce_pedido p
    WHERE
        p.id_pedido = :new.id_pedido;
    
    -- Calculamos los nuevos montos
    nuevo_monto_igv := 0.18 * nuevo_subtotal;
    nuevo_monto_total := 1.18 * nuevo_subtotal;
    
    -- Actualizamos los datos en la tabla CE_PEDIDO
    UPDATE ce_pedido p
    SET
        p.subtotal = nuevo_subtotal,
        p.monto_igv = nuevo_monto_igv,
        p.monto_total = nuevo_monto_total
    WHERE
        p.id_pedido = :new.id_pedido;

END;

-- Test cases

SELECT
    *
FROM
    ce_pedido
WHERE
    id_pedido = 1;

INSERT INTO ce_pedido_detalle (
    id_pedido_detalle,
    id_pedido,
    id_producto,
    numero_unidades,
    subtotal,
    estado
) VALUES (
    3,
    1,
    4,
    1,
    2500,
    'A'
);

SELECT
    *
FROM
    ce_pedido
WHERE
    id_pedido = 1;