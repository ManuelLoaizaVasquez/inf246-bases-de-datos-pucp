-- 6.2 La creacion de vistas
CREATE VIEW v_hotel_habitacion AS
SELECT
h.id_hotel,
h.numero,
t.tipo_cama,
t.numero_camas,
t.descripcion
FROM
cr_dormitorio h,
cr_tipo_habitacion t
WHERE
h.id_tipo_habitacion = t.id_tipo_habitacion;

DROP VIEW v_hotel_habitacion;
