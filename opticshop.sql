CREATE DATABASE  IF NOT EXISTS `opticshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `opticshop`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: opticshop
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `liquid`
--

DROP TABLE IF EXISTS `liquid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquid` (
  `idLiquid` int NOT NULL AUTO_INCREMENT,
  `liquidName` varchar(45) NOT NULL,
  `liquidPrice` decimal(10,2) NOT NULL,
  `liquidStock` int NOT NULL,
  `liquidContents` varchar(45) DEFAULT NULL,
  `liquidFeatures` varchar(45) DEFAULT NULL,
  `liquidIndications` varchar(45) DEFAULT NULL,
  `liquidNotes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLiquid`),
  UNIQUE KEY `idLiquid_UNIQUE` (`idLiquid`),
  UNIQUE KEY `liquidName_UNIQUE` (`liquidName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquid`
--

LOCK TABLES `liquid` WRITE;
/*!40000 ALTER TABLE `liquid` DISABLE KEYS */;
INSERT INTO `liquid` VALUES (1,'Bausch+Lomb 博士倫Biotrue博士倫舒視能水漾平衡多效保養液300ML',240.00,1,'水','清爽','睡前使用','無'),(2,'Bausch+Lomb 博士倫Biotrue博士倫舒視能舒潤液單支裝-30支',299.00,0,'蘆薈','清涼','乾燥時使用','不適用敏感肌'),(3,'Bausch+Lomb 博士倫Renu博士倫瑞霖水漾清新多效保養液355ML',220.00,2,NULL,NULL,NULL,NULL),(4,'Bausch+Lomb 博士倫Boston博士倫博視頓先進護理液120ML',260.00,3,NULL,NULL,NULL,NULL),(5,'Bausch+Lomb 博士倫Boston博視頓新潔多功能護理液120ML',340.00,5,NULL,NULL,NULL,NULL),(6,'Bausch+Lomb 博士倫Boston博士倫博視頓舒潤液10ML',220.00,7,NULL,NULL,NULL,NULL),(7,'Bausch+Lomb 博士倫Boston博士倫博視頓酵素除蛋白清潔液5ML',220.00,6,NULL,NULL,NULL,NULL),(8,'Bausch+Lomb 博士倫Boston博士倫博視頓先進清潔液30ML',220.00,8,NULL,NULL,NULL,NULL),(9,'Hydron海昌美麗秘密長效保濕隱形眼鏡潤濕液15ml',120.00,5,NULL,NULL,NULL,NULL),(10,'Hydron海昌粉紅玻尿酸保養液360ml',240.00,3,NULL,NULL,NULL,NULL),(11,'海昌美麗主張無汞緩衝液360ml',30.00,4,NULL,NULL,NULL,NULL),(12,'Miacare美若康睛透多效保養液360ml',235.00,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `liquid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memberID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `lnearsighted` int NOT NULL,
  `rnearsighted` int NOT NULL,
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `memberID_UNIQUE` (`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (2,'LewisHamilton','password','ham44@fmail.com','1997-03-14','male',300,0),(3,'劉曦鴻','password','ham44@fmail.com','1997-03-14','male',300,0),(37,'darren52499','abc','test@gmail.com','2023-12-13','female',156,0),(39,'leclerc','asdfg','lec@l3c.com','2023-12-15','male',500,0),(40,'schumi','password','schumi@gmail.com','2023-12-08','male',400,350),(41,'test','123','test@gmail.com','2023-12-01','male',12,13),(43,'asd','asd','test@gmail.com','2023-12-01','male',12,13),(44,'qwe','asd','test@gmail.com','2023-12-01','male',12,13),(52,'ew','ew','asd','2023-12-02','male',3,5),(54,'bg','bg','asd','2023-12-02','male',3,5),(56,'bv','12345','asd','2023-12-02','male',3,5),(57,'tyu','123','tyu','2023-12-08','male',350,350),(58,'test1','1234','test@gmail.com','2023-12-15','male',123,123),(59,'test2','12345','test@gmail.com','2023-12-01','male',123,123);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transparentlens`
--

DROP TABLE IF EXISTS `transparentlens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transparentlens` (
  `idtransparentLens` int NOT NULL,
  `transparentLensName` varchar(45) NOT NULL,
  `transparentLensPrice` decimal(10,2) NOT NULL,
  `transparentLensStock` int NOT NULL,
  `transparentLensWaterContent` int DEFAULT NULL,
  `transparentLensBaseCurve` int DEFAULT NULL,
  `transparentLensDiameter` int DEFAULT NULL,
  `transparentLensGraphicDiameter` int DEFAULT NULL,
  PRIMARY KEY (`idtransparentLens`),
  UNIQUE KEY `idtransparentLens_UNIQUE` (`idtransparentLens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transparentlens`
--

LOCK TABLES `transparentlens` WRITE;
/*!40000 ALTER TABLE `transparentlens` DISABLE KEYS */;
/*!40000 ALTER TABLE `transparentlens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-01  1:00:54
