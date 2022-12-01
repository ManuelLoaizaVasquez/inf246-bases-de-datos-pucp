-- Pregunta 5
CREATE OR REPLACE FUNCTION f_get_cant_producida (
    nombre_in       IN sp_producto.nombre%TYPE,
    fecha_inicio_in IN DATE,
    fecha_fin_in    IN DATE
) RETURN NUMBER IS
    cantidad_out NUMBER;
BEGIN
    IF
        fecha_inicio_in IS NULL
        AND fecha_fin_in IS NULL
    THEN
        SELECT
            SUM(d.unidades)
        INTO cantidad_out
        FROM
                 sp_detalle_producto d
            INNER JOIN sp_producto         p ON p.id_producto = d.id_producto
            INNER JOIN sp_orden_produccion o ON o.id_orden = d.id_orden
        WHERE
            upper(p.nombre) = upper(nombre_in);

    ELSIF fecha_inicio_in IS NULL THEN
        SELECT
            SUM(d.unidades)
        INTO cantidad_out
        FROM
                 sp_detalle_producto d
            INNER JOIN sp_producto         p ON p.id_producto = d.id_producto
            INNER JOIN sp_orden_produccion o ON o.id_orden = d.id_orden
        WHERE
                o.fecha_registro < fecha_fin_in + 1
            AND upper(p.nombre) = upper(nombre_in);

    ELSIF fecha_fin_in IS NULL THEN
        SELECT
            SUM(d.unidades)
        INTO cantidad_out
        FROM
                 sp_detalle_producto d
            INNER JOIN sp_producto         p ON p.id_producto = d.id_producto
            INNER JOIN sp_orden_produccion o ON o.id_orden = d.id_orden
        WHERE
                fecha_inicio_in <= o.fecha_registro
            AND upper(p.nombre) = upper(nombre_in);

    ELSE
        SELECT
            SUM(d.unidades)
        INTO cantidad_out
        FROM
                 sp_detalle_producto d
            INNER JOIN sp_producto         p ON p.id_producto = d.id_producto
            INNER JOIN sp_orden_produccion o ON o.id_orden = d.id_orden
        WHERE
                fecha_inicio_in <= o.fecha_registro
            AND o.fecha_registro < fecha_fin_in + 1
            AND upper(p.nombre) = upper(nombre_in);

    END IF;

    SELECT
        nvl(cantidad_out, 0)
    INTO cantidad_out
    FROM
        dual;

    RETURN cantidad_out;
END;

SELECT
    f_get_cant_producida('Zapato Caballero Talla 41', TO_DATE('01/08/2022', 'dd/mm/yyyy'), NULL)
FROM
    dual;