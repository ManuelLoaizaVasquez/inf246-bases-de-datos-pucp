-- Pregunta 2

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_depurar_pedidos IS
    CURSOR pedidos IS
    SELECT
        id_pedido,
        codigo
    FROM
        ce_pedido;

    n_detalles NUMBER;
BEGIN
    FOR pedido IN pedidos LOOP
        -- Consultamos si el pedido tiene registros
        SELECT
            COUNT(*)
        INTO n_detalles
        FROM
            ce_pedido_detalle pd
        WHERE
            pd.id_pedido = pedido.id_pedido;

        IF n_detalles > 0 THEN
            CONTINUE;
        END IF;
        
        -- En caso no tener registros,
        -- lo etiquetamos como eliminado y lo imprimimos en consola
        UPDATE ce_pedido p
        SET
            p.estado = 'E'
        WHERE
            p.id_pedido = pedido.id_pedido;

        dbms_output.put_line('ID_PEDIDO: '
                             || pedido.id_pedido
                             || ' CODIGO: '
                             || pedido.codigo);

    END LOOP;
END;

-- Test cases

EXEC SP_DEPURAR_PEDIDOS;