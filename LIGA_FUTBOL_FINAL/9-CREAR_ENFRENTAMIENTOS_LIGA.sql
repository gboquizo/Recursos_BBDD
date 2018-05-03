create or replace PROCEDURE CREAR_ENFRENTAMIENTOS AS

    CURSOR Cequipos_1 IS
    SELECT * FROM equipos
    ORDER BY equipos.id DESC;

    CURSOR Cequipos_2 IS
    SELECT * FROM equipos
    ORDER BY equipos.id ASC;

    CONTADOR_PARTIDOS NUMBER := 1;

BEGIN

    FOR EQUIPO1 IN Cequipos_1 LOOP
        FOR EQUIPO2 IN Cequipos_2 LOOP



        IF EQUIPO1.ID != EQUIPO2.ID THEN

            INSERT INTO PARTIDOS (ID, IDEQUIPOLOCAL,IDEQUIPOVISITANTE, FECHA_HORA, GOLESLOCAL, GOLESVISITANTE, ESTADO )
            VALUES (CONTADOR_PARTIDOS,EQUIPO1.ID, EQUIPO2.ID, NULL, 0, 0, 'Sin jugar');

            CONTADOR_PARTIDOS := CONTADOR_PARTIDOS + 1;

        END IF;



        END LOOP;
      END LOOP;


END CREAR_ENFRENTAMIENTOS;
