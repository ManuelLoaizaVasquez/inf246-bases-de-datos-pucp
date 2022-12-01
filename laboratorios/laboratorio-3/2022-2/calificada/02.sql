-- Pregunta 2
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_upd_stock_insumos (
    nombre_in   IN sp_insumo.nombre%TYPE,
    cantidad_in IN NUMBER,
    accion_in   IN VARCHAR2
) IS
    delta NUMBER;
BEGIN
    -- Determinamos la cantidad a modificar
    IF upper(accion_in) = 'SUMAR' THEN
        delta := cantidad_in;
    ELSIF upper(accion_in) = 'RESTAR' THEN
        delta := ( -1 ) * cantidad_in;
    ELSE
        raise_application_error(-20111, 'Accion invalida.');
    END IF;
    
    -- Actualizamos el registro solicitado
    UPDATE sp_insumo
    SET
        stock = stock + delta
    WHERE
        upper(nombre) = upper(nombre_in);
    
    -- Mostramos en pantalla si se actualizo o no algun registro
    IF SQL%rowcount = 0 THEN
        dbms_output.put_line('No se realizo ninguna accion.');
    ELSE
        dbms_output.put_line('El stock del insumo '
                             || nombre_in
                             || ' fue actualizado.');
    END IF;

END;

-- Test cases
BEGIN
    p_upd_stock_insumos('PEGAMENTO', 5, 'SUMAR');
END;

BEGIN
    p_upd_stock_insumos('PEGA234', 5, 'RESTAR');
END;