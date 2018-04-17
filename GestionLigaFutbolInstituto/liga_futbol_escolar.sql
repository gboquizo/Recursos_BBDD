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

  primary key (id)
);

CREATE TABLE partidos (

  id integer,

  idEquipoLocal integer,
  idEquipoVisitante integer,
  fecha date,
  hora time,
  golesLocal integer,
  golesVisitante integer,

  primary key (id)

);

CREATE TABLE goles (

  id integer,
  idPartido integer,
  idJugadorMarca integer,
  minGol integer,

  primary key (id)

);

CREATE TABLE arbitros (

  id integer,
  nombre varchar2(255),
  apellido1 varchar2(255),
  apellido2 varchar2(255),

  primary key (id)
);

-- Foreign keys --

ALTER TABLE jugadores
ADD CONSTRAINT fk_equipo FOREIGN KEY (idEquipo) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_local FOREIGN KEY (idEquipoLocal) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_visitante FOREIGN KEY (idEquipoVisitante) REFERENCES equipos(id);

ALTER TABLE goles
ADD CONSTRAINT fk_gol_partido FOREIGN KEY (idPartido) REFERENCES partidos(id);

ALTER TABLE goles
ADD CONSTRAINT fk_jugador_marca FOREIGN KEY (idJugadorMarca) REFERENCES jugadores(id);

-- INSERCCIÓN DE DATOS --

INSERT INTO jugadores (id,nombre,apellido1,apellido2) VALUES (1,'Juan', 'Perez', 'Molina');
INSERT INTO jugadores (id,nombre,apellido1,apellido2) VALUES (2,'Jose', 'Molina', 'Muñoz');
INSERT INTO jugadores (id,nombre,apellido1,apellido2) VALUES (3,'Antonio', 'Fernandez', 'Murillo');

INSERT INTO equipos (id,nombre) VALUES (1,'1DAW');
INSERT INTO equipos (id,nombre) VALUES (2,'2DAW');
INSERT INTO equipos (id,nombre) VALUES (3,'1ASIR');
INSERT INTO equipos (id,nombre) VALUES (4,'2ASIR');

-- Actualizaciones y mejoras --
ALTER TABLE PARTIDOS
ADD jugado varchar2(50);

ALTER TABLE PARTIDOS
ADD CONSTRAINT CHCK_PARTIDOS CHECK ( jugado in ('Jugado', 'Jugando' , 'Sin jugar'));
