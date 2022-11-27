-- Pregunta 3
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_recalcular_orden_compra IS

    CURSOR ordenes IS
    SELECT
        oc.id_orden              AS id_orden,
        SUM(nvl(dc.subtotal, 0)) AS subtotal_orden
    FROM
             sp_orden_compra oc
        INNER JOIN sp_detalle_compra dc ON dc.id_orden = oc.id_orden
    GROUP BY
        oc.id_orden
    ORDER BY
        1 ASC;

    nuevo_monto_igv   NUMBER;
    nuevo_monto_total NUMBER;
BEGIN
    -- Por cada orden de compra
    FOR orden IN ordenes LOOP
        -- Calculamos los nuevos montos
        nuevo_monto_igv := 0.18 * orden.subtotal_orden;
        nuevo_monto_total := 1.18 * orden.subtotal_orden;
        
        -- Actualizamos los nuevos montos
        UPDATE sp_orden_compra
        SET
            subtotal = orden.subtotal_orden,
            monto_total = nuevo_monto_total,
            monto_igv = nuevo_monto_igv
        WHERE
            id_orden = orden.id_orden;
        
        -- Mostramos en consola los montos asociados a la orden actualizada
        dbms_output.put_line('ID_ORDEN: '
                             || orden.id_orden
                             || ' SUBTOTAL: '
                             || orden.subtotal_orden
                             || ' MONTO_IGV: '
                             || nuevo_monto_igv
                             || ' MONTO_TOTAL: '
                             || nuevo_monto_total);

    END LOOP;
END;

-- Test case
EXEC SP_RECALCULAR_ORDEN_COMPRA;