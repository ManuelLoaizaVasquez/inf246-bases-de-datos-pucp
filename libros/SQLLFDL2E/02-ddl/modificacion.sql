-- 4.1 El comando ALTER
ALTER TABLE cr_habitacion
ADD numero_telefonico NUMBER(38, 0);

ALTER TABLE cr_habitacion
DROP COLUMN numero_telefonico;

-- 4.2 Renombrar una tabla
RENAME cr_habitacion
TO cr_dormitorio;
