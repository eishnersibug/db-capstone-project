-- MySQL Script generated by MySQL Workbench
-- Thu Jan 18 18:57:31 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db-capstone-project` DEFAULT CHARACTER SET utf8 ;
USE `db-capstone-project` ;

-- -----------------------------------------------------
-- Table `db-capstone-project`.`Customer Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Customer Details` (
  `CustomerID` INT NOT NULL,
  `First Name` VARCHAR(45) NOT NULL,
  `Last Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Contact Number` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL,
  `Booking Time` DATETIME NOT NULL,
  `Table Number` INT NOT NULL,
  `Number of Guests` INT NOT NULL,
  `Comments` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`BookingID`),
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `db-capstone-project`.`Customer Details` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisines` VARCHAR(45) NOT NULL,
  `Starters` VARCHAR(45) NOT NULL,
  `Main Course` VARCHAR(45) NOT NULL,
  `Drinks` VARCHAR(45) NOT NULL,
  `Dessert` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Orders` (
  `OrderID` INT NOT NULL,
  `Order Date` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `Total Cost` DECIMAL(2,0) NOT NULL,
  `Order Priority` INT NOT NULL,
  `Discount` DECIMAL(2,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `Customer to Orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db-capstone-project`.`Customer Details` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Menu Items`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db-capstone-project`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Staff Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Staff Info` (
  `StaffID` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Order Delivery Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Order Delivery Status` (
  `StatusID` INT NOT NULL,
  `Prepare Time` INT NOT NULL,
  `Ready to Serve?` VARCHAR(45) NOT NULL,
  INDEX `OrdersID_idx` (`StatusID` ASC) VISIBLE,
  PRIMARY KEY (`StatusID`),
  CONSTRAINT `OrdersID`
    FOREIGN KEY (`StatusID`)
    REFERENCES `db-capstone-project`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Staff`
    FOREIGN KEY (`StatusID`)
    REFERENCES `db-capstone-project`.`Staff Info` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
