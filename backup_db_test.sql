-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: db_test
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Jeans',100000.00,9),(2,'T-Shirt',150000.00,9),(3,'Shoes',1000000.00,7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_no` int NOT NULL AUTO_INCREMENT,
  `transaction_date` timestamp NULL DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_no`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (4,'2021-04-09 20:54:42',2,150000.00,1,150000,'ahmadm','2021-04-09 20:54:42'),(5,'2021-04-09 20:56:07',2,150000.00,1,150000,'ahmadm','2021-04-09 20:56:07'),(6,'2021-04-09 20:57:41',3,1000000.00,1,1000000,'ahmad','2021-04-09 20:57:41'),(7,'2021-04-09 20:57:49',2,150000.00,1,150000,'ahmad','2021-04-09 20:57:49'),(8,'2021-04-09 20:58:01',2,150000.00,1,150000,'ahmad','2021-04-09 20:58:01'),(9,'2021-04-09 20:58:12',2,150000.00,1,150000,'ahmad','2021-04-09 20:58:12'),(10,'2021-04-09 20:58:59',2,150000.00,1,150000,'ahmad','2021-04-09 20:58:59'),(11,'2021-04-09 20:59:05',2,150000.00,1,150000,'ahmad','2021-04-09 20:59:05'),(12,'2021-04-09 21:05:13',2,150000.00,1,150000,'ahmad','2021-04-09 21:05:13'),(13,'2021-04-09 21:05:56',2,150000.00,1,150000,'ahmad','2021-04-09 21:05:56'),(14,'2021-04-09 21:07:08',2,150000.00,1,150000,'ahmad','2021-04-09 21:07:08'),(15,'2021-04-09 21:10:30',3,1000000.00,1,1000000,'ahmad','2021-04-09 21:10:30'),(16,'2021-04-09 21:10:32',1,100000.00,1,100000,'ahmad','2021-04-09 21:10:32'),(17,'2021-04-09 21:10:34',2,150000.00,1,150000,'ahmad','2021-04-09 21:10:34'),(18,'2021-04-09 22:01:26',2,150000.00,1,150000,'ahmad','2021-04-09 22:01:26'),(19,'2021-04-09 22:01:28',3,1000000.00,1,1000000,'ahmad','2021-04-09 22:01:28'),(20,'2021-04-09 22:01:40',1,100000.00,1,100000,'ahmad','2021-04-09 22:01:40'),(21,'2021-04-09 22:01:48',3,1000000.00,1,1000000,'ahmad','2021-04-09 22:01:48'),(22,'2021-04-09 22:03:18',3,1000000.00,1,1000000,'ahmad','2021-04-09 22:03:18');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` text,
  `gender` tinyint(1) DEFAULT NULL,
  `bird_date` date DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'ahmad','ahmadm','Ahmad Mardiana','Jl. Ramasari, Haurwangi',1,'1998-01-25'),(3,'Daffa','ahmadm','Ahmad Mardiana','Jl. Ramasari, Haurwangi',1,'1998-01-25'),(4,'daffaeiy','password','Daffa Tea','Depok',1,'1998-01-18');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-10  6:12:03
