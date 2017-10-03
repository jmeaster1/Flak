-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema flakdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `flakdb` ;

-- -----------------------------------------------------
-- Schema flakdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flakdb` DEFAULT CHARACTER SET utf8 ;
USE `flakdb` ;

-- -----------------------------------------------------
-- Table `flak_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flak_group` ;

CREATE TABLE IF NOT EXISTS `flak_group` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(60) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `admin` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_user` ;

CREATE TABLE IF NOT EXISTS `group_user` (
  `group_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`group_id`, `user_id`),
  INDEX `fk_group_user_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_group_user_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `flak_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_user_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conversation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conversation` ;

CREATE TABLE IF NOT EXISTS `conversation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `group_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `group_id`),
  INDEX `fk_converation_group_id_idx` (`group_id` ASC),
  CONSTRAINT `fk_conversation_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `flak_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` VARCHAR(500) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `conv_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `conv_id`),
  INDEX `fk_post_conv_id_idx` (`conv_id` ASC),
  INDEX `fk_post_user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_conv_id`
    FOREIGN KEY (`conv_id`)
    REFERENCES `conversation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE TABLE IF NOT EXISTS `type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  `group_id` INT UNSIGNED NOT NULL,
  `type_id` INT UNSIGNED NOT NULL,
  `timestamp` DATETIME NULL,
  `assigned` TINYINT(1) NOT NULL DEFAULT 0,
  `complete` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `group_id`, `type_id`),
  INDEX `fk_activity_group_id_idx` (`group_id` ASC),
  INDEX `fk_activity_type_id_idx` (`type_id` ASC),
  CONSTRAINT `fk_activity_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `flak_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_type_id`
    FOREIGN KEY (`type_id`)
    REFERENCES `type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_activity` ;

CREATE TABLE IF NOT EXISTS `user_activity` (
  `user_id` INT UNSIGNED NOT NULL,
  `activity_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `activity_id`),
  INDEX `fk_user_activity_activity_id_idx` (`activity_id` ASC),
  CONSTRAINT `fk_user_activity_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_activity_activity_id`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qrl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qrl` ;

CREATE TABLE IF NOT EXISTS `qrl` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(60) NULL,
  `group_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `group_id`),
  INDEX `fk_qrl_group_id_idx` (`group_id` ASC),
  CONSTRAINT `fk_qrl_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `flak_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(60) NULL,
  `qrl_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `qrl_id`),
  INDEX `fk_contact_qrl_id_idx` (`qrl_id` ASC),
  CONSTRAINT `fk_contact_qrl_id`
    FOREIGN KEY (`qrl_id`)
    REFERENCES `qrl` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `phone_number`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phone_number` ;

CREATE TABLE IF NOT EXISTS `phone_number` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(60) NOT NULL,
  `number` INT NOT NULL,
  `contact_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `contact_id`),
  INDEX `fk_phone_number_contact_id_idx` (`contact_id` ASC),
  CONSTRAINT `fk_phone_number_contact_id`
    FOREIGN KEY (`contact_id`)
    REFERENCES `contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'flakadmin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO user1;
 DROP USER user1;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user1';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `flak_group`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `flak_group` (`id`, `name`) VALUES (1, 'Flak Development Team');
INSERT INTO `flak_group` (`id`, `name`) VALUES (2, 'The Simpsons');
INSERT INTO `flak_group` (`id`, `name`) VALUES (3, 'Smith Family');
INSERT INTO `flak_group` (`id`, `name`) VALUES (4, 'Rugby Team');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (1, 'Jimmy', 'pass1', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (2, 'Doug', 'pass1', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (3, 'Daniel', 'pass1', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (4, 'Meira', 'pass1', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (5, 'Homer', 'pass1', 0);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (6, 'SueSmith', 'pass1', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (7, 'BobSmith', 'pass1', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (8, 'TommySmith', 'pass1', 0);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (9, 'KimmySmith', 'pass1', 0);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (10, 'Marge', 'pass1', 1);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (11, 'Maggie', 'pass1', 0);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (12, 'Bart', 'pass1', 0);
INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES (13, 'Lisa', 'pass1', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (1, 1);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (1, 2);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (1, 3);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (1, 4);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (2, 5);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (4, 1);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (4, 5);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (3, 6);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (3, 7);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (3, 8);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (3, 9);
INSERT INTO `group_user` (`group_id`, `user_id`) VALUES (2, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `conversation`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `conversation` (`id`, `title`, `group_id`) VALUES (1, 'Hello Team!', 1);
INSERT INTO `conversation` (`id`, `title`, `group_id`) VALUES (2, 'Family Meeting', 3);
INSERT INTO `conversation` (`id`, `title`, `group_id`) VALUES (3, 'Clean the car', 3);
INSERT INTO `conversation` (`id`, `title`, `group_id`) VALUES (4, 'Practice Tuesday', 4);
INSERT INTO `conversation` (`id`, `title`, `group_id`) VALUES (5, 'Away game - Ft Collins', 4);
INSERT INTO `conversation` (`id`, `title`, `group_id`) VALUES (6, 'Eat a donut', 2);
INSERT INTO `conversation` (`id`, `title`, `group_id`) VALUES (7, 'Feed Dog', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `post` (`id`, `timestamp`, `message`, `user_id`, `conv_id`) VALUES (1, '2017-12-31 23:59:59', 'Hey, team! Let\'s go build a killer app!', 1, 1);
INSERT INTO `post` (`id`, `timestamp`, `message`, `user_id`, `conv_id`) VALUES (2, '2017-10-6 08:30:00', 'We\'ll meet in the kitchen at 10:00', 6, 2);
INSERT INTO `post` (`id`, `timestamp`, `message`, `user_id`, `conv_id`) VALUES (3, '2017-10-8 10:00:00', 'Kids clean car today', 7, 3);
INSERT INTO `post` (`id`, `timestamp`, `message`, `user_id`, `conv_id`) VALUES (4, '2017-10-10 9:30:30', 'Carpool to practice w Homer', 1, 4);
INSERT INTO `post` (`id`, `timestamp`, `message`, `user_id`, `conv_id`) VALUES (5, '2017-10-12 12:00:00', 'Bring first-aid kit to game', 5, 5);
INSERT INTO `post` (`id`, `timestamp`, `message`, `user_id`, `conv_id`) VALUES (6, '2017-10-20 04:15:30', 'Don\'t eat it all in one bite', 5, 6);
INSERT INTO `post` (`id`, `timestamp`, `message`, `user_id`, `conv_id`) VALUES (7, '2017-10-11 09:45:00', 'Remember to feed Santa\'s Little Helper', 10, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `type`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `type` (`id`, `name`) VALUES (1, 'task');
INSERT INTO `type` (`id`, `name`) VALUES (2, 'event');
INSERT INTO `type` (`id`, `name`) VALUES (3, 'shopping');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `activity` (`id`, `name`, `description`, `group_id`, `type_id`, `timestamp`, `assigned`, `complete`) VALUES (1, 'Garbage', 'Take out garbage', 1, 1, NULL, DEFAULT, DEFAULT);
INSERT INTO `activity` (`id`, `name`, `description`, `group_id`, `type_id`, `timestamp`, `assigned`, `complete`) VALUES (2, 'Dishes', 'Wash dishes', 1, 1, NULL, DEFAULT, DEFAULT);
INSERT INTO `activity` (`id`, `name`, `description`, `group_id`, `type_id`, `timestamp`, `assigned`, `complete`) VALUES (3, 'Meeting', 'Family Meeting', 1, 2, NULL, DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `user_activity` (`user_id`, `activity_id`) VALUES (1, 1);
INSERT INTO `user_activity` (`user_id`, `activity_id`) VALUES (2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `qrl`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `qrl` (`id`, `description`, `group_id`) VALUES (1, 'Doc\'s office', 1);
INSERT INTO `qrl` (`id`, `description`, `group_id`) VALUES (2, 'Homer\'s Office', 2);
INSERT INTO `qrl` (`id`, `description`, `group_id`) VALUES (3, 'Coach', 4);
INSERT INTO `qrl` (`id`, `description`, `group_id`) VALUES (4, 'Homer\'s Cell', 4);
INSERT INTO `qrl` (`id`, `description`, `group_id`) VALUES (5, 'School', 3);
INSERT INTO `qrl` (`id`, `description`, `group_id`) VALUES (6, 'Bob\'s work', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (1, 'Meira', 'Pentermann', 'co-creator', 1);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (2, 'Doug', 'Kucera', 'co-creator', 1);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (3, 'Daniel', 'Clark', 'co-creator', 1);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (4, 'Jimmy', 'Easter', 'co-creator', 1);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (5, 'Homer', 'Simpson', 'Father', 2);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (6, 'Marge', 'Simpson', 'Mother', 2);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (7, 'Bart', 'Simpson', 'Son', 2);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (8, 'Maggie', 'Simpson', 'Baby Girl', 2);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (9, 'Lisa', 'Simpson', 'Daughter', 2);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (10, 'Bob', 'Smith', 'Work', 6);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (11, 'George', 'Halas', 'Coach', 3);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (12, 'Mary', 'Class', 'School Reception', 5);
INSERT INTO `contact` (`id`, `first_name`, `last_name`, `description`, `qrl_id`) VALUES (13, 'Homer', 'Simpson', 'Father', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `phone_number`
-- -----------------------------------------------------
START TRANSACTION;
USE `flakdb`;
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (1, 'Meira Cell', 3035555555, 1);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (2, 'Doug Home', 3033333333, 2);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (3, 'Daniel Work', 8281111111, 3);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (4, 'Jimmy iPhone', 3049999999, 4);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (5, 'Homer Office', 2222222222, 5);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (6, 'Marge Cell', 3333333333, 6);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (7, 'Bart Pager', 4444444444, 7);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (8, 'Maggie Home', 5555555555, DEFAULT);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (9, 'Lisa Work', 3434343434, DEFAULT);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (10, 'Homer\'s Cell', 9992322234, 13);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (11, 'School Office', 3334445567, 12);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (12, 'Bob\'s Office', 5557797979, 10);
INSERT INTO `phone_number` (`id`, `description`, `number`, `contact_id`) VALUES (13, 'Coach', 3334445678, 11);

COMMIT;

