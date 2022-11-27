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

DROP PROCEDURE sp_detalle_compra;

DROP PROCEDURE sp_depurar_ordenes_prd;

DROP PROCEDURE sp_recalcular_orden_compra;

DROP TRIGGER after_insert_detalle_compra;

DROP TRIGGER after_update_insumo;