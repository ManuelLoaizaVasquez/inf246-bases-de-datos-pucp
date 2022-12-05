-- Pregunta 4

CREATE OR REPLACE TRIGGER tr_actualiza_saldos AFTER
    INSERT ON pp_transferencia
    FOR EACH ROW
BEGIN
    UPDATE pp_cuenta_bancaria
    SET
        saldo = saldo - :new.monto_transferido
    WHERE
        id_cuenta = :new.cuenta_origen;

    UPDATE pp_cuenta_bancaria
    SET
        saldo = saldo + :new.monto_transferido
    WHERE
        id_cuenta = :new.cuenta_destino;

END;

-- Test cases
SELECT
    id_cuenta,
    numero_cuenta,
    id_cliente,
    saldo
FROM
    pp_cuenta_bancaria
WHERE
    id_cuenta IN ( 12, 13 );

INSERT INTO pp_transferencia VALUES (
    11,
    12,
    13,
    1250,
    'Pago deuda',
    sysdate,
    NULL,
    'P'
);

SELECT
    id_cuenta,
    numero_cuenta,
    id_cliente,
    saldo
FROM
    pp_cuenta_bancaria
WHERE
    id_cuenta IN ( 12, 13 );