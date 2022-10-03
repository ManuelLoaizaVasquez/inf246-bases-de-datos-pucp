-- 2.1 El comando CREATE

CREATE TABLE cr_tarifa (
  id_tarifa NUMBER(38, 0),
  id_hotel NUMBER(38, 0),
  id_tipo_habitacion NUMBER(38, 0),
  fecha_inicio DATE,
  fecha_fin DATE,
  precio DECIMAL(7, 3)
);

CREATE TABLE cr_hotel (
  id_hotel NUMBER(38, 0),
  nombre VARCHAR2(50),
  numero_estrellas VARCHAR2(5)
);

CREATE TABLE cr_tipo_habitacion (
  id_tipo_habitacion NUMBER(38, 0),
  numero_camas NUMBER(2, 0),
  tipo_cama VARCHAR2(50),
  descripcion VARCHAR2(255)
);

-- 2.2 Tablas temporales

CREATE GLOBAL TEMPORARY TABLE cr_tarifas_2019 (
  id_tarifa NUMBER(38, 0),
  id_hotel NUMBER(38, 0),
  id_tipo_habitacion NUMBER(38, 0),
  fecha_inicio DATE,
  fecha_fin DATE,
  precio DECIMAL(7, 3)
) ON COMMIT PRESERVE ROWS;

-- 2.3 Los comentarios
COMMENT ON TABLE cr_tarifa
IS 'Tarifa por hotel y habitaciones';

COMMENT ON COLUMN cr_hotel.id_hotel
IS 'Numero del hotel';

-- Los comentarios se almacenan en dos tablas Oracle
SELECT *
FROM user_tab_comments;

SELECT *
FROM user_col_comments;

-- 2.5 Utilizacion de sinonimos

CREATE SYNONYM cr_precio FOR cr_tarifa;

SELECT *
FROM cr_precio;

-- 2.6 Las secuencias

CREATE SEQUENCE numeros
START WITH 5
INCREMENT BY 1
MINVALUE 2
MAXVALUE 999999
CYCLE;

SELECT numeros.nextval
FROM dual;

SELECT numeros.currval
FROM dual;

CREATE TABLE cr_habitacion (
  id_habitacion NUMBER(38, 0),
  id_hotel NUMBER(38, 0),
  id_tipo_habitacion NUMBER(38, 0),
  numero VARCHAR2(6),
  comentario VARCHAR2(400),
  CONSTRAINT pk_habitacion PRIMARY_KEY (id_habitacion)
);

CREATE OR REPLACE TRIGGER tr_numeros
BEFORE INSERT ON cr_habitacion
FOR EACH ROW DECLARE
  BEGIN
    SELECT numeros.nextval
    INTO:NEW.id_habitacion FROM dual;
  END;

INSERT INTO cr_habitacion (id_hotel, id_tipo_habitacion, numero, comentario)
VALUES (2, 1, '2', NULL);

INSERT INTO cr_habitacion (id_hotel, id_tipo_habitacion, numero, comentario)
VALUES (2, 1, '2', NULL);

INSERT INTO cr_habitacion(id_hotel, id_tipo_habitacion, numero, comentario)
VALUES (2, 1, '2', NULL);

ALTER SEQUENCE numeros
MAXVALUE 100000;

ALTER SEQUENCE numeros
INCREMENT BY 5;

INSERT INTO cr_habitacion (id_hotel, id_tipo_habitacion, numero, comentario)
VALUES (2, 1, '2', NULL);

INSERT INTO cr_habitacion (id_hotel, id_tipo_habitacion, numero, comentario)
VALUES (2, 1, '2', NULL);

INSERT INTO cr_habitacion(id_hotel, id_tipo_habitacion, numero, comentario)
VALUES (2, 1, '2', NULL);

SELECT *
FROM cr_habitacion;

DROP SEQUENCE numeros;

-- 2.4 Crear una tabla a partir de una seleccion de datos

CREATE TABLE cr_copia_habitacion AS
SELECT * FROM cr_habitacion;

CREATE TABLE cr_estructura_habitacion AS
SELECT * FROM cr_habitacion WHERE 1 = 2;
