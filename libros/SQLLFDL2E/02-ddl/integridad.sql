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

ALTER TABLE cr_tipo_habitacion
ADD CONSTRAINT pk_cr_tipo_habitacion PRIMARY KEY(id_tipo_habitacion);

-- 8.2 La clave extranjera
CREATE TABLE cr_dormitorio (
  id_habitacion INTEGER PRIMARY KEY,
  id_hotel INTEGER,
  id_tipo_habitacion INTEGER,
  numero VARCHAR2(6),
  comentario VARCHAR2(400),
  CONSTRAINT fk_cr_tipo_habitacion FOREIGN KEY (id_tipo_habitacion)
  REFERENCES cr_tipo_habitacion (id_tipo_habitacion)
);

-- 8.3 Los valores por defecto
CREATE TABLE cr_dormitorio (
  id_habitacion INTEGER PRIMARY KEY,
  id_hotel INTEGER,
  id_tipo_habitacion INTEGER DEFAULT 2,
  numero VARCHAR2(6),
  comentario VARCHAR2(400),
  CONSTRAINT fk_cr_tipo_habitacion FOREIGN KEY (id_tipo_habitacion)
  REFERENCES cr_tipo_habitacion (id_tipo_habitacion)
);

ALTER TABLE cr_dormitorio
MODIFY id_tipo_habitacion DEFAULT 3;

ALTER TABLE cr_dormitorio
ADD vista VARCHAR2(20) DEFAULT 'Mar';

-- 8.5 La restriccion de unicidad UNIQUE
ALTER TABLE cr_hotel
MODIFY nombre UNIQUE;

-- 8.6 La restriccion de comprobacion CHECK
CREATE TABLE cr_dormitorio (
  id_habitacion INTEGER PRIMARY KEY,
  id_hotel INTEGER
  CHECK(VALUE BETWEEN 1 AND 999),
  id_tipo_habitacion INTEGER,
  numero VARCHAR2(6),
  comentario VARCHAR2(400)
);
