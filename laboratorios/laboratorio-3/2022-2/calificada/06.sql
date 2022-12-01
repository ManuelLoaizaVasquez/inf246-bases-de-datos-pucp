-- Pregunta 6

-- Retorna un timestamp que representa el siguiente lunes manteniendo la
-- informacion de mayor precision que dia.
-- Por ejemplo, para 11/11/2022 15:42:56 obtendriamos 11/14/2022 15:42:56.
-- En caso el dia ingresado sea lunes, retorna el lunes de la semana siguiente.
CREATE OR REPLACE FUNCTION obtener_siguiente_lunes (
    fecha_in DATE
) RETURN DATE IS
    fecha                 DATE;
    fecha_algun_lunes     DATE := TO_DATE ( '11/14/2022', 'mm/dd/yyyy' );
    clase_equivalencia    NUMBER;
    fecha_siguiente_lunes DATE;
BEGIN
    -- Truncamos la fecha ingresada hasta precision de dias
    fecha := trunc(fecha_in);
    
    -- Hallamos la clase de equivalencia modulo 7
    SELECT
        mod(fecha - fecha_algun_lunes, 7)
    INTO clase_equivalencia
    FROM
        dual;

    -- Aterrizamos las clases en el rango [0, 6]
    IF clase_equivalencia < 0 THEN
        clase_equivalencia := clase_equivalencia + 7;
    END IF;
    
    -- Desfasamos la fecha ingresada
    fecha_siguiente_lunes := fecha_in + ( 7 - clase_equivalencia );
    RETURN fecha_siguiente_lunes;
END;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_crear_orden_replica (
    id_orden_in IN sp_orden_produccion.id_orden%TYPE
) IS

    motivo_orden          sp_orden_produccion.motivo%TYPE;
    fecha_registro_orden  sp_orden_produccion.fecha_registro%TYPE;
    fecha_siguiente_lunes sp_orden_produccion.fecha_autorizacion%TYPE;
    id_nueva_orden        sp_orden_produccion.id_orden%TYPE;
BEGIN
    -- Obtenemos los datos de la orden especificada
    SELECT
        motivo,
        sysdate,
        sp_orden_produccion_seq.NEXTVAL
    INTO
        motivo_orden,
        fecha_registro_orden,
        id_nueva_orden
    FROM
        sp_orden_produccion
    WHERE
        id_orden = id_orden_in;
        
    -- Obtenemos la fecha del siguiente lunes
    fecha_siguiente_lunes := obtener_siguiente_lunes(fecha_registro_orden);
    
    -- Replicamos la orden
    INSERT INTO sp_orden_produccion VALUES (
        id_nueva_orden,
        motivo_orden,
        fecha_registro_orden,
        fecha_siguiente_lunes,
        fecha_siguiente_lunes,
        'A'
    );
    
    -- Replicamos los detalles de la orden
    INSERT INTO sp_detalle_producto
        SELECT
            sp_detalle_producto_seq.NEXTVAL,
            id_nueva_orden,
            id_producto,
            unidades,
            merma
        FROM
            sp_detalle_producto
        WHERE
            id_orden = id_orden_in;
    
    -- Mostramos en pantalla el exito de la replicacion
    dbms_output.put_line('Se creo la nueva orden con ID '
                         || id_nueva_orden
                         || '.');
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No se creo ninguna nueva orden.');
END;

-- Test cases
SELECT
    *
FROM
    sp_orden_produccion;

SELECT
    *
FROM
    sp_detalle_producto;

-- Utilizamos 2 como ID en vez de 1 porque los inserts proporcionados en el
-- laboratorio tienen errores y no crean la orden con ID 1.
BEGIN
    p_crear_orden_replica(2);
END;

SELECT
    *
FROM
    sp_orden_produccion;

SELECT
    *
FROM
    sp_detalle_producto;

BEGIN
    p_crear_orden_replica(100);
END;