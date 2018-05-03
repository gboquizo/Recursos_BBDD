create or replace TRIGGER T_AUDITORIA_LIGA
AFTER DELETE OR UPDATE OR INSERT ON PARTIDOS
FOR EACH ROW
DECLARE

    fecha_hora AUDITORIA_LIGA.FECHA_HORA%TYPE;
    usuario AUDITORIA_LIGA.USUARIO%TYPE;
    operacion AUDITORIA_LIGA.OPERACION%TYPE;


BEGIN

    SELECT USER INTO usuario FROM DUAL;

    SELECT SYSTIMESTAMP INTO fecha_hora FROM DUAL;



    IF INSERTING THEN

        operacion := 'Insertando partido --> ' ||
                     'Datos ' || '('|| :NEW.ID || ',' 
                     || 'Local: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOLOCAL) || ', ' 
                     || 'Visitante: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOVISITANTE) || ', '
                     ||:NEW.FECHA_HORA || ', ' 
                     || 'Goles local: ' ||:NEW.GOLESLOCAL || ', ' 
                     || 'Goles visitante: ' || :NEW.GOLESVISITANTE || ', ' 
                     || :NEW.ESTADO || ')';
    END IF;

    IF UPDATING THEN

        operacion := 'Modificado partido --> ' ||
                     'Datos anteriores' || '('|| :OLD.ID || ',' 
                     || 'Local: ' || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOLOCAL) || ', ' 
                     || 'Visitante: ' || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOVISITANTE) || ', '
                     ||:OLD.FECHA_HORA || ', ' 
                     || 'Goles local: ' || :OLD.GOLESLOCAL || ', ' 
                     || 'Goles visitante: ' || :OLD.GOLESVISITANTE || ', ' 
                     || :OLD.ESTADO || ')' ||
                     ' --> Datos nuevos' 
                     || '('|| :NEW.ID || ',' 
                     || 'Local: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOLOCAL) || ',' 
                     || 'Visitante: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOVISITANTE) || ', '
                     ||:NEW.FECHA_HORA || ', ' 
                     || 'Goles local: ' || :NEW.GOLESLOCAL || ', ' 
                     || 'Goles visitante: ' || :NEW.GOLESVISITANTE || ', ' 
                     || :NEW.ESTADO || ')';


    END IF;


    IF DELETING THEN

        operacion := 'Eliminado partido --> ' ||
                     'Datos partido' || '('|| :OLD.ID || ', ' 
                     || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOLOCAL) || ', ' 
                     || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOVISITANTE) || ', '
                     || :OLD.FECHA_HORA || ', ' 
                     || :OLD.GOLESLOCAL || ', ' 
                     || :OLD.GOLESVISITANTE || ', ' 
                     || :NEW.ESTADO || ')';
    END IF;

    INSERT INTO AUDITORIA_LIGA (FECHA_HORA, USUARIO, OPERACION) VALUES (fecha_hora,usuario,operacion);
END;