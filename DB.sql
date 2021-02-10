-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: contact_manager
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `date_update` varchar(45) DEFAULT 'null',
  PRIMARY KEY (`id`),
  KEY `first_name` (`first_name`) /*!80000 INVISIBLE */,
  KEY `last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (28,'Tanya','Okopnik','Israel','Tel-Aviv','Mahal street 51/6','cpklda@gmail.com','+351967076529','584521','08-02-2021'),(29,'Dina','Abramovich','Israel','Rehovot','Moshe sharet 58/5','dina@gmail.com','+351967076529','85412','08-02-2021'),(30,'Moshe','Zilberman','Israel','Tel aviv','Dereh bar lev 51','moshe@gmail.com','05498887452','0','08-02-2021'),(31,'Anastasya','Chehov','Russia','Moskva','Arbat','ana@gmail.com','03-6854521','12354','08-02-2021'),(32,'alon','livnat','israel','ramat gan','oded 5','alon@gmail.com','036545421','254123',NULL),(33,'Rivka','Levi','Israel','Tel aviv','mahal','rivka@gmail.com','035452126','258741','08-02-2021'),(34,'Katya','okopnik','Israel','Tel aviv','Mahal 51/6','katya@iranogroup.co.il','0543444594','45687','07-02-2021'),(37,'Roman','Koz','Israel','Tel aviv','Mahal','roman@gmail.com','0544352056','45108','08-02-2021'),(38,'Moshe','Katz','Israel','Petah tikva','Rambam','mo@gmail.com','254521234','258452','08-02-2021');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `contacts_AFTER_INSERT` AFTER INSERT ON `contacts` FOR EACH ROW BEGIN
INSERT INTO updates (update_date, update_type, contact, contact_id)
VALUES (now(), "new user", CONCAT(NEW.first_name,' ', NEW.last_name), NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `contacts_AFTER_UPDATE` AFTER UPDATE ON `contacts` FOR EACH ROW BEGIN
INSERT INTO updates (update_date, update_type, contact, contact_id)
VALUES (now(), "contact was updated", CONCAT(NEW.first_name,' ', NEW.last_name),  NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates` (
  `contact_id` int NOT NULL,
  `contact` varchar(45) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES (26,'roman roman@gmail.com','2021-02-07 19:48:15','new user'),(26,'Roman kozirovski','2021-02-07 19:53:50','contact was updated'),(26,'Roman Kozirovski','2021-02-07 19:54:14','contact was updated'),(27,'katya kozirovski','2021-02-07 19:54:42','new user'),(27,'Katya Kozirovski','2021-02-07 19:54:57','contact was updated'),(27,'Katya Kozirovski','2021-02-07 19:55:11','contact was updated'),(27,'Katya Kozirovski','2021-02-07 21:07:42','contact was updated'),(28,'tanya okopnik','2021-02-07 21:08:49','new user'),(28,'Tanya Okopnik','2021-02-07 21:08:59','contact was updated'),(28,'Tanya Okopnik','2021-02-07 21:10:19','contact was updated'),(28,'Tanya Okopnik','2021-02-07 21:10:26','contact was updated'),(26,'Roman Kozirovski','2021-02-07 21:12:27','contact was updated'),(26,'Roman Kozirovski','2021-02-07 21:12:30','contact was updated'),(26,'Roman Kozirovski','2021-02-07 21:21:01','contact was updated'),(29,'Dina Abramovich','2021-02-07 21:23:56','new user'),(30,'moshe zilberman','2021-02-07 21:26:35','new user'),(31,'anastasya chehov','2021-02-07 21:27:22','new user'),(32,'alon livnat','2021-02-07 21:30:34','new user'),(33,'rivka levi','2021-02-07 23:12:42','new user'),(34,'Katya katya@iranogroup.co.il','2021-02-07 23:17:14','new user'),(34,'Katya okopnik','2021-02-07 23:19:05','contact was updated'),(35,'roman kozirovski','2021-02-07 23:21:00','new user'),(36,'roman roman@gmail.com','2021-02-07 23:22:26','new user'),(37,'roman koz','2021-02-08 00:36:12','new user'),(29,'Dina Abramovich','2021-02-08 00:43:10','contact was updated'),(29,'Dina Abramovich','2021-02-08 00:44:06','contact was updated'),(29,'Dina Abramovich','2021-02-08 00:45:18','contact was updated'),(29,'Dina Abramovich','2021-02-08 00:48:31','contact was updated'),(29,'Dina Abramovich','2021-02-08 00:49:17','contact was updated'),(37,'Roman Koz','2021-02-08 00:49:58','contact was updated'),(29,'Dina Abramovich','2021-02-08 18:36:25','contact was updated'),(29,'Dina Abramovich','2021-02-08 18:36:31','contact was updated'),(37,'Roman Koz','2021-02-08 18:36:36','contact was updated'),(29,'Dina Abramovich','2021-02-08 18:38:04','contact was updated'),(29,'Dina Abramovich','2021-02-08 19:29:53','contact was updated'),(30,'Moshe Zilberman','2021-02-08 19:32:19','contact was updated'),(37,'Roman Koz','2021-02-08 20:07:11','contact was updated'),(28,'Tanya Okopnik','2021-02-08 20:38:25','contact was updated'),(28,'Tanya Okopnik','2021-02-08 20:39:31','contact was updated'),(37,'Roman Koz','2021-02-08 20:42:54','contact was updated'),(37,'Roman Koz','2021-02-08 20:45:24','contact was updated'),(37,'Roman Koz','2021-02-08 20:47:48','contact was updated'),(37,'Roman Koz','2021-02-08 20:49:18','contact was updated'),(37,'Roman Koz','2021-02-08 20:50:44','contact was updated'),(37,'Roman Koz','2021-02-08 20:55:42','contact was updated'),(37,'Roman Koz','2021-02-08 21:01:41','contact was updated'),(37,'Roman Koz','2021-02-08 21:04:55','contact was updated'),(37,'Roman Koz','2021-02-08 21:06:22','contact was updated'),(37,'Roman Koz','2021-02-08 21:57:43','contact was updated'),(31,'Anastasya Chehov','2021-02-08 21:58:23','contact was updated'),(31,'Anastasya Chehov','2021-02-08 21:58:32','contact was updated'),(33,'Rivka Levi','2021-02-08 22:01:09','contact was updated'),(38,'moshe katz','2021-02-08 22:20:33','new user'),(37,'Roman Koz','2021-02-08 22:24:39','contact was updated'),(38,'Moshe Katz','2021-02-08 22:24:47','contact was updated');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'contact_manager'
--

--
-- Dumping routines for database 'contact_manager'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_contacts_with_total_updates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contacts_with_total_updates`()
BEGIN
select contacts.id, contacts.first_name, contacts.last_name, contacts.state, contacts.city, contacts.street, contacts.email, contacts.phone, contacts.postal_code, date_update,
count(updates.contact_id) as total_updates 
from contacts inner join updates on updates.contact_id = contacts.id group by contacts.id order by contacts.last_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-09 20:11:49
