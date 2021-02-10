-

CREATE TABLE `contact_manager`.`contacts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `date_update` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `contact_manager`.`updates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contact_id` INT NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  `update_date` DATETIME NOT NULL,
  `update_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `contact_manager`.`contacts` 
ADD INDEX `first_name` (`first_name` ASC) INVISIBLE,
ADD INDEX `last_name` (`last_name` ASC) VISIBLE;
;

DROP TRIGGER IF EXISTS `contact_manager`.`contacts_AFTER_INSERT`;

DELIMITER $$
USE `contact_manager`$$
CREATE DEFINER = CURRENT_USER TRIGGER `contact_manager`.`contacts_AFTER_INSERT` AFTER INSERT ON `contacts` FOR EACH ROW
BEGIN
INSERT INTO updates (update_date, update_type, contact, contact_id)
VALUES (now(), "new user", CONCAT(NEW.first_name,' ', NEW.last_name), NEW.id);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `contact_manager`.`contacts_AFTER_UPDATE`;

DELIMITER $$
USE `contact_manager`$$
CREATE DEFINER = CURRENT_USER TRIGGER `contact_manager`.`contacts_AFTER_UPDATE` AFTER UPDATE ON `contacts` FOR EACH ROW
BEGIN
INSERT INTO updates (update_date, update_type, contact, contact_id)
VALUES (now(), "contact was updated", CONCAT(NEW.first_name,' ', NEW.last_name),  NEW.id);
END$$
DELIMITER ;

ALTER TABLE `contact_manager`.`contacts` 
CHANGE COLUMN `date_update` `date_update` VARCHAR(45) NULL DEFAULT 'null' ;



USE `contact_manager`;
DROP procedure IF EXISTS `get_contacts_with_total_updates`;

DELIMITER $$
USE `contact_manager`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contacts_with_total_updates`()
BEGIN
select contacts.id, contacts.first_name, contacts.last_name, contacts.state, contacts.city, contacts.street, contacts.email, contacts.phone, contacts.postal_code, date_update,
count(updates.contact_id) as total_updates 
from contacts inner join updates on updates.contact_id = contacts.id group by contacts.id order by contacts.last_name;
END$$

DELIMITER ;



