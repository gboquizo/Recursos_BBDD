CREATE OR REPLACE FORCE VIEW "CLASIFICACION" ("NOMBRE", "PJ", "PG", "PE", "PP", "PUNTOS", "GOLES_FAVOR", "GOLES_CONTRA", "DIFERENCIA_GOLES") AS 
  SELECT NOMBRE AS "Nombre del equipo", 
  PJ as "Partidos jugados", 
  PG as "Partidos ganados", 
  PE as "Partidos empatados", 
  PP as "Partidos perdidos", 
  PUNTOS as "Puntos", 
  GOLES_FAVOR as "Goles a favor", 
  GOLES_CONTRA as "Goles en contra", 
  DIFERENCIA_GOLES as "Diferencia de goles"  
FROM EQUIPOS ORDER BY PUNTOS DESC, DIFERENCIA_GOLES DESC, GOLES_FAVOR DESC