-- Pregunta 8.
-- Elaborar un subprograma que devuelva el menor y mayor monto de pedido
-- realizado por un numero de documento de cliente.

SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION obtener_menor_monto (
    numero_documento VARCHAR2
) RETURN NUMBER IS
    menor_monto NUMBER(8, 2);
BEGIN
    SELECT
        MIN(p.monto_total)
    INTO menor_monto
    FROM
             ce_pedido p
        INNER JOIN ce_cliente c ON c.id_cliente = p.id_cliente
    WHERE
        c.numero_documento = numero_documento;

    RETURN menor_monto;
END;
/

CREATE OR REPLACE FUNCTION obtener_mayor_monto (
    numero_documento VARCHAR2
) RETURN NUMBER IS
    mayor_monto NUMBER(8, 2);
BEGIN
    SELECT
        MAX(p.monto_total)
    INTO mayor_monto
    FROM
             ce_pedido p
        INNER JOIN ce_cliente c ON c.id_cliente = p.id_cliente
    WHERE
        c.numero_documento = numero_documento;

    RETURN mayor_monto;
END;
/

DECLARE
    menor_monto      NUMBER(8, 2);
    mayor_monto      NUMBER(8, 2);
    numero_documento VARCHAR2(15) := '42525748';
BEGIN
    menor_monto := obtener_menor_monto(numero_documento);
    mayor_monto := obtener_mayor_monto(numero_documento);
    dbms_output.put_line('El cliente '
                         || numero_documento
                         || ' ha realizado pedidos en el rango de '
                         || menor_monto
                         || ' al '
                         || mayor_monto
                         || ' soles.');

END;
