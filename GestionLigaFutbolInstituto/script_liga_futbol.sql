-- CREACIÓN ESQUEMA --

CREATE TABLE jugadores(

  id integer,
  nombre varchar2(255),
  apellido1 varchar2(255),
  apellido2 varchar2(255),

  idEquipo integer,

  primary key (id)

);

CREATE TABLE equipos (

  id integer,
  nombre varchar2(255),
  PE number,
  PP number,
  PG number,
  PJ number,
  PTOS number,
  GF number,
  GC number,
  DF number,

  primary key (id)
);

CREATE TABLE partidos (

  id integer,

  idEquipoLocal integer,
  idEquipoVisitante integer,
  fecha_hora timestamp,
  golesLocal integer,
  golesVisitante integer,
  jugado varchar2(50),

  primary key (id)

);

CREATE TABLE AUDITORIA (

  fecha_hora timestamp,
  usuario varchar2(255),
  operacion varchar2(255),


  primary key (fecha_hora)
);

CREATE TABLE arbitros (

  id integer,
  nombre varchar2(255),
  apellido1 varchar2(255),
  apellido2 varchar2(255),

  primary key (id)
);

-- FOREIGN KEYS --

ALTER TABLE jugadores
ADD CONSTRAINT fk_equipo FOREIGN KEY (idEquipo) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_local FOREIGN KEY (idEquipoLocal) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_visitante FOREIGN KEY (idEquipoVisitante) REFERENCES equipos(id);

-- CHECK ESTADO DE PARTIDO --
ALTER TABLE PARTIDOS
ADD CONSTRAINT CHCK_PARTIDOS CHECK ( jugado in ('Jugado', 'Jugando' , 'Sin jugar'));

-- CHECKS PARA EQUIPOS --
ALTER TABLE EQUIPOS
ADD CONSTRAINT PTOS_CK  CHECK (PTOS >= 0);

ALTER TABLE EQUIPOS
ADD CONSTRAINT PP_CK CHECK (PP >= 0);

ALTER TABLE EQUIPOS
ADD CONSTRAINT PE_CK  CHECK (PE >= 0);

ALTER TABLE EQUIPOS
ADD CONSTRAINT PG_CK  CHECK (PG >= 0);

ALTER TABLE EQUIPOS
ADD CONSTRAINT PJ_CK  CHECK (PJ >= 0);

-- CHECKS PARA PARTIDOS --
ALTER TABLE PARTIDOS
ADD CONSTRAINT GL_CK  CHECK (GOLESLOCAL >= 0);

ALTER TABLE PARTIDOS
ADD CONSTRAINT GV_CK CHECK (GOLESVISITANTE >= 0);

-- FUNCION PARA SACAR EL NOMBRE DE UN EQUIPO POR ID --
CREATE OR REPLACE FUNCTION SACAR_NOMBRE_EQUIPO (ID_EQUIPO IN NUMBER )

RETURN VARCHAR2 IS
NOMBRE_EQUIPO EQUIPOS.NOMBRE%TYPE;

BEGIN

    SELECT EQUIPOS.NOMBRE
    INTO NOMBRE_EQUIPO
    FROM EQUIPOS
    WHERE EQUIPOS.ID = ID_EQUIPO;

  RETURN NOMBRE_EQUIPO;
END SACAR_NOMBRE_EQUIPO;

-- PROCEDIMIENTO PARA CREAR LOS ENFRENTAMIENTOS ENTRE EQUIPOS --
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


-- TRIGGER SUMA PUNTOS TRAS METER RESULTADO --
create or replace TRIGGER ACTUALIZA_PUNTOS_TRAS_PARTIDO
BEFORE UPDATE ON PARTIDOS
FOR EACH ROW

DECLARE


BEGIN

        IF :OLD.ESTADO = 'Jugado' THEN

          IF :OLD.GOLESLOCAL > :OLD.GOLESVISITANTE THEN

            UPDATE EQUIPOS
            SET PJ = PJ -1 , PG = PG -1 , PTOS = PTOS -3 , GF = GF - :OLD.GOLESLOCAL , GC = GC - :OLD.GOLESVISITANTE
            WHERE ID = :OLD.IDEQUIPOLOCAL;

            UPDATE EQUIPOS
            SET PJ = PJ -1 , PP = PP -1 , GF = GF - :OLD.GOLESVISITANTE , GC = GC - :OLD.GOLESLOCAL
            WHERE ID = :OLD.IDEQUIPOVISITANTE;


          END IF;


          IF :OLD.GOLESLOCAL < :OLD.GOLESVISITANTE THEN

            UPDATE EQUIPOS
            SET PJ = PJ -1 , PG = PG -1 , PTOS = PTOS -3 , GF = GF - :OLD.GOLESVISITANTE , GC = GC - :OLD.GOLESLOCAL
            WHERE ID = :OLD.IDEQUIPOVISITANTE;

            UPDATE EQUIPOS
            SET PJ = PJ -1 , PP = PP -1 ,GF = GF - :OLD.GOLESLOCAL , GC = GC - :OLD.GOLESVISITANTE
            WHERE ID = :OLD.IDEQUIPOLOCAL;


          END IF;


         IF :OLD.GOLESLOCAL = :OLD.GOLESVISITANTE THEN

            UPDATE EQUIPOS
            SET PJ = PJ -1 , PE = PE -1 , PTOS = PTOS -1 , GF = GF - :OLD.GOLESVISITANTE , GC = GC - :OLD.GOLESLOCAL
            WHERE ID = :OLD.IDEQUIPOVISITANTE;

            UPDATE EQUIPOS
            SET PJ = PJ -1 , PE = PE -1 , PTOS = PTOS -1, GF = GF - :OLD.GOLESLOCAL , GC = GC - :OLD.GOLESVISITANTE
            WHERE ID = :OLD.IDEQUIPOLOCAL;


          END IF;








        END IF;


        IF :OLD.ESTADO = 'Sin jugar' OR :OLD.ESTADO = 'Jugado' THEN

            IF :NEW.GOLESLOCAL > :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PG = PG +1 , PTOS = PTOS + 3, GF = GF + :NEW.GOLESLOCAL , GC = GC + :NEW.GOLESVISITANTE
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ +1 ,  PP = PP + 1 , GF = NVL(GF,0) + :NEW.GOLESVISITANTE , GC = NVL(GC,0) + :NEW.GOLESLOCAL
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';

            END IF;

            IF :NEW.GOLESLOCAL = :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PE = PE +1 , PTOS = PTOS + 1, GF = GF + :NEW.GOLESLOCAL , GC = GC + :NEW.GOLESVISITANTE
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ +1 ,  PE = PE + 1 , PTOS = PTOS + 1, GF = GF + :NEW.GOLESVISITANTE , GC = GC + :NEW.GOLESLOCAL
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';


            END IF;

            IF :NEW.GOLESLOCAL < :NEW.GOLESVISITANTE THEN

                UPDATE EQUIPOS
                SET PJ = PJ +1 , PP = PP +1, GF = GF + :NEW.GOLESLOCAL , GC = GC + :NEW.GOLESVISITANTE
                WHERE ID = :NEW.IDEQUIPOLOCAL;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOLOCAL;


                UPDATE EQUIPOS
                SET PJ = PJ +1 , PG = PG + 1, PTOS = PTOS + 3, GF = GF + :NEW.GOLESVISITANTE , GC = GC + :NEW.GOLESLOCAL
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                UPDATE EQUIPOS
                SET DF = (GF-GC)
                WHERE ID = :NEW.IDEQUIPOVISITANTE;

                :NEW.ESTADO := 'Jugado';


            END IF;

        END IF;


END;

-- AUDITORIA LIGA FUTBOL --

create or replace TRIGGER AUDITORIA
AFTER DELETE OR UPDATE OR INSERT ON PARTIDOS
FOR EACH ROW
DECLARE

    usuario AUDITORIA.USUARIO%TYPE;

    fecha_hora AUDITORIA.FECHA_HORA%TYPE;

    operacion AUDITORIA.OPERACION%TYPE;


BEGIN

    SELECT USER INTO usuario FROM DUAL;

    SELECT systimestamp INTO fecha_hora FROM DUAL;



    IF INSERTING THEN

        operacion := 'Insertado partido --> ' ||
                     'Datos ' || '('|| :NEW.ID || ',' || 'Local: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOLOCAL) || ', ' || 'Visitante: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOVISITANTE) || ', '
                              ||:NEW.FECHA_HORA || ', ' || 'Goles local: ' ||:NEW.GOLESLOCAL || ', ' || 'Goles visitante: ' || :NEW.GOLESVISITANTE || ', ' || :NEW.ESTADO ||  ')';



    END IF;

    IF UPDATING THEN

        operacion := 'Modificado partido --> ' ||
                     'Datos anteriores' || '('|| :OLD.ID || ',' || 'Local: ' || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOLOCAL) || ', ' || 'Visitante: ' || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOVISITANTE) || ', '
                              ||:OLD.FECHA_HORA || ', ' || 'Goles local: ' || :OLD.GOLESLOCAL || ', ' || 'Goles visitante: ' || :OLD.GOLESVISITANTE || ', ' || :OLD.ESTADO || ')' ||
                     ' --> Datos nuevos' || '('|| :NEW.ID || ',' || 'Local: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOLOCAL) || ',' || 'Visitante: ' || SACAR_NOMBRE_EQUIPO(:NEW.IDEQUIPOVISITANTE) || ', '
                              ||:NEW.FECHA_HORA || ', ' || 'Goles local: ' || :NEW.GOLESLOCAL || ', ' || 'Goles visitante: ' || :NEW.GOLESVISITANTE || ', ' || :NEW.ESTADO || ')';


    END IF;


    IF DELETING THEN

        operacion := 'Eliminado partido --> ' ||
                     'Datos partido' || '('|| :OLD.ID || ', ' || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOLOCAL) || ', ' || SACAR_NOMBRE_EQUIPO(:OLD.IDEQUIPOVISITANTE) || ', '
                              ||:NEW.FECHA_HORA || ', ' || :NEW.GOLESLOCAL || ', ' || :NEW.GOLESVISITANTE || ', ' || :NEW.ESTADO || ')';


    END IF;


    INSERT INTO AUDITORIA (FECHA_HORA, USUARIO, OPERACION) VALUES (fecha_hora,usuario,operacion);

END;

-- SECUENCIA Y TRIGGER PARA ID_AUTO_INCREMENT --

CREATE SEQUENCE ID_AUTO_EQUIPOS START WITH 1;

CREATE OR REPLACE TRIGGER ID_AUTO_EQUIPO
BEFORE INSERT ON EQUIPOS
FOR EACH ROW
BEGIN

    :NEW.ID := ID_AUTO_EQUIPOS.NEXTVAL;

  NULL;
END;

-- DATOS PRUEBA --
INSERT INTO EQUIPOS (NOMBRE,PJ,PG,PP,PE,PTOS,GF,GC,DF) VALUES ('1DAW',0,0,0,0,0,0,0,0);
INSERT INTO EQUIPOS (NOMBRE,PJ,PG,PP,PE,PTOS,GF,GC,DF) VALUES ('2DAW',0,0,0,0,0,0,0,0);
INSERT INTO EQUIPOS (NOMBRE,PJ,PG,PP,PE,PTOS,GF,GC,DF) VALUES ('1ASIR',0,0,0,0,0,0,0,0);
INSERT INTO EQUIPOS (NOMBRE,PJ,PG,PP,PE,PTOS,GF,GC,DF) VALUES ('2ASIR',0,0,0,0,0,0,0,0);
