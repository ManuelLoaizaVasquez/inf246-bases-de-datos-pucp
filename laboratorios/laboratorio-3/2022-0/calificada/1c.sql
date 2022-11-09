SET SERVEROUTPUT ON;

-- Pregunta 1 Parte C
CREATE OR REPLACE PROCEDURE pa_actualizar_contrasena (
    usuario             VARCHAR2,
    contrasena          VARCHAR2,
    respuesta_seguridad VARCHAR2,
    nueva_contrasena    VARCHAR2
) IS

    n_usuarios_validos       NUMBER;
    invalid_credentials EXCEPTION;
    tipo_usuario             CHAR(1);
    respuesta_seguridad_real VARCHAR2(100);
    invalid_security_answer EXCEPTION;
BEGIN
    -- Validamos que el usuario con la contrasena existan.
    SELECT
        COUNT(*)
    INTO n_usuarios_validos
    FROM
        sp_usuario u
    WHERE
            u.correo = usuario
        AND u.contrasenha = contrasena;

    IF n_usuarios_validos = 0 THEN
        RAISE invalid_credentials;
    END IF;
    
    -- Verificamos la respuesta de seguridad.
    SELECT
        u.tipo_usuario
    INTO tipo_usuario
    FROM
        sp_usuario u
    WHERE
        u.correo = usuario;

    IF tipo_usuario = 'A' THEN
        SELECT
            u.ap_paterno
        INTO respuesta_seguridad_real
        FROM
            sp_usuario u
        WHERE
            u.correo = usuario;

    ELSIF tipo_usuario = 'E' THEN
        SELECT
            nvl(u.ap_materno, '')
        INTO respuesta_seguridad_real
        FROM
            sp_usuario u
        WHERE
            u.correo = usuario;

    ELSIF tipo_usuario = 'P' THEN
        SELECT
            u.nombre
        INTO respuesta_seguridad_real
        FROM
            sp_usuario u
        WHERE
            u.correo = usuario;

    END IF;

    IF respuesta_seguridad != respuesta_seguridad_real THEN
        RAISE invalid_security_answer;
    END IF;
    
    -- Actualizamos la contrasena.
    UPDATE sp_usuario u
    SET
        u.contrasenha = nueva_contrasena
    WHERE
        u.correo = usuario;

    dbms_output.put_line('Contrasena actualizada.');
EXCEPTION
    WHEN invalid_credentials THEN
        dbms_output.put_line('Usuario o contrasena incorrectos.');
    WHEN invalid_security_answer THEN
        dbms_output.put_line('Respuesta de seguridad incorrecta.');
END;
/

BEGIN
    pa_actualizar_contrasena('rruiz@mail.com', '3dx5rd45fc', 'Renzo', 'ContraNueva');
    pa_actualizar_contrasena('rruiz@mail.com', '3dx5rd45fc', 'Ruiz', 'ContraNueva');
END;
