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

-- Foreign keys --

ALTER TABLE jugadores
ADD CONSTRAINT fk_equipo FOREIGN KEY (idEquipo) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_local FOREIGN KEY (idEquipoLocal) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_visitante FOREIGN KEY (idEquipoVisitante) REFERENCES equipos(id);




-- Actualizaciones y mejoras --

ALTER TABLE PARTIDOS
ADD CONSTRAINT CHCK_PARTIDOS CHECK ( jugado in ('Jugado', 'Jugando' , 'Sin jugar'));
