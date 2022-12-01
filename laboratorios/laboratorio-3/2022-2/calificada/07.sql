-- Pregunta 7
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_actualiza_mermas (
    id_orden_in   IN sp_detalle_producto.id_orden%TYPE,
    porcentaje_in IN NUMBER
) IS
BEGIN
    UPDATE sp_detalle_producto
    SET
        merma = porcentaje_in * unidades / 100
    WHERE
        id_orden = id_orden_in;

    IF SQL%rowcount > 0 THEN
        dbms_output.put_line('El valor de la merma fue actualizado');
    END IF;
END;

-- Test case
BEGIN
    p_actualiza_mermas(3, 10);
END;