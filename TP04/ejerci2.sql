-- MySQL Script generated by MySQL Workbench
-- Tue Nov 29 06:18:48 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ejercicio2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ejercicio2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejerci2` DEFAULT CHARACTER SET = utf8mb4;
USE `Ejerci2` ;

-- -----------------------------------------------------
-- Table `Ejerci2`.`Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejerci2`.`Localidad` (
  `ID_Localidad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Codigo_Postal` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_Localidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejerci2`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejerci2`.`Provincia` (
  `ID_Provincia` INT NOT NULL,
  `Nombre_Provincia` VARCHAR(45) NOT NULL,
  `Localidad_ID_Localidad` INT NOT NULL,
  PRIMARY KEY (`ID_Provincia`),
  CONSTRAINT `fk_Provincia_Localidad1`
    FOREIGN KEY (`Localidad_ID_Localidad`)
    REFERENCES `Ejerci2`.`Localidad` (`ID_Localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Provincia_Localidad1_idx` ON `Ejerci2`.`Provincia` (`Localidad_ID_Localidad` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Ejerci2`.`País`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejerci2`.`País` (
  `ID_País` INT NOT NULL,
  `Nombre_pais` VARCHAR(45) NOT NULL,
  `Provincia_ID_Provincia` INT NOT NULL,
  PRIMARY KEY (`ID_País`),
  CONSTRAINT `fk_País_Provincia1`
    FOREIGN KEY (`Provincia_ID_Provincia`)
    REFERENCES `Ejerci2`.`Provincia` (`ID_Provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_País_Provincia1_idx` ON `Ejerci2`.`País` (`Provincia_ID_Provincia` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Ejerci2`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejerci2`.`Empleado` (
  `ID_Empleado` INT NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Fecha_Alta` VARCHAR(45) NOT NULL,
  `Localidad_ID_Localidad` INT NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  CONSTRAINT `fk_Empleado_Localidad1`
    FOREIGN KEY (`Localidad_ID_Localidad`)
    REFERENCES `Ejerci2`.`Localidad` (`ID_Localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Empleado_Localidad1_idx` ON `Ejerci2`.`Empleado` (`Localidad_ID_Localidad` ASC) VISIBLE;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
