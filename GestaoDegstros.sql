-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema gastos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gastos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gastos` DEFAULT CHARACTER SET utf8 ;
USE `gastos` ;

-- -----------------------------------------------------
-- Table `gastos`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gastos`.`Usuario` (
  `idusuario` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `senha` VARCHAR(60) NOT NULL,
  `tipo` INT NOT NULL,
  `status` INT NULL,
  `dataCadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gastos`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gastos`.`Tipo` (
  `idTipo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `creditoDebito` INT NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gastos`.`Credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gastos`.`Credito` (
  `idCredito` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATE NULL,
  `descricao` VARCHAR(90) NULL,
  `dataCadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario_idusuario` INT NOT NULL,
  `Tipo_idTipo` INT NOT NULL,
  PRIMARY KEY (`idCredito`),
  INDEX `fk_Credito_Usuario_idx` (`Usuario_idusuario` ASC),
  INDEX `fk_Credito_Tipo1_idx` (`Tipo_idTipo` ASC),
  CONSTRAINT `fk_Credito_Usuario`
    FOREIGN KEY (`Usuario_idusuario`)
    REFERENCES `gastos`.`Usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Credito_Tipo1`
    FOREIGN KEY (`Tipo_idTipo`)
    REFERENCES `gastos`.`Tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gastos`.`Debito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gastos`.`Debito` (
  `idDebito` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATE NULL,
  `descricao` VARCHAR(90) NULL,
  `dataCadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario_idusuario` INT NOT NULL,
  `Tipo_idTipo` INT NOT NULL,
  PRIMARY KEY (`idDebito`),
  INDEX `fk_Debito_Usuario1_idx` (`Usuario_idusuario` ASC),
  INDEX `fk_Debito_Tipo1_idx` (`Tipo_idTipo` ASC),
  CONSTRAINT `fk_Debito_Usuario1`
    FOREIGN KEY (`Usuario_idusuario`)
    REFERENCES `gastos`.`Usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Debito_Tipo1`
    FOREIGN KEY (`Tipo_idTipo`)
    REFERENCES `gastos`.`Tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
