SET SERVEROUTPUT ON;
-- Pregunta 3
CREATE OR REPLACE PROCEDURE pa_listar_centros (
    usuario VARCHAR2
) IS

    CURSOR centros (
        usuario VARCHAR2
    ) IS
    SELECT
        c.nombre
        || ' '
        || decode(c.tipo_centro, 'C', '(Colegio)', 'P', '(Centro pre-universitario)') AS nombre,
        c.direccion                                                                   AS direccion,
        to_char(c.fecha_inicio, 'dd/mm/yyyy')
        || '-'
        || to_char(c.fecha_fin, 'dd/mm/yyyy')                                         AS rango_estudios,
        c.fecha_fin                                                                   AS fecha_fin
    FROM
             sp_centro c
        INNER JOIN sp_postulante p ON p.id_postulante = c.id_postulante
        INNER JOIN sp_usuario    u ON u.id_usuario = p.id_usuario
    WHERE
        u.correo = usuario
    ORDER BY
        4 DESC;

    usuario_bd VARCHAR2(150);
BEGIN
    -- Validamos que el usuario no exista
    SELECT DISTINCT
        u.correo
    INTO usuario_bd
    FROM
        sp_usuario u
    WHERE
        u.correo = usuario;
    
    -- Imprimimos el reporte
    dbms_output.put_line('REPORTE DE CENTROS DEL POSTULANTE');
    dbms_output.put_line('Centros donde el estudiante estudio:');
    dbms_output.put_line(rpad('-', 70, '-'));
    FOR centro IN centros(usuario) LOOP
        dbms_output.put_line('Nombre: ' || centro.nombre);
        dbms_output.put_line('Direccion: ' || centro.direccion);
        dbms_output.put_line('Rangos de estudio: ' || centro.rango_estudios);
        dbms_output.put_line(rpad('-', 70, '-'));
    END LOOP;

EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Usuario ingresado no existe.');
END;
/

BEGIN
    -- Correo valido
    pa_listar_centros('agutierrez@mail.com');
    -- Correo invalido
    pa_listar_centros('correo@invalido.com');
END;
