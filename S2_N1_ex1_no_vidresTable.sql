-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema S2_N1_ex1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `S2_N1_ex1` ;

-- -----------------------------------------------------
-- Schema S2_N1_ex1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `S2_N1_ex1` DEFAULT CHARACTER SET utf8 ;
USE `S2_N1_ex1` ;

-- -----------------------------------------------------
-- Table `S2_N1_ex1`.`proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N1_ex1`.`proveidors` (
  `proveidors_id` INT NOT NULL AUTO_INCREMENT,
  `prov_address` VARCHAR(45) NOT NULL,
  `prov_phone` VARCHAR(45) NOT NULL,
  `prov_fax` VARCHAR(45) NULL,
  `prov_nif` VARCHAR(45) NOT NULL,
  `prov_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`proveidors_id`),
  UNIQUE INDEX `prov_nif_UNIQUE` (`prov_nif` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N1_ex1`.`montura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N1_ex1`.`montura` (
  `montura_id` INT NOT NULL AUTO_INCREMENT,
  `montura_type` VARCHAR(45) NOT NULL DEFAULT 'flotante, pasta, metalica',
  `montura_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`montura_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N1_ex1`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N1_ex1`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(45) NOT NULL,
  `client_address` VARCHAR(45) NULL,
  `client_phone` VARCHAR(45) NULL,
  `client_email` VARCHAR(255) NULL,
  `client_registration` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `client_referred_by` INT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_client_client1_idx` (`client_referred_by` ASC) VISIBLE,
  CONSTRAINT `fk_client_client1`
    FOREIGN KEY (`client_referred_by`)
    REFERENCES `S2_N1_ex1`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N1_ex1`.`seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N1_ex1`.`seller` (
  `seller_id` INT NOT NULL AUTO_INCREMENT,
  `seller_name` VARCHAR(45) NULL,
  PRIMARY KEY (`seller_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N1_ex1`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N1_ex1`.`marca` (
  `marca_id` INT NOT NULL AUTO_INCREMENT,
  `marca_name` VARCHAR(45) NULL,
  `proveidors_id` INT NOT NULL,
  PRIMARY KEY (`marca_id`, `proveidors_id`),
  INDEX `fk_marca_proveidors1_idx` (`proveidors_id` ASC) VISIBLE,
  CONSTRAINT `fk_marca_proveidors1`
    FOREIGN KEY (`proveidors_id`)
    REFERENCES `S2_N1_ex1`.`proveidors` (`proveidors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N1_ex1`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N1_ex1`.`ulleres` (
  `ulleres_id` INT NOT NULL AUTO_INCREMENT,
  `ull_preu` DECIMAL NOT NULL,
  `montura_id` INT NOT NULL,
  `vidre_right_color` VARCHAR(45) NOT NULL,
  `vidre_right_grad` INT NOT NULL,
  `vidre_left_color` VARCHAR(45) NOT NULL,
  `vidre_left_grad` INT NOT NULL,
  `client_id` INT NULL,
  `seller_id` INT NULL COMMENT 'If null the glass has not been sold yet',
  `marca_id` INT NOT NULL,
  `ulleres_sale_date` DATETIME NULL,
  PRIMARY KEY (`ulleres_id`, `montura_id`, `marca_id`),
  INDEX `fk_ulleres_montura1_idx` (`montura_id` ASC) VISIBLE,
  INDEX `fk_ulleres_client1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_ulleres_seller1_idx` (`seller_id` ASC) VISIBLE,
  INDEX `fk_ulleres_marca1_idx` (`marca_id` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_montura1`
    FOREIGN KEY (`montura_id`)
    REFERENCES `S2_N1_ex1`.`montura` (`montura_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `S2_N1_ex1`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_seller1`
    FOREIGN KEY (`seller_id`)
    REFERENCES `S2_N1_ex1`.`seller` (`seller_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_marca1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `S2_N1_ex1`.`marca` (`marca_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
