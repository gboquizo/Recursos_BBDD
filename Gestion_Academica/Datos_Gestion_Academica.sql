


-- Datos Ciclos --
INSERT INTO Ciclos (Ciclos) VALUES ('DAW');
INSERT INTO Ciclos (Ciclos) VALUES ('ASIR');


-- Datos Grupos DAW --
INSERT INTO Grupos (nombre,aula,idCiclo) VALUES ('1DAW','116','DAW');
INSERT INTO Grupos (nombre,aula,idCiclo) VALUES ('2DAW','115','DAW');

-- Datos Grupos ASIR --
INSERT INTO Grupos (nombre,aula,idCiclo) VALUES ('1ASIR','113','ASIR');
INSERT INTO Grupos (nombre,aula,idCiclo) VALUES ('2ASIR','114','ASIR');

-- Datos Asignaturas 1DAW --
INSERT INTO Asignaturas (nombre,nhoras,Grupos_id) VALUES ('Base de datos',6,2);
INSERT INTO Asignaturas (nombre,nhoras,Grupos_id) VALUES ('Programación',8,2);
INSERT INTO Asignaturas (nombre,nhoras,Grupos_id) VALUES ('Lenguaje de marcas',4,2);
INSERT INTO Asignaturas (nombre,nhoras,Grupos_id) VALUES ('Entornos de desarrollo',4,2);
INSERT INTO Asignaturas (nombre,nhoras,Grupos_id) VALUES ('Sistemas informáticos',4,2);
INSERT INTO Asignaturas (nombre,nhoras,Grupos_id) VALUES ('Formación y orientación laboral',4,2);

-- Datos Asignaturas 2DAW --
INSERT INTO Asignaturas (nombre,nhoras,Grupos_id) VALUES ('Diseño web',6,3);
INSERT INTO Asignaturas (nombre,nhoras, Grupos_id) VALUES ('Desarrolo web entorno servidor',8,3);
INSERT INTO Asignaturas (nombre,nhoras, Grupos_id) VALUES ('Desarrolo web entorno cliente',6,3);
INSERT INTO Asignaturas (nombre,nhoras, Grupos_id) VALUES ('Despliegue de aplicaciones webs',3,3);
INSERT INTO Asignaturas (nombre,nhoras, Grupos_id) VALUES ('Empresa e iniciativa emprendedora',4,3);
INSERT INTO Asignaturas (nombre,nhoras, Grupos_id) VALUES ('Hora libre configuración',3,3);

-- Datos Alumnos --
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Sixto', 'Naranjo','Marin','sixto@gmail.com',2);
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Arturo','Tabares' , 'Mora','arturo@gmail.com',2);
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Jaime','Lopez','Tobón','jaime@gmail.com',2);

INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Jorge', 'Uribe','Botero','jorge@gmail.com',2);
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Gonzalo', 'López' , 'Gaviria','gonzaloLopez@gmail.com',2);
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Héctor', 'Manuel','Pineda','hectorManuel@gmail.com',2);

INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Alejandro', 'Alzate','Garcés','alejandro@gmail.com',2);
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Jorge', 'León' , 'Ruiz','jorgeLeon@gmail.com',2);
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Saúl', 'Diaz','Hernadez','saulDiaz@gmail.com',2);
INSERT INTO Alumnos (nombre,apellido1,apellido2,email,idGrupo) VALUES ('Oscar', 'Vidal' , 'Reyes','oscarReyes@gmail.com',2);
 

-- Notas para base de datos --
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (1,1,7,5,6,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (2,1,6,7,8,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (3,1,5,7,8,7);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (4,1,8,5,5,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (5,1,3,8,7,9);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (6,1,4,5,6,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (7,1,7,5,5,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (8,1,6,6,8,8);

-- Notas para programación -- 
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (1,2,7,5,6,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (2,2,6,7,8,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (3,2,5,7,8,7);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (4,2,8,5,5,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (5,2,3,8,7,9);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (6,2,4,5,6,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (7,2,7,5,5,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (8,2,6,6,8,8);


-- Notas para lenguaje de marcas --
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (1,3,7,5,6,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (2,3,6,7,8,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (3,3,6,4,8,7);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (4,3,8,5,7,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (5,3,3,8,7,9);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (6,3,6,5,6,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (7,3,7,6,5,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (8,3,9,6,7,8);

-- Notas para entornos de desarrollo --
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (1,4,7,5,6,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (2,4,6,7,8,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (3,4,6,4,8,7);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (4,4,8,5,7,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (5,4,3,8,7,9);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (6,4,6,5,6,8);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (7,4,7,6,5,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (8,4,9,6,7,8);

-- Notas para sistemas informáticos --
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (1,5,3,3,3,4);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (2,5,6,7,8,5);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (3,5,4,4,3,4);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (4,5,8,5,7,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (5,5,3,8,7,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (6,5,6,5,6,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (7,5,4,4,4,4);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (8,5,6,6,7,8);

-- Notas para formación y orientacion laboral --
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (1,6,4,4,5,5);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (2,6,6,7,8,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (3,6,4,4,3,4);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (4,6,8,5,7,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (5,6,3,3,3,3);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (6,6,6,5,6,6);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (7,6,4,4,4,4);
INSERT INTO Notas (Alumnos_id,Asignaturas_id,1EV,2EV,3EV,Final) VALUES (8,6,6,6,7,8);

-- Delegados grupos -- 
INSERT INTO Delegados (idAlumnos,idGrupos) VALUES (10,2);


-- Profesores -- 
INSERT INTO Profesores (nombre) VALUES ('Jose');
INSERT INTO Profesores (nombre) VALUES ('Amelia');
INSERT INTO Profesores (nombre) VALUES ('Lourdes');
INSERT INTO Profesores (nombre) VALUES ('Jaime');

-- Profesores imparten asignaturas -- 
INSERT INTO imparte(idGrupos,idProfesores,idAsignaturas) VALUES (2,1,1);
INSERT INTO imparte(idGrupos,idProfesores,idAsignaturas) VALUES (2,3,2);
INSERT INTO imparte(idGrupos,idProfesores,idAsignaturas) VALUES (2,2,3);


