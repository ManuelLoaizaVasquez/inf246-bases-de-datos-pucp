SET SERVEROUTPUT ON

-- Pregunta 2
-- Realizar un subprograma que en base a un nombre de un producto
-- muestre la informacion del proveedor asociado en el formato especificado.

CREATE OR REPLACE PROCEDURE mostrar_informacion_proveedor (
    nombre_producto VARCHAR2
) IS

    razon_social_proveedor VARCHAR2(100);
    ruc_proveedor          VARCHAR2(11);
    telefono_proveedor     VARCHAR2(15);
    correo_proveedor       VARCHAR2(50);
BEGIN
    SELECT
        p.razon_social,
        p.ruc,
        p.numero_telefono,
        p.correo_electronico
    INTO
        razon_social_proveedor,
        ruc_proveedor,
        telefono_proveedor,
        correo_proveedor
    FROM
             ce_proveedor p
        INNER JOIN ce_producto o ON p.id_proveedor = o.id_proveedor
    WHERE
        o.nombre = nombre_producto;

    dbms_output.put_line('Articulo: ' || nombre_producto);
    dbms_output.put_line('--------------------------------');
    dbms_output.put_line('Proveedor: '
                         || razon_social_proveedor
                         || '('
                         || ruc_proveedor
                         || ')');

    dbms_output.put_line('Telefono: ' || telefono_proveedor);
    dbms_output.put_line('Correo electronico: ' || correo_proveedor);
END;

DECLARE
    nombre_producto VARCHAR2(50) := 'CELULAR GALAXY Z FOLD2';
BEGIN
    mostrar_informacion_proveedor(nombre_producto);
END;
