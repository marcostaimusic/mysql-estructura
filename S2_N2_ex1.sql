-- MySQL Workbench Synchronization
-- Generated: 2021-05-20 11:38
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Casa

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `S2_N2_ex1` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_emaill` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_birthdate` DATE NOT NULL,
  `user_gender` VARCHAR(45) NULL DEFAULT 'M, F, NB' COMMENT 'Male, Female, Non-Binary',
  `user_country` VARCHAR(45) NOT NULL,
  `user_postcode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_emaill_UNIQUE` (`user_emaill` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`videos` (
  `video_id` INT(11) NOT NULL AUTO_INCREMENT,
  `video_title` VARCHAR(45) NOT NULL,
  `video_descr` TEXT(300) NULL DEFAULT NULL,
  `video_size_mb` FLOAT(11) NULL DEFAULT NULL,
  `video_filename` VARCHAR(45) NULL DEFAULT NULL,
  `video_duration` TIME NULL DEFAULT NULL,
  `video_thumbnail` BLOB NULL DEFAULT NULL,
  `video_views` INT(11) NULL DEFAULT NULL,
  `video_state` VARCHAR(45) NULL DEFAULT NULL,
  `video_pub_date` DATETIME NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_id`, `user_id`),
  INDEX `fk_videos_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `S2_N2_ex1`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`channels` (
  `channel_id` INT(11) NOT NULL AUTO_INCREMENT,
  `channel_name` VARCHAR(45) NOT NULL,
  `channel_descr` TEXT(300) NULL DEFAULT NULL,
  `channel_creation` DATETIME NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `user_id`),
  UNIQUE INDEX `channel_name_UNIQUE` (`channel_name` ASC) VISIBLE,
  INDEX `fk_channels_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channels_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `S2_N2_ex1`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`playlists` (
  `playlist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` VARCHAR(45) NOT NULL,
  `playlist_creation` DATETIME NULL DEFAULT NULL,
  `playlist_state` TINYINT(4) NOT NULL COMMENT 'true = public\nfalse = private',
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_id`, `user_id`),
  UNIQUE INDEX `playlist_name_UNIQUE` (`playlist_name` ASC) VISIBLE,
  INDEX `fk_playlists_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `S2_N2_ex1`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`tags` (
  `tag_id` INT(11) NOT NULL,
  `tag_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE INDEX `tag_name_UNIQUE` (`tag_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`comments` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `comment_text` TEXT(300) NOT NULL,
  `comment_creation` DATETIME NULL DEFAULT NULL,
  `playlist_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`comment_id`, `playlist_id`, `user_id`),
  INDEX `fk_comments_playlists1_idx` (`playlist_id` ASC, `user_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_playlists1`
    FOREIGN KEY (`playlist_id` , `user_id`)
    REFERENCES `S2_N2_ex1`.`playlists` (`playlist_id` , `user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`videos_has_tags` (
  `video_id` INT(11) NOT NULL,
  `tag_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_id`, `tag_id`),
  INDEX `fk_videos_has_tags_tags1_idx` (`tag_id` ASC) VISIBLE,
  INDEX `fk_videos_has_tags_videos1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_has_tags_videos1`
    FOREIGN KEY (`video_id`)
    REFERENCES `S2_N2_ex1`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_tags_tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `S2_N2_ex1`.`tags` (`tag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`playlists_has_videos` (
  `playlist_id` INT(11) NOT NULL,
  `video_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_id`, `video_id`),
  INDEX `fk_playlists_has_videos_videos1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_playlists_has_videos_playlists1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_has_videos_playlists1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `S2_N2_ex1`.`playlists` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlists_has_videos_videos1`
    FOREIGN KEY (`video_id`)
    REFERENCES `S2_N2_ex1`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`channels_has_subscribers` (
  `channel_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `user_id`),
  INDEX `fk_channels_has_users_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_channels_has_users_channels1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_channels_has_users_channels1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `S2_N2_ex1`.`channels` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_channels_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `S2_N2_ex1`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`users_like_comments` (
  `comment_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `isLike` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`, `user_id`),
  INDEX `fk_comments_has_users_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_comments_has_users_comments1_idx` (`comment_id` ASC) VISIBLE,
  UNIQUE INDEX `isLike_UNIQUE` (`isLike` ASC) VISIBLE,
  CONSTRAINT `fk_comments_has_users_comments1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `S2_N2_ex1`.`comments` (`comment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `S2_N2_ex1`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `S2_N2_ex1`.`users_like_videos` (
  `user_id` INT(11) NOT NULL,
  `video_id` INT(11) NOT NULL,
  `isLike` TINYINT(1) NULL DEFAULT NULL COMMENT '1 = like\n0 = dislike',
  PRIMARY KEY (`user_id`, `video_id`),
  INDEX `fk_users_has_videos_videos1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_users_has_videos_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_videos_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `S2_N2_ex1`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_videos_videos1`
    FOREIGN KEY (`video_id`)
    REFERENCES `S2_N2_ex1`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
