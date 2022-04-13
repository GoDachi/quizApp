-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `user_mail` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_avtar` VARCHAR(100) NULL,
  `is_admin` TINYINT NOT NULL,
  `created_at` DATE NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Quiz` (
  `quiz_id` INT NOT NULL,
  `quiz_name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(100) NULL,
  PRIMARY KEY (`quiz_id`),
  UNIQUE INDEX `quiz_id_UNIQUE` (`quiz_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Question` (
  `ques_id` INT NOT NULL,
  `ques_text` VARCHAR(100) NOT NULL,
  `quiz_id` INT NOT NULL,
  `ans_id` INT NOT NULL,
  `points` INT NOT NULL,
  `Quiz_quiz_id` INT NOT NULL,
  UNIQUE INDEX `ques_id_UNIQUE` (`ques_id` ASC) VISIBLE,
  PRIMARY KEY (`ques_id`, `Quiz_quiz_id`),
  UNIQUE INDEX `ques_text_UNIQUE` (`ques_text` ASC) VISIBLE,
  INDEX `fk_Question_Quiz1_idx` (`Quiz_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_Quiz1`
    FOREIGN KEY (`Quiz_quiz_id`)
    REFERENCES `mydb`.`Quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Option` (
  `option_id` INT NOT NULL,
  `ques_id` INT NOT NULL,
  `option_text` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `option_id_UNIQUE` (`option_id` ASC) VISIBLE,
  PRIMARY KEY (`option_id`, `ques_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Score` (
  `quiz_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `score` INT NOT NULL,
  PRIMARY KEY (`quiz_id`, `user_id`),
  UNIQUE INDEX `quiz_id_UNIQUE` (`quiz_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_has_User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_has_User` (
  `User_user_id` INT NOT NULL,
  `User_user_id1` INT NOT NULL,
  PRIMARY KEY (`User_user_id`, `User_user_id1`),
  INDEX `fk_User_has_User_User1_idx` (`User_user_id1` ASC) VISIBLE,
  INDEX `fk_User_has_User_User_idx` (`User_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_User_User`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_User_User1`
    FOREIGN KEY (`User_user_id1`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_has_User1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_has_User1` (
  `User_user_id` INT NOT NULL,
  `User_user_id1` INT NOT NULL,
  PRIMARY KEY (`User_user_id`, `User_user_id1`),
  INDEX `fk_User_has_User1_User2_idx` (`User_user_id1` ASC) VISIBLE,
  INDEX `fk_User_has_User1_User1_idx` (`User_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_User1_User1`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_User1_User2`
    FOREIGN KEY (`User_user_id1`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_plays_Quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_plays_Quiz` (
  `User_user_id` INT NOT NULL,
  `Quiz_quiz_id` INT NOT NULL,
  PRIMARY KEY (`User_user_id`, `Quiz_quiz_id`),
  INDEX `fk_User_has_Quiz_Quiz1_idx` (`Quiz_quiz_id` ASC) VISIBLE,
  INDEX `fk_User_has_Quiz_User1_idx` (`User_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Quiz_User1`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `mydb`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Quiz_Quiz1`
    FOREIGN KEY (`Quiz_quiz_id`)
    REFERENCES `mydb`.`Quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question_has_Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Question_has_Question` (
  `Question_ques_id` INT NOT NULL,
  `Question_Quiz_quiz_id` INT NOT NULL,
  `Question_ques_id1` INT NOT NULL,
  `Question_Quiz_quiz_id1` INT NOT NULL,
  PRIMARY KEY (`Question_ques_id`, `Question_Quiz_quiz_id`, `Question_ques_id1`, `Question_Quiz_quiz_id1`),
  INDEX `fk_Question_has_Question_Question2_idx` (`Question_ques_id1` ASC, `Question_Quiz_quiz_id1` ASC) VISIBLE,
  INDEX `fk_Question_has_Question_Question1_idx` (`Question_ques_id` ASC, `Question_Quiz_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_has_Question_Question1`
    FOREIGN KEY (`Question_ques_id` , `Question_Quiz_quiz_id`)
    REFERENCES `mydb`.`Question` (`ques_id` , `Quiz_quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_has_Question_Question2`
    FOREIGN KEY (`Question_ques_id1` , `Question_Quiz_quiz_id1`)
    REFERENCES `mydb`.`Question` (`ques_id` , `Quiz_quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question_has_Option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Question_has_Option` (
  `Question_ques_id` INT NOT NULL,
  `Question_Quiz_quiz_id` INT NOT NULL,
  `Option_option_id` INT NOT NULL,
  `Option_ques_id` INT NOT NULL,
  PRIMARY KEY (`Question_ques_id`, `Question_Quiz_quiz_id`, `Option_option_id`, `Option_ques_id`),
  INDEX `fk_Question_has_Option_Option1_idx` (`Option_option_id` ASC, `Option_ques_id` ASC) VISIBLE,
  INDEX `fk_Question_has_Option_Question1_idx` (`Question_ques_id` ASC, `Question_Quiz_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_has_Option_Question1`
    FOREIGN KEY (`Question_ques_id` , `Question_Quiz_quiz_id`)
    REFERENCES `mydb`.`Question` (`ques_id` , `Quiz_quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_has_Option_Option1`
    FOREIGN KEY (`Option_option_id` , `Option_ques_id`)
    REFERENCES `mydb`.`Option` (`option_id` , `ques_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question_has_Option1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Question_has_Option1` (
  `Question_ques_id` INT NOT NULL,
  `Question_Quiz_quiz_id` INT NOT NULL,
  `Option_option_id` INT NOT NULL,
  `Option_ques_id` INT NOT NULL,
  PRIMARY KEY (`Question_ques_id`, `Question_Quiz_quiz_id`, `Option_option_id`, `Option_ques_id`),
  INDEX `fk_Question_has_Option1_Option1_idx` (`Option_option_id` ASC, `Option_ques_id` ASC) VISIBLE,
  INDEX `fk_Question_has_Option1_Question1_idx` (`Question_ques_id` ASC, `Question_Quiz_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_has_Option1_Question1`
    FOREIGN KEY (`Question_ques_id` , `Question_Quiz_quiz_id`)
    REFERENCES `mydb`.`Question` (`ques_id` , `Quiz_quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_has_Option1_Option1`
    FOREIGN KEY (`Option_option_id` , `Option_ques_id`)
    REFERENCES `mydb`.`Option` (`option_id` , `ques_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Score_has_Score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Score_has_Score` (
  `Score_quiz_id` INT NOT NULL,
  `Score_quiz_id1` INT NOT NULL,
  PRIMARY KEY (`Score_quiz_id`, `Score_quiz_id1`),
  INDEX `fk_Score_has_Score_Score2_idx` (`Score_quiz_id1` ASC) VISIBLE,
  INDEX `fk_Score_has_Score_Score1_idx` (`Score_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Score_has_Score_Score1`
    FOREIGN KEY (`Score_quiz_id`)
    REFERENCES `mydb`.`Score` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Score_has_Score_Score2`
    FOREIGN KEY (`Score_quiz_id1`)
    REFERENCES `mydb`.`Score` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_plays_Quiz_has_Score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_plays_Quiz_has_Score` (
  `Score_quiz_id` INT NOT NULL,
  `Score_user_id` INT NOT NULL,
  `User_plays_Quiz_User_user_id` INT NOT NULL,
  `User_plays_Quiz_Quiz_quiz_id` INT NOT NULL,
  PRIMARY KEY (`Score_quiz_id`, `Score_user_id`, `User_plays_Quiz_User_user_id`, `User_plays_Quiz_Quiz_quiz_id`),
  INDEX `fk_Score_has_User_plays_Quiz_User_plays_Quiz1_idx` (`User_plays_Quiz_User_user_id` ASC, `User_plays_Quiz_Quiz_quiz_id` ASC) VISIBLE,
  INDEX `fk_Score_has_User_plays_Quiz_Score1_idx` (`Score_quiz_id` ASC, `Score_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Score_has_User_plays_Quiz_Score1`
    FOREIGN KEY (`Score_quiz_id` , `Score_user_id`)
    REFERENCES `mydb`.`Score` (`quiz_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Score_has_User_plays_Quiz_User_plays_Quiz1`
    FOREIGN KEY (`User_plays_Quiz_User_user_id` , `User_plays_Quiz_Quiz_quiz_id`)
    REFERENCES `mydb`.`User_plays_Quiz` (`User_user_id` , `Quiz_quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
