-- Pregunta 2
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_depurar_ordenes_prd IS
    -- Obtenemos los IDs de todas las ordenes de produccion que no tienen
    -- detalles asociados
    CURSOR ordenes IS
    SELECT
        op.id_orden
    FROM
        sp_orden_produccion op
    WHERE
        (
            SELECT
                COUNT(*)
            FROM
                sp_detalle_producto dp
            WHERE
                dp.id_orden = op.id_orden
        ) = 0;

BEGIN
    -- Para cada orden sin detalle, la eliminaremos logicamente
    FOR orden IN ordenes LOOP
        UPDATE sp_orden_produccion
        SET
            estado = 'E'
        WHERE
            id_orden = orden.id_orden;
        
        -- Mostramos en consola la orden eliminada logicamente
        dbms_output.put_line('ID_ORDEN: '
                             || orden.id_orden
                             || ' ELIMINADO');
    END LOOP;
END;

-- Test case
EXEC SP_DEPURAR_ORDENES_PRD;