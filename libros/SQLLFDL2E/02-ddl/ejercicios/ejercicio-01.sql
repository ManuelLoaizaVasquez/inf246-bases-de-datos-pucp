-- Primer ejercicio
CREATE TABLE cr_pelicula (
  id_pelicular INTEGER PRIMARY KEY,
  titulo VARCHAR2(100),
  genero VARCHAR2(100),
  sinopsis VARCHAR2(1000),
  cantidad_entradas INTEGER,
  recaudacion NUMBER(38, 2),
  fecha_estreno DATE,
  fecha_alta TIMESTAMP,
  id_pais INTEGER
);

CREATE INDEX i_genero_pais ON cr_pelicula (genero, id_pais);

