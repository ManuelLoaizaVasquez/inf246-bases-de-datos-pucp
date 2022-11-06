SET SERVEROUTPUT ON
-- Pregunta 4
-- Realizar un subprograma que liste el stock de productos asociados
-- a un RUC de proveedor de la forma mostrada.
-- El subprograma debe alertar si el proveedor consultado no existe.

CREATE OR REPLACE PROCEDURE listar_stock_productos (
    ruc_proveedor VARCHAR2
) IS

    CURSOR productos IS
    SELECT
        o.nombre,
        o.stock
    FROM
             ce_producto o
        INNER JOIN ce_proveedor p ON p.id_proveedor = o.id_proveedor
    WHERE
        p.ruc = ruc_proveedor;

    n_proveedores NUMBER;
BEGIN
    -- Determinamos la existencia del proveedor.
    SELECT
        COUNT(p.id_proveedor)
    INTO n_proveedores
    FROM
        ce_proveedor p
    WHERE
        p.ruc = ruc_proveedor;
        
    -- En caso  no exista, terminamos el procedimiento
    IF n_proveedores = 0 THEN
        dbms_output.put_line('El proveedor '
                             || ruc_proveedor
                             || ' no se encuentra registrado en el sistema');
        RETURN;
    END IF;
    
    -- En caso exista, listamos el stock de sus productos
    dbms_output.put_line('Proveedor: ' || ruc_proveedor);
    dbms_output.put_line(rpad('-', 70, '-'));
    dbms_output.put_line(rpad('Articulo', 50, ' ')
                         || rpad('|', 10, ' ')
                         || rpad('Stock', 10, ' '));

    dbms_output.put_line(rpad('-', 70, '-'));
    FOR producto IN productos LOOP
        dbms_output.put_line(rpad(producto.nombre, 50, ' ')
                             || rpad('|', 10, ' ')
                             || rpad(producto.stock, 10, ' '));
    END LOOP;

END;

BEGIN
    -- RUC valido
    listar_stock_productos('20201329255');
    -- RUC invalida
    listar_stock_productos('666777888999');
END;
