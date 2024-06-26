-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clearview
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clearview` ;

-- -----------------------------------------------------
-- Schema clearview
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clearview` DEFAULT CHARACTER SET utf8mb3 ;
USE `clearview` ;

-- -----------------------------------------------------
-- Table `clearview`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`address` ;

CREATE TABLE IF NOT EXISTS `clearview`.`address` (
  `address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address_line1` VARCHAR(45) NOT NULL,
  `address_line2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`customer` ;

CREATE TABLE IF NOT EXISTS `clearview`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `c_fname` VARCHAR(45) NOT NULL,
  `c_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`order` ;

CREATE TABLE IF NOT EXISTS `clearview`.`order` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `estimated_date` DATE NOT NULL,
  `actual_date` DATE NULL DEFAULT NULL,
  `estimated_cost` FLOAT NOT NULL,
  `actual_cost` FLOAT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`cust_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`cust_order` ;

CREATE TABLE IF NOT EXISTS `clearview`.`cust_order` (
  `cust_order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cust_order_id`),
  INDEX `fk_cust_order_customer_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_cust_order_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `cust_order_fk1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `clearview`.`customer` (`customer_id`),
  CONSTRAINT `cust_order_fk2`
    FOREIGN KEY (`order_id`)
    REFERENCES `clearview`.`order` (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`customer_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`customer_address` ;

CREATE TABLE IF NOT EXISTS `clearview`.`customer_address` (
  `customer_address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`customer_address_id`),
  INDEX `fk_customer_address_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_customer_address_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_address_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `clearview`.`address` (`address_id`),
  CONSTRAINT `fk_customer_address_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `clearview`.`customer` (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`door`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`door` ;

CREATE TABLE IF NOT EXISTS `clearview`.`door` (
  `door_id` INT NOT NULL AUTO_INCREMENT,
  `slide_type` VARCHAR(45) NOT NULL,
  `slide_color` VARCHAR(45) NOT NULL,
  `wheels_num` INT NOT NULL,
  `swing_type` VARCHAR(45) NOT NULL,
  `swing_color` VARCHAR(45) NOT NULL,
  `opening_side` CHAR(2) NOT NULL,
  `handle_style` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`door_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`employee` ;

CREATE TABLE IF NOT EXISTS `clearview`.`employee` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `e_fname` VARCHAR(45) NOT NULL,
  `e_lname` VARCHAR(45) NOT NULL,
  `access_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`general_retract_control`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`general_retract_control` ;

CREATE TABLE IF NOT EXISTS `clearview`.`general_retract_control` (
  `general_retract_control_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `door_type` VARCHAR(45) NOT NULL,
  `door_mount` VARCHAR(45) NOT NULL COMMENT 'In VS Surface\\n',
  `opening_side` VARCHAR(45) NOT NULL,
  `fraction` VARCHAR(45) NOT NULL,
  `mesh` VARCHAR(45) NOT NULL,
  `mohair` VARCHAR(45) NOT NULL,
  `mohair_position` VARCHAR(45) NOT NULL,
  `top_adapter` VARCHAR(45) NOT NULL,
  `build_out` VARCHAR(45) NOT NULL,
  `btm_adapter` VARCHAR(45) NOT NULL,
  `btm_adapter_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`general_retract_control_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`hale_door`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`hale_door` ;

CREATE TABLE IF NOT EXISTS `clearview`.`hale_door` (
  `table_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `size` VARCHAR(45) NOT NULL,
  `flap_config` VARCHAR(45) NOT NULL,
  `door_color` VARCHAR(45) NOT NULL,
  `sec_cover_load` VARCHAR(45) NOT NULL,
  `second_ext_cover` CHAR(1) NOT NULL,
  `rain_cap` CHAR(1) NOT NULL,
  `flap` CHAR(1) NOT NULL,
  `thickness` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`table_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`hale_screen_model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`hale_screen_model` ;

CREATE TABLE IF NOT EXISTS `clearview`.`hale_screen_model` (
  `hale_screen_model_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_size` VARCHAR(45) NOT NULL,
  `model_color` VARCHAR(45) NOT NULL,
  `model_thickness` VARCHAR(45) NOT NULL,
  `model_has_flap` CHAR(2) NOT NULL,
  `model_placement` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hale_screen_model_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`mirage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`mirage` ;

CREATE TABLE IF NOT EXISTS `clearview`.`mirage` (
  `mirage_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage_build_out` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mirage_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`mirage_3500`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`mirage_3500` ;

CREATE TABLE IF NOT EXISTS `clearview`.`mirage_3500` (
  `mirage_3500_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage_3500_handle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mirage_3500_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`color` ;

CREATE TABLE IF NOT EXISTS `clearview`.`color` (
  `color_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `color_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`frame_size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`frame_size` ;

CREATE TABLE IF NOT EXISTS `clearview`.`frame_size` (
  `frame_size_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `size_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`frame_size_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`fastener`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`fastener` ;

CREATE TABLE IF NOT EXISTS `clearview`.`fastener` (
  `fastener_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fastener_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fastener_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`mesh`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`mesh` ;

CREATE TABLE IF NOT EXISTS `clearview`.`mesh` (
  `mesh_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mesh_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mesh_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`window`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`window` ;

CREATE TABLE IF NOT EXISTS `clearview`.`window` (
  `window_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tab_spring` VARCHAR(45) NOT NULL,
  `color_id` INT UNSIGNED NOT NULL,
  `frame_size_id` INT UNSIGNED NOT NULL,
  `fastener_id` INT UNSIGNED NOT NULL,
  `mesh_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`window_id`),
  INDEX `window_fk1_idx` (`color_id` ASC) VISIBLE,
  INDEX `window_fk2_idx` (`frame_size_id` ASC) VISIBLE,
  INDEX `window_fk3_idx` (`fastener_id` ASC) VISIBLE,
  INDEX `window_fk4_idx` (`mesh_id` ASC) VISIBLE,
  CONSTRAINT `window_fk1`
    FOREIGN KEY (`color_id`)
    REFERENCES `clearview`.`color` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `window_fk2`
    FOREIGN KEY (`frame_size_id`)
    REFERENCES `clearview`.`frame_size` (`frame_size_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `window_fk3`
    FOREIGN KEY (`fastener_id`)
    REFERENCES `clearview`.`fastener` (`fastener_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `window_fk4`
    FOREIGN KEY (`mesh_id`)
    REFERENCES `clearview`.`mesh` (`mesh_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`new_window_screen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`new_window_screen` ;

CREATE TABLE IF NOT EXISTS `clearview`.`new_window_screen` (
  `nws_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `width_inch` VARCHAR(45) NOT NULL COMMENT 'in inches',
  `height_inch` VARCHAR(45) NOT NULL COMMENT 'in inches',
  `window_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`nws_id`),
  INDEX `nws_fk1_idx` (`window_id` ASC) VISIBLE,
  CONSTRAINT `nws_fk1`
    FOREIGN KEY (`window_id`)
    REFERENCES `clearview`.`window` (`window_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`order_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`order_log` ;

CREATE TABLE IF NOT EXISTS `clearview`.`order_log` (
  `order_log_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `employee_id` INT UNSIGNED NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  `actual_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`order_log_id`),
  INDEX `fk_order_log_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_log_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_order_log_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `order_log_fk1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `clearview`.`customer` (`customer_id`),
  CONSTRAINT `order_log_fk2`
    FOREIGN KEY (`employee_id`)
    REFERENCES `clearview`.`employee` (`employee_id`),
  CONSTRAINT `order_log_fk3`
    FOREIGN KEY (`order_id`)
    REFERENCES `clearview`.`order` (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`phantom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`phantom` ;

CREATE TABLE IF NOT EXISTS `clearview`.`phantom` (
  `phantom_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `phantom_color` VARCHAR(45) NOT NULL,
  `phantom_build_out` VARCHAR(45) NOT NULL DEFAULT 'None',
  `meshlock` CHAR(1) NOT NULL,
  `phantom_mesh` VARCHAR(200) NOT NULL,
  `meshlock_mesh` VARCHAR(100) NOT NULL,
  `type_of_screen` VARCHAR(60) NOT NULL,
  `screen_color` VARCHAR(45) NOT NULL,
  `wood_type` VARCHAR(45) NOT NULL,
  `mount` VARCHAR(45) NOT NULL,
  `hembar` VARCHAR(45) NOT NULL,
  `tracks` VARCHAR(45) NOT NULL,
  `mesh` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`phantom_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`rainier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`rainier` ;

CREATE TABLE IF NOT EXISTS `clearview`.`rainier` (
  `rainier_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `est_placement` VARCHAR(45) NULL,
  `act_placement` VARCHAR(45) NULL,
  `est_housing_series` VARCHAR(45) NULL DEFAULT NULL,
  `act_housing_series` VARCHAR(45) NULL DEFAULT NULL,
  `est_drive_side` VARCHAR(45) NULL DEFAULT NULL,
  `act_drive_side` VARCHAR(45) NULL DEFAULT NULL,
  `est_hembar` VARCHAR(45) NULL DEFAULT NULL,
  `act_hembar` VARCHAR(45) NULL DEFAULT NULL,
  `est_pilebrush` VARCHAR(45) NULL DEFAULT NULL,
  `act_pilebrush` VARCHAR(45) NULL DEFAULT NULL,
  `est_brush_location` VARCHAR(45) NULL DEFAULT NULL,
  `act_brush_location` VARCHAR(45) NULL DEFAULT NULL,
  `est_cord_length` VARCHAR(45) NULL DEFAULT NULL,
  `act_cord_length` VARCHAR(45) NULL DEFAULT NULL,
  `est_mount_type` VARCHAR(45) NULL DEFAULT NULL,
  `act_mount_type` VARCHAR(45) NULL DEFAULT NULL,
  `est_top_opening_width` VARCHAR(45) NULL DEFAULT NULL,
  `act_top_opening_width` VARCHAR(45) NULL DEFAULT NULL,
  `act_top_level` VARCHAR(45) NULL DEFAULT NULL,
  `act_bottom_opening_width` VARCHAR(45) NULL DEFAULT NULL,
  `act_bottom_level` VARCHAR(45) NULL DEFAULT NULL,
  `act_left_opening_height` VARCHAR(45) NULL DEFAULT NULL,
  `act_left_plumb` VARCHAR(45) NULL DEFAULT NULL,
  `act_right_opening_height` VARCHAR(45) NULL DEFAULT NULL,
  `act_right_plumb` VARCHAR(45) NULL DEFAULT NULL,
  `est_left_buildout` VARCHAR(45) NULL DEFAULT NULL,
  `act_left_buildout` VARCHAR(45) NULL DEFAULT NULL,
  `est_right_buildout` VARCHAR(45) NULL DEFAULT NULL,
  `act_right_buildout` VARCHAR(45) NULL DEFAULT NULL,
  `est_add_buildout` VARCHAR(45) NULL DEFAULT NULL,
  `act_add_buildout` VARCHAR(45) NULL DEFAULT NULL,
  `est_left_track` VARCHAR(45) NULL DEFAULT NULL,
  `act_left_track` VARCHAR(45) NULL DEFAULT NULL,
  `est_right_track` VARCHAR(45) NULL DEFAULT NULL,
  `act_right_track` VARCHAR(45) NULL DEFAULT NULL,
  `act_starting_point` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`rainier_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`sunscreen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`sunscreen` ;

CREATE TABLE IF NOT EXISTS `clearview`.`sunscreen` (
  `sunscreen_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cast_clip` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`sunscreen_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`view_guard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`view_guard` ;

CREATE TABLE IF NOT EXISTS `clearview`.`view_guard` (
  `viewguard_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `handle_color` VARCHAR(10) NOT NULL,
  `door_type` VARCHAR(10) NOT NULL,
  `number_of_slides` INT NOT NULL,
  `color` VARCHAR(10) NOT NULL,
  `handle_style` VARCHAR(45) NOT NULL,
  `deadbolt` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`viewguard_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`wizard_smart_screen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`wizard_smart_screen` ;

CREATE TABLE IF NOT EXISTS `clearview`.`wizard_smart_screen` (
  `wizard_smart_screen_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `location_on_house` VARCHAR(45) NOT NULL,
  `placement` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `fabric_type` VARCHAR(45) NOT NULL,
  `housing_size` VARCHAR(45) NOT NULL,
  `drive_side` VARCHAR(45) NOT NULL,
  `bottom_seal` VARCHAR(45) NOT NULL,
  `zipper_color` VARCHAR(45) NOT NULL,
  `probe_color` VARCHAR(45) NOT NULL,
  `cable_length` VARCHAR(45) NOT NULL,
  `top_opening_width` VARCHAR(45) NULL DEFAULT NULL,
  `top_level` VARCHAR(45) NOT NULL,
  `bottom_opening_width` VARCHAR(45) NOT NULL,
  `bottom_level` VARCHAR(45) NOT NULL,
  `left_opening_height` VARCHAR(45) NOT NULL,
  `left_plump` VARCHAR(45) NOT NULL,
  `right_opening_height` VARCHAR(45) NOT NULL,
  `right_plump` VARCHAR(45) NOT NULL,
  `two_by_two_angle` VARCHAR(45) NOT NULL,
  `track_type` VARCHAR(45) NOT NULL,
  `track_punched` VARCHAR(45) NOT NULL,
  `starting_point` VARCHAR(45) NULL DEFAULT NULL,
  `order_width` VARCHAR(45) NOT NULL,
  `order_height` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`wizard_smart_screen_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `clearview`.`measurement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`measurement` ;

CREATE TABLE IF NOT EXISTS `clearview`.`measurement` (
  `measurement_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `measurement_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`measurement_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`nws_measurement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`nws_measurement` ;

CREATE TABLE IF NOT EXISTS `clearview`.`nws_measurement` (
  `nws_measurement_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `measurement_id` INT UNSIGNED NOT NULL,
  `nws_id` INT UNSIGNED NOT NULL,
  `width_fraction` CHAR(1) NULL,
  `width_plus_minus` CHAR(1) NULL,
  `height_fraction` CHAR(1) NULL,
  `height_plus_minus` CHAR(1) NULL,
  PRIMARY KEY (`nws_measurement_id`),
  INDEX `nws_measurement_fk1_idx` (`measurement_id` ASC) VISIBLE,
  INDEX `nws_measurement_fk2_idx` (`nws_id` ASC) VISIBLE,
  CONSTRAINT `nws_measurement_fk1`
    FOREIGN KEY (`measurement_id`)
    REFERENCES `clearview`.`measurement` (`measurement_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nws_measurement_fk2`
    FOREIGN KEY (`nws_id`)
    REFERENCES `clearview`.`new_window_screen` (`nws_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`rainier_color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`rainier_color` ;

CREATE TABLE IF NOT EXISTS `clearview`.`rainier_color` (
  `rainier_color_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rainier_id` INT UNSIGNED NOT NULL,
  `color_id` INT UNSIGNED NOT NULL,
  `est_hardware_color` CHAR(1) NULL,
  `act_hardware_color` CHAR(1) NULL,
  `est_fabric_color` CHAR(1) NULL,
  `act_fabric_color` CHAR(1) NULL,
  `est_zipper_color` CHAR(1) NULL DEFAULT NULL,
  `act_zipper_color` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`rainier_color_id`),
  INDEX `rainier_color_fk1_idx` (`rainier_id` ASC) VISIBLE,
  INDEX `rainier_color_fk2_idx` (`color_id` ASC) VISIBLE,
  CONSTRAINT `rainier_color_fk1`
    FOREIGN KEY (`rainier_id`)
    REFERENCES `clearview`.`rainier` (`rainier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rainier_color_fk2`
    FOREIGN KEY (`color_id`)
    REFERENCES `clearview`.`color` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`mirage_3500_mesh`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`mirage_3500_mesh` ;

CREATE TABLE IF NOT EXISTS `clearview`.`mirage_3500_mesh` (
  `mirage_3500_mesh_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage_3500_id` INT UNSIGNED NOT NULL,
  `mesh_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`mirage_3500_mesh_id`),
  INDEX `mirage_3500_mesh_fk1_idx` (`mirage_3500_id` ASC) VISIBLE,
  INDEX `mirage_3500_mesh_fk2_idx` (`mesh_id` ASC) VISIBLE,
  CONSTRAINT `mirage_3500_mesh_fk1`
    FOREIGN KEY (`mirage_3500_id`)
    REFERENCES `clearview`.`mirage_3500` (`mirage_3500_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mirage_3500_mesh_fk2`
    FOREIGN KEY (`mesh_id`)
    REFERENCES `clearview`.`mesh` (`mesh_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`mirage_mesh`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`mirage_mesh` ;

CREATE TABLE IF NOT EXISTS `clearview`.`mirage_mesh` (
  `mirage_mesh_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage_id` INT UNSIGNED NOT NULL,
  `mesh_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`mirage_mesh_id`),
  INDEX `mirage_mesh_fk1_idx` (`mirage_id` ASC) VISIBLE,
  INDEX `mirage_mesh_fk2_idx` (`mesh_id` ASC) VISIBLE,
  CONSTRAINT `mirage_mesh_fk1`
    FOREIGN KEY (`mirage_id`)
    REFERENCES `clearview`.`mirage` (`mirage_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mirage_mesh_fk2`
    FOREIGN KEY (`mesh_id`)
    REFERENCES `clearview`.`mesh` (`mesh_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`mirage_3500_color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`mirage_3500_color` ;

CREATE TABLE IF NOT EXISTS `clearview`.`mirage_3500_color` (
  `mirage_3500_color_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage_3500_id` INT UNSIGNED NOT NULL,
  `color_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`mirage_3500_color_id`),
  INDEX `mirage_3500_color_fk1_idx` (`mirage_3500_id` ASC) VISIBLE,
  INDEX `mirage_3500_color_fk2_idx` (`color_id` ASC) VISIBLE,
  CONSTRAINT `mirage_3500_color_fk1`
    FOREIGN KEY (`mirage_3500_id`)
    REFERENCES `clearview`.`mirage_3500` (`mirage_3500_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mirage_3500_color_fk2`
    FOREIGN KEY (`color_id`)
    REFERENCES `clearview`.`color` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clearview`.`mirage_color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clearview`.`mirage_color` ;

CREATE TABLE IF NOT EXISTS `clearview`.`mirage_color` (
  `mirage_color_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mirage_id` INT UNSIGNED NOT NULL,
  `color_id` INT UNSIGNED NOT NULL,
  `mirage_color` CHAR(1) NULL,
  `pivot_pro_color` CHAR(1) NULL,
  PRIMARY KEY (`mirage_color_id`),
  INDEX `mirage_color_fk1_idx` (`mirage_id` ASC) VISIBLE,
  INDEX `mirage_color_fk2_idx` (`color_id` ASC) VISIBLE,
  CONSTRAINT `mirage_color_fk1`
    FOREIGN KEY (`mirage_id`)
    REFERENCES `clearview`.`mirage` (`mirage_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mirage_color_fk2`
    FOREIGN KEY (`color_id`)
    REFERENCES `clearview`.`color` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
