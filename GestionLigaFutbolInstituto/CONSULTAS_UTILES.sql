-- Usando la funcion para scar nombre de equipo por id, sacamos los enfrentamientos.
SELECT SACAR_NOMBRE_EQUIPO(IDEQUIPOLOCAL), SACAR_NOMBRE_EQUIPO(IDEQUIPOVISITANTE) FROM PARTIDOS;

-- Sacar la clasificación ordenada por puntos, diferencia de goles y goles a favor.
SELECT * FROM EQUIPOS ORDER BY PTOS DESC , DF DESC , GF DESC;
