BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_DETALLE_PRODUCTO CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_ORDEN_PRODUCCION CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_DETALLE_COMPRA CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_ORDEN_COMPRA CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_MATRIZ_INSUMO CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_PRODUCTO CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_TIPO_PRODUCTO CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_INSUMO CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_UNIDAD_DIVISORIA CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_MOTIVO CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_UNIDAD_DIVISORIA CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_DIMENSION CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SP_DETALLE_PRODUCTO CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SP_ORDEN_PRODUCCION_SEQ';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SP_DETALLE_PRODUCTO_SEQ';
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode != -942 THEN
            RAISE;
        END IF;
END;
/

DROP FUNCTION f_stock_insumo;
/

DROP PROCEDURE p_upd_stock_insumos;
/

DROP FUNCTION f_total_insumo;
/

DROP PROCEDURE p_top_insumo;
/

DROP FUNCTION f_get_cant_producida;
/

DROP PROCEDURE p_crear_orden_replica;
/

DROP PROCEDURE p_actualiza_mermas;
/

DROP FUNCTION f_top_insumo;
/

DROP FUNCTION obtener_siguiente_lunes;
/