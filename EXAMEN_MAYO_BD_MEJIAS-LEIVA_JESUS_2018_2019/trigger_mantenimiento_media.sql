create or replace TRIGGER mantenimiento_media
BEFORE INSERT OR UPDATE ON NOTAS
FOR EACH ROW
DECLARE

BEGIN

       :NEW.ccMEDIA := (:NEW.PRIMERA_EV + :NEW.SEGUNDA_EV + :NEW.TERCERA_EV)/3;

END;
