CREATE GLOBAL TEMPORARY TABLE cr_tarifas_2019 (
  id_tarifa NUMBER(38, 0),
  id_hotel NUMBER(38, 0),
  id_tipo_habitacion NUMBER(38, 0),
  fecha_inicio DATE,
  fecha_fin DATE,
  precio DECIMAL(7, 3)
) ON COMMIT PRESERVE ROWS;
