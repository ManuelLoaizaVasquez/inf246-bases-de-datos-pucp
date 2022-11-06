-- Pregunta 3
-- Realizar un subprograma que actualice los porcentajes de descuentos activos
-- e indique cuantos descuentos han sido actualizados haciendo uso de un valor
-- ingresado como parametro.

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION actualizar_descuentos (
    nuevo_descuento NUMBER
) RETURN NUMBER IS
    n_descuentos_actualizados NUMBER;
BEGIN
    UPDATE ce_descuento d
    SET
        d.porcentaje = nuevo_descuento
    WHERE
        sysdate BETWEEN d.fecha_inicio AND d.fecha_fin;

    n_descuentos_actualizados := SQL%rowcount;
    RETURN n_descuentos_actualizados;
END;
/

DECLARE
    nuevo_descuento           NUMBER(10, 2) := 0.69;
    n_descuentos_actualizados NUMBER := 0;
BEGIN
    n_descuentos_actualizados := actualizar_descuentos(nuevo_descuento);
    dbms_output.put_line('Descuentos actualizados: ' || n_descuentos_actualizados);
END;
