-- MySQL Workbench Synchronization
-- Generated: 2021-05-23 12:54
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Casa

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `S2_N1_ex2` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Clients` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `post_code` VARCHAR(45) NOT NULL,
  `client_phone` VARCHAR(45) NOT NULL,
  `localidad_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `localidad_id`),
  INDEX `fk_Clients_Localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Localidad1`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `S2_N1_ex2`.`Localidad` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Localidad` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `provincia_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `provincia_id`),
  INDEX `fk_Localidad_Provincia1_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_Localidad_Provincia1`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `S2_N1_ex2`.`Provincia` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Provincia` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Products` (
  `products_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL DEFAULT 'pizza, hamburger, drink',
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `img` BLOB NULL DEFAULT NULL,
  `price` DECIMAL NOT NULL,
  `categoria_pizza_id` INT(11) NOT NULL,
  PRIMARY KEY (`products_id`),
  INDEX `fk_Products_Categorias Pizza1_idx` (`categoria_pizza_id` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Categorias Pizza1`
    FOREIGN KEY (`categoria_pizza_id`)
    REFERENCES `S2_N1_ex2`.`Categorias Pizza` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Categorias Pizza` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_time` DATETIME NOT NULL,
  `type` VARCHAR(45) NOT NULL DEFAULT 'take away, delivery',
  `price` DECIMAL NOT NULL,
  `client_id` INT(11) NOT NULL,
  `restaurant_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`, `client_id`, `restaurant_id`),
  INDEX `fk_Order_Clients_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_Order_Restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Clients`
    FOREIGN KEY (`client_id`)
    REFERENCES `S2_N1_ex2`.`Clients` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `S2_N1_ex2`.`Restaurant` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`in_order` (
  `in_order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_quantity` INT(11) NOT NULL,
  `price` DECIMAL NOT NULL,
  `order_id` INT(11) NOT NULL,
  `products_id` INT(11) NOT NULL,
  PRIMARY KEY (`in_order_id`, `order_id`, `products_id`),
  INDEX `fk_in_order_Order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_in_order_Products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_in_order_Order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `S2_N1_ex2`.`Order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_in_order_Products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `S2_N1_ex2`.`Products` (`products_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Restaurant` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `post_code` VARCHAR(45) NOT NULL,
  `localidad_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `localidad_id`),
  INDEX `fk_Restaurant_Localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_Localidad1`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `S2_N1_ex2`.`Localidad` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`Employees` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL DEFAULT 'chef, delivery',
  `nif` VARCHAR(45) NOT NULL,
  `phone` INT(11) NOT NULL,
  `restaurant_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `restaurant_id`),
  INDEX `fk_Employees_Restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `S2_N1_ex2`.`Restaurant` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

CREATE TABLE IF NOT EXISTS `S2_N1_ex2`.`shipping` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `time` DATETIME NOT NULL,
  `employee_id` INT(11) NOT NULL,
  `restaurant_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `client_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `employee_id`, `restaurant_id`),
  INDEX `fk_shipping_Employees1_idx` (`employee_id` ASC, `restaurant_id` ASC) INVISIBLE,
  INDEX `fk_shipping_Order1_idx` (`order_id` ASC, `client_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipping_Employees1`
    FOREIGN KEY (`employee_id` , `restaurant_id`)
    REFERENCES `S2_N1_ex2`.`Employees` (`id` , `restaurant_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_shipping_Order1`
    FOREIGN KEY (`order_id` , `client_id`)
    REFERENCES `S2_N1_ex2`.`Order` (`order_id` , `client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
