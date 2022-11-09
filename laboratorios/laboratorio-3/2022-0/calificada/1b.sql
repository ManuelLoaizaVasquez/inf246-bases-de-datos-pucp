SET SERVEROUTPUT ON;

-- Pregunta 1 Parte B
CREATE OR REPLACE FUNCTION fn_recuperar_contrasena (
    usuario   VARCHAR2,
    respuesta VARCHAR2
) RETURN VARCHAR2 IS

    contrasena          VARCHAR2(150);
    invalid_answer EXCEPTION;
    n_usuarios_validos  NUMBER;
    user_not_found EXCEPTION;
    tipo_usuario        CHAR(1);
    respuesta_seguridad VARCHAR2(100);
BEGIN
    -- Validamos que el usuario exista
    SELECT
        COUNT(*)
    INTO n_usuarios_validos
    FROM
        sp_usuario u
    WHERE
        u.correo = usuario;

    IF n_usuarios_validos = 0 THEN
        RAISE user_not_found;
    END IF;
    
    -- Obtenemos el tipo de usuario
    SELECT
        u.tipo_usuario
    INTO tipo_usuario
    FROM
        sp_usuario u
    WHERE
        u.correo = usuario;
    
    -- Obtenemos la respuesta de seguridad del usuario
    IF tipo_usuario = 'A' THEN
        SELECT
            u.ap_paterno
        INTO respuesta_seguridad
        FROM
            sp_usuario u
        WHERE
            u.correo = usuario;

    ELSIF tipo_usuario = 'E' THEN
        SELECT
            nvl(u.ap_materno, '')
        INTO respuesta_seguridad
        FROM
            sp_usuario u
        WHERE
            u.correo = usuario;

    ELSIF tipo_usuario = 'P' THEN
        SELECT
            u.nombre
        INTO respuesta_seguridad
        FROM
            sp_usuario u
        WHERE
            u.correo = usuario;

    END IF;

    IF respuesta = respuesta_seguridad THEN
        dbms_output.put_line('Respuesta de seguridad correcta.');
        SELECT
            u.contrasenha
        INTO contrasena
        FROM
            sp_usuario u
        WHERE
            u.correo = usuario;

        RETURN contrasena;
    END IF;

    RAISE invalid_answer;
EXCEPTION
    WHEN user_not_found THEN
        dbms_output.put_line('El usuario no existe');
        RETURN '';
    WHEN invalid_answer THEN
        dbms_output.put_line('Respuesta de seguridad incorrecta.');
        RETURN '';
END;
/

DECLARE
    contrasena VARCHAR2(150);
BEGIN
    -- Respuestas de seguridad correctas.
    contrasena := fn_recuperar_contrasena('rruiz@mail.com', 'Ruiz');
    dbms_output.put_line('Contrasena: ' || contrasena);
    contrasena := fn_recuperar_contrasena('scarpio@mail.com', 'Caceres');
    dbms_output.put_line('Contrasena: ' || contrasena);
    contrasena := fn_recuperar_contrasena('carrasco@mail.com', 'Carlos');
    dbms_output.put_line('Contrasena: ' || contrasena);
    
    -- Respuestas de seguridad incorrectas.
    contrasena := fn_recuperar_contrasena('carrasco@mail.com', 'Cardenas');
END;
