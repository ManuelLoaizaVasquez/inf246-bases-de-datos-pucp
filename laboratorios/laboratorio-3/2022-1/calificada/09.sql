-- Pregunta 9
-- Elaborar una funcion que devuelva la marca de producto con mas unidades
-- pedidas en un rango de fechas recibidos como parametros.

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION obtener_nombre_marca_popular (
    fecha_inicio DATE,
    fecha_fin    DATE
) RETURN VARCHAR2 IS
    nombre_marca_popular VARCHAR2(50);
BEGIN
    SELECT
        nombre_marca
    INTO nombre_marca_popular
    FROM
        (
            SELECT
                m.nombre nombre_marca,
                SUM(d.numero_unidades)
            FROM
                     ce_marca_producto m
                INNER JOIN ce_producto       o ON o.id_marca = m.id_marca
                INNER JOIN ce_pedido_detalle d ON d.id_producto = o.id_producto
                INNER JOIN ce_pedido         p ON p.id_pedido = d.id_pedido group by m.nombre
            WHERE
                p.fecha_registro BETWEEN fecha_inicio AND fecha_fin
            GROUP BY
                m.nombre
            ORDER BY
                2 DESC
        )
    WHERE
        ROWNUM <= 1;

    RETURN nombre_marca_popular;
END;
/

DECLARE
    fecha_inicio  DATE := TO_DATE ( '01-01-2022', 'dd-mm-yyyy' );
    fecha_fin     DATE := TO_DATE ( '31-10-2022', 'dd-mm-yyyy' );
    marca_popular VARCHAR2(50);
BEGIN
    marca_popular := obtener_marca_popular(fecha_inicio, fecha_fin);
    dbms_output.put_line('La marca con mas unidades vendidas entre '
                         || fecha_inicio
                         || ' y '
                         || fecha_fin
                         || ' es '
                         || marca_popular
                         || '.');

END;
