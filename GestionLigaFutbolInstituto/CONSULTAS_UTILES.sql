-- Usando la funcion para scar nombre de equipo por id, sacamos los enfrentamientos.
SELECT ID, SACAR_NOMBRE_EQUIPO(IDEQUIPOLOCAL) AS 'Equipo local', GOLESLOCAL, SACAR_NOMBRE_EQUIPO(IDEQUIPOVISITANTE) AS 'Equipo Visitante', GOLESVISITANTE , fecha_hora, estado FROM PARTIDOS;

-- Sacar la clasificación ordenada por puntos, diferencia de goles y goles a favor.
SELECT * FROM EQUIPOS ORDER BY PTOS DESC , DF DESC , GF DESC;
