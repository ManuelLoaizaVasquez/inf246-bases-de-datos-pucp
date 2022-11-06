SET SERVEROUTPUT ON
-- Pregunta 6
-- Se desea un subprograma que devuelva la cantidad de unidades compradas de un
-- articulo por un cliente particular.
CREATE OR REPLACE FUNCTION contar_unidades_compradas (
    numero_documento_cliente VARCHAR2,
    nombre_producto          VARCHAR2
) RETURN NUMBER AS
    unidades_compradas NUMBER;
BEGIN
    SELECT
        d.numero_unidades
    INTO unidades_compradas
    FROM
             ce_pedido_detalle d
        INNER JOIN ce_producto o ON o.id_producto = d.id_producto
        INNER JOIN ce_pedido   p ON p.id_pedido = d.id_pedido
        INNER JOIN ce_cliente  c ON c.id_cliente = p.id_cliente
    WHERE
            c.numero_documento = numero_documento_cliente
        AND o.nombre = nombre_producto;

    RETURN unidades_compradas;
END;

DECLARE
    numero_documento_cliente VARCHAR2(15) := '42525748';
    nombre_producto          VARCHAR2(50) := 'CELULAR SAMSUNG GALAXY S20';
    unidades_compradas       NUMBER;
BEGIN
    unidades_compradas := contar_unidades_compradas(numero_documento_cliente, nombre_producto);
    dbms_output.put_line('El cliente '
                         || numero_documento_cliente
                         || ' ha comprado '
                         || unidades_compradas
                         || ' unidades de '
                         || nombre_producto);

END;
