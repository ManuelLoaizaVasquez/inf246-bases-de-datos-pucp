-- Pregunta 1
CREATE OR REPLACE FUNCTION f_stock_insumo (
    nombre_in IN sp_insumo.nombre%TYPE
) RETURN sp_insumo.stock%TYPE IS
    stock_out sp_insumo.stock%TYPE;
BEGIN
    SELECT
        stock
    INTO stock_out
    FROM
        sp_insumo
    WHERE
        upper(nombre_in) = upper(nombre);

    RETURN stock_out;
END;

-- Test case
SELECT
    f_stock_insumo('PEGAMENTO')
FROM
    dual;