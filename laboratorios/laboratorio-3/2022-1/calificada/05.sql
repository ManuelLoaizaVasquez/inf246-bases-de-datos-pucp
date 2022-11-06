SET SERVEROUTPUT ON
-- Pregunta 5
-- Se desea un subprograma que reciba parte del nombre o apellidos de un cliente
-- y liste el historial de pedidos en orden descendente en base a la
-- fecha de entrega.
CREATE OR REPLACE PROCEDURE listar_historial_pedidos (
    patron VARCHAR2
) IS

    CURSOR clientes IS
    SELECT
        c.nombres
        || ' '
        || c.apellido_paterno
        || ' '
        || c.apellido_materno
        || ' ('
        || c.numero_documento
        || ')'       datos,
        c.id_cliente id
    FROM
        ce_cliente c
    WHERE
        upper(c.nombres) LIKE upper('%'
                                    || patron
                                    || '%')
        OR upper(c.apellido_paterno) LIKE upper('%'
                                                || patron
                                                || '%')
        OR upper(c.apellido_materno) LIKE upper('%'
                                                || patron
                                                || '%');

    CURSOR pedidos_cliente (
        id_cliente NUMBER
    ) IS
    SELECT
        p.codigo               codigo,
        p.monto_total          monto_total,
        trunc(p.fecha_entrega) fecha_entrega
    FROM
        ce_pedido p
    WHERE
        p.id_cliente = id_cliente
    ORDER BY
        p.fecha_entrega DESC;

BEGIN
    dbms_output.put_line('Parametro: ' || patron);
    FOR cliente IN clientes LOOP
        dbms_output.put_line(rpad('-', 70, '-'));
        dbms_output.put_line('Cliente: ' || cliente.datos);
        dbms_output.put_line(rpad('-', 70, '-'));
        dbms_output.put_line(rpad('Codigo pedido', 30, ' ')
                             || rpad('|', 5, ' ')
                             || rpad('Monto total', 15, ' ')
                             || rpad('|', 5, ' ')
                             || rpad('Fecha entrega', 15, ' '));

        dbms_output.put_line(rpad('-', 70, '-'));
        FOR pedido IN pedidos_cliente(cliente.id) LOOP
            dbms_output.put_line(rpad(pedido.codigo, 30, ' ')
                                 || rpad('|', 5, ' ')
                                 || rpad(pedido.monto_total, 15, ' ')
                                 || rpad('|', 5, ' ')
                                 || rpad(pedido.fecha_entrega, 15, ' '));
        END LOOP;

        dbms_output.put_line(rpad('-', 70, '-'));
    END LOOP;

END;

BEGIN
    listar_historial_pedidos('e');
END;
