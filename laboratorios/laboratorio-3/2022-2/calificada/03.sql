-- Pregunta 3
CREATE OR REPLACE FUNCTION f_total_insumo (
    nombre_producto_in IN sp_producto.nombre%TYPE,
    cantidad_in        IN NUMBER,
    nombre_insumo_in   IN sp_insumo.nombre%TYPE
) RETURN NUMBER IS
    cantidad_insumo_out NUMBER;
BEGIN
    SELECT
        cantidad_in * m.cantidad
    INTO cantidad_insumo_out
    FROM
             sp_matriz_insumo m
        INNER JOIN sp_producto p ON p.id_producto = m.id_producto
        INNER JOIN sp_insumo   i ON i.id_insumo = m.id_insumo
    WHERE
            upper(p.nombre) = upper(nombre_producto_in)
        AND upper(i.nombre) = upper(nombre_insumo_in);

    RETURN cantidad_insumo_out;

EXCEPTION
    WHEN no_data_found THEN
        RETURN 0;
END;

-- Test cases
SELECT
    f_total_insumo('Zapato Caballero Talla 41', 3, 'Cuero nacional')
FROM
    dual;

SELECT
    f_total_insumo('xxZapato Caballero Talla 41', 3, 'Cuero nacional')
FROM
    dual;