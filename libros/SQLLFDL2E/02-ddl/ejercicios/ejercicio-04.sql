-- Cuarto ejercicio
CREATE SEQUENCE s_id_pelicula
START WITH 12
INCREMENT BY 1
MAXVALUE 9999;

RENAME cr_pelicula TO cr_backup_pelicula;

CREATE TABLE cr_pelicula AS
SELECT * FROM cr_backup_pelicula;

DROP TABLE cr_pelicula;
DROP TABLE cr_backup_pelicula;

