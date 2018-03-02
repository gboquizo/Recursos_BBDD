create index idx_ciclos on Ciclos(Ciclos);
create index idx_alumnos on Alumnos(nombre);
create index idx_emailalumno on Alumnos(email);
create index idx_grupos on Grupos(nombre);
create index idx_grupoAula on Grupos(aula);
create index idx_grupoCiclo on Grupos(ciclo);
create index idx_asignaturas on Asignaturas(nombre);
create index idx_asignaturasH on Asignaturas(nhoras);
create index idx_notas1ev on Notas(1ev);
create index idx_notas2ev on Notas(2ev);
create index idx_notas3ev on Notas(3ev);
create index idx_notasFinal on Notas(final);
create index idx_Profesores on Profesores (nombre);

