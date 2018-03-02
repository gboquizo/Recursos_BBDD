
/*Generación de la BBDD y la tabla alumnos*/
CREATE SCHEMA IF NOT EXISTS `Gestion_Academica_Aleatoria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Gestion_Academica_Aleatoria` ;

CREATE TABLE IF NOT EXISTS `Gestion_Academica_Aleatoria`.`Alumnos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `apellido1` VARCHAR(200) NULL,
    `apellido2` VARCHAR(200) NULL,
    `nombre` VARCHAR(200) NULL, 
    PRIMARY KEY (`id`)
)

/*Inserción de alumnos en la BBDD*/
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Baños", "Trujillo", "Francisco José");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Carpio", "Cuevas", "Sergio");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Castro", "Muñoz", "Antonio Javier");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Castro", "Torres", "Bernabé");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("De la Mata", "Aguilar", "Alfonso");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Díaz", "Ramos", "José María");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Erencia", "Gómez", "Antonio");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Escribano", "García", "Antonio Jesús");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Estepa", "Calero", "Juan José");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Fernández", "Grande", "Álvaro");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("García", "Hinojosa", "Juan Francisco");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("García", "Roldán", "Ignacio");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("García", "Sánchez", "Mario");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("González", "León", "Ana María");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Hernández", "Pozo", "Manuel David");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Humanes", "Barrios", "David");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Luna", "Berral", "Antonio");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Martínez", "Pulido", "Domingo");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Molinero", "Moles", "José");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Murillo", "Ávila", "Pablo");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Orti", "Tordera", "Antonio");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Pérez", "Sánchez", "Juan Camilo");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Regalón", "Hernández", "Iván");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Rivera", "Sánchez", "Gema María");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Rodríguez", "Benito", "Francisco");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Romero", "Lavirgen", "Juan Francisco");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Sánchez", "Zamora", "Juan Miguel");    
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Sobota","Pérez", "Enrico");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Sotomayor", "Rueda", "Daniel");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Tirado", "Carrillo", "Miguel");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Triviño", "Angulo", "Cristina Elizabeth");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Valenzuela", "Andújar", "Manuel");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Velasco", "Gutiérrez", "Moisés");
INSERT INTO Alumnos(apellido1,apellido2,nombre) VALUES("Zamora", "Vargas", "Guzmán");


/*Funciones que generan nombre, apellido1 y apellido2*/
DROP function if exists generarNombre;
DELIMITER $$
CREATE FUNCTION generarNombre () RETURNS varchar(255)
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (39-1))), "Juan","Miguel","Jesús","Guillermo","Antonio","Javier", "Tomás", "Eduardo","José","Francisco José","Sergio","Antonio Javier", "Bernabé","Alfonso","José María","Antonio","Antonio Jesús","Juan José","Álvaro","Juan Francisco","Ignacio","Mario","Ana María","Manuel David","David","Antonio","Domingo","José","Pablo","Antonio","Juan Camilo","Iván","Gema María","Francisco","Juan Francisco","Juan Miguel","Enrico","Daniel","Miguel","Cristina Elizabeth","Manuel","Moisés","Guzmán");
END$$
DELIMITER ;

DROP function if exists generarApellido1;
DELIMITER $$
CREATE FUNCTION generarApellido1 () RETURNS varchar(255)
BEGIN
    RETURN ELT(FLOOR(1 + (RAND() * (39-1))), "Pérez", "Rodríguez","Sánchez","López","Medina","González","Mejías","Boquizo", "García","Baños", "Carpio","Cruz","Castro","De la mata","Díaz","Erencia","Escribano","Estepa","Fernández","Garrido","Gómez","Leiva","Guzmán","Hernández","Humanes","Luna","Martínez","Molinero","Murillo","Orti","Paez","Regalón","Rivera","Sevillano","Romero","Ponferrada","Sobota","Sotomayor","Tirado","Triviño","Valenzuela","Velasco","Zamora");
END$$
DELIMITER ;

DROP function if exists generarApellido2;
DELIMITER $$
CREATE FUNCTION generarApellido2 () RETURNS varchar(255)
BEGIN
    RETURN ELT(FLOOR(1 + (RAND() * (39-1))), "Pérez", "Rodríguez","Sánchez","López","Medina","González","Mejías","Boquizo", "García","Trujillo","Cuevas","Muñoz","Torres","Aguilar","Ramos","Gómez","García","Calero","Grande","Hinojosa","Roldán","Sánchez","León","Pozo","Barrios","Berral","Pulido","Moles","Ávila","Tordera","Sánchez","Hernández","Sánchez","Benito","Lavirgen","Zamora","Pérez","Rueda","Carrillo","Angulo","Andújar","Gutiérrez","Vargas");
END$$
DELIMITER ;


/*Consulta de comprobación de las funciones*/
select generarNombre() as nombre, generarApellido1() as apellido1, generarApellido2() as apellido2 ;


/**Procedimiento de inserción aleatoria de 30 alumnos*/
drop procedure if exists creaUsuarios;
delimiter $$  
    create procedure creaUsuarios()
    begin
    declare vnombre varchar(200) ;
    declare vapellido1 varchar(200) ;
    declare vapellido2 varchar(200) ;
    declare contador int default 0;

    miBucle:
    while contador < 50 do
        set vnombre = generarNombre() ;
        set vapellido1 = generarApellido1() ;
        set vapellido2 = generarApellido2();

        insert into `alumnos` (`nombre`, `apellido1`,`apellido2`) VALUES (vnombre, vapellido1, vapellido2) ;
        set contador=contador+1;
    end while;
END$$;
delimiter ;

/*Invocación del procedimiento*/
call creaUsuarios;


/*Consultas de comprobación y actualización en la bbdd*/
UPDATE Alumnos set apellido1 = 'Aguilera' where apellido1 like 'S%';
UPDATE Alumnos set apellido2 = 'Rodríguez' where apellido2 like 'S%';
select nombre, count(*) as total from Alumnos group by nombre having count(*) > 1 order by total desc limit 1
select apellido1, count(*) as total from Alumnos group by apellido1 having count(*) > 1 order by total desc limit 1 
Select * from Alumnos order by apellido1 desc
Select * from Alumnos order by apellido1 desc, apellido2
SELECT nombre,apellido1,apellido2, 
COUNT(*) AS Apariciones
FROM alumnos
GROUP BY nombre, apellido1, apellido2
HAVING ( COUNT(*)) > 1

drop trigger if exists insercion_alumnos
  
/*Disparador que evita la generación de nombres repetidos*/             
DELIMITER $$
CREATE TRIGGER insercion_alumnos BEFORE INSERT ON alumnos
FOR EACH ROW BEGIN
    IF EXISTS( SELECT nombre, apellido1, apellido2 FROM alumnos WHERE nombre = NEW.NOMBRE AND apellido1 = new.apellido1 and apellido2 = new.apellido2) THEN
        signal SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pueden insertar alumnos ya existentes', MYSQL_ERRNO = 1001;
    END IF;
END$$
DELIMITER ;


/*Disparador que evita la generación de nombres repetidos*/             
DELIMITER $$
CREATE TRIGGER actualizacion_alumnos BEFORE update ON alumnos
FOR EACH ROW BEGIN
    IF EXISTS( SELECT nombre, apellido1, apellido2 FROM alumnos WHERE nombre = NEW.NOMBRE AND apellido1 = new.apellido1 and apellido2 = new.apellido2) THEN
        signal SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pueden insertar alumnos ya existentes', MYSQL_ERRNO = 1001;
    END IF;
END$$
DELIMITER ;

UPDATE `alumnos` SET `apellido1`='Luna' ,`apellido2`='Torres',`nombre`='Felipe' WHERE id = 1

/**FASE EXPERIMENTAL**/
/*Procedimiento de actualización, en pruebas*/
drop procedure if exists actualizarUsuarios;
delimiter $$  
    create procedure actualizarUsuarios()
    begin
    declare vnombre varchar(200) ;
    declare vapellido1 varchar(200) ;
    declare vapellido2 varchar(200) ;
    declare contador int default 0;

    miBucle:
    while contador < 30 do
        set vnombre = generarNombre() ;
        set vapellido1 = generarApellido1() ;
        set vapellido2 = generarApellido2();
        set contador=contador+1;
        UPDATE `alumnos` SET `apellido1`= vapellido1,`apellido2`=vapellido2,`nombre`=vnombre where `id` > 0;
        end while;
END$$;
delimiter ;

/*Invocación del procedimiento*/
call actualizarUsuarios('José')


