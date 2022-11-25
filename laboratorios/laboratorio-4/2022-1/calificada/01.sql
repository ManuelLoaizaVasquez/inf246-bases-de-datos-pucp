-- Pregunta 1
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_recalcular_pedido_detalle IS

    CURSOR detalles IS
    SELECT
        pd.id_pedido_detalle id_pedido_detalle,
        pd.numero_unidades   numero_unidades,
        p.precio             precio
    FROM
             ce_pedido_detalle pd
        INNER JOIN ce_producto p ON p.id_producto = pd.id_producto;

    nuevo_subtotal NUMBER(8, 2);
BEGIN
    FOR detalle IN detalles LOOP
        nuevo_subtotal := detalle.numero_unidades * detalle.precio;
        UPDATE ce_pedido_detalle pd
        SET
            pd.subtotal = nuevo_subtotal
        WHERE
            pd.id_pedido_detalle = detalle.id_pedido_detalle;

        dbms_output.put_line('ID_PEDIDO_DETALLE: '
                             || detalle.id_pedido_detalle
                             || ' SUBTOTAL: '
                             || nuevo_subtotal);
    END LOOP;
END;

-- Test cases

exec sp_recalcular_pedido_detalle;