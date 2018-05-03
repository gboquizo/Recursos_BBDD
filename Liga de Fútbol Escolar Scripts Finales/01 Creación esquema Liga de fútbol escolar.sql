/*Creación del esquema para la liga de fútbol del centro*/

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
  pj integer,
  pg integer,
  pe integer,
  pp integer,
  puntos integer,
  goles_favor integer,
  goles_contra integer,
  diferencia_goles integer,
  primary key (id)
);

CREATE TABLE partidos (
  id integer,
  idEquipoLocal integer,
  idEquipoVisitante integer,
  fecha_hora timestamp,
  golesLocal integer,
  golesVisitante integer,
  estado varchar2(50),
  primary key (id)
);

-- Foreign keys --

ALTER TABLE jugadores
ADD CONSTRAINT fk_equipo FOREIGN KEY (idEquipo) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_local FOREIGN KEY (idEquipoLocal) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_visitante FOREIGN KEY (idEquipoVisitante) REFERENCES equipos(id);