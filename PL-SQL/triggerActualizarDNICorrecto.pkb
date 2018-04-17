create or replace TRIGGER I_U_NIF_CORRECTO
BEFORE INSERT OR
UPDATE OF NIF
ON ALUMNOS
FOR EACH ROW

DECLARE

BEGIN



    IF NIFCORRECTO(:NEW.NIF) = 'FALSE' THEN
        raise_application_error( -20001, 'El DNI introducido no es válido' );

    END IF;


END;
