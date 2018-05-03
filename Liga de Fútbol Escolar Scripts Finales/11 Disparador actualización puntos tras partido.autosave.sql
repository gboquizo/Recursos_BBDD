create or replace TRIGGER ACTUALIZA_PUNTOS_TRAS_PARTIDO
BEFORE UPDATE OF GOLESLOCAL,GOLESVISITANTE ON PARTIDOS
FOR EACH ROW

DECLARE


BEGIN

        IF :OLD.ESTADO = 'Jugado' THEN

          IF :OLD.GOLESLOCAL > :OLD.GOLESVISITANTE THEN

            UPDATE EQUIPOS
            SET PJ = PJ - 1 ,
	        PG = PG - 1 , 
	        PUNTOS = PUNTOS - 3 ,
	        GOLES_FAVOR = GOLES_FAVOR - :OLD.GOLESLOCAL ,
	        GOLES_CONTRA = GOLES_CONTRA - :OLD.GOLESVISITANTE
            WHERE ID = :OLD.IDEQUIPOLOCAL;

            UPDATE EQUIPOS
            SET PJ = PJ - 1 ,
            PP = PP - 1 , 
            GOLES_FAVOR = GOLES_FAVOR - :OLD.GOLESVISITANTE ,
            GOLES_CONTRA = GOLES_CONTRA - :OLD.GOLESLOCAL
            WHERE ID = :OLD.IDEQUIPOVISITANTE;

          END IF;


          IF :OLD.GOLESLOCAL < :OLD.GOLESVISITANTE THEN
            UPDATE EQUIPOS
            SET PJ = PJ - 1 ,
            PG = PG - 1 , 
            PUNTOS = PUNTOS - 3 ,
            GOLES_FAVOR = GOLES_FAVOR - :OLD.GOLESVISITANTE ,
            GOLES_CONTRA = GOLES_CONTRA - :OLD.GOLESLOCAL
            WHERE ID = :OLD.IDEQUIPOVISITANTE;

            UPDATE EQUIPOS
            SET PJ = PJ - 1 , 
            PP = PP - 1 ,
            GOLES_FAVOR = GOLES_FAVOR - :OLD.GOLESLOCAL ,
            GOLES_CONTRA = GOLES_CONTRA - :OLD.GOLESVISITANTE
            WHERE ID = :OLD.IDEQUIPOLOCAL;

          END IF;


         IF :OLD.GOLESLOCAL = :OLD.GOLESVISITANTE THEN

            UPDATE EQUIPOS
            SET PJ = PJ - 1 ,
            PE = PE - 1 , 
            PUNTOS = PUNTOS - 1 ,
            GOLES_FAVOR = GOLES_FAVOR - :OLD.GOLESVISITANTE ,
            GOLES_CONTRA = GOLES_CONTRA - :OLD.GOLESLOCAL
            WHERE ID = :OLD.IDEQUIPOVISITANTE;

            UPDATE EQUIPOS
            SET PJ = PJ - 1 ,
            PE = PE - 1 , 
            PUNTOS = PUNTOS - 1,
            GOLES_FAVOR = GOLES_FAVOR - :OLD.GOLESLOCAL ,
            GOLES_CONTRA = GOLES_CONTRA - :OLD.GOLESVISITANTE
            WHERE ID = :OLD.IDEQUIPOLOCAL;

          END IF;
        END IF;


        IF :OLD.ESTADO = 'Sin jugar' OR :OLD.ESTADO = 'Jugado' THEN

            IF :NEW.GOLESLOCAL > :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ + 1 ,
                PG = PG + 1 ,
                PUNTOS = PUNTOS + 3,
                GOLES_FAVOR = GOLES_FAVOR + :NEW.GOLESLOCAL ,
                GOLES_CONTRA = GOLES_CONTRA + :NEW.GOLESVISITANTE
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DIFERENCIA_GOLES = (GOLES_FAVOR - GOLES_CONTRA)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ + 1 ,
                PP = PP + 1 ,
                GOLES_FAVOR = NVL(GOLES_FAVOR, 0) + :NEW.GOLESVISITANTE ,
                GOLES_CONTRA = NVL(GOLES_CONTRA, 0) + :NEW.GOLESLOCAL
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DIFERENCIA_GOLES = (GOLES_FAVOR - GOLES_CONTRA)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';

            END IF;

            IF :NEW.GOLESLOCAL = :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ + 1 ,
                PE = PE + 1 , 
                PUNTOS = PUNTOS + 1, 
                GOLES_FAVOR = GOLES_FAVOR + :NEW.GOLESLOCAL ,
                GOLES_CONTRA = GOLES_CONTRA + :NEW.GOLESVISITANTE
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DIFERENCIA_GOLES = (GOLES_FAVOR - GOLES_CONTRA)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ + 1 ,  
                PE = PE + 1 , 
                PUNTOS = PUNTOS + 1, 
                GOLES_FAVOR = GOLES_FAVOR + :NEW.GOLESVISITANTE , 
                GOLES_CONTRA = GOLES_CONTRA + :NEW.GOLESLOCAL
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DIFERENCIA_GOLES = (GOLES_FAVOR-GOLES_CONTRA)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';


            END IF;

            IF :NEW.GOLESLOCAL < :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ + 1 ,
                PP = PP + 1,
                GOLES_FAVOR = GOLES_FAVOR + :NEW.GOLESLOCAL ,
                GOLES_CONTRA = GOLES_CONTRA + :NEW.GOLESVISITANTE
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DIFERENCIA_GOLES = (GOLES_FAVOR - GOLES_CONTRA)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ + 1 ,
                PG = PG + 1, 
                PUNTOS = PUNTOS + 3,
                GOLES_FAVOR = GOLES_FAVOR + :NEW.GOLESVISITANTE ,
                GOLES_CONTRA = GOLES_CONTRA + :NEW.GOLESLOCAL
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DIFERENCIA_GOLES = (GOLES_FAVOR-GOLES_CONTRA)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';
            END IF;
        END IF;
END;