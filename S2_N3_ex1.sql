-- MySQL Workbench Synchronization
-- Generated: 2021-05-23 13:13
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Casa

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `s2_n3_ex1`.`artists` 
DROP FOREIGN KEY `fk_artists_artists1`;

ALTER TABLE `s2_n3_ex1`.`users` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`playlists` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`subscriptions` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`cards` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `exp_month` `exp_month` TINYINT(2) NOT NULL ,
CHANGE COLUMN `exp_year` `exp_year` TINYINT(2) NOT NULL ;

ALTER TABLE `s2_n3_ex1`.`paypal` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`payments` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD INDEX `fk_payments_subscriptions1_idx` (`subscriptions_id` ASC) VISIBLE,
DROP INDEX `fk_payments_subscriptions1_idx` ;
;

ALTER TABLE `s2_n3_ex1`.`artists` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `artists_id`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
DROP INDEX `fk_artists_artists1_idx` ;
;

ALTER TABLE `s2_n3_ex1`.`albums` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`songs` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`users_has_subscriptions` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`playlists_has_songs` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `s2_n3_ex1`.`artists_has_artists` (
  `artists_id` INT(11) NOT NULL,
  `artists_id1` INT(11) NOT NULL,
  PRIMARY KEY (`artists_id`, `artists_id1`),
  INDEX `fk_artists_has_artists_artists2_idx` (`artists_id1` ASC) VISIBLE,
  INDEX `fk_artists_has_artists_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_artists_has_artists_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `s2_n3_ex1`.`artists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artists_has_artists_artists2`
    FOREIGN KEY (`artists_id1`)
    REFERENCES `s2_n3_ex1`.`artists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `s2_n3_ex1`.`users_has_songs` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`users_has_albums` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`payments_has_cards` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`payments_has_paypal` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `s2_n3_ex1`.`users_has_artists` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
