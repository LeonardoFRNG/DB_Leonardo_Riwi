CREATE DATABASE  IF NOT EXISTS `bd_leonardo_jimenez_cumbia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_leonardo_jimenez_cumbia`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: bd_leonardo_jimenez_cumbia
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `id_city` int DEFAULT NULL,
  `id_client` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_city` (`id_city`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`),
  CONSTRAINT `branch_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'North Office',1,1),(2,'Headquarters',2,2),(3,'West Branch',3,3),(4,'Main Office',4,4),(5,'Coastal',5,5),(6,'Coffee Branch',6,6),(7,'East Office',7,7),(8,'NorthEast',8,8),(9,'Central Office',9,10),(10,'Caribbean',10,9);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Bogotá'),(2,'Medellín'),(3,'Cali'),(4,'Barranquilla'),(5,'Cartagena '),(6,'Pereira'),(7,'Bucaramanga'),(8,'Cúcuta'),(9,'Manizales'),(10,'Santa Marta');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `id_city` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'ACME LTDA',1),(2,'Innova S.A.S.',2),(3,'Nova Tech',3),(4,'Bio Health',4),(5,'Soft Corp',5),(6,'Vision S.A.',6),(7,'Retail One',7),(8,'Edu Center',8),(9,'Mega Foods',9),(10,'Health Plus',10);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_categories`
--

DROP TABLE IF EXISTS `equipment_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_categories`
--

LOCK TABLES `equipment_categories` WRITE;
/*!40000 ALTER TABLE `equipment_categories` DISABLE KEYS */;
INSERT INTO `equipment_categories` VALUES (1,'Laptops'),(2,'Desktops'),(3,'Networking'),(4,'Printers');
/*!40000 ALTER TABLE `equipment_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES (1,'Lenovo ThinkPad'),(2,'Dell Latitude 5420'),(3,'HP Pro Desk'),(4,'Cisco Switch 2960'),(5,'Canon Pixma');
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movements`
--

DROP TABLE IF EXISTS `movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workorder` varchar(255) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `hours` decimal(10,0) DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `id_order` int DEFAULT NULL,
  `id_equipment` int DEFAULT NULL,
  `id_client` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_order` (`id_order`),
  KEY `id_equipment` (`id_equipment`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `movements_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  CONSTRAINT `movements_ibfk_2` FOREIGN KEY (`id_equipment`) REFERENCES `equipments` (`id`),
  CONSTRAINT `movements_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movements`
--

LOCK TABLES `movements` WRITE;
/*!40000 ALTER TABLE `movements` DISABLE KEYS */;
INSERT INTO `movements` VALUES (1,'WO1001','2026-05-01',2,120,2,2,1),(2,'WO1002','2026-05-02',3,180,2,2,1),(3,'WO1003','2026-05-03',4,250,3,3,2),(4,'WO1004','2026-05-04',2,150,3,3,2),(5,'WO1005','2026-05-05',5,500,4,4,3),(6,'WO1006','2026-05-06',4,450,4,4,3),(7,'WO1007','2026-05-07',2,130,5,5,4),(8,'WO1008','2026-05-08',3,200,5,5,4),(9,'WO1009','2026-05-09',2,140,1,1,5),(10,'WO1010','2026-05-10',3,190,1,1,5),(11,'WO1011','2026-05-11',6,550,3,3,6),(12,'WO1012','2026-05-12',5,520,3,3,6),(13,'WO1013','2026-05-13',2,160,2,2,7),(14,'WO1014','2026-05-14',3,210,2,2,7),(15,'WO1015','2026-05-15',2,125,4,4,8),(16,'WO1016','2026-05-16',2,135,4,4,8),(17,'WO1017','2026-05-17',4,400,5,5,10),(18,'WO1018','2026-05-18',5,430,5,5,10),(19,'WO1019','2026-05-19',3,220,1,1,9),(20,'WO1020','2026-05-20',4,260,1,1,9);
/*!40000 ALTER TABLE `movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_equipment` int DEFAULT NULL,
  `id_equipment_category` int DEFAULT NULL,
  `id_technician` int DEFAULT NULL,
  `id_service_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_equipment` (`id_equipment`),
  KEY `id_equipment_category` (`id_equipment_category`),
  KEY `id_technician` (`id_technician`),
  KEY `id_service_type` (`id_service_type`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipments` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_equipment_category`) REFERENCES `equipment_categories` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_technician`) REFERENCES `technicians` (`id`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`id_service_type`) REFERENCES `service_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,5,1),(2,2,1,1,1),(3,3,2,1,3),(4,4,3,3,1),(5,5,4,4,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_types`
--

DROP TABLE IF EXISTS `service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_types`
--

LOCK TABLES `service_types` WRITE;
/*!40000 ALTER TABLE `service_types` DISABLE KEYS */;
INSERT INTO `service_types` VALUES (1,'Preventive Maintenance'),(2,'Repair'),(3,'Installation');
/*!40000 ALTER TABLE `service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technicians`
--

DROP TABLE IF EXISTS `technicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technicians` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technicians`
--

LOCK TABLES `technicians` WRITE;
/*!40000 ALTER TABLE `technicians` DISABLE KEYS */;
INSERT INTO `technicians` VALUES (1,'Juan Perez'),(2,'Maria Gomez'),(3,'Carlos Ruiz'),(4,'Laura Diaz'),(5,'Andres Mora');
/*!40000 ALTER TABLE `technicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_rendimiento_tecnicos`
--

DROP TABLE IF EXISTS `vw_rendimiento_tecnicos`;
/*!50001 DROP VIEW IF EXISTS `vw_rendimiento_tecnicos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rendimiento_tecnicos` AS SELECT 
 1 AS `tecnico_id`,
 1 AS `nombre_tecnico`,
 1 AS `total_ordenes_atendidas`,
 1 AS `total_horas_trabajadas`,
 1 AS `costo_total_generado`,
 1 AS `promedio_horas_por_orden`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_rendimiento_tecnicos`
--

/*!50001 DROP VIEW IF EXISTS `vw_rendimiento_tecnicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rendimiento_tecnicos` AS select `t`.`id` AS `tecnico_id`,`t`.`nombre` AS `nombre_tecnico`,count(distinct `m`.`workorder`) AS `total_ordenes_atendidas`,sum(`m`.`hours`) AS `total_horas_trabajadas`,sum(`m`.`cost`) AS `costo_total_generado`,round(avg(`m`.`hours`),2) AS `promedio_horas_por_orden` from ((`technicians` `t` join `orders` `o` on((`t`.`id` = `o`.`id_technician`))) join `movements` `m` on((`o`.`id` = `m`.`id_order`))) group by `t`.`id`,`t`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-06 15:41:14
