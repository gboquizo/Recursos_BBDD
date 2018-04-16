CREATE TABLE jugadores (

  id integer,
  nombre varchar2(255),
  primer_apellido varchar2(255),
  segundo_apellido varchar2(255),
  fecha_nacimiento date,
  posicion varchar2(255),
  dorsal integer,
  estado varchar2(255),

  id_equipo integer,

  primary key (id)



);

CREATE TABLE equipos (

  id integer,
  nombre varchar2(255) unique,

  id_primer_capitan integer,
  id_segundo_capitan integer,

  primary key (id),

  foreign key (id_primer_capitan) references jugadores (id),
  foreign key (id_segundo_capitan) references jugadores (id)

);

CREATE TABLE arbitros (

  id integer,
  nombre varchar2(255),
  fecha_nacimiento date,

  primary key (id)
);

CREATE TABLE partidos (

  id integer,
  fecha date,
  hora date,

  id_equipo_local integer,
  id_equipo_visitante integer,

  id_arbitro integer,

  primary key (id),

  foreign key (id_equipo_local) references equipos (id),
  foreign key (id_equipo_visitante) references equipos (id),

  foreign key (id_arbitro) references arbitros (id)

);


CREATE TABLE goles (

  id integer,
  min_gol integer,

  id_jugador_marca integer,
  id_partido integer,

  primary key (id),

  foreign key (id_jugador_marca) references jugadores (id),
  foreign key (id_partido) references partidos (id)

);



ALTER TABLE jugadores ADD CONSTRAINT FK_EQUIPO foreign key (id_equipo) references equipos (id);
