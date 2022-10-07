-- Tercer ejercicio
CREATE VIEW v_pelicula AS
SELECT id_pelicula, titulo, genero, recaudacion, sinopsis
FROM cr_pelicula;

DROP VIEW v_pelicula;
