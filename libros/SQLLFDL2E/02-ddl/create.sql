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
