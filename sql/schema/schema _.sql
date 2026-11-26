-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: bankandfraudpatterndetection
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `Time` double DEFAULT NULL,
  `V1` decimal(10,6) DEFAULT NULL,
  `V2` decimal(10,6) DEFAULT NULL,
  `V3` decimal(10,6) DEFAULT NULL,
  `V4` decimal(10,6) DEFAULT NULL,
  `V5` decimal(10,6) DEFAULT NULL,
  `V6` decimal(10,6) DEFAULT NULL,
  `V7` decimal(10,6) DEFAULT NULL,
  `V8` decimal(10,6) DEFAULT NULL,
  `V9` decimal(10,6) DEFAULT NULL,
  `V10` decimal(10,6) DEFAULT NULL,
  `V11` decimal(10,6) DEFAULT NULL,
  `V12` decimal(10,6) DEFAULT NULL,
  `V13` decimal(10,6) DEFAULT NULL,
  `V14` decimal(10,6) DEFAULT NULL,
  `V15` decimal(10,6) DEFAULT NULL,
  `V16` decimal(10,6) DEFAULT NULL,
  `V17` decimal(10,6) DEFAULT NULL,
  `V18` decimal(10,6) DEFAULT NULL,
  `V19` decimal(10,6) DEFAULT NULL,
  `V20` decimal(10,6) DEFAULT NULL,
  `V21` decimal(10,6) DEFAULT NULL,
  `V22` decimal(10,6) DEFAULT NULL,
  `V23` decimal(10,6) DEFAULT NULL,
  `V24` decimal(10,6) DEFAULT NULL,
  `V25` decimal(10,6) DEFAULT NULL,
  `V26` decimal(10,6) DEFAULT NULL,
  `V27` decimal(10,6) DEFAULT NULL,
  `V28` decimal(10,6) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Class` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-26  6:33:14
