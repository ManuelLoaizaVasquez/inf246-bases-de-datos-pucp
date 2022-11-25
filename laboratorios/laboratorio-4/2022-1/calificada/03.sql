-- Pregunta 3

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_recalcular_pedido IS

    CURSOR pedidos IS
    SELECT
        p.id_pedido,
        p.codigo,
        nvl(SUM(pd.subtotal),
            0) AS subtotal
    FROM
        ce_pedido         p
        LEFT JOIN ce_pedido_detalle pd ON pd.id_pedido = p.id_pedido
    GROUP BY
        p.id_pedido,
        p.codigo;

    nuevo_monto_igv   NUMBER(8, 2);
    nuevo_monto_total NUMBER(8, 2);
BEGIN
    FOR pedido IN pedidos LOOP
        nuevo_monto_igv := 0.18 * pedido.subtotal;
        nuevo_monto_total := 1.18 * pedido.subtotal;
        UPDATE ce_pedido p
        SET
            p.subtotal = pedido.subtotal,
            p.monto_igv = nuevo_monto_igv,
            p.monto_total = nuevo_monto_total
        WHERE
            p.id_pedido = pedido.id_pedido;

        dbms_output.put_line('ID_PEDIDO: '
                             || pedido.id_pedido
                             || ' CODIGO: '
                             || pedido.codigo
                             || ' SUBTOTAL: '
                             || pedido.subtotal
                             || ' MONTO_IGV: '
                             || nuevo_monto_igv
                             || ' MONTO_TOTAL: '
                             || nuevo_monto_total);

    END LOOP;
END;

-- Test cases

EXEC SP_RECALCULAR_PEDIDO;