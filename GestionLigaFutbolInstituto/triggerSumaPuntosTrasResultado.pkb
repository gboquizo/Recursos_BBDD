CREATE OR REPLACE TRIGGER ACTUALIZA_PUNTOS_TRAS_PARTIDO
BEFORE UPDATE ON PARTIDOS
FOR EACH ROW

DECLARE


BEGIN

        IF :OLD.ESTADO = 'Sin jugar' THEN

            IF :NEW.GOLESLOCAL > :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PG = PG +1 , PTOS = PTOS + 3, GF = GF + :NEW.GOLESLOCAL , GC = GC + :NEW.GOLESVISITANTE, DF = DF + (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ +1 ,  PP = PP + 1 , GF = NVL(GF,0) + :NEW.GOLESVISITANTE , GC = NVL(GC,0) + :NEW.GOLESLOCAL, DF = NVL(DF,0) + (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';

            END IF;

            IF :NEW.GOLESLOCAL = :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PE = PE +1 , PTOS = PTOS + 1, GF = GF + :NEW.GOLESLOCAL , GC = GC + :NEW.GOLESVISITANTE, DF = DF+ (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ +1 ,  PE = PE + 1 , GF = GF + :NEW.GOLESVISITANTE , GC = GC + :NEW.GOLESLOCAL, DF = DF + (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';


            END IF;

            IF :NEW.GOLESLOCAL < :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PP = PP +1, GF = GF + :NEW.GOLESLOCAL , GC = GC + :NEW.GOLESVISITANTE, DF = DF + (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ +1 , PG = PG + 1, PTOS = PTOS + 3, GF = GF + :NEW.GOLESVISITANTE , GC = GC + :NEW.GOLESLOCAL, DF = DF + (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';


            END IF;

        END IF;


END;
