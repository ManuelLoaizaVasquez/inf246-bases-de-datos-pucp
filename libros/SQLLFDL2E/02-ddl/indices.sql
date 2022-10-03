-- 7.3 La creacion de un indice
CREATE INDEX i_tipo_habitacion
ON cr_dormitorio (id_tipo_habitacion);

CREATE INDEX i_tipo_hotel
ON cr_dormitorio (id_tipo_habitacion, id_hotel);

CREATE INDEX i_numero
ON cr_dormitorio (numero DESC);

-- 7.4 La eliminacion de un indice
DROP INDEX i_tipo_habitacion;
DROP INDEX i_tipo_hotel;
DROP INDEX i_numero;

