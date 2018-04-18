CREATE OR REPLACE TRIGGER ACTUALIZA_PUNTOS_TRAS_PARTIDO
BEFORE UPDATE ON PARTIDOS
FOR EACH ROW

DECLARE


BEGIN

        IF :OLD.ESTADO = 'Sin jugar' THEN

            IF :NEW.GOLESLOCAL > :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PG = PG +1 , PTOS = PTOS + 3
                WHERE ID = :NEW.IDEQUIPOLOCAL;



                UPDATE EQUIPOS
                SET PJ = PJ +1 ,  PP = PP + 1
                WHERE ID = :NEW.IDEQUIPOVISITANTE;


                :NEW.ESTADO := 'Jugado';

            END IF;

            IF :NEW.GOLESLOCAL = :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PE = PE +1 , PTOS = PTOS + 1
                WHERE ID = :NEW.IDEQUIPOLOCAL;



                UPDATE EQUIPOS
                SET PJ = PJ +1 ,  PE = PE + 1
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';


            END IF;

            IF :NEW.GOLESLOCAL < :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PP = PP +1
                WHERE ID = :NEW.IDEQUIPOLOCAL;



                UPDATE EQUIPOS
                SET PJ = PJ +1 , PG = PG + 1
                WHERE ID = :NEW.IDEQUIPOVISITANTE;


                :NEW.ESTADO := 'Jugado';


            END IF;

        END IF;


END;
