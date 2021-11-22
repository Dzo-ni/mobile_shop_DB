-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mobile_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mobile_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mobile_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `mobile_shop` ;

-- -----------------------------------------------------
-- Table `mobile_shop`.`user_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`user_status` (
  `user_status_id` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`user_role` (
  `user_role_id` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `stripe_customer_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(255) NOT NULL,
  `user_status_id` TINYINT(1) NOT NULL DEFAULT 1,
  `user_role_id` TINYINT(1) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_status_id_idx` (`user_status_id` ASC) VISIBLE,
  INDEX `fk_user_user_role1_idx` (`user_role_id` ASC) VISIBLE,
  INDEX `fk_user_customer1_idx` (`customer_id` ASC) VISIBLE,
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_status_id`
    FOREIGN KEY (`user_status_id`)
    REFERENCES `mobile_shop`.`user_status` (`user_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_role1`
    FOREIGN KEY (`user_role_id`)
    REFERENCES `mobile_shop`.`user_role` (`user_role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mobile_shop`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`email_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`email_status` (
  `email_status_id` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`email` (
  `email_id` INT NOT NULL AUTO_INCREMENT,
  `email_address` VARCHAR(100) NOT NULL,
  `activation_code` VARCHAR(255) NOT NULL,
  `email_status_id` TINYINT(1) NOT NULL,
  `on_mailing` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_customer_registered` TINYINT(1) NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`email_id`),
  INDEX `fk_email_email_status1_idx` (`email_status_id` ASC) VISIBLE,
  UNIQUE INDEX `email_address_UNIQUE` (`email_address` ASC) VISIBLE,
  INDEX `fk_email_customer1_idx` (`customer_id` ASC) VISIBLE,
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_email_email_status1`
    FOREIGN KEY (`email_status_id`)
    REFERENCES `mobile_shop`.`email_status` (`email_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_email_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mobile_shop`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) BINARY NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_address_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mobile_shop`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`order_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`order_status` (
  `order_status_id` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `po_number` VARCHAR(45) NOT NULL,
  `stripe_pi` VARCHAR(255) NOT NULL,
  `subtotal_price` DECIMAL(12,2) NOT NULL,
  `total_price` DECIMAL(12,2) NOT NULL,
  `order_status_id` TINYINT(1) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_order_status1_idx` (`order_status_id` ASC) VISIBLE,
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_order_status1`
    FOREIGN KEY (`order_status_id`)
    REFERENCES `mobile_shop`.`order_status` (`order_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mobile_shop`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(120) NOT NULL,
  `product_brand` VARCHAR(100) NOT NULL,
  `product_price` DECIMAL(8,2) NOT NULL,
  `product_ram` CHAR(5) NOT NULL,
  `product_storage` VARCHAR(50) NOT NULL,
  `product_camera` VARCHAR(20) NOT NULL,
  `product_image` VARCHAR(255) NOT NULL,
  `product_thumbnail` VARCHAR(255) NOT NULL,
  `product_status` BIT(1) NOT NULL DEFAULT 1,
  `exposed` BIT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`order_detail` (
  `order_detail_id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `mobile_shop`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `mobile_shop`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`stock` (
  `stock_id` INT NOT NULL AUTO_INCREMENT,
  `quantity` MEDIUMINT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`stock_id`),
  INDEX `fk_stock_product1_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_stock_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mobile_shop`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`reset_password`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`reset_password` (
  `reset_password_id` INT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(32) NOT NULL,
  `email_id` INT NOT NULL,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`reset_password_id`),
  INDEX `fk_reset_password_email1_idx` (`email_id` ASC) VISIBLE,
  CONSTRAINT `fk_reset_password_email1`
    FOREIGN KEY (`email_id`)
    REFERENCES `mobile_shop`.`email` (`email_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_shop`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_shop`.`event` (
  `event_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` ENUM('email') NOT NULL,
  `data` TEXT NOT NULL,
  `status` ENUM('pending', 'started', 'failed', 'done') NULL,
  PRIMARY KEY (`event_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
