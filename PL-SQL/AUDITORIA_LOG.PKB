CREATE OR REPLACE TRIGGER AUDITORIA
AFTER DELETE OR UPDATE OR INSERT ON ALUMNOS
FOR EACH ROW
DECLARE

    usuario AUDITORIA.USUARIO%TYPE;

    fecha_hora AUDITORIA.FECHA_HORA%TYPE;

    operacion AUDITORIA.OPERACION%TYPE;


BEGIN

    SELECT USER INTO USUARIO FROM DUAL;

    SELECT SYSDATE INTO fecha_hora FROM DUAL;



    IF INSERTING THEN

        operacion := 'Insertando alumno --> ' ||
                     'Datos nuevos' || '('|| :NEW.ID || ',' || :NEW.NOMBRE || ',' || :NEW.PTOS || ',' ||:NEW.NIF || ')';



    END IF;

    IF UPDATING THEN

        operacion := 'Modificado alumno --> ' ||
                     'Datos anteriores' || '('|| :OLD.ID || ',' || :OLD.NOMBRE || ',' || :OLD.PTOS || ',' ||:OLD.NIF || ')' ||
                     ' --> Datos nuevos' || '('|| :NEW.ID || ',' || :NEW.NOMBRE || ',' || :NEW.PTOS || ',' ||:NEW.NIF || ')';


    END IF;


    IF DELETING THEN

        operacion := 'Eliminado alumno --> ' ||
                     'Datos alumno' || '('|| :OLD.ID || ',' || :OLD.NOMBRE || ',' || :OLD.PTOS || ',' ||:OLD.NIF || ')';


    END IF;


    INSERT INTO AUDITORIA (FECHA_HORA, USUARIO, OPERACION) VALUES (fecha_hora,usuario,operacion);

END;
