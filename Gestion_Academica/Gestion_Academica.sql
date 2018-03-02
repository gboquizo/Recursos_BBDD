-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Ciclos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciclos` (
  `Ciclos` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Ciclos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Grupos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `aula` VARCHAR(10) NULL,
  `idCiclo` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC),
  INDEX `fk_Grupos_Ciclos_idx` (`idCiclo` ASC),
  CONSTRAINT `fk_Grupos_Ciclos`
    FOREIGN KEY (`idCiclo`)
    REFERENCES `mydb`.`Ciclos` (`Ciclos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumnos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NULL,
  `email` VARCHAR(100) NOT NULL,
  `idGrupo` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `idAlumnos` (`nombre` ASC),
  INDEX `fk_Alumnos_Grupos1_idx` (`idGrupo` ASC),
  CONSTRAINT `fk_Alumnos_Grupos1`
    FOREIGN KEY (`idGrupo`)
    REFERENCES `mydb`.`Grupos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignaturas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nhoras` VARCHAR(45) NULL,
  `Grupos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC),
  INDEX `fk_Asignaturas_Grupos1_idx` (`Grupos_id` ASC),
  CONSTRAINT `fk_Asignaturas_Grupos1`
    FOREIGN KEY (`Grupos_id`)
    REFERENCES `mydb`.`Grupos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Notas` (
  `Alumnos_id` INT NOT NULL,
  `Asignaturas_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `1Ev` INT NULL,
  `2Ev` INT NULL,
  `3Ev` INT NULL,
  `Final` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Alumnos_has_Asignaturas_Asignaturas1_idx` (`Asignaturas_id` ASC),
  INDEX `fk_Alumnos_has_Asignaturas_Alumnos1_idx` (`Alumnos_id` ASC),
  CONSTRAINT `fk_Alumnos_has_Asignaturas_Alumnos1`
    FOREIGN KEY (`Alumnos_id`)
    REFERENCES `mydb`.`Alumnos` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_has_Asignaturas_Asignaturas1`
    FOREIGN KEY (`Asignaturas_id`)
    REFERENCES `mydb`.`Asignaturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`imparte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`imparte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idGrupos` INT NOT NULL,
  `idProfesores` INT NOT NULL,
  `idAsignaturas` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idGrupos_idx` (`idGrupos` ASC),
  INDEX `idProfesores_idx` (`idProfesores` ASC),
  INDEX `idAsignaturas_idx` (`idAsignaturas` ASC),
  CONSTRAINT `idGrupos`
    FOREIGN KEY (`idGrupos`)
    REFERENCES `mydb`.`Grupos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProfesores`
    FOREIGN KEY (`idProfesores`)
    REFERENCES `mydb`.`Profesores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAsignaturas`
    FOREIGN KEY (`idAsignaturas`)
    REFERENCES `mydb`.`Asignaturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delegados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Delegados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idAlumnos` INT NOT NULL,
  `idGrupos` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `Grupos_idx` (`idGrupos` ASC),
  INDEX `Alumnos_idx` (`idAlumnos` ASC),
  UNIQUE INDEX `idAlumnos_UNIQUE` (`idAlumnos` ASC),
  UNIQUE INDEX `idGrupos_UNIQUE` (`idGrupos` ASC),
  CONSTRAINT `Grupos`
    FOREIGN KEY (`idGrupos`)
    REFERENCES `mydb`.`Grupos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Alumnos`
    FOREIGN KEY (`idAlumnos`)
    REFERENCES `mydb`.`Alumnos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
