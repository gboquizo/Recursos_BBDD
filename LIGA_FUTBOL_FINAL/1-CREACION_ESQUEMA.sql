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
  estado varchar2(50),
  fecha_hora timestamp,
  golesLocal integer,
  golesVisitante integer,

  primary key (id)

);

CREATE TABLE AUDITORIA (

  fecha_hora timestamp,
  usuario varchar2(255),
  operacion CLOB,


  primary key (fecha_hora)
);

-- Foreign keys --

ALTER TABLE jugadores
ADD CONSTRAINT fk_equipo FOREIGN KEY (idEquipo) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_local FOREIGN KEY (idEquipoLocal) REFERENCES equipos(id);

ALTER TABLE partidos
ADD CONSTRAINT fk_equipo_visitante FOREIGN KEY (idEquipoVisitante) REFERENCES equipos(id);
