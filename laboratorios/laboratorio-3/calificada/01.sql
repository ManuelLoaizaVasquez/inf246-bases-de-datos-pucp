SET serveroutput ON;

-- Pregunta 1
-- Se solicita desarrollar un subprograma que calcule la cantidad de pedidos
-- registrados para un numero de clientes en un rango de fechas.

CREATE OR REPLACE FUNCTION contar_pedidos_registrados (
    documento_cliente VARCHAR2,
    fecha_inicio      DATE,
    fecha_fin         DATE
) RETURN NUMBER IS
    cantidad_pedidos NUMBER;
BEGIN
    SELECT
        COUNT(p.id_pedido)
    INTO cantidad_pedidos
    FROM
             ce_pedido p
        INNER JOIN ce_cliente c ON c.id_cliente = p.id_cliente
    WHERE
            c.numero_documento = documento_cliente
        AND p.fecha_registro BETWEEN fecha_inicio AND fecha_fin;

    RETURN cantidad_pedidos;
END;

DECLARE
    cantidad_pedidos  NUMBER;
    documento_cliente VARCHAR2(15);
    fecha_inicio      DATE;
    fecha_fin         DATE;
BEGIN
    documento_cliente := '42525748';
    fecha_inicio := TO_DATE ( '15-03-2022', 'dd-mm-yyyy' );
    fecha_fin := TO_DATE ( '15-06-2022', 'dd-mm-yyyy' );
    cantidad_pedidos := contar_pedidos_registrados(documento_cliente, fecha_inicio, fecha_fin);
    dbms_output.put_line('Hay '
                         || cantidad_pedidos
                         || ' para el cliente con documento '
                         || documento_cliente
                         || ' en el rango de '
                         || fecha_inicio
                         || ' al '
                         || fecha_fin);

END;
