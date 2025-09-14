-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: govsite_db
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_attendance`
--

DROP TABLE IF EXISTS `accounts_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `punch_in` datetime(6) NOT NULL,
  `punch_out` datetime(6) DEFAULT NULL,
  `shift` varchar(10) NOT NULL,
  `late` tinyint(1) NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_attendance_user_id_4720ddee_fk_accounts_customuser_id` (`user_id`),
  KEY `accounts_attendance_employee_id_79e72588_fk_accounts_` (`employee_id`),
  CONSTRAINT `accounts_attendance_employee_id_79e72588_fk_accounts_` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employeeprofile` (`id`),
  CONSTRAINT `accounts_attendance_user_id_4720ddee_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_attendance`
--

LOCK TABLES `accounts_attendance` WRITE;
/*!40000 ALTER TABLE `accounts_attendance` DISABLE KEYS */;
INSERT INTO `accounts_attendance` VALUES (216,'2025-06-14','2025-06-14 16:32:00.000000','2025-06-15 00:34:00.000000','C',0,1,5),(217,'2025-06-27','2025-06-27 08:36:00.000000','2025-06-27 16:38:00.000000','B',0,1,5),(218,'2025-06-25','2025-06-25 03:34:00.000000','2025-06-25 12:37:00.000000','General',0,1,5),(219,'2025-06-15','2025-06-15 03:31:00.000000','2025-06-15 12:33:00.000000','General',0,1,5),(220,'2025-06-29','2025-06-29 16:30:00.000000','2025-06-30 00:36:00.000000','C',0,1,5),(221,'2025-06-17','2025-06-17 08:35:00.000000','2025-06-17 16:31:00.000000','B',0,1,5),(222,'2025-06-20','2025-06-20 00:44:00.000000','2025-06-20 08:34:00.000000','A',1,1,5),(223,'2025-06-12','2025-06-12 08:32:00.000000','2025-06-12 16:35:00.000000','B',0,1,5),(224,'2025-06-27','2025-06-27 03:39:00.000000','2025-06-27 12:35:00.000000','General',0,1,5),(225,'2025-06-22','2025-06-22 08:36:00.000000','2025-06-22 16:33:00.000000','B',0,1,5),(226,'2025-07-05','2025-07-05 03:39:00.000000','2025-07-05 12:41:00.000000','General',0,2,6),(227,'2025-06-28','2025-06-28 16:36:00.000000','2025-06-29 00:42:00.000000','C',0,2,6),(228,'2025-06-22','2025-06-22 08:34:00.000000','2025-06-22 16:35:00.000000','B',0,2,6),(229,'2025-07-07','2025-07-07 16:43:00.000000','2025-07-08 00:35:00.000000','C',1,2,6),(230,'2025-06-25','2025-06-25 16:34:00.000000','2025-06-26 00:30:00.000000','C',0,2,6),(231,'2025-06-15','2025-06-15 00:32:00.000000','2025-06-15 08:43:00.000000','A',0,2,6),(232,'2025-06-25','2025-06-25 03:38:00.000000','2025-06-25 12:38:00.000000','General',0,2,6),(233,'2025-07-02','2025-07-02 08:34:00.000000','2025-07-02 16:34:00.000000','B',0,2,6),(234,'2025-06-27','2025-06-27 08:37:00.000000','2025-06-27 16:40:00.000000','B',0,2,6),(235,'2025-06-23','2025-06-23 16:37:00.000000','2025-06-24 00:39:00.000000','C',0,2,6),(236,'2025-07-05','2025-07-05 03:37:00.000000','2025-07-05 12:31:00.000000','General',0,3,7),(237,'2025-06-30','2025-06-30 08:44:00.000000','2025-06-30 16:41:00.000000','B',1,3,7),(238,'2025-06-24','2025-06-24 03:36:00.000000','2025-06-24 12:43:00.000000','General',0,3,7),(239,'2025-06-28','2025-06-28 08:39:00.000000','2025-06-28 16:39:00.000000','B',0,3,7),(240,'2025-06-14','2025-06-14 03:35:00.000000','2025-06-14 12:41:00.000000','General',0,3,7),(241,'2025-06-29','2025-06-29 08:38:00.000000','2025-06-29 16:35:00.000000','B',0,3,7),(242,'2025-07-01','2025-07-01 08:38:00.000000','2025-07-01 16:32:00.000000','B',0,3,7),(243,'2025-06-24','2025-06-24 03:34:00.000000','2025-06-24 12:42:00.000000','General',0,3,7),(244,'2025-06-13','2025-06-13 08:39:00.000000','2025-06-13 16:31:00.000000','B',0,3,7),(245,'2025-07-09','2025-07-09 00:31:00.000000','2025-07-09 08:45:00.000000','A',0,3,7),(246,'2025-06-14','2025-06-14 08:41:00.000000','2025-06-14 16:43:00.000000','B',1,4,3),(247,'2025-07-05','2025-07-05 08:38:00.000000','2025-07-05 16:36:00.000000','B',0,4,3),(248,'2025-06-12','2025-06-12 03:45:00.000000','2025-06-12 12:42:00.000000','General',1,4,3),(249,'2025-06-17','2025-06-17 16:39:00.000000','2025-06-18 00:38:00.000000','C',0,4,3),(250,'2025-06-19','2025-06-19 00:36:00.000000','2025-06-19 08:39:00.000000','A',0,4,3),(251,'2025-06-18','2025-06-18 03:30:00.000000','2025-06-18 12:35:00.000000','General',0,4,3),(252,'2025-06-29','2025-06-29 08:40:00.000000','2025-06-29 16:40:00.000000','B',0,4,3),(253,'2025-06-29','2025-06-29 08:38:00.000000','2025-06-29 16:35:00.000000','B',0,4,3),(254,'2025-06-11','2025-06-11 03:30:00.000000','2025-06-11 12:45:00.000000','General',0,4,3),(255,'2025-06-20','2025-06-20 03:33:00.000000','2025-06-20 12:36:00.000000','General',0,4,3),(256,'2025-07-04','2025-07-04 03:40:00.000000','2025-07-04 12:33:00.000000','General',0,5,8),(257,'2025-06-23','2025-06-23 03:44:00.000000','2025-06-23 12:31:00.000000','General',1,5,8),(258,'2025-06-11','2025-06-11 08:43:00.000000','2025-06-11 16:39:00.000000','B',1,5,8),(259,'2025-07-07','2025-07-07 08:43:00.000000','2025-07-07 16:34:00.000000','B',1,5,8),(260,'2025-06-13','2025-06-13 00:45:00.000000','2025-06-13 08:45:00.000000','A',1,5,8),(261,'2025-06-24','2025-06-24 00:36:00.000000','2025-06-24 08:36:00.000000','A',0,5,8),(262,'2025-07-09','2025-07-09 16:43:00.000000','2025-07-10 00:30:00.000000','C',1,5,8),(263,'2025-07-08','2025-07-08 00:38:00.000000','2025-07-08 08:37:00.000000','A',0,5,8),(264,'2025-07-03','2025-07-03 08:44:00.000000','2025-07-03 16:30:00.000000','B',1,5,8),(265,'2025-06-18','2025-06-18 08:37:00.000000','2025-06-18 16:34:00.000000','B',0,5,8),(266,'2025-06-29','2025-06-29 08:34:00.000000','2025-06-29 16:39:00.000000','B',0,6,11),(267,'2025-07-01','2025-07-01 16:42:00.000000','2025-07-02 00:45:00.000000','C',1,6,11),(268,'2025-06-23','2025-06-23 03:40:00.000000','2025-06-23 12:31:00.000000','General',0,6,11),(269,'2025-07-01','2025-07-01 08:42:00.000000','2025-07-01 16:42:00.000000','B',1,6,11),(270,'2025-06-12','2025-06-12 00:39:00.000000','2025-06-12 08:39:00.000000','A',0,6,11),(271,'2025-06-30','2025-06-30 08:44:00.000000','2025-06-30 16:44:00.000000','B',1,6,11),(272,'2025-07-06','2025-07-06 03:45:00.000000','2025-07-06 12:45:00.000000','General',1,6,11),(273,'2025-06-17','2025-06-17 08:36:00.000000','2025-06-17 16:34:00.000000','B',0,6,11),(274,'2025-06-30','2025-06-30 03:31:00.000000','2025-06-30 12:37:00.000000','General',0,6,11),(275,'2025-07-07','2025-07-07 03:42:00.000000','2025-07-07 12:40:00.000000','General',1,6,11),(276,'2025-06-19','2025-06-19 03:34:00.000000','2025-06-19 12:31:00.000000','General',0,7,12),(277,'2025-06-19','2025-06-19 08:43:00.000000','2025-06-19 16:32:00.000000','B',1,7,12),(278,'2025-07-09','2025-07-09 00:42:00.000000','2025-07-09 08:35:00.000000','A',1,7,12),(279,'2025-06-16','2025-06-16 08:42:00.000000','2025-06-16 16:41:00.000000','B',1,7,12),(280,'2025-06-24','2025-06-24 00:31:00.000000','2025-06-24 08:42:00.000000','A',0,7,12),(281,'2025-07-08','2025-07-08 08:35:00.000000','2025-07-08 16:30:00.000000','B',0,7,12),(282,'2025-06-16','2025-06-16 03:32:00.000000','2025-06-16 12:38:00.000000','General',0,7,12),(283,'2025-06-23','2025-06-23 03:30:00.000000','2025-06-23 12:34:00.000000','General',0,7,12),(284,'2025-06-13','2025-06-13 16:30:00.000000','2025-06-14 00:33:00.000000','C',0,7,12),(285,'2025-06-16','2025-06-16 00:43:00.000000','2025-06-16 08:44:00.000000','A',1,7,12),(286,'2025-06-10','2025-06-10 16:43:00.000000','2025-06-11 00:32:00.000000','C',1,8,13),(287,'2025-06-17','2025-06-17 03:45:00.000000','2025-06-17 12:44:00.000000','General',1,8,13),(288,'2025-06-26','2025-06-26 16:30:00.000000','2025-06-27 00:39:00.000000','C',0,8,13),(289,'2025-06-10','2025-06-10 16:34:00.000000','2025-06-11 00:35:00.000000','C',0,8,13),(290,'2025-07-01','2025-07-01 16:45:00.000000','2025-07-02 00:41:00.000000','C',1,8,13),(291,'2025-06-19','2025-06-19 03:37:00.000000','2025-06-19 12:44:00.000000','General',0,8,13),(292,'2025-07-01','2025-07-01 03:40:00.000000','2025-07-01 12:40:00.000000','General',0,8,13),(293,'2025-06-17','2025-06-17 16:33:00.000000','2025-06-18 00:44:00.000000','C',0,8,13),(294,'2025-06-22','2025-06-22 03:34:00.000000','2025-06-22 12:43:00.000000','General',0,8,13),(295,'2025-06-23','2025-06-23 16:36:00.000000','2025-06-24 00:41:00.000000','C',0,8,13),(296,'2025-07-06','2025-07-06 00:39:00.000000','2025-07-06 08:33:00.000000','A',0,9,14),(297,'2025-07-01','2025-07-01 08:37:00.000000','2025-07-01 16:35:00.000000','B',0,9,14),(298,'2025-06-15','2025-06-15 16:36:00.000000','2025-06-16 00:31:00.000000','C',0,9,14),(299,'2025-06-27','2025-06-27 08:31:00.000000','2025-06-27 16:41:00.000000','B',0,9,14),(300,'2025-06-30','2025-06-30 16:33:00.000000','2025-07-01 00:30:00.000000','C',0,9,14),(301,'2025-06-14','2025-06-14 08:33:00.000000','2025-06-14 16:35:00.000000','B',0,9,14),(302,'2025-07-03','2025-07-03 00:39:00.000000','2025-07-03 08:33:00.000000','A',0,9,14),(303,'2025-06-14','2025-06-14 00:45:00.000000','2025-06-14 08:45:00.000000','A',1,9,14),(304,'2025-06-27','2025-06-27 00:33:00.000000','2025-06-27 08:38:00.000000','A',0,9,14),(305,'2025-06-16','2025-06-16 16:44:00.000000','2025-06-17 00:34:00.000000','C',1,9,14),(306,'2025-06-24','2025-06-24 16:34:00.000000','2025-06-25 00:31:00.000000','C',0,10,15),(307,'2025-06-27','2025-06-27 00:44:00.000000','2025-06-27 08:44:00.000000','A',1,10,15),(308,'2025-06-15','2025-06-15 00:31:00.000000','2025-06-15 08:44:00.000000','A',0,10,15),(309,'2025-06-23','2025-06-23 03:36:00.000000','2025-06-23 12:42:00.000000','General',0,10,15),(310,'2025-07-01','2025-07-01 03:32:00.000000','2025-07-01 12:36:00.000000','General',0,10,15),(311,'2025-06-20','2025-06-20 08:31:00.000000','2025-06-20 16:39:00.000000','B',0,10,15),(312,'2025-07-08','2025-07-08 16:36:00.000000','2025-07-09 00:44:00.000000','C',0,10,15),(313,'2025-07-07','2025-07-07 16:38:00.000000','2025-07-08 00:36:00.000000','C',0,10,15),(314,'2025-07-03','2025-07-03 08:41:00.000000','2025-07-03 16:34:00.000000','B',1,10,15),(315,'2025-06-13','2025-06-13 16:39:00.000000','2025-06-14 00:37:00.000000','C',0,10,15),(316,'2025-06-27','2025-06-27 08:36:00.000000','2025-06-27 16:44:00.000000','B',0,11,16),(317,'2025-07-08','2025-07-08 16:44:00.000000','2025-07-09 00:41:00.000000','C',1,11,16),(318,'2025-07-01','2025-07-01 08:30:00.000000','2025-07-01 16:38:00.000000','B',0,11,16),(319,'2025-06-20','2025-06-20 08:44:00.000000','2025-06-20 16:45:00.000000','B',1,11,16),(320,'2025-06-20','2025-06-20 00:38:00.000000','2025-06-20 08:43:00.000000','A',0,11,16),(321,'2025-06-11','2025-06-11 00:38:00.000000','2025-06-11 08:39:00.000000','A',0,11,16),(322,'2025-06-18','2025-06-18 16:31:00.000000','2025-06-19 00:39:00.000000','C',0,11,16),(323,'2025-06-20','2025-06-20 03:40:00.000000','2025-06-20 12:44:00.000000','General',0,11,16),(324,'2025-06-11','2025-06-11 08:32:00.000000','2025-06-11 16:38:00.000000','B',0,11,16),(325,'2025-06-16','2025-06-16 03:35:00.000000','2025-06-16 12:40:00.000000','General',0,11,16),(326,'2025-06-18','2025-06-18 00:42:00.000000','2025-06-18 08:30:00.000000','A',1,12,17),(327,'2025-06-17','2025-06-17 00:43:00.000000','2025-06-17 08:42:00.000000','A',1,12,17),(328,'2025-06-23','2025-06-23 03:35:00.000000','2025-06-23 12:31:00.000000','General',0,12,17),(329,'2025-06-14','2025-06-14 03:37:00.000000','2025-06-14 12:37:00.000000','General',0,12,17),(330,'2025-06-28','2025-06-28 03:39:00.000000','2025-06-28 12:43:00.000000','General',0,12,17),(331,'2025-07-04','2025-07-04 08:37:00.000000','2025-07-04 16:37:00.000000','B',0,12,17),(332,'2025-07-04','2025-07-04 03:30:00.000000','2025-07-04 12:32:00.000000','General',0,12,17),(333,'2025-06-12','2025-06-12 16:37:00.000000','2025-06-13 00:31:00.000000','C',0,12,17),(334,'2025-06-13','2025-06-13 16:35:00.000000','2025-06-14 00:30:00.000000','C',0,12,17),(335,'2025-06-19','2025-06-19 16:43:00.000000','2025-06-20 00:41:00.000000','C',1,12,17),(336,'2025-06-20','2025-06-20 16:36:00.000000','2025-06-21 00:40:00.000000','C',0,13,18),(337,'2025-06-13','2025-06-13 00:44:00.000000','2025-06-13 08:35:00.000000','A',1,13,18),(338,'2025-06-21','2025-06-21 00:36:00.000000','2025-06-21 08:39:00.000000','A',0,13,18),(339,'2025-07-06','2025-07-06 16:37:00.000000','2025-07-07 00:31:00.000000','C',0,13,18),(340,'2025-06-11','2025-06-11 16:39:00.000000','2025-06-12 00:45:00.000000','C',0,13,18),(341,'2025-06-11','2025-06-11 16:37:00.000000','2025-06-12 00:39:00.000000','C',0,13,18),(342,'2025-07-01','2025-07-01 16:40:00.000000','2025-07-02 00:36:00.000000','C',0,13,18),(343,'2025-07-06','2025-07-06 00:39:00.000000','2025-07-06 08:34:00.000000','A',0,13,18),(344,'2025-06-16','2025-06-16 03:42:00.000000','2025-06-16 12:35:00.000000','General',1,13,18),(345,'2025-06-22','2025-06-22 16:32:00.000000','2025-06-23 00:37:00.000000','C',0,13,18),(346,'2025-06-17','2025-06-17 16:38:00.000000','2025-06-18 00:31:00.000000','C',0,14,19),(347,'2025-06-14','2025-06-14 03:32:00.000000','2025-06-14 12:43:00.000000','General',0,14,19),(348,'2025-06-28','2025-06-28 03:43:00.000000','2025-06-28 12:31:00.000000','General',1,14,19),(349,'2025-06-20','2025-06-20 03:36:00.000000','2025-06-20 12:37:00.000000','General',0,14,19),(350,'2025-06-26','2025-06-26 16:42:00.000000','2025-06-27 00:36:00.000000','C',1,14,19),(351,'2025-06-30','2025-06-30 00:41:00.000000','2025-06-30 08:38:00.000000','A',1,14,19),(352,'2025-07-04','2025-07-04 16:30:00.000000','2025-07-05 00:35:00.000000','C',0,14,19),(353,'2025-06-21','2025-06-21 08:36:00.000000','2025-06-21 16:35:00.000000','B',0,14,19),(354,'2025-06-19','2025-06-19 00:39:00.000000','2025-06-19 08:38:00.000000','A',0,14,19),(355,'2025-06-19','2025-06-19 03:45:00.000000','2025-06-19 12:35:00.000000','General',1,14,19),(356,'2025-06-21','2025-06-21 03:34:00.000000','2025-06-21 12:41:00.000000','General',0,15,20),(357,'2025-06-17','2025-06-17 16:42:00.000000','2025-06-18 00:43:00.000000','C',1,15,20),(358,'2025-06-12','2025-06-12 16:34:00.000000','2025-06-13 00:44:00.000000','C',0,15,20),(359,'2025-07-01','2025-07-01 16:37:00.000000','2025-07-02 00:34:00.000000','C',0,15,20),(360,'2025-07-02','2025-07-02 08:30:00.000000','2025-07-02 16:41:00.000000','B',0,15,20),(361,'2025-06-16','2025-06-16 03:31:00.000000','2025-06-16 12:37:00.000000','General',0,15,20),(362,'2025-07-05','2025-07-05 08:45:00.000000','2025-07-05 16:36:00.000000','B',1,15,20),(363,'2025-06-17','2025-06-17 00:37:00.000000','2025-06-17 08:41:00.000000','A',0,15,20),(364,'2025-06-11','2025-06-11 00:38:00.000000','2025-06-11 08:30:00.000000','A',0,15,20),(365,'2025-06-28','2025-06-28 08:40:00.000000','2025-06-28 16:41:00.000000','B',0,15,20),(366,'2025-06-30','2025-06-30 03:31:00.000000','2025-06-30 12:36:00.000000','General',0,16,21),(367,'2025-06-13','2025-06-13 03:36:00.000000','2025-06-13 12:38:00.000000','General',0,16,21),(368,'2025-06-22','2025-06-22 03:38:00.000000','2025-06-22 12:33:00.000000','General',0,16,21),(369,'2025-06-23','2025-06-23 16:34:00.000000','2025-06-24 00:37:00.000000','C',0,16,21),(370,'2025-07-06','2025-07-06 08:41:00.000000','2025-07-06 16:37:00.000000','B',1,16,21),(371,'2025-06-21','2025-06-21 08:39:00.000000','2025-06-21 16:31:00.000000','B',0,16,21),(372,'2025-06-18','2025-06-18 00:35:00.000000','2025-06-18 08:38:00.000000','A',0,16,21),(373,'2025-07-07','2025-07-07 08:36:00.000000','2025-07-07 16:37:00.000000','B',0,16,21),(374,'2025-07-07','2025-07-07 03:38:00.000000','2025-07-07 12:35:00.000000','General',0,16,21),(375,'2025-07-09','2025-07-09 08:43:00.000000','2025-07-09 16:36:00.000000','B',1,16,21),(376,'2025-06-24','2025-06-24 08:36:00.000000','2025-06-24 16:34:00.000000','B',0,17,22),(377,'2025-07-02','2025-07-02 03:45:00.000000','2025-07-02 12:31:00.000000','General',1,17,22),(378,'2025-07-08','2025-07-08 16:33:00.000000','2025-07-09 00:44:00.000000','C',0,17,22),(379,'2025-06-23','2025-06-23 00:35:00.000000','2025-06-23 08:37:00.000000','A',0,17,22),(380,'2025-07-06','2025-07-06 00:30:00.000000','2025-07-06 08:33:00.000000','A',0,17,22),(381,'2025-07-03','2025-07-03 16:36:00.000000','2025-07-04 00:35:00.000000','C',0,17,22),(382,'2025-07-06','2025-07-06 00:40:00.000000','2025-07-06 08:40:00.000000','A',0,17,22),(383,'2025-06-20','2025-06-20 03:41:00.000000','2025-06-20 12:38:00.000000','General',1,17,22),(384,'2025-07-07','2025-07-07 00:33:00.000000','2025-07-07 08:44:00.000000','A',0,17,22),(385,'2025-06-10','2025-06-10 16:33:00.000000','2025-06-11 00:45:00.000000','C',0,17,22),(386,'2025-06-30','2025-06-30 03:34:00.000000','2025-06-30 12:36:00.000000','General',0,18,23),(387,'2025-07-07','2025-07-07 16:44:00.000000','2025-07-08 00:31:00.000000','C',1,18,23),(388,'2025-06-23','2025-06-23 00:41:00.000000','2025-06-23 08:31:00.000000','A',1,18,23),(389,'2025-06-11','2025-06-11 08:45:00.000000','2025-06-11 16:32:00.000000','B',1,18,23),(390,'2025-06-12','2025-06-12 16:31:00.000000','2025-06-13 00:36:00.000000','C',0,18,23),(391,'2025-07-07','2025-07-07 16:33:00.000000','2025-07-08 00:32:00.000000','C',0,18,23),(392,'2025-06-24','2025-06-24 16:43:00.000000','2025-06-25 00:30:00.000000','C',1,18,23),(393,'2025-06-25','2025-06-25 03:41:00.000000','2025-06-25 12:30:00.000000','General',1,18,23),(394,'2025-06-11','2025-06-11 08:30:00.000000','2025-06-11 16:32:00.000000','B',0,18,23),(395,'2025-06-29','2025-06-29 16:43:00.000000','2025-06-30 00:43:00.000000','C',1,18,23),(396,'2025-07-05','2025-07-05 08:33:00.000000','2025-07-05 16:31:00.000000','B',0,19,24),(397,'2025-07-05','2025-07-05 03:41:00.000000','2025-07-05 12:41:00.000000','General',1,19,24),(398,'2025-06-30','2025-06-30 03:30:00.000000','2025-06-30 12:34:00.000000','General',0,19,24),(399,'2025-06-13','2025-06-13 08:35:00.000000','2025-06-13 16:33:00.000000','B',0,19,24),(400,'2025-07-02','2025-07-02 00:41:00.000000','2025-07-02 08:37:00.000000','A',1,19,24),(401,'2025-06-13','2025-06-13 16:38:00.000000','2025-06-14 00:40:00.000000','C',0,19,24),(402,'2025-06-11','2025-06-11 16:32:00.000000','2025-06-12 00:33:00.000000','C',0,19,24),(403,'2025-06-20','2025-06-20 00:43:00.000000','2025-06-20 08:33:00.000000','A',1,19,24),(404,'2025-07-07','2025-07-07 08:43:00.000000','2025-07-07 16:45:00.000000','B',1,19,24),(405,'2025-06-24','2025-06-24 00:37:00.000000','2025-06-24 08:33:00.000000','A',0,19,24),(406,'2025-06-26','2025-06-26 08:37:00.000000','2025-06-26 16:39:00.000000','B',0,20,25),(407,'2025-06-18','2025-06-18 08:41:00.000000','2025-06-18 16:45:00.000000','B',1,20,25),(408,'2025-06-27','2025-06-27 03:45:00.000000','2025-06-27 12:37:00.000000','General',1,20,25),(409,'2025-06-14','2025-06-14 16:36:00.000000','2025-06-15 00:43:00.000000','C',0,20,25),(410,'2025-06-21','2025-06-21 03:44:00.000000','2025-06-21 12:38:00.000000','General',1,20,25),(411,'2025-06-27','2025-06-27 08:41:00.000000','2025-06-27 16:35:00.000000','B',1,20,25),(412,'2025-06-14','2025-06-14 16:36:00.000000','2025-06-15 00:30:00.000000','C',0,20,25),(413,'2025-06-12','2025-06-12 16:34:00.000000','2025-06-13 00:45:00.000000','C',0,20,25),(414,'2025-06-30','2025-06-30 08:32:00.000000','2025-06-30 16:36:00.000000','B',0,20,25),(415,'2025-06-22','2025-06-22 08:36:00.000000','2025-06-22 16:42:00.000000','B',0,20,25),(416,'2025-06-19','2025-06-19 00:32:00.000000','2025-06-19 08:39:00.000000','A',0,21,10),(417,'2025-06-25','2025-06-25 00:33:00.000000','2025-06-25 08:40:00.000000','A',0,21,10),(418,'2025-06-14','2025-06-14 00:36:00.000000','2025-06-14 08:45:00.000000','A',0,21,10),(419,'2025-06-19','2025-06-19 00:38:00.000000','2025-06-19 08:39:00.000000','A',0,21,10),(420,'2025-07-07','2025-07-07 08:43:00.000000','2025-07-07 16:41:00.000000','B',1,21,10),(421,'2025-07-01','2025-07-01 08:34:00.000000','2025-07-01 16:31:00.000000','B',0,21,10),(422,'2025-06-20','2025-06-20 03:37:00.000000','2025-06-20 12:35:00.000000','General',0,21,10),(423,'2025-06-11','2025-06-11 03:45:00.000000','2025-06-11 12:41:00.000000','General',1,21,10),(424,'2025-06-15','2025-06-15 00:45:00.000000','2025-06-15 08:41:00.000000','A',1,21,10),(425,'2025-06-28','2025-06-28 00:45:00.000000','2025-06-28 08:35:00.000000','A',1,21,10),(426,'2025-07-10','2025-07-10 07:07:26.184495',NULL,'General',1,1,5),(427,'2025-07-12','2025-07-12 16:25:48.471980',NULL,'General',1,1,5),(428,'2025-08-22','2025-08-22 11:35:25.718616',NULL,'General',1,1,5);
/*!40000 ALTER TABLE `accounts_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_attendancerecord`
--

DROP TABLE IF EXISTS `accounts_attendancerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_attendancerecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `punch_time` datetime(6) NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_attendancer_employee_id_5b22f6f4_fk_accounts_` (`employee_id`),
  CONSTRAINT `accounts_attendancer_employee_id_5b22f6f4_fk_accounts_` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employeeprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_attendancerecord`
--

LOCK TABLES `accounts_attendancerecord` WRITE;
/*!40000 ALTER TABLE `accounts_attendancerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_attendancerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bankdetail`
--

DROP TABLE IF EXISTS `accounts_bankdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_bankdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `ifsc_code` varchar(20) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `accounts_bankdetail_employee_id_a63b9b9c_fk_accounts_` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employeeprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bankdetail`
--

LOCK TABLES `accounts_bankdetail` WRITE;
/*!40000 ALTER TABLE `accounts_bankdetail` DISABLE KEYS */;
INSERT INTO `accounts_bankdetail` VALUES (1,'Axis Bank','321907957721','AXIS04609',1,1),(2,'State Bank of India','133181401074','STAT07457',1,2),(3,'HDFC Bank','466534483195','HDFC09381',1,3),(4,'HDFC Bank','928977356724','HDFC02341',0,4),(5,'HDFC Bank','569018676541','HDFC03254',0,5),(6,'Axis Bank','931448040355','AXIS09668',1,6),(7,'ICICI Bank','689907664424','ICIC06899',0,7),(8,'State Bank of India','601413272430','STAT04340',1,8),(9,'ICICI Bank','034577778822','ICIC07740',0,9),(10,'HDFC Bank','028592648855','HDFC02644',0,10),(11,'Punjab National Bank','967595332022','PUNJ02989',0,11),(12,'HDFC Bank','426032579613','HDFC08360',1,12),(13,'State Bank of India','612741923851','STAT03458',1,13),(14,'Punjab National Bank','739245901693','PUNJ07779',0,14),(15,'Punjab National Bank','579062125489','PUNJ01234',0,15),(16,'State Bank of India','767591550655','STAT02950',1,16),(17,'ICICI Bank','101795790719','ICIC08705',0,17),(18,'Axis Bank','997365665202','AXIS08440',0,18),(19,'State Bank of India','621046578732','STAT02410',1,19),(20,'ICICI Bank','504564656054','ICIC09948',1,20),(21,'State Bank of India','789525778850','STAT04440',0,21);
/*!40000 ALTER TABLE `accounts_bankdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$1000000$QlNIXjYb4dV8Q2h0RNnnuM$5o8z4koIGeNXq2u7ZX2SHPqkK9gs96Ka1aDowtJpbq0=','2025-07-10 08:22:44.205973',1,'ADMIN0001','','',1,1,'2025-07-02 17:48:15.767638','',''),(3,'pbkdf2_sha256$1000000$Umg7jjhZCLMJvalDBoAaRx$7F+JIbi7ybcxXlxfWXeo81yoCf+0kml1IGHg9iogJ7Y=','2025-07-07 12:31:21.298881',0,'GM0001','Pavan','S Suvarna',1,1,'2025-07-02 18:43:04.000000','gm','pavan@sail.co.in'),(4,'pbkdf2_sha256$1000000$65CHvv82rew8WJwEZp85BE$E54frqwEIE8x9z43pQtozCToBkaEN4b9mAx9ZWrslvs=','2025-08-22 11:36:49.777348',0,'HR0001','Abhishek','Phukan',1,1,'2025-07-02 18:55:28.000000','hr','abhishek@sail.co.in'),(5,'pbkdf2_sha256$1000000$5AeYd5omHZbAhMoSjgSZDm$DomUonmRoM0bExaCfbQGU+qHF/Z1zoQiU6snZowh6jo=','2025-08-22 11:33:48.595147',0,'EMP0001','Aditi','Nayanar',0,1,'2025-07-02 18:57:11.000000','employee','aditi@sail.co.in'),(6,'pbkdf2_sha256$1000000$EcfAzmBTpj1xcFf9wgZFZr$38usaFVGADbAEWExNYY+2O/mDiH1TVT+BlMqCMeGqRA=','2025-07-10 08:09:16.501380',0,'EMP0002','Ambika','M',0,1,'2025-07-02 19:01:22.000000','employee','ambika@sail.co.in'),(7,'pbkdf2_sha256$1000000$qR9YS3kAVLc1jmOWHXlzXe$TikLWU8r0xoAgxDM0rQcIuXixs8TLQYHoEhRFy46yNM=','2025-07-03 11:39:07.000000',0,'EMP0003','Meghna','Dutta',0,1,'2025-07-03 11:38:25.000000','employee','meghna@sail.co.in'),(8,'pbkdf2_sha256$1000000$xdKuFHDpDNxPs8i3aUq7T7$DwQZRMtH1uZjEWQ34G8Z1jQDoGIcxOIwimCiq0CVI5M=','2025-07-09 21:08:35.619832',0,'GM0002','Ananya','H',1,1,'2025-07-05 14:42:26.000000','gm','ananya@sail.co.in'),(9,'pbkdf2_sha256$1000000$OUKnHEMdC6pUuxEotxHrFb$8kGWdb3dV6eqqE1sJWoZ1Tm/lWkaoXuTNkp12hQt/Do=','2025-08-22 11:39:09.813889',0,'HR0002','Vishnu Priya','N R',1,1,'2025-07-05 14:49:25.000000','hr','vishnu@sail.co.in'),(10,'pbkdf2_sha256$1000000$knqbJ7al1rIrnhHgz0qcKH$FREu1uy+nMPYMA96K5JojgELIpaQlaO6cvIfp8fT0b4=','2025-07-07 17:25:22.654579',0,'EMP0004','Arunima','Bishen',0,1,'2025-07-07 12:08:58.000000','employee','arunima@sail.co.in'),(11,'pbkdf2_sha256$1000000$RyuDrlCHraj4YKnS5IGuik$p4hmIfJQG+bdr1k1JeJiJEn1xYb4gdKmHirdYM7Of5Q=','2025-07-11 04:52:29.633316',0,'EMP0005','Madison','Davenport',0,1,'2025-07-07 12:13:08.000000','employee','madison@sail.co.in'),(12,'pbkdf2_sha256$1000000$9cm0w2mSqi7T3zL5lTAfK3$8p1ZYPfBPAGkw5x/g9z6a7Rx33JZ91ycCjSa3xxpA9I=',NULL,0,'EMP0006','Akash','Bhagat',0,1,'2025-07-07 12:13:09.000000','employee','akash@sail.co.in'),(13,'pbkdf2_sha256$1000000$iGfVmLdmbXkceO1og43nE2$J1+oz7Kpup0q5YcH9Os6JXQ0VzkmJsJO/Go+mUAlWyc=',NULL,0,'EMP0007','Nick','Sharma',0,1,'2025-07-07 12:13:10.000000','employee','nick@sail.co.in'),(14,'pbkdf2_sha256$1000000$0xfqf0eXYF6GmiC58LbfjU$Shve0TqcwMAnMTS7qv9RzNHTgZBmHfGfTyX9xofiInA=','2025-07-12 16:26:33.976447',0,'EMP0008','Sophie','Turner',0,1,'2025-07-07 12:13:11.000000','employee','sophie@sail.co.in'),(15,'pbkdf2_sha256$1000000$hKNaJ92DqhnW3DrBWgP1Yf$3r8OYKp2EvI9HJetxa99iFqFo/mxEanMm7MOms8KhnE=',NULL,0,'EMP0009','Muskan','Shekhar',0,1,'2025-07-07 12:13:12.000000','employee','muskan@sail.co.in'),(16,'pbkdf2_sha256$1000000$vQGYVE5DvaMIk0JQNSI9Sw$/TYWsI6AyHQh+9XJm98T6r1DEFClp81P92RU6baypHY=',NULL,0,'EMP0010','Shreya','Pal',0,1,'2025-07-07 12:13:13.000000','employee','shreya@sail.co.in'),(17,'pbkdf2_sha256$1000000$V1JiysypY17wp1dC8DPsAp$BY9Dd2HjW6aoff4lF3j4hltgkpyHP6HWJ1TkmtnzefU=',NULL,0,'EMP0011','Ishan','Banerjee',0,1,'2025-07-07 12:13:14.000000','employee','ishan@sail.co.in'),(18,'pbkdf2_sha256$1000000$47am5HWxnHXBsi1nDHmLSI$NOFr38780e59Uk1ktarG1RhKGIX7AhJJUTyWknJxpNo=',NULL,0,'EMP0012','Thulasi','Gowda',0,1,'2025-07-07 12:13:15.000000','employee','thulasi@sail.co.in'),(19,'pbkdf2_sha256$1000000$H23W5di5RflSxhuy8q9UJI$w3zAnTKlQojcvHgm4SVtNF8TQHG3pgcDlDppEWHbxHU=',NULL,0,'EMP0013','Steve','Biju',0,1,'2025-07-07 12:13:16.000000','employee','steve@sail.co.in'),(20,'pbkdf2_sha256$1000000$ITjBfLC4Ll18xoy8HLVdtk$ryEzQnoTalsyCEnKT1qN/gxszeTqN44Qmo5mR4g9YJ0=','2025-07-09 20:27:41.655927',0,'EMP0014','Achsah','Anna Biju',0,1,'2025-07-07 12:13:17.000000','employee','achsah@sail.co.in'),(21,'pbkdf2_sha256$1000000$CTMyv0nU9XAIqtuI640NLr$vCQ5PCEFr/yTnB8S1jR+AoES8Gcu6z9M31VXLi/xznM=','2025-07-07 14:28:03.461113',0,'GM0003','Ayan','Shankar',1,1,'2025-07-07 12:13:18.000000','gm','ayan@sail.co.in'),(22,'pbkdf2_sha256$1000000$K4cE6vgOgyn1MN5TUAO8Yx$ltPf2GpJPghRhJYA2y+aB7D52YC5WptCHrd/E1FYX64=','2025-07-07 14:28:38.991909',0,'GM0004','Samriddhi','Metkar',1,1,'2025-07-07 12:13:19.000000','gm','samridhhi@sail.co.in'),(23,'pbkdf2_sha256$1000000$mfySIgSI7dd4i7qkkrBN7x$QZqutHxIV3lgqOW2b1c9uGHC311j2HNRW0WtlKHu5/g=','2025-07-07 14:18:29.863208',0,'GM0005','Amber','Johnson',1,1,'2025-07-07 12:13:20.000000','gm','amber@sail.co.in'),(24,'pbkdf2_sha256$1000000$7liSAIXyFk4n8Vxa3sGAea$R9O+4WxoVS/7WrqD0KCUff5LSfIhswK10DXMG2ORKqE=',NULL,0,'GM0006','Riya','Sharma',1,1,'2025-07-07 14:36:33.000000','gm','riya@sail.co.in'),(25,'pbkdf2_sha256$1000000$tSrWSLuQqAzrsX7AshASnn$+RwZ8GHKB1I9igEaAQ6O/BRUQQe02fCA5MhDdq8CvpY=',NULL,0,'GM0007','Preethi','Patil',1,1,'2025-07-07 14:37:48.000000','gm','preethi@sail.co.in'),(26,'pbkdf2_sha256$1000000$w2tqKsFxbxCghrvfVLFaWg$EkJV4gYW41BccId+XIOe/RuhHK7ns7lVXcDyIlTBJ+s=','2025-08-22 11:41:06.397109',0,'HR0003','Keerthi','K',1,1,'2025-07-07 18:13:12.000000','hr','keerthi@sail.co.in');
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_department`
--

DROP TABLE IF EXISTS `accounts_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `general_manager_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_department_general_manager_id_7318d5e7_fk_accounts_` (`general_manager_id`),
  CONSTRAINT `accounts_department_general_manager_id_7318d5e7_fk_accounts_` FOREIGN KEY (`general_manager_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_department`
--

LOCK TABLES `accounts_department` WRITE;
/*!40000 ALTER TABLE `accounts_department` DISABLE KEYS */;
INSERT INTO `accounts_department` VALUES (1,'C&IT',3),(3,'Production',3),(4,'Legal & Corporate Affairs',3),(5,'Projects & Planning',3),(6,'Marketing & Sales',3),(7,'Finance',3),(8,'Mechanical Maintenance',3);
/*!40000 ALTER TABLE `accounts_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_employeeprofile`
--

DROP TABLE IF EXISTS `accounts_employeeprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_employeeprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `department_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_of_joining` date DEFAULT NULL,
  `department_location` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `supervisor` varchar(100) DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_employeepro_department_id_371127a9_fk_accounts_` (`department_id`),
  KEY `accounts_employeeprofile_post_id_fd2e4a2d_fk_accounts_post_id` (`post_id`),
  CONSTRAINT `accounts_employeepro_department_id_371127a9_fk_accounts_` FOREIGN KEY (`department_id`) REFERENCES `accounts_department` (`id`),
  CONSTRAINT `accounts_employeepro_user_id_c9163851_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_employeeprofile_post_id_fd2e4a2d_fk_accounts_post_id` FOREIGN KEY (`post_id`) REFERENCES `accounts_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_employeeprofile`
--

LOCK TABLES `accounts_employeeprofile` WRITE;
/*!40000 ALTER TABLE `accounts_employeeprofile` DISABLE KEYS */;
INSERT INTO `accounts_employeeprofile` VALUES (1,'9691973089','2004-03-12',1,5,'2024-01-01','C-BLOCK',50000.00,'Pavan S Suvarna',7),(2,'7024886612','2004-01-24',4,6,'2023-06-05','E-BLOCK',80000.00,'Ananya H',14),(3,'7024779934','2004-03-20',1,7,'2024-02-05','C-BLOCK',50000.00,'Pavan S Suvarna',7),(4,'9691865308','2001-10-14',1,3,'2023-02-08','C-BLOCK',100000.00,NULL,8),(5,'8945673089','1998-12-13',4,8,'2022-03-06','E-BLOCK',150000.00,NULL,13),(6,'9521660782','2002-08-20',5,11,'2023-07-03','D-BLOCK',60000.00,'Samriddhi Metkar',12),(7,'9706206964','1996-10-09',7,12,'2024-01-15','F-BLOCK',75000.00,'Riya Sharma',6),(8,'9614610116','1978-10-17',3,13,'2025-01-22','A-BLOCK',60000.00,'Ayan Shankar',1),(9,'9553049795','2001-01-17',3,14,'2024-07-08','A-BLOCK',59000.00,'Ayan Shankar',2),(10,'9668707426','1970-08-20',6,15,'2021-10-31','B-BLOCK',50000.00,'Amber Johnson',9),(11,'9886262442','1990-08-19',3,16,'2025-05-15','A-BLOCK',75000.00,'Ayan Shankar',1),(12,'9949052619','1987-12-30',6,17,'2022-12-18','B-BLOCK',45000.00,'Amber Johnson',10),(13,'9573414591','2001-12-22',3,18,'2025-01-04','A-BLOCK',55000.00,'Ayan Shankar',1),(14,'9421270202','1993-10-10',7,19,'2024-04-12','F-BLOCK',70000.00,'Riya Sharma',5),(15,'9672859512','1971-07-30',8,20,'2024-11-11','G-BLOCK',30000.00,'Preethi Patil',4),(16,'9823956743','1995-08-11',3,21,'2021-01-04','A-BLOCK',100000.00,NULL,2),(17,'7025987432','1990-03-30',5,22,'2019-10-07','D-BLOCK',120000.00,NULL,11),(18,'9765845341','1992-07-10',6,23,'2018-10-08','B-BLOCK',150000.00,NULL,9),(19,'7389519900','1994-10-01',7,24,'2019-06-03','F-BLOCK',180000.00,NULL,6),(20,'9691975076','1998-08-12',8,25,'2015-07-05','G-BLOCK',150000.00,NULL,3),(21,'9634785308','2001-05-21',5,10,'2021-10-04','D-BLOCK',50000.00,'Samriddhi Metkar',12);
/*!40000 ALTER TABLE `accounts_employeeprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_employeetrainingrecord`
--

DROP TABLE IF EXISTS `accounts_employeetrainingrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_employeetrainingrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `attendance` tinyint(1) NOT NULL,
  `employee_id` bigint NOT NULL,
  `training_program_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_employeetra_employee_id_b95fc159_fk_accounts_` (`employee_id`),
  KEY `accounts_employeetra_training_program_id_6199c378_fk_accounts_` (`training_program_id`),
  CONSTRAINT `accounts_employeetra_employee_id_b95fc159_fk_accounts_` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employeeprofile` (`id`),
  CONSTRAINT `accounts_employeetra_training_program_id_6199c378_fk_accounts_` FOREIGN KEY (`training_program_id`) REFERENCES `accounts_trainingprogram` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_employeetrainingrecord`
--

LOCK TABLES `accounts_employeetrainingrecord` WRITE;
/*!40000 ALTER TABLE `accounts_employeetrainingrecord` DISABLE KEYS */;
INSERT INTO `accounts_employeetrainingrecord` VALUES (1,'ENROLLED',1,13,1),(2,'COMPLETED',0,3,3),(3,'PENDING',0,15,2),(4,'ENROLLED',1,6,7);
/*!40000 ALTER TABLE `accounts_employeetrainingrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_hrprofile`
--

DROP TABLE IF EXISTS `accounts_hrprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_hrprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_phone` varchar(15) NOT NULL,
  `user_id` bigint NOT NULL,
  `hr_role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_hrprofile_user_id_a2b91989_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_hrprofile`
--

LOCK TABLES `accounts_hrprofile` WRITE;
/*!40000 ALTER TABLE `accounts_hrprofile` DISABLE KEYS */;
INSERT INTO `accounts_hrprofile` VALUES (1,'7024893412',4,'general'),(2,'8923470986',9,'payroll'),(3,'9483764510',26,'training');
/*!40000 ALTER TABLE `accounts_hrprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_post`
--

DROP TABLE IF EXISTS `accounts_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_post`
--

LOCK TABLES `accounts_post` WRITE;
/*!40000 ALTER TABLE `accounts_post` DISABLE KEYS */;
INSERT INTO `accounts_post` VALUES (1,'Operator'),(2,'Metallurgist'),(3,'Electrical Engineer'),(4,'Maintenance Supervisor'),(5,'Accounts Officer'),(6,'Finance Manager'),(7,'Software Developer'),(8,'IT Officer'),(9,'Sales Executive'),(10,'Senior Sales Manager'),(11,'Project Engineer'),(12,'Project Coordinator'),(13,'Senior Legal Advisor'),(14,'Legal Officer');
/*!40000 ALTER TABLE `accounts_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_salaryrecord`
--

DROP TABLE IF EXISTS `accounts_salaryrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_salaryrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `month` date NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_salaryrecor_employee_id_6bd33d62_fk_accounts_` (`employee_id`),
  CONSTRAINT `accounts_salaryrecor_employee_id_6bd33d62_fk_accounts_` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employeeprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_salaryrecord`
--

LOCK TABLES `accounts_salaryrecord` WRITE;
/*!40000 ALTER TABLE `accounts_salaryrecord` DISABLE KEYS */;
INSERT INTO `accounts_salaryrecord` VALUES (3,50000.00,'2025-07-01',1),(4,80000.00,'2025-07-01',2),(5,50000.00,'2025-07-01',3),(6,100000.00,'2025-07-01',4),(7,150000.00,'2025-07-01',5),(8,50000.00,'2025-01-01',1),(9,50000.00,'2025-02-01',1),(10,50000.00,'2025-03-01',1),(11,50000.00,'2025-04-01',1),(12,50000.00,'2025-05-01',1),(13,50000.00,'2025-06-01',1),(14,80000.00,'2025-01-01',2),(15,80000.00,'2025-02-01',2),(16,80000.00,'2025-03-01',2),(17,80000.00,'2025-04-01',2),(18,80000.00,'2025-05-01',2),(19,80000.00,'2025-06-01',2),(20,50000.00,'2025-01-01',3),(21,50000.00,'2025-02-01',3),(22,50000.00,'2025-03-01',3),(23,50000.00,'2025-04-01',3),(24,50000.00,'2025-05-01',3),(25,50000.00,'2025-06-01',3),(26,100000.00,'2025-01-01',4),(27,100000.00,'2025-02-01',4),(28,100000.00,'2025-03-01',4),(29,100000.00,'2025-04-01',4),(30,100000.00,'2025-05-01',4),(31,100000.00,'2025-06-01',4),(32,150000.00,'2025-01-01',5),(33,150000.00,'2025-02-01',5),(34,150000.00,'2025-03-01',5),(35,150000.00,'2025-04-01',5),(36,150000.00,'2025-05-01',5),(37,150000.00,'2025-06-01',5),(38,60000.00,'2025-01-01',6),(39,60000.00,'2025-02-01',6),(40,60000.00,'2025-03-01',6),(41,60000.00,'2025-04-01',6),(42,60000.00,'2025-05-01',6),(43,60000.00,'2025-06-01',6),(44,75000.00,'2025-01-01',7),(45,75000.00,'2025-02-01',7),(46,75000.00,'2025-03-01',7),(47,75000.00,'2025-04-01',7),(48,75000.00,'2025-05-01',7),(49,75000.00,'2025-06-01',7),(50,60000.00,'2025-01-01',8),(51,60000.00,'2025-02-01',8),(52,60000.00,'2025-03-01',8),(53,60000.00,'2025-04-01',8),(54,60000.00,'2025-05-01',8),(55,60000.00,'2025-06-01',8),(56,59000.00,'2025-01-01',9),(57,59000.00,'2025-02-01',9),(58,59000.00,'2025-03-01',9),(59,59000.00,'2025-04-01',9),(60,59000.00,'2025-05-01',9),(61,59000.00,'2025-06-01',9),(62,50000.00,'2025-01-01',10),(63,50000.00,'2025-02-01',10),(64,50000.00,'2025-03-01',10),(65,50000.00,'2025-04-01',10),(66,50000.00,'2025-05-01',10),(67,50000.00,'2025-06-01',10),(68,75000.00,'2025-01-01',11),(69,75000.00,'2025-02-01',11),(70,75000.00,'2025-03-01',11),(71,75000.00,'2025-04-01',11),(72,75000.00,'2025-05-01',11),(73,75000.00,'2025-06-01',11),(74,45000.00,'2025-01-01',12),(75,45000.00,'2025-02-01',12),(76,45000.00,'2025-03-01',12),(77,45000.00,'2025-04-01',12),(78,45000.00,'2025-05-01',12),(79,45000.00,'2025-06-01',12),(80,55000.00,'2025-01-01',13),(81,55000.00,'2025-02-01',13),(82,55000.00,'2025-03-01',13),(83,55000.00,'2025-04-01',13),(84,55000.00,'2025-05-01',13),(85,55000.00,'2025-06-01',13),(86,70000.00,'2025-01-01',14),(87,70000.00,'2025-02-01',14),(88,70000.00,'2025-03-01',14),(89,70000.00,'2025-04-01',14),(90,70000.00,'2025-05-01',14),(91,70000.00,'2025-06-01',14),(92,30000.00,'2025-01-01',15),(93,30000.00,'2025-02-01',15),(94,30000.00,'2025-03-01',15),(95,30000.00,'2025-04-01',15),(96,30000.00,'2025-05-01',15),(97,30000.00,'2025-06-01',15),(98,100000.00,'2025-01-01',16),(99,100000.00,'2025-02-01',16),(100,100000.00,'2025-03-01',16),(101,100000.00,'2025-04-01',16),(102,100000.00,'2025-05-01',16),(103,100000.00,'2025-06-01',16),(104,120000.00,'2025-01-01',17),(105,120000.00,'2025-02-01',17),(106,120000.00,'2025-03-01',17),(107,120000.00,'2025-04-01',17),(108,120000.00,'2025-05-01',17),(109,120000.00,'2025-06-01',17),(110,150000.00,'2025-01-01',18),(111,150000.00,'2025-02-01',18),(112,150000.00,'2025-03-01',18),(113,150000.00,'2025-04-01',18),(114,150000.00,'2025-05-01',18),(115,150000.00,'2025-06-01',18),(116,180000.00,'2025-01-01',19),(117,180000.00,'2025-02-01',19),(118,180000.00,'2025-03-01',19),(119,180000.00,'2025-04-01',19),(120,180000.00,'2025-05-01',19),(121,180000.00,'2025-06-01',19),(122,150000.00,'2025-01-01',20),(123,150000.00,'2025-02-01',20),(124,150000.00,'2025-03-01',20),(125,150000.00,'2025-04-01',20),(126,150000.00,'2025-05-01',20),(127,150000.00,'2025-06-01',20),(128,50000.00,'2025-01-01',21),(129,50000.00,'2025-02-01',21),(130,50000.00,'2025-03-01',21),(131,50000.00,'2025-04-01',21),(132,50000.00,'2025-05-01',21),(133,50000.00,'2025-06-01',21);
/*!40000 ALTER TABLE `accounts_salaryrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_taxrecord`
--

DROP TABLE IF EXISTS `accounts_taxrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_taxrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `financial_year` varchar(9) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `tax_percentage` decimal(5,2) NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_taxrecord_employee_id_2a81190c_fk_accounts_` (`employee_id`),
  CONSTRAINT `accounts_taxrecord_employee_id_2a81190c_fk_accounts_` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employeeprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_taxrecord`
--

LOCK TABLES `accounts_taxrecord` WRITE;
/*!40000 ALTER TABLE `accounts_taxrecord` DISABLE KEYS */;
INSERT INTO `accounts_taxrecord` VALUES (1,'2024-2025',11340.00,22.68,1),(2,'2022-2023',6335.00,12.67,1),(3,'2022-2023',5025.00,10.05,1),(4,'2022-2023',11944.00,14.93,2),(5,'2024-2025',14896.00,18.62,2),(6,'2023-2024',9020.00,18.04,3),(7,'2024-2025',5725.00,11.45,3),(8,'2022-2023',3355.00,6.71,3),(9,'2024-2025',19750.00,19.75,4),(10,'2022-2023',7440.00,7.44,4),(11,'2024-2025',22620.00,22.62,4),(12,'2023-2024',19635.00,13.09,5),(13,'2023-2024',25470.00,16.98,5),(14,'2022-2023',8340.00,5.56,5),(15,'2023-2024',5720.00,11.44,1),(16,'2023-2024',4864.00,6.08,2),(17,'2023-2024',18220.00,18.22,4),(18,'2024-2025',37260.00,24.84,5),(19,'2022-2023',5538.00,9.23,6),(20,'2023-2024',17868.00,29.78,6),(21,'2024-2025',13056.00,21.76,6),(22,'2022-2023',4920.00,6.56,7),(23,'2023-2024',7567.50,10.09,7),(24,'2024-2025',21030.00,28.04,7),(25,'2022-2023',11850.00,19.75,8),(26,'2023-2024',4854.00,8.09,8),(27,'2024-2025',14136.00,23.56,8),(28,'2022-2023',13080.30,22.17,9),(29,'2023-2024',17440.40,29.56,9),(30,'2024-2025',16596.70,28.13,9),(31,'2022-2023',3000.00,6.00,10),(32,'2023-2024',10305.00,20.61,10),(33,'2024-2025',8720.00,17.44,10),(34,'2022-2023',10687.50,14.25,11),(35,'2023-2024',21547.50,28.73,11),(36,'2024-2025',4222.50,5.63,11),(37,'2022-2023',11704.50,26.01,12),(38,'2023-2024',2344.50,5.21,12),(39,'2024-2025',12667.50,28.15,12),(40,'2022-2023',4548.50,8.27,13),(41,'2023-2024',5819.00,10.58,13),(42,'2024-2025',7051.00,12.82,13),(43,'2022-2023',7574.00,10.82,14),(44,'2023-2024',8554.00,12.22,14),(45,'2024-2025',11900.00,17.00,14),(46,'2022-2023',4311.00,14.37,15),(47,'2023-2024',5004.00,16.68,15),(48,'2024-2025',1758.00,5.86,15),(49,'2022-2023',10780.00,10.78,16),(50,'2023-2024',29230.00,29.23,16),(51,'2024-2025',28680.00,28.68,16),(52,'2022-2023',13152.00,10.96,17),(53,'2023-2024',34248.00,28.54,17),(54,'2024-2025',20100.00,16.75,17),(55,'2022-2023',26895.00,17.93,18),(56,'2023-2024',19560.00,13.04,18),(57,'2024-2025',21615.00,14.41,18),(58,'2022-2023',28854.00,16.03,19),(59,'2023-2024',31176.00,17.32,19),(60,'2024-2025',52470.00,29.15,19),(61,'2022-2023',12645.00,8.43,20),(62,'2023-2024',30495.00,20.33,20),(63,'2024-2025',16845.00,11.23,20),(64,'2022-2023',6640.00,13.28,21),(65,'2023-2024',11640.00,23.28,21),(66,'2024-2025',5005.00,10.01,21);
/*!40000 ALTER TABLE `accounts_taxrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_trainingprogram`
--

DROP TABLE IF EXISTS `accounts_trainingprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_trainingprogram` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `trainer` varchar(100) NOT NULL,
  `venue` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_trainingprogram`
--

LOCK TABLES `accounts_trainingprogram` WRITE;
/*!40000 ALTER TABLE `accounts_trainingprogram` DISABLE KEYS */;
INSERT INTO `accounts_trainingprogram` VALUES (1,'Basic Metallurgy and Steelmaking','Introductory course covering metallurgy fundamentals, blast furnace operations, and steelmaking techniques.','2025-07-01','2025-07-20','Mr. Rakesh Gupta','Training Hall - Blast Furnace Department'),(2,'Industrial Safety and Hazard Management','Safety protocols, hazard identification, and emergency response procedures.','2025-06-20','2025-06-21','Ms. Kavita Menon','Safety Training Center'),(3,'SAP ERP Implementation Workshop','Training on SAP modules used in Materials Management and Finance.','2025-06-25','2025-06-27','Mr. Arvind Sharma','Computer Lab - C&IT Department'),(4,'Digital Transformation and Industry 4.0','Adopting digital technologies, automation, and data analytics in plant operations.','2025-07-05','2025-07-06','Mr. Manish Kumar','C&IT Seminar Hall'),(5,'Quality Control and ISO Standards','Overview of quality assurance processes and ISO 9001 compliance.','2025-06-20','2025-06-22','Ms. Priya Verma','Quality Lab Training Room'),(6,'Energy Efficiency in Steel Plants','Methods to improve energy efficiency and reduce carbon emissions in operations.','2025-06-10','2025-06-11','Dr. Anjali Desai','Conference Hall'),(7,'Vocational Training','Vocational training at SAIL Bhilai Steel Plant provides practical exposure to steel manufacturing, plant operations, equipment maintenance, and safety procedures. It helps trainees understand real-world industrial processes in a large integrated steel plant.','2025-06-16','2025-07-12','Dr. Meera Joshi','Conference Hall');
/*!40000 ALTER TABLE `accounts_trainingprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add department',6,'add_department'),(22,'Can change department',6,'change_department'),(23,'Can delete department',6,'delete_department'),(24,'Can view department',6,'view_department'),(25,'Can add user',7,'add_customuser'),(26,'Can change user',7,'change_customuser'),(27,'Can delete user',7,'delete_customuser'),(28,'Can view user',7,'view_customuser'),(29,'Can add employee profile',8,'add_employeeprofile'),(30,'Can change employee profile',8,'change_employeeprofile'),(31,'Can delete employee profile',8,'delete_employeeprofile'),(32,'Can view employee profile',8,'view_employeeprofile'),(33,'Can add hr profile',9,'add_hrprofile'),(34,'Can change hr profile',9,'change_hrprofile'),(35,'Can delete hr profile',9,'delete_hrprofile'),(36,'Can view hr profile',9,'view_hrprofile'),(37,'Can add salary record',10,'add_salaryrecord'),(38,'Can change salary record',10,'change_salaryrecord'),(39,'Can delete salary record',10,'delete_salaryrecord'),(40,'Can view salary record',10,'view_salaryrecord'),(41,'Can add bank detail',11,'add_bankdetail'),(42,'Can change bank detail',11,'change_bankdetail'),(43,'Can delete bank detail',11,'delete_bankdetail'),(44,'Can view bank detail',11,'view_bankdetail'),(45,'Can add tax record',12,'add_taxrecord'),(46,'Can change tax record',12,'change_taxrecord'),(47,'Can delete tax record',12,'delete_taxrecord'),(48,'Can view tax record',12,'view_taxrecord'),(49,'Can add employee training record',13,'add_employeetrainingrecord'),(50,'Can change employee training record',13,'change_employeetrainingrecord'),(51,'Can delete employee training record',13,'delete_employeetrainingrecord'),(52,'Can view employee training record',13,'view_employeetrainingrecord'),(53,'Can add training program',14,'add_trainingprogram'),(54,'Can change training program',14,'change_trainingprogram'),(55,'Can delete training program',14,'delete_trainingprogram'),(56,'Can view training program',14,'view_trainingprogram'),(57,'Can add attendance record',15,'add_attendancerecord'),(58,'Can change attendance record',15,'change_attendancerecord'),(59,'Can delete attendance record',15,'delete_attendancerecord'),(60,'Can view attendance record',15,'view_attendancerecord'),(61,'Can add attendance',16,'add_attendance'),(62,'Can change attendance',16,'change_attendance'),(63,'Can delete attendance',16,'delete_attendance'),(64,'Can view attendance',16,'view_attendance'),(65,'Can add post',17,'add_post'),(66,'Can change post',17,'change_post'),(67,'Can delete post',17,'delete_post'),(68,'Can view post',17,'view_post');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-09 21:51:14.475927','4','EMP0014 - 2025-07-10',3,'',16,1),(2,'2025-07-09 21:51:14.476261','3','EMP0001 - 2025-07-10',3,'',16,1),(3,'2025-07-09 21:51:14.476288','2','EMP0001 - 2025-07-09',3,'',16,1),(4,'2025-07-09 21:51:57.158083','1','HR0001 - 2025-07-09',3,'',16,1),(5,'2025-07-10 07:54:51.436250','1','Operator',1,'[{\"added\": {}}]',17,1),(6,'2025-07-10 07:55:10.269963','2','Metallurgist',1,'[{\"added\": {}}]',17,1),(7,'2025-07-10 07:55:24.637903','3','Electrical Engineer',1,'[{\"added\": {}}]',17,1),(8,'2025-07-10 07:55:35.869456','4','Maintenance Supervisor',1,'[{\"added\": {}}]',17,1),(9,'2025-07-10 07:55:56.341817','5','Accounts Officer',1,'[{\"added\": {}}]',17,1),(10,'2025-07-10 07:56:12.405719','6','Finance Manager',1,'[{\"added\": {}}]',17,1),(11,'2025-07-10 07:56:25.558208','7','Software Developer',1,'[{\"added\": {}}]',17,1),(12,'2025-07-10 07:56:37.157168','8','IT Officer',1,'[{\"added\": {}}]',17,1),(13,'2025-07-10 07:58:54.731347','9','Sales Executive',1,'[{\"added\": {}}]',17,1),(14,'2025-07-10 07:59:11.863850','10','Senior Sales Manager',1,'[{\"added\": {}}]',17,1),(15,'2025-07-10 07:59:23.522321','11','Project Engineer',1,'[{\"added\": {}}]',17,1),(16,'2025-07-10 07:59:36.635313','12','Project Coordinator',1,'[{\"added\": {}}]',17,1),(17,'2025-07-10 07:59:50.077226','13','Senior Legal Advisor',1,'[{\"added\": {}}]',17,1),(18,'2025-07-10 08:00:05.162515','14','Legal Officer',1,'[{\"added\": {}}]',17,1),(19,'2025-07-10 08:01:43.280283','21','EMP0004 - arunima@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(20,'2025-07-10 08:01:53.701409','20','GM0007 - preethi@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(21,'2025-07-10 08:02:02.714649','19','GM0006 - riya@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(22,'2025-07-10 08:02:13.571393','18','GM0005 - amber@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(23,'2025-07-10 08:02:24.840075','17','GM0004 - samridhhi@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(24,'2025-07-10 08:02:46.016832','16','GM0003 - ayan@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(25,'2025-07-10 08:03:05.129306','15','EMP0014 - achsah@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(26,'2025-07-10 08:03:14.367488','14','EMP0013 - steve@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(27,'2025-07-10 08:03:23.147204','13','EMP0012 - thulasi@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(28,'2025-07-10 08:03:53.154271','12','EMP0011 - ishan@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(29,'2025-07-10 08:04:07.381313','11','EMP0010 - shreya@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(30,'2025-07-10 08:04:15.204363','10','EMP0009 - muskan@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(31,'2025-07-10 08:04:24.166853','9','EMP0008 - sophie@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(32,'2025-07-10 08:04:32.188172','8','EMP0007 - nick@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(33,'2025-07-10 08:04:45.077781','7','EMP0006 - akash@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(34,'2025-07-10 08:05:07.971362','6','EMP0005 - madison@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(35,'2025-07-10 08:05:20.426880','5','GM0002 - ananya@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(36,'2025-07-10 08:05:29.307558','4','GM0001 - pavan@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(37,'2025-07-10 08:05:38.446653','3','EMP0003 - meghna@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(38,'2025-07-10 08:05:47.712680','2','EMP0002 - ambika@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1),(39,'2025-07-10 08:05:56.239438','1','EMP0001 - aditi@sail.co.in',2,'[{\"changed\": {\"fields\": [\"Post\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (16,'accounts','attendance'),(15,'accounts','attendancerecord'),(11,'accounts','bankdetail'),(7,'accounts','customuser'),(6,'accounts','department'),(8,'accounts','employeeprofile'),(13,'accounts','employeetrainingrecord'),(9,'accounts','hrprofile'),(17,'accounts','post'),(10,'accounts','salaryrecord'),(12,'accounts','taxrecord'),(14,'accounts','trainingprogram'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-02 17:40:15.207395'),(2,'contenttypes','0002_remove_content_type_name','2025-07-02 17:40:15.308769'),(3,'auth','0001_initial','2025-07-02 17:40:15.647216'),(4,'auth','0002_alter_permission_name_max_length','2025-07-02 17:40:15.730419'),(5,'auth','0003_alter_user_email_max_length','2025-07-02 17:40:15.740608'),(6,'auth','0004_alter_user_username_opts','2025-07-02 17:40:15.750585'),(7,'auth','0005_alter_user_last_login_null','2025-07-02 17:40:15.764561'),(8,'auth','0006_require_contenttypes_0002','2025-07-02 17:40:15.769530'),(9,'auth','0007_alter_validators_add_error_messages','2025-07-02 17:40:15.782674'),(10,'auth','0008_alter_user_username_max_length','2025-07-02 17:40:15.793616'),(11,'auth','0009_alter_user_last_name_max_length','2025-07-02 17:40:15.805916'),(12,'auth','0010_alter_group_name_max_length','2025-07-02 17:40:15.834739'),(13,'auth','0011_update_proxy_permissions','2025-07-02 17:40:15.850566'),(14,'auth','0012_alter_user_first_name_max_length','2025-07-02 17:40:15.860494'),(19,'sessions','0001_initial','2025-07-02 17:40:16.909146'),(29,'accounts','0011_alter_attendance_shift','2025-07-09 13:21:13.636596'),(30,'accounts','0012_attendance_late','2025-07-09 16:51:11.868522'),(31,'accounts','0001_initial','2025-07-09 19:29:27.570172'),(32,'accounts','0002_department_general_manager_alter_customuser_role','2025-07-09 19:29:27.585822'),(33,'accounts','0003_employeeprofile_date_of_joining_and_more','2025-07-09 19:29:27.588607'),(34,'accounts','0004_hrprofile_hr_role','2025-07-09 19:29:27.592305'),(35,'accounts','0005_salaryrecord','2025-07-09 19:29:27.595911'),(36,'accounts','0006_bankdetail','2025-07-09 19:29:27.599925'),(37,'accounts','0007_taxrecord','2025-07-09 19:29:27.603436'),(38,'accounts','0008_trainingprogram_employeetrainingrecord','2025-07-09 19:29:27.607687'),(39,'accounts','0009_attendancerecord','2025-07-09 19:29:27.611522'),(41,'accounts','0010_attendance','2025-07-09 19:32:56.815659'),(42,'accounts','0011_alter_attendance_employee_alter_attendance_punch_out','2025-07-09 19:48:36.425349'),(43,'admin','0001_initial','2025-07-09 19:48:36.624996'),(44,'admin','0002_logentry_remove_auto_add','2025-07-09 19:48:36.640524'),(45,'admin','0003_logentry_add_action_flag_choices','2025-07-09 19:48:36.661795'),(46,'accounts','0012_post_employeeprofile_post','2025-07-10 07:52:24.477938');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1ricmlj85asgzc0ql83cpmhllq0jdihy','.eJxVjDsOwyAQBe9CHSHzh5TpfQa0sGxwEmHJ2FWUu0dILpL2zcx7swjHXuPRyxYXZFem2eV3S5CfpQ2AD2j3lee17duS-FD4STufVyyv2-n-HVToddSajJqsVkIU502QELQXMgE5IVKaBKEqWUpv0ahilHNEQVKwSNkAIvt8AcdDN94:1uZjgR:7H50Ps8xdDu_WT3fEQiC-w0_HPYXAQQl9b3V1QQfBuw','2025-07-24 05:18:59.381727'),('3cmeaeilc51ewo5ldqcbggebhn3m3p4z','.eJxVjDsOwyAQBe9CHSHzh5TpfQa0sGxwEmHJ2FWUu0dILpL2zcx7swjHXuPRyxYXZFem2eV3S5CfpQ2AD2j3lee17duS-FD4STufVyyv2-n-HVToddSajJqsVkIU502QELQXMgE5IVKaBKEqWUpv0ahilHNEQVKwSNkAIvt8AcdDN94:1uZlbT:v8FQ0Tf_GsiOV6g-l7xdSS-TZjFQJxeK6KURMJ8eL7A','2025-07-24 07:21:59.144958'),('idpg8f7oi56y4zpmqbcakwioajydl4tb','.eJxVjDsOwyAQBe9CHSHzh5TpfQa0sGxwEmHJ2FWUu0dILpL2zcx7swjHXuPRyxYXZFem2eV3S5CfpQ2AD2j3lee17duS-FD4STufVyyv2-n-HVToddSajJqsVkIU502QELQXMgE5IVKaBKEqWUpv0ahilHNEQVKwSNkAIvt8AcdDN94:1uZlbC:6qiF0z3bw886SHnX_7u-dd3QkVvjltjr9aKG5vfecVw','2025-07-24 07:21:42.601892'),('m5y9ub6xyp2dm44khex3pyq3h24e3cm0','.eJxVjDsOwyAQBe9CHSHzh5TpfQa0sGxwEmHJ2FWUu0dILpL2zcx7swjHXuPRyxYXZFem2eV3S5CfpQ2AD2j3lee17duS-FD4STufVyyv2-n-HVToddSajJqsVkIU502QELQXMgE5IVKaBKEqWUpv0ahilHNEQVKwSNkAIvt8AcdDN94:1ua5jI:Tv2OUQH3m1zQscay92BkwhCqPVc7p0lTbqysyTh5ZFg','2025-07-25 04:51:24.510185'),('r6q2tddmjgfop0g0tawwpe5a8y9jserd','.eJxVjDsOwyAQBe9CHSHzh5TpfQa0sGxwEmHJ2FWUu0dILpL2zcx7swjHXuPRyxYXZFem2eV3S5CfpQ2AD2j3lee17duS-FD4STufVyyv2-n-HVToddSajJqsVkIU502QELQXMgE5IVKaBKEqWUpv0ahilHNEQVKwSNkAIvt8AcdDN94:1uZlb1:IyfhxPJDD72inHjm6uZhO1rsBqNtDR3io4L1iSsAxqk','2025-07-24 07:21:31.938267');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-14  7:33:50
