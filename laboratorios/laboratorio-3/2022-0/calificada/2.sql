SET SERVEROUTPUT ON;
-- Pregunta 2
CREATE OR REPLACE PROCEDURE pa_reporte_banco (
    nombre_banco VARCHAR2
) IS
    nombre_banco_bd VARCHAR2(100);
    CURSOR pagos (
        nombre_banco VARCHAR2
    ) IS
    SELECT
        upper(u.ap_paterno)
        || decode(u.ap_materno, NULL, '', ' ' || upper(u.ap_materno))
        || ', '
        || u.nombre  AS nombre,
        p.monto      AS monto,
        p.fecha_pago AS fecha
    FROM
             sp_pago p
        INNER JOIN sp_cuenta     c ON c.id_cuenta = p.id_cuenta
        INNER JOIN sp_postulante o ON o.id_postulante = p.id_postulante
        INNER JOIN sp_usuario    u ON u.id_usuario = o.id_usuario
    WHERE
            c.banco = nombre_banco
        AND p.estado = 'R'
    ORDER BY
        3 DESC;

    bank_not_found EXCEPTION;
BEGIN
    -- Validamos que el banco exista.
    SELECT DISTINCT c.banco INTO nombre_banco_bd
    FROM
        sp_cuenta c
    WHERE
        c.banco = nombre_banco;
    
    -- Imprimos el reporte.
    dbms_output.put_line(rpad('-', 70, '-'));
    dbms_output.put_line('REPORTE DEL BANCO ' || nombre_banco);
    dbms_output.put_line(rpad('-', 70, '-'));
    FOR pago IN pagos(nombre_banco) LOOP
        dbms_output.put_line('Nombre: ' || pago.nombre);
        dbms_output.put_line('Monto: S/. ' || pago.monto);
        dbms_output.put_line('Fecha: ' || pago.fecha);
        dbms_output.put_line(rpad('-', 70, '-'));
    END LOOP;

EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('El banco ingresado no existe.');
END;
/

BEGIN
    pa_reporte_banco('Mibanco');
    pa_reporte_banco('BancoNoExistente');
END;
