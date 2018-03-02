CREATE SCHEMA IF NOT EXISTS `Gestion_Academica_Aleatoria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Gestion_Academica_Aleatoria` ;



CREATE TABLE IF NOT EXISTS `Gestion_Academica_Aleatoria`.`Alumnos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `apellido1` VARCHAR(200) NULL,
    `apellido2` VARCHAR(200) NULL,
    `nombre` VARCHAR(200) NULL, 
    PRIMARY KEY (`id`)
)


