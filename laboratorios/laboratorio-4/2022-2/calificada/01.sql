-- Pregunta 1
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sp_recalcular_detalle_compra IS
    CURSOR detalles IS
    SELECT
        id_compra,
        id_insumo,
        cantidad
    FROM
        sp_detalle_compra
    ORDER BY
        1;

    nuevo_subtotal NUMBER;
BEGIN
    -- Para cada detalle de la compra
    FOR detalle IN detalles LOOP
        -- Calculamos el nuevo subtotal
        SELECT
            detalle.cantidad * precio
        INTO nuevo_subtotal
        FROM
            sp_insumo
        WHERE
            id_insumo = detalle.id_insumo;
        
        -- Actualizamos el subtotal
        UPDATE sp_detalle_compra
        SET
            subtotal = nuevo_subtotal
        WHERE
                id_compra = detalle.id_compra
            AND id_insumo = detalle.id_insumo;
        
        -- Mostramos el nuevo subtotal en consola
        dbms_output.put_line('ID_COMPRA: '
                             || detalle.id_compra
                             || ' SUBTOTAL: '
                             || nuevo_subtotal);
    END LOOP;
END;

-- Test case

EXEC SP_RECALCULAR_DETALLE_COMPRA;