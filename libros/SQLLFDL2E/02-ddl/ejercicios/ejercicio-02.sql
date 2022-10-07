-- Segundo ejercicio
CREATE TABLE cr_realizador (
  numero_real INTEGER PRIMARY KEY
);

ALTER TABLE cr_pelicula
ADD numero_real INTEGER;

ALTER TABLE cr_pelicula
ADD CONSTRAINT fk_numero_real FOREIGN KEY (numero_real)
REFERENCES cr_realizador(numero_real);

ALTER TABLE cr_pelicula
MODIFY recaudacion DEFAULT 0;

ALTER TABLE cr_pelicula
MODIFY (titulo NOT NULL);

ALTER TABLE cr_pelicula
MODIFY (id_pais NOT NULL);

ALTER TABLE cr_pelicula
DROP CONSTRAINT fk_numero_real;

