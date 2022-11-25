DROP TABLE ce_pedido_detalle;

DROP TABLE ce_descuento;

DROP TABLE ce_producto;

DROP TABLE ce_categoria_producto;

DROP TABLE ce_marca_producto;

DROP TABLE ce_pedido;

DROP TABLE ce_direccion;

DROP TABLE ce_ubigeo;

DROP TABLE ce_cliente;

DROP TABLE ce_tipo_documento;

DROP TABLE ce_proveedor;

DROP TABLE ce_medio_pago;

DROP PROCEDURE sp_recalcular_pedido_detalle;

DROP PROCEDURE sp_depurar_pedidos;

DROP PROCEDURE sp_recalcular_pedido;

DROP TRIGGER despues_insertar_detalle;

DROP TRIGGER despues_actualizar_precio;