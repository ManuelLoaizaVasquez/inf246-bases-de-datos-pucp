-- 8.1 La clave primaria
CREATE TABLE cr_dormitorio(
  id_habitacion INTEGER PRIMARY KEY,
  id_hotel INTEGER,
  id_tipo_habitacion INTEGER,
  numero VARCHAR2(6),
  comentario VARCHAR2(400)
);


CREATE TABLE cr_dormitorio(
  id_habitacion INTEGER,
  id_hotel INTEGER,
  id_tipo_habitacion INTEGER,
  numero VARCHAR2(6),
  comentario VARCHAR2(400),
  CONSTRAINT pk_cr_dormitorio PRIMARY KEY(id_hotel, numero)
);

ALTER TABLE cr_dormitorio
ADD CONSTRAINT pk_cr_dormitorio PRIMARY KEY(id_hotel, numero);

