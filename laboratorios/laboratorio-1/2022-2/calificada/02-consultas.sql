-- Parte 2: Consultas

-- Pregunta 6

SELECT
    i.id_insumo,
    i.nombre,
    i.stock
FROM
    sp_insumo           i,
    sp_unidad_divisoria u
WHERE
        i.id_unidad = u.id_unidad
    AND u.nombre = 'Pulgada cuadrada';

-- Pregunta 7

SELECT
    i.nombre AS insumo,
    m.cantidad
    || ' '
    || u.nombre
    || ' ('
    || u.id_unidad
    || ')'   AS requerimiento
FROM
    sp_insumo           i,
    sp_matriz_insumo    m,
    sp_producto         p,
    sp_unidad_divisoria u
WHERE
        u.id_unidad = i.id_unidad
    AND i.id_insumo = m.id_insumo
    AND m.id_producto = p.id_producto
    AND p.nombre = 'Mocasín Caballero Talla 41';