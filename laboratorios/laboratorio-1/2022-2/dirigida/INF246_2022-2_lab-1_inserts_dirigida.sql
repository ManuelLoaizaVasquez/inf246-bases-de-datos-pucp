/* EMPLEADOS */
INSERT INTO empleados VALUES (
    '12345',
    'Jose',
    'Merc�',
    'L�pez',
    '1500',
    'C/Sol, 1',
    'C/ Otra, 1',
    'C�diz',
    '11000',
    'H',
    '5/01/74',
    'C�diz'
);

INSERT INTO empleados VALUES (
    '22222',
    'Mar�a',
    'Rosal',
    'C�zar',
    '2000',
    '',
    '',
    'Ubrique',
    '11600',
    'M',
    '',
    ''
);

INSERT INTO empleados VALUES (
    '33333',
    'Pilar',
    'P�rez',
    'Roll�n',
    '1000',
    '',
    '',
    'C�diz',
    '11600',
    'M',
    '2/8/73',
    'C�diz'
);
/* DEPARTAMENTOS */
INSERT INTO departamentos VALUES (
    '001',
    'INFORM�TICA',
    '33333',
    80000,
    50000
);
/* UNIVERSIDADES */
INSERT INTO universidades VALUES (
    '0001',
    'UNED',
    'MADRID',
    'M',
    '41420'
);

INSERT INTO universidades VALUES (
    '0002',
    'SEVILLA',
    'SEVILLA',
    '',
    '55555'
);

INSERT INTO universidades VALUES (
    '0003',
    'C�DIZ',
    'C�DIZ',
    '',
    '11000'
);
/* ESTUDIOS */
INSERT INTO estudios VALUES (
    '12345',
    '0001',
    '1992',
    'MED',
    'ADMINISTRATIVO'
);

INSERT INTO estudios VALUES (
    '22222',
    '0001',
    '1998',
    'SUP',
    'ING INFORM�TICA'
);

INSERT INTO estudios VALUES (
    '33333',
    '0002',
    '1997',
    'SUP',
    'LIC INFORM�TICA'
);
/* HISTORIAL SALARIAL */
INSERT INTO historial_salarial VALUES (
    '12345',
    950,
    '5/01/2003',
    ''
);

INSERT INTO historial_salarial VALUES (
    '22222',
    1000,
    '3/11/2004',
    '3/11/2005'
);

INSERT INTO historial_salarial VALUES (
    '22222',
    1500,
    '3/11/2005',
    ''
);

INSERT INTO historial_salarial VALUES (
    '33333',
    1600,
    '15/01/2001',
    ''
);
/* HISTORIAL LABORAL */
INSERT INTO historial_laboral VALUES (
    '12345',
    '001',
    '5/01/2003',
    '',
    '0001',
    '33333'
);

INSERT INTO historial_laboral VALUES (
    '22222',
    '003',
    '3/11/2004',
    '3/11/2005',
    '001',
    '33333'
);

INSERT INTO historial_laboral VALUES (
    '22222',
    '003',
    '3/11/2005',
    '',
    '001',
    '33333'
);

INSERT INTO historial_laboral VALUES (
    '33333',
    '004',
    '15/01/2001',
    '',
    '001',
    '33333'
);