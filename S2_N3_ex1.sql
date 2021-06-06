-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema S2_N3_ex1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema S2_N3_ex1
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `S2_N3_ex1`;
CREATE SCHEMA IF NOT EXISTS `S2_N3_ex1` DEFAULT CHARACTER SET utf8 ;
USE `S2_N3_ex1` ;

-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `birthdate` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NULL DEFAULT 'm, f, nb',
  `country` VARCHAR(45) NULL,
  `post_code` VARCHAR(45) NULL,
  `subscription_type` VARCHAR(45) NULL DEFAULT 'free, premium',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`playlists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `songs_number` INT NULL,
  `created` DATETIME NULL,
  `state` VARCHAR(45) NOT NULL DEFAULT 'active, erased',
  `state_modified_date` DATETIME NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_playlists_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `S2_N3_ex1`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`subscriptions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NOT NULL,
  `renovation_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`cards` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(16) NOT NULL,
  `exp_month` TINYINT(2) NOT NULL,
  `exp_year` TINYINT(2) NOT NULL,
  `code` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`paypal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`paypal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`payments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image` BLOB NULL,
  `genre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`albums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` YEAR(4) NULL,
  `image` BLOB NULL,
  `artists_id` INT NOT NULL,
  PRIMARY KEY (`id`, `artists_id`),
  INDEX `fk_albums_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_albums_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `S2_N3_ex1`.`artists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`songs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `duration` TIME NULL,
  `views` INT NULL,
  `albums_id` INT NOT NULL,
  `artists_id` INT NOT NULL,
  PRIMARY KEY (`id`, `albums_id`, `artists_id`),
  INDEX `fk_songs_albums1_idx` (`albums_id` ASC) VISIBLE,
  INDEX `fk_songs_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_albums1`
    FOREIGN KEY (`albums_id`)
    REFERENCES `S2_N3_ex1`.`albums` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_songs_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `S2_N3_ex1`.`artists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`users_has_subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`users_has_subscriptions` (
  `users_id` INT NOT NULL,
  `subscriptions_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `subscriptions_id`),
  INDEX `fk_users_has_subscriptions_subscriptions1_idx` (`subscriptions_id` ASC) VISIBLE,
  INDEX `fk_users_has_subscriptions_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_subscriptions_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `S2_N3_ex1`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_subscriptions_subscriptions1`
    FOREIGN KEY (`subscriptions_id`)
    REFERENCES `S2_N3_ex1`.`subscriptions` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`subscriptions_has_payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`subscriptions_has_payments` (
  `subscriptions_id` INT NOT NULL,
  `payments_id` INT NOT NULL,
  PRIMARY KEY (`subscriptions_id`, `payments_id`),
  INDEX `fk_subscriptions_has_payments_payments1_idx` (`payments_id` ASC) VISIBLE,
  INDEX `fk_subscriptions_has_payments_subscriptions1_idx` (`subscriptions_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscriptions_has_payments_subscriptions1`
    FOREIGN KEY (`subscriptions_id`)
    REFERENCES `S2_N3_ex1`.`subscriptions` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_subscriptions_has_payments_payments1`
    FOREIGN KEY (`payments_id`)
    REFERENCES `S2_N3_ex1`.`payments` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`playlists_has_songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`playlists_has_songs` (
  `playlists_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `song_added_date` DATE NULL,
  PRIMARY KEY (`playlists_id`, `songs_id`, `users_id`),
  INDEX `fk_playlists_has_songs_songs1_idx` (`songs_id` ASC) VISIBLE,
  INDEX `fk_playlists_has_songs_playlists1_idx` (`playlists_id` ASC) VISIBLE,
  INDEX `fk_playlists_has_songs_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_has_songs_playlists1`
    FOREIGN KEY (`playlists_id`)
    REFERENCES `S2_N3_ex1`.`playlists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlists_has_songs_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES `S2_N3_ex1`.`songs` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlists_has_songs_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `S2_N3_ex1`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`artists_has_artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`artists_has_artists` (
  `artists_id` INT NOT NULL,
  `artists_id1` INT NOT NULL,
  PRIMARY KEY (`artists_id`, `artists_id1`),
  INDEX `fk_artists_has_artists_artists2_idx` (`artists_id1` ASC) VISIBLE,
  INDEX `fk_artists_has_artists_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_artists_has_artists_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `S2_N3_ex1`.`artists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_artists_has_artists_artists2`
    FOREIGN KEY (`artists_id1`)
    REFERENCES `S2_N3_ex1`.`artists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`users_has_songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`users_has_songs` (
  `users_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `songs_id`),
  INDEX `fk_users_has_songs_songs1_idx` (`songs_id` ASC) VISIBLE,
  INDEX `fk_users_has_songs_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_songs_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `S2_N3_ex1`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_songs_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES `S2_N3_ex1`.`songs` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`users_has_albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`users_has_albums` (
  `users_id` INT NOT NULL,
  `albums_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `albums_id`),
  INDEX `fk_users_has_albums_albums1_idx` (`albums_id` ASC) VISIBLE,
  INDEX `fk_users_has_albums_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_albums_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `S2_N3_ex1`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_albums_albums1`
    FOREIGN KEY (`albums_id`)
    REFERENCES `S2_N3_ex1`.`albums` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`payments_has_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`payments_has_cards` (
  `payments_id` INT NOT NULL,
  `cards_id` INT NOT NULL,
  PRIMARY KEY (`payments_id`, `cards_id`),
  INDEX `fk_payments_has_cards_cards1_idx` (`cards_id` ASC) VISIBLE,
  INDEX `fk_payments_has_cards_payments1_idx` (`payments_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_has_cards_payments1`
    FOREIGN KEY (`payments_id`)
    REFERENCES `S2_N3_ex1`.`payments` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payments_has_cards_cards1`
    FOREIGN KEY (`cards_id`)
    REFERENCES `S2_N3_ex1`.`cards` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`payments_has_paypal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`payments_has_paypal` (
  `payments_id` INT NOT NULL,
  `paypal_id` INT NOT NULL,
  PRIMARY KEY (`payments_id`, `paypal_id`),
  INDEX `fk_payments_has_paypal_paypal1_idx` (`paypal_id` ASC) VISIBLE,
  INDEX `fk_payments_has_paypal_payments1_idx` (`payments_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_has_paypal_payments1`
    FOREIGN KEY (`payments_id`)
    REFERENCES `S2_N3_ex1`.`payments` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payments_has_paypal_paypal1`
    FOREIGN KEY (`paypal_id`)
    REFERENCES `S2_N3_ex1`.`paypal` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `S2_N3_ex1`.`users_has_artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S2_N3_ex1`.`users_has_artists` (
  `users_id` INT NOT NULL,
  `artists_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `artists_id`),
  INDEX `fk_users_has_artists_artists1_idx` (`artists_id` ASC) VISIBLE,
  INDEX `fk_users_has_artists_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_artists_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `S2_N3_ex1`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_artists_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `S2_N3_ex1`.`artists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
