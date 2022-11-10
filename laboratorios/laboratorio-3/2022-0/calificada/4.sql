-- Pregunta 4
CREATE OR REPLACE FUNCTION fn_calendario_frances (
    fecha DATE
) RETURN VARCHAR2 IS
    dia         NUMBER;
    mes         NUMBER;
    mes_frances VARCHAR2(20);
BEGIN
    dia := extract(DAY FROM fecha);
    mes := extract(MONTH FROM fecha);
    IF mes = 9 THEN
        IF dia < 22 THEN
            mes_frances := 'Fructidor';
        ELSE
            mes_frances := 'Vendimiario';
        END IF;
    ELSIF mes = 10 THEN
        IF dia < 22 THEN
            mes_frances := 'Vendimiario';
        ELSE
            mes_frances := 'Brumario';
        END IF;
    ELSIF mes = 11 THEN
        IF dia < 21 THEN
            mes_frances := 'Brumario';
        ELSE
            mes_frances := 'Frimario';
        END IF;
    ELSIF mes = 12 THEN
        IF dia < 21 THEN
            mes_frances := 'Frimario';
        ELSE
            mes_frances := 'Nivoso';
        END IF;
    ELSIF mes = 1 THEN
        IF dia < 20 THEN
            mes_frances := 'Nivoso';
        ELSE
            mes_frances := 'Pluvioso';
        END IF;
    ELSIF mes = 2 THEN
        IF dia < 19 THEN
            mes_frances := 'Pluvioso';
        ELSE
            mes_frances := 'Ventoso';
        END IF;
    ELSIF mes = 3 THEN
        IF dia < 20 THEN
            mes_frances := 'Ventoso';
        ELSE
            mes_frances := 'Germinal';
        END IF;
    ELSIF mes = 4 THEN
        IF dia < 20 THEN
            mes_frances := 'Germinal';
        ELSE
            mes_frances := 'Floreal';
        END IF;
    ELSIF mes = 5 THEN
        IF dia < 20 THEN
            mes_frances := 'Floreal';
        ELSE
            mes_frances := 'Pradial';
        END IF;
    ELSIF mes = 6 THEN
        IF dia < 19 THEN
            mes_frances := 'Pradial';
        ELSE
            mes_frances := 'Mesidor';
        END IF;
    ELSIF mes = 7 THEN
        IF dia < 19 THEN
            mes_frances := 'Mesidor';
        ELSE
            mes_frances := 'Termidor';
        END IF;
    ELSE
        IF dia < 18 THEN
            mes_frances := 'Termidor';
        ELSE
            mes_frances := 'Fructidor';
        END IF;
    END IF;

    RETURN mes_frances;
END;
/

SELECT
    u.ap_paterno
    || decode(u.ap_materno, NULL, '', ' ' || u.ap_materno)
    || ', '
    || u.nombre                        AS "Nombre completo",
    p.fecha_nac                        AS "Fecha de nacimiento",
    fn_calendario_frances(p.fecha_nac) AS "Mes frances"
FROM
         sp_usuario u
    INNER JOIN sp_postulante p ON p.id_usuario = u.id_usuario;
