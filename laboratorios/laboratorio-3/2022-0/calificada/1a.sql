SET SERVEROUTPUT ON;

-- Pregunta 1 Parte A
CREATE OR REPLACE FUNCTION fn_iniciar_sesion (
    usuario     VARCHAR2,
    contrasenha VARCHAR2
) RETURN NUMBER IS
    n_usuarios_validos  NUMBER;
    n_usuarios_exitosos NUMBER;
    user_not_found EXCEPTION;
    invalid_password EXCEPTION;
BEGIN
    -- Validamos que exista un usuario con el correo especificado
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
    
    -- Validamos que la contraseña sea correcta
    SELECT
        COUNT(*)
    INTO n_usuarios_exitosos
    FROM
        sp_usuario u
    WHERE
            u.correo = usuario
        AND u.contrasenha = contrasenha;

    IF n_usuarios_exitosos = 0 THEN
        RAISE invalid_password;
    END IF;
    dbms_output.put_line('Credenciales correctas.');
    RETURN 1;
EXCEPTION
    WHEN user_not_found THEN
        dbms_output.put_line('El usuario ingresado no existe.');
        RETURN 0;
    WHEN invalid_password THEN
        dbms_output.put_line('La contrasena es incorrecta.');
        RETURN 0;
END;
/
-- Casos de prueba
DECLARE
    exito NUMBER;
BEGIN
    -- Credenciales validas
    exito := fn_iniciar_sesion('rruiz@mail.com', '3dx5rd45fc');
    dbms_output.put_line('Exito: ' || exito);
    
    -- Credenciales invalidas
    exito := fn_iniciar_sesion('mparedes@mail.com', 'fpvBnqqs');
    dbms_output.put_line('Exito: ' || exito);
    
    -- Usuario inexistente
    exito := fn_iniciar_sesion('aho@corasick.automaton', 'eertree');
    dbms_output.put_line('Exito: ' || exito);
END;
