CREATE DATABASE ligaFutbol;

CREATE TABLE equipos (
    id INTEGER,
    nombre VARCHAR2(255),
    id_primer_capitan INTEGER,
    id_segundo_capitan INTEGER,
    id_tercer_capitan INTEGER,
    id_estadio INTEGER,

    -- CLAVE PRIMARIA --
    CONSTRAINT PK_EQUIPOS PRIMARY KEY (id),

    -- FOREIGN KEY DE LOS CAPITANES DEL EQUIPO --
    CONSTRAINT FK_PRIMER_CAPITAN FOREIGN KEY (id_primer_capitan) REFERENCES jugadores (id),
    CONSTRAINT FK_SEGUNDO_CAPITAN FOREIGN KEY (id_segundo_capitan) REFERENCES jugadores (id),
    CONSTRAINT FK_TERCER_CAPITAN FOREIGN KEY (id_tercer_capitan) REFERENCES jugadores (id),

    -- FOREIG KEY LOS EQUIPOS TIENEN UN ESTADIO --
    CONSTRAINT FK_EQUIPO_ESTADIO FOREIGN KEY (id_estadio) REFERENCES estadios (id)
    
);

CREATE TABLE jugadores (
    id INTEGER,
    nombre VARCHAR2(255),
    apellido1 VARCHAR2(255),
    apellido2 VARCHAR2(255),
    edad INTEGER,
    posicion VARCHAR2(255),
    dorsal INTEGER,
    estado VARCHAR2(255),
    id_equipo INTEGER,

    --CLAVE PRIMARIA --
    CONSTRAINT PK_JUGADORES PRIMARY KEY (id),

    -- FOREIGN KEY DEL EQUIPO AL QUE PERTENECEN --
    CONSTRAINT FK_EQUIPO FOREIGN KEY (id_equipo) REFERENCES equipos (id)

);

CREATE TABLE partidos (
    id INTEGER,
    fecha DATE,
    id_equipo_local INTEGER,
    id_equipo_visitante INTEGER,
    id_jugador_marca_gol INTEGER,
    min_gol INTEGER,
    id_estadio INTEGER,
    id_arbitro INTEGER,
    id_juez_linea_1 INTEGER,
    id_juez_linea_2 INTEGER,

    -- CLAVE PRIMARIA --
    CONSTRAINT PK_PARTIDOS PRIMARY KEY (id),

    -- FOREIGN KEY EQUIPOS LOCAL Y VISITANTE --
    CONSTRAINT FK_EQUIPO_LOCAL FOREIGN KEY (id_equipo_local) REFERENCES equipos (id),
    CONSTRAINT FK_EQUIPO_VISITANTE FOREIGN KEY (id_equipo_visitante) REFERENCES equipos (id),

    -- FOREIG KEY DE LOS JUGADORES QUE MARCAN EN UN PARTIDO --
    CONSTRAINT FK_JUGADOR_MARCA FOREIGN KEY (id_jugador_marca_gol) REFERENCES jugadores (id),
 
    -- RESTRICCION MAS DE UN JUGADOR NO PUEDE MARCAR EN UN MISMO MINUTO --
    CONSTRAINT MIN_GOL_JUGADOR UNIQUE (id_jugador_marca_gol,min_gol),

    -- FOREIG KEY DE LOS PARTIDOS SE JUEGAN EN UN ESTADIO --
    CONSTRAINT FK_PARTIDO_ESTADIO FOREIGN KEY (id_estadio) REFERENCES estadios (id),


    -- FOREIGN KEY A ARBITRO --
    CONSTRAINT FK_PARTIDO_ARBITRO FOREIGN KEY (id_arbitro) REFERENCES arbitros(id),

    -- FOREIGN KEY A JUEZ LINEA 1 --
    CONSTRAINT FK_JUEZ_LINEA_1 FOREIGN KEY (id_juez_linea_1) REFERENCES jueces_linea(id),

    -- FOREIGN KEY A JUEZ LINEA 2 --
    CONSTRAINT FK_JUEZ_LINEA_2 FOREIGN KEY (id_juez_linea_2) REFERENCES jueces_linea(id)
);


CREATE TABLE jugadores_partidos (
    id INTEGER,
    id_jugador INTEGER,
    id_partido INTEGER,

    -- CLAVE PRIMARIA --
    CONSTRAINT PK_JUGADORES_PARTIDOS PRIMARY KEY (id),

    -- REESTRICCIÓN CLAVE CANDIDATA Y FOREIGN KEYS
    CONSTRAINT CLAVE_CANDIDATA UNIQUE (id_jugador,id_partido),
    CONSTRAINT FK_JUGADOR FOREIGN KEY (id_jugador) REFERENCES jugadores (id),
    CONSTRAINT FK_PARTIDO FOREIGN KEY (id_partido) REFERENCES partidos (id)

);


CREATE TABLE colegiados (
    id INTEGER,
    nombre VARCHAR2(255),
    apellido1 VARCHAR2(255),
    apellido2 VARCHAR2(255),

    -- CLAVE PRIMARIA --
    CONSTRAINT PK_ARBITROS PRIMARY KEY (id),

);


CREATE TABLE arbitros(
    id INTEGER,
    id_colegiado INTEGER,

    -- CLAVE PRIMARIA ARBITROS -- 
    CONSTRAINT PK_ARBITROS PRIMARY KEY (id),

    -- FOREIGN KEY A COLEGIADOS --
    CONSTRAINT FK_COLEGIADOS_ARBITROS FOREIGN KEY (id_colegiado) REFERENCES colegiados(id)

);

CREATE TABLE jueces_linea(
    id INTEGER,
    id_colegiado INTEGER,

    -- CLAVE PRIMARIA JUECES LINEA --
    CONSTRAINT PK_JUECES_LINEA PRIMARY KEY (id),

    -- FOREIGN KEY A COLEGIADOS --
    CONSTRAINT FK_COLEGIADOS_JUECES_L FOREIGN KEY (id_colegiado) REFERENCES colegiados(id)

);


CREATE TABLE estadios (
    id INTEGER,
    aforo INTEGER,
    nombre VARCHAR2(255),

    -- CLAVE PRIMARIA --
    CONSTRAINT PK_ESTADIO PRIMARY KEY (id)
);

--INDICES --
CREATE INDEX i_nombre_equipo ON equipos(nombre);
CREATE INDEX i_nombre_jugador ON jugadores(nombre);
CREATE INDEX i_fecha_partido ON partidos(fecha);
CREATE INDEX i_arbitro ON arbitros(nombre);
CREATE INDEX i_estadio ON estadios(nombre);

