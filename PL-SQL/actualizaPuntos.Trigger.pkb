create or replace TRIGGER ACTUALIZA_PUNTOS_ALUMNOS

/**
  Queremos que el disparador actue después de insertar un resultado en la tabla RAP, en el campo resultado,
  por los cuál necesitamos un AFTER INSERT en la tabla RAP.
**/

AFTER INSERT ON RAP
   FOR EACH ROW

DECLARE

/**
  No se neceitan variables
**/

BEGIN

  /**
    Comprobamos el nuevo valor del campo resuelto, después del insert con :new.resuelto, y hacemos los updates
    correspondientes para actualizar los puntos en funcion del valor del campo resuelto. Actualizando los valores
    solo del usuario al que le corresponde para ello usamos el :new.id_alumno, que nos sirve al ser foreign key.
  **/
  IF :new.resuelto = 's' THEN

        UPDATE Alumnos
        SET PTOS = (NVL(PTOS,0) + 1)
        WHERE ID = :new.ID_ALUMNO;


  ELSIF :new.resuelto = 'n' THEN

    UPDATE Alumnos
    SET PTOS = (NVL(PTOS,0) - 1)
    WHERE ID = :new.ID_ALUMNO;

  END IF;


END;
