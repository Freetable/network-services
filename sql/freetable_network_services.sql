SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `Freetable` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

USE `Freetable` ;

-- -----------------------------------------------------
-- Table `Freetable`.`users`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`users` ;

CREATE TABLE IF NOT EXISTS `Freetable`.`users` (
  `WWUSERID` CHAR(128) NOT NULL ,
	`join_date` DATE NOT NULL ,
  `email` VARCHAR(96) NOT NULL DEFAULT '' ,
  `email_public` BOOL DEFAULT FALSE,
  `nickname` VARCHAR(32) NOT NULL DEFAULT '' ,
  `password` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'SHA512' ,
  `first_name` VARCHAR(32) NOT NULL DEFAULT '' ,
  `first_name_public` BOOL DEFAULT FALSE,
  `last_name` VARCHAR(32) NOT NULL DEFAULT '' ,
  `last_name_public` BOOL DEFAULT FALSE,
  `short_description` VARCHAR(1024) NOT NULL DEFAULT '' ,
  `short_description_public` BOOL DEFAULT FALSE,
  `long_description` TEXT,
	`long_description_public BOOL DEFAULT FALSE,
  `avatar_blob` BLOB NULL ,
  `avatar_type` VARCHAR(3) NULL COMMENT 'file extension' ,
  `sprite_pallet_blob` BLOB NULL ,
  `sprite_pallet_type` VARCHAR(3) NULL COMMENT 'file extension' ,
  `model_blob` BLOB NULL ,
  `model_type` VARCHAR(3) NULL COMMENT 'file extension' ,
  `sessionid` CHAR(128) NULL DEFAULT NULL ,
  PRIMARY KEY (`WWUSERID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`users_to_urls`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`users_to_urls` ;

CREATE TABLE IF NOT EXISTS `Freetable`.`users_to_urls` (
  `WWUSERID` CHAR(128) NOT NULL ,
  `icon` VARCHAR(384) NOT NULL ,
  `link` VARCHAR(384) NOT NULL ,
  PRIMARY KEY (`WWUSERID`) ,
  FOREIGN KEY (`WWUSERID`) REFERENCES `Freetable`.`users` (`WWUSERID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`users_favorites`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`users_favorites` ;

CREATE TABLE IF NOT EXISTS `Freetable`.`users_favorites` (
  `WWUSERID` CHAR(128) NOT NULL ,
  `url` VARCHAR(384) NOT NULL ,
  PRIMARY KEY (`WWUSERID`, `url`) ,
  FOREIGN KEY (`WWUSERID`) REFERENCES `Freetable`.`users` (`WWUSERID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`files`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`files` ;

CREATE TABLE IF NOT EXISTS `Freetable`.`files` (
  `WWFILEID` CHAR(128) NOT NULL ,
  `random_hash` CHAR(128) NOT NULL , 
  `title` VARCHAR(256) NOT NULL DEFAULT 'Unknown' ,
  `artist` VARCHAR(256) NOT NULL DEFAULT 'Unknown' ,
  `album` VARCHAR(256) NOT NULL DEFAULT 'Unknown' ,
  `year` DATE NULL DEFAULT NULL ,
  `url` VARCHAR(384) NULL DEFAULT NULL ,
  `md5` CHAR(32) NOT NULL DEFAULT '' ,
  `sha1` CHAR(160) NOT NULL DEFAULT '' ,
  `sha512` CHAR(128) NOT NULL DEFAULT '' ,
  `upload_datetime` DATETIME ,
  PRIMARY KEY (`WWFILEID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`file_network`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`file_network` ;

CREATE  TABLE IF NOT EXISTS `Freetable`.`file_network` (
  `file_network` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `network_name` VARCHAR(384) NOT NULL DEFAULT '' ,
  `network_info_url` VARCHAR(384) NOT NULL DEFAULT '' ,
  `contact_name` VARCHAR(96) NOT NULL DEFAULT '' ,
  `contact_email` VARCHAR(96) NOT NULL DEFAULT '' ,
  `contact_url` VARCHAR(384) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`file_network`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`playlists`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`playlists` ;

CREATE  TABLE IF NOT EXISTS `Freetable`.`playlists` (
  `WWFILEID` CHAR(128) NOT NULL ,
  `WWUSERID` CHAR(128) NOT NULL ,
  `playlist_number` INT UNSIGNED NOT NULL ,
  `order_number` INT NOT NULL ,
  `tmp_order_number` INT NOT NULL ,
  `file_network` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`WWFILEID`, `WWUSERID`) ,
  FOREIGN KEY (`WWFILEID`) REFERENCES `Freetable`.`files` (`WWFILEID`),
  FOREIGN KEY (`WWUSERID`) REFERENCES `Freetable`.`users` (`WWUSERID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`playlist_to_name`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`playlist_to_name` ;

CREATE  TABLE IF NOT EXISTS `Freetable`.`playlist_to_name` (
  `PLUID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `playlist_number` INT UNSIGNED NOT NULL ,
  `playlist_name` VARCHAR(64) NOT NULL ,
  `WWUSERID` CHAR(128) NOT NULL ,
  PRIMARY KEY (`PLUID`, `WWUSERID`, `playlist_number`) ,
  FOREIGN KEY (`WWUSERID`) REFERENCES `Freetable`.`users` (`WWUSERID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`file_to_servers`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`file_to_servers` ;

CREATE  TABLE IF NOT EXISTS `Freetable`.`file_to_servers` (
  `WWFILEID` CHAR(128) NOT NULL ,
  `url` VARCHAR(384) NOT NULL ,
  `last_verified` DATETIME ,
  `surrogate_key` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`surrogate_key`) ,
  FOREIGN KEY (`WWFILEID`) REFERENCES `Freetable`.`files` (`WWFILEID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`servers`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`servers` ;

CREATE  TABLE IF NOT EXISTS `Freetable`.`servers` (
  `WWSERVERID` CHAR(128) NOT NULL ,
  `name` VARCHAR(384) NOT NULL ,
  `description` VARCHAR(1024) NOT NULL ,
  `url` VARCHAR(384) NOT NULL ,
  `last_verified` DATETIME ,
  PRIMARY KEY (`WWSERVERID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Freetable`.`users_current_playlist`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Freetable`.`users_current_playlist` ;

CREATE  TABLE IF NOT EXISTS `Freetable`.`users_current_playlist` (
  `WWUSERID` CHAR(128) NOT NULL ,
  `playlist_number` INT UNSIGNED NULL ,
  PRIMARY KEY (`WWUSERID`) ,
  FOREIGN KEY (`WWUSERID`) REFERENCES `Freetable`.`users` (`WWUSERID`) )
ENGINE = InnoDB;

INSERT INTO file_network SET network_name='Freetable', network_info_url='http://www.freetable.info', contact_name='Stephanie Sunshine', contact_url='http://www.freetable.info';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
