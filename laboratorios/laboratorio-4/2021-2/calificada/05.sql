CREATE OR REPLACE TRIGGER tr_actualiza_estados AFTER
    INSERT OR UPDATE OR DELETE ON pp_transferencia
    FOR EACH ROW
DECLARE
    nuevo_id_estado NUMBER;
BEGIN
    -- Obtenemos el nuevo ID
    SELECT
        nvl(MAX(id_estado_transferencia),
            0) + 1
    INTO nuevo_id_estado
    FROM
        pp_estado_transferencia;
    
    -- Si se registra una transferencia
    IF inserting THEN
        IF :new.fecha_confirmacion IS NULL THEN
            -- Regla 1: transferencia en proceso
            INSERT INTO pp_estado_transferencia VALUES (
                nuevo_id_estado,
                :new.id_transferencia,
                'Transferencia en proceso',
                sysdate,
                NULL,
                'P'
            );

        ELSE
            -- Regla 2: transferencia confirmada
            INSERT INTO pp_estado_transferencia VALUES (
                nuevo_id_estado,
                :new.id_transferencia,
                'Transferencia confirmada',
                sysdate,
                'P',
                'C'
            );

        END IF;

    ELSIF updating('FECHA_CONFIRMACION') THEN
        IF
            :old.fecha_confirmacion IS NULL
            AND :new.fecha_confirmacion IS NOT NULL
        THEN
            -- Regla 3:  transferencia confirmada
            INSERT INTO pp_estado_transferencia VALUES (
                nuevo_id_estado,
                :new.id_transferencia,
                'Transferencia confirmada',
                sysdate,
                'P',
                'C'
            );

        END IF;
    ELSIF deleting THEN
        -- Regla 4: transferencia anulada
        INSERT INTO pp_estado_transferencia VALUES (
            nuevo_id_estado,
            :old.id_transferencia,
            'Transferencia anulada',
            sysdate,
            'C',
            'A'
        );

    END IF;

END;

-- Test cases

-- Regla 1

INSERT INTO pp_transferencia VALUES (
    12,
    12,
    13,
    150,
    'Compras del mes',
    sysdate,
    NULL,
    'P'
);

SELECT
    *
FROM
    pp_estado_transferencia;

-- Regla 2

INSERT INTO pp_transferencia VALUES (
    13,
    13,
    12,
    150,
    'Devoluci?n compras',
    TO_DATE('28/11/2021', 'DD/MM/YYYY'),
    sysdate,
    'C'
);

SELECT
    *
FROM
    pp_estado_transferencia;

-- Regla 3

UPDATE pp_transferencia
SET
    fecha_confirmacion = sysdate
WHERE
    id_transferencia = 12;

SELECT
    *
FROM
    pp_estado_transferencia;

UPDATE pp_transferencia
SET
    fecha_confirmacion = sysdate
WHERE
    id_transferencia = 13;

SELECT
    *
FROM
    pp_estado_transferencia;

-- Regla 4

DELETE FROM pp_transferencia
WHERE
    id_transferencia = 13;

SELECT
    *
FROM
    pp_estado_transferencia;