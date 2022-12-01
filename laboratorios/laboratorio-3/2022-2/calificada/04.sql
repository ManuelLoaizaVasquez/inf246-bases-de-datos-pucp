-- Pregunta 4
CREATE OR REPLACE FUNCTION f_top_insumo (
    fecha_inicio_in DATE,
    fecha_fin_in    DATE
) RETURN NUMBER IS
    max_consumo_out NUMBER;
BEGIN
    IF
        fecha_inicio_in IS NULL
        AND fecha_fin_in IS NULL
    THEN
        SELECT
            MAX(suma)
        INTO max_consumo_out
        FROM
            (
                SELECT
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion,
                    SUM(oc.monto_total) AS suma
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
            );

    ELSIF fecha_inicio_in IS NULL THEN
        SELECT
            MAX(suma)
        INTO max_consumo_out
        FROM
            (
                SELECT
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion,
                    SUM(oc.monto_total) AS suma
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                WHERE
                    oc.fecha_registro < fecha_fin_in + 1
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
            );

    ELSIF fecha_fin_in IS NULL THEN
        SELECT
            MAX(suma)
        INTO max_consumo_out
        FROM
            (
                SELECT
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion,
                    SUM(oc.monto_total) AS suma
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                WHERE
                    fecha_inicio_in <= oc.fecha_registro
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
            );

    ELSE
        SELECT
            MAX(suma)
        INTO max_consumo_out
        FROM
            (
                SELECT
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion,
                    SUM(oc.monto_total) AS suma
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                WHERE
                        fecha_inicio_in <= oc.fecha_registro
                    AND oc.fecha_registro < fecha_fin_in + 1
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
            );

    END IF;

    RETURN max_consumo_out;
EXCEPTION
    WHEN no_data_found THEN
        RETURN -1;
END;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p_top_insumo (
    fecha_inicio_in DATE,
    fecha_fin_in    DATE
) IS

    nombre_insumo_out sp_insumo.nombre%TYPE;
    tipo_insumo_out   sp_insumo.tipo_material%TYPE;
    nombre_unidad_out sp_unidad_divisoria.nombre%TYPE;
    dimension_out     sp_dimension.denominacion%TYPE;
    max_consumo       NUMBER;
BEGIN
    -- Calculamos el maximo consumo en el rango de fechas especificado
    max_consumo := f_top_insumo(fecha_inicio_in, fecha_fin_in);
    
    -- Si este no tiene sentido, no mostraremos ningun reporte
    IF max_consumo = -1 THEN
        dbms_output.put_line('No hay datos entre las fechas especificadas.');
        RETURN;
    END IF;
    
    -- En otro caso, obtendremos los valores respectivos para mostrar el reporte
    IF
        fecha_inicio_in IS NULL
        AND fecha_fin_in IS NULL
    THEN
        SELECT
            nombre_insumo_inner,
            tipo_material_inner,
            nombre_unidad_inner,
            denominacion_inner
        INTO
            nombre_insumo_out,
            tipo_insumo_out,
            nombre_unidad_out,
            dimension_out
        FROM
            (
                SELECT
                    i.nombre        AS nombre_insumo_inner,
                    i.tipo_material AS tipo_material_inner,
                    u.nombre        AS nombre_unidad_inner,
                    d.denominacion  AS denominacion_inner
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
                HAVING
                    SUM(oc.monto_total) = max_consumo
            )
        WHERE
            ROWNUM <= 1;

    ELSIF fecha_inicio_in IS NULL THEN
        SELECT
            nombre_insumo_inner,
            tipo_material_inner,
            nombre_unidad_inner,
            denominacion_inner
        INTO
            nombre_insumo_out,
            tipo_insumo_out,
            nombre_unidad_out,
            dimension_out
        FROM
            (
                SELECT
                    i.nombre        AS nombre_insumo_inner,
                    i.tipo_material AS tipo_material_inner,
                    u.nombre        AS nombre_unidad_inner,
                    d.denominacion  AS denominacion_inner
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                WHERE
                    oc.fecha_registro < fecha_fin_in + 1
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
                HAVING
                    SUM(oc.monto_total) = max_consumo
            )
        WHERE
            ROWNUM <= 1;

    ELSIF fecha_fin_in IS NULL THEN
        SELECT
            nombre_insumo_inner,
            tipo_material_inner,
            nombre_unidad_inner,
            denominacion_inner
        INTO
            nombre_insumo_out,
            tipo_insumo_out,
            nombre_unidad_out,
            dimension_out
        FROM
            (
                SELECT
                    i.nombre        AS nombre_insumo_inner,
                    i.tipo_material AS tipo_material_inner,
                    u.nombre        AS nombre_unidad_inner,
                    d.denominacion  AS denominacion_inner
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                WHERE
                    fecha_inicio_in <= oc.fecha_registro
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
                HAVING
                    SUM(oc.monto_total) = max_consumo
            )
        WHERE
            ROWNUM <= 1;

    ELSE
        SELECT
            nombre_insumo_inner,
            tipo_material_inner,
            nombre_unidad_inner,
            denominacion_inner
        INTO
            nombre_insumo_out,
            tipo_insumo_out,
            nombre_unidad_out,
            dimension_out
        FROM
            (
                SELECT
                    i.nombre        AS nombre_insumo_inner,
                    i.tipo_material AS tipo_material_inner,
                    u.nombre        AS nombre_unidad_inner,
                    d.denominacion  AS denominacion_inner
                FROM
                         sp_insumo i
                    INNER JOIN sp_detalle_compra   dc ON dc.id_insumo = i.id_insumo
                    INNER JOIN sp_orden_compra     oc ON oc.id_orden = dc.id_orden
                    INNER JOIN sp_unidad_divisoria u ON u.id_unidad = i.id_unidad
                    INNER JOIN sp_dimension        d ON d.id_dimension = u.id_dimension
                WHERE
                        fecha_inicio_in <= oc.fecha_registro
                    AND oc.fecha_registro < fecha_fin_in + 1
                GROUP BY
                    i.nombre,
                    i.tipo_material,
                    u.nombre,
                    d.denominacion
                HAVING
                    SUM(oc.monto_total) = max_consumo
            )
        WHERE
            ROWNUM <= 1;

    END IF;

    -- Mostramos el reporte en pantalla
    dbms_output.put_line('El insumo mas comprado ha sido '
                         || nombre_insumo_out
                         || ' del tipo '
                         || tipo_insumo_out);
    dbms_output.put_line('Unidad divisoria: ' || nombre_unidad_out);
    dbms_output.put_line('Dimension: ' || dimension_out);
END;

BEGIN
    p_top_insumo(TO_DATE('01/07/2022', 'DD/MM/YYYY'), TO_DATE('31/07/2022', 'DD/MM/YYYY'));
END;