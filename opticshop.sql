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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `customerID` varchar(45) NOT NULL,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`cartID`),
  UNIQUE KEY `cartID_UNIQUE` (`cartID`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'D8A2360524D9A42B0CD21B01B6CDDF6A','2024-01-03'),(6,'B2FAA88CA667BD54F2B8141CE671B149','2024-01-03'),(14,'5A8D62FB21CE1C32B2F4834B5F848EF6','2024-01-03'),(15,'FD84A00459A9D2B0BBD6240F5B3F53CA','2024-01-03'),(34,'41','2024-01-03'),(35,'599328B84485D34429CAC9C6E11F25AA','2024-01-03');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartdetails`
--

DROP TABLE IF EXISTS `cartdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartdetails` (
  `cartDetailsID` int NOT NULL AUTO_INCREMENT,
  `cartID` int NOT NULL,
  `productCategory` varchar(45) NOT NULL,
  `productID` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`cartDetailsID`),
  UNIQUE KEY `cartDetailsID_UNIQUE` (`cartDetailsID`),
  UNIQUE KEY `cartID` (`cartID`,`productCategory`,`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetails`
--

LOCK TABLES `cartdetails` WRITE;
/*!40000 ALTER TABLE `cartdetails` DISABLE KEYS */;
INSERT INTO `cartdetails` VALUES (1,15,'liquid',1,NULL),(4,15,'liquid',3,NULL),(9,15,'liquid',4,NULL),(12,15,'liquid',5,NULL),(16,34,'liquid',6,NULL),(19,34,'liquid',9,NULL);
/*!40000 ALTER TABLE `cartdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coloredlens`
--

DROP TABLE IF EXISTS `coloredlens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coloredlens` (
  `productID` int NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int NOT NULL,
  `coloredLensWaterContent` decimal(10,2) DEFAULT NULL,
  `coloredLensBaseCurve` decimal(10,2) DEFAULT NULL,
  `coloredLensDiameter` decimal(10,2) DEFAULT NULL,
  `coloredLensGraphicDiameter` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `idColoredLens_UNIQUE` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coloredlens`
--

LOCK TABLES `coloredlens` WRITE;
/*!40000 ALTER TABLE `coloredlens` DISABLE KEYS */;
INSERT INTO `coloredlens` VALUES (1,'Hydron海昌百變濾藍光彩色日拋10片裝-星光可可',320.00,1,55.00,6.00,2.00,2.00),(2,'Hydron海昌百變濾藍光彩色日拋10片裝-星光焦糖',320.00,2,34.56,6.70,2.00,4.00),(3,'Hydron海昌百變濾藍光彩色日拋10片裝-星光黑',320.00,3,57.00,5.00,2.00,5.00),(4,'Hydron海昌星眸心機彩色日拋10片裝-心機琥珀',270.00,0,12.00,7.00,3.00,23.00),(5,'Hydron海昌百變濾藍光彩色日拋10片裝-星光咖',320.00,5,64.00,2.00,6.00,5.00),(6,'Hydron海昌百變彩色日拋10片裝-百變棕',280.00,7,32.00,7.00,5.00,3.00),(7,'Hydron海昌百變彩色日拋10片裝-時尚澄',280.00,6,12.00,3.00,2.00,1.00),(8,'Hydron海昌星眸彩色日拋10片裝-大銀河墨',220.00,3,35.00,6.00,1.00,23.00),(9,'Hydron海昌星眸彩色日拋10片裝-大銀河咖',220.00,89,22.00,8.00,2.00,5.00),(10,'Hydron海昌星眸彩色日拋10片裝-星鑽黑',220.00,2,6.60,5.00,31.00,2.00),(11,'Hydron海昌星眸彩色日拋10片裝-蜜糖棕',220.00,5,85.00,4.00,12.00,4.00),(12,'Hydron海昌星眸心機彩色日拋10片裝-心機抹茶',270.00,7,14.00,2.00,10.00,5.00);
/*!40000 ALTER TABLE `coloredlens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquid`
--

DROP TABLE IF EXISTS `liquid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquid` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int NOT NULL,
  `liquidContents` varchar(45) DEFAULT NULL,
  `liquidFeatures` varchar(45) DEFAULT NULL,
  `liquidIndications` varchar(45) DEFAULT NULL,
  `liquidNotes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `idLiquid_UNIQUE` (`productID`),
  UNIQUE KEY `liquidName_UNIQUE` (`productName`)
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
  `memberUsername` varchar(30) NOT NULL,
  `memberName` varchar(45) NOT NULL,
  `memberPassword` varchar(20) NOT NULL,
  `memberEmail` varchar(45) NOT NULL,
  `memberBirthday` date DEFAULT NULL,
  `memberGender` varchar(10) DEFAULT NULL,
  `memberLeftNearsighted` int NOT NULL DEFAULT '0',
  `memberRightNearsighted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `username_UNIQUE` (`memberUsername`),
  UNIQUE KEY `memberID_UNIQUE` (`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (2,'LewisHamilton','Lewis','password','ham44@fmail.com','1997-03-14','male',300,0),(3,'劉曦鴻','','password','ham44@fmail.com','1997-03-14','male',300,0),(37,'darren52499','Darren','abc','test@gmail.com','2023-12-13','female',156,0),(41,'test','張三','123','test@gmail.com','2023-12-01','male',12,13),(43,'asd','李四','asd','test@gmail.com','2023-12-01','male',12,13);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transparentlens`
--

DROP TABLE IF EXISTS `transparentlens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transparentlens` (
  `productID` int NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int NOT NULL,
  `transparentLensWaterContent` decimal(10,2) DEFAULT NULL,
  `transparentLensBaseCurve` decimal(10,2) DEFAULT NULL,
  `transparentLensDiameter` decimal(10,2) DEFAULT NULL,
  `transparentLensGraphicDiameter` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `idtransparentLens_UNIQUE` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transparentlens`
--

LOCK TABLES `transparentlens` WRITE;
/*!40000 ALTER TABLE `transparentlens` DISABLE KEYS */;
INSERT INTO `transparentlens` VALUES (1,'Hydron海昌真水感濾藍光清透日拋30片裝',440.00,1,35.00,3.50,15.50,10.00),(2,'Hydron海昌真水感濾藍光清透日拋10片裝',190.00,2,35.70,4.50,17.00,11.00),(3,'LARGAN星歐透明日拋30片裝(升級版)',290.00,3,23.00,3.60,15.00,12.00),(4,'Hydron海昌純粹氧矽水膠日拋30片裝',499.00,0,23.00,5.00,11.00,13.20),(5,'Hydron海昌真水感透明日拋30片裝',399.00,4,50.00,7.40,11.50,15.50),(6,'Capell卡沛兒睛亮透明日拋30片裝',350.00,5,47.70,2.00,13.00,32.00),(7,'AQUAMAX水滋氧PMB透明日拋30片裝',350.00,4,55.00,45.00,22.00,13.00),(8,'CooperVision酷柏UltraFlex Air奧克拉優氧矽水膠日拋30片裝8.6mm',450.00,8,33.00,23.00,51.00,41.00),(9,'Ticon帝康光漾瞬間非球面透明日拋30片裝',390.00,3,44.20,22.00,14.00,12.50),(10,'Miacare美若康O2Cellence澄氧透明日拋20片裝',580.00,7,58.00,1.00,12.50,13.00),(11,'HBaush+Lomb博士倫ULTRA輕水氧奧澈矽水膠透明日拋30片裝',950.00,5,12.00,23.00,23.00,14.50),(12,'Ticon帝康國民日拋(非球面透明日拋)20片裝',260.00,5,75.00,2.00,23.00,15.00);
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

-- Dump completed on 2024-01-04  2:48:39
