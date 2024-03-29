CREATE DATABASE  IF NOT EXISTS `opticshop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `opticshop`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: opticshop
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `href` varchar(45) NOT NULL,
  `img` varchar(45) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (1,'activity/activity/act01/act01.html','activity/activity/act01/image/act01.jpg','聖誕瞳樂！全館打折！'),(2,'activity/activity/act02/act02.html','activity/activity/act02/image/act02.jpg','2024 新年快樂！'),(3,'activity/activity/act03/act03.html','activity/activity/act03/image/act03.jpg','聖誕節過不了 可以過剩單節^^');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'D8A2360524D9A42B0CD21B01B6CDDF6A','2024-01-03'),(6,'B2FAA88CA667BD54F2B8141CE671B149','2024-01-03'),(14,'5A8D62FB21CE1C32B2F4834B5F848EF6','2024-01-03'),(15,'FD84A00459A9D2B0BBD6240F5B3F53CA','2024-01-03'),(34,'41','2024-01-03'),(35,'599328B84485D34429CAC9C6E11F25AA','2024-01-03'),(39,'E0E740CD595FDD6AAFA5282D77687F8A','2024-01-04'),(42,'37','2024-01-04'),(87,'C02097F7B2F211478A4998EE5571E6A0','2024-01-04'),(89,'2','2024-01-04'),(96,'60567C77E8BF66014A16B016C5FC0F92','2024-01-04'),(100,'52FBEAFF383B126660E1DF6875F10C4D','2024-01-04'),(111,'5D211CAAD6DA38FD97BEE3FD7EFBD659','2024-01-05');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetails`
--

LOCK TABLES `cartdetails` WRITE;
/*!40000 ALTER TABLE `cartdetails` DISABLE KEYS */;
INSERT INTO `cartdetails` VALUES (1,15,'liquid',1,NULL),(4,15,'liquid',3,NULL),(9,15,'liquid',4,NULL),(12,15,'liquid',5,NULL),(16,34,'liquid',6,1),(19,34,'liquid',9,1),(20,34,'liquid',1,1),(22,34,'liquid',3,1),(32,34,'liquid',4,1),(33,34,'liquid',7,1),(35,34,'liquid',8,1),(37,0,'null',0,NULL);
/*!40000 ALTER TABLE `cartdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coloredlens`
--

DROP TABLE IF EXISTS `coloredlens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coloredlens` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int NOT NULL,
  `coloredLensWaterContent` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `coloredLensBaseCurve` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `coloredLensDiameter` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `coloredLensGraphicDiameter` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `instock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`productID`),
  UNIQUE KEY `idColoredLens_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coloredlens`
--

LOCK TABLES `coloredlens` WRITE;
/*!40000 ALTER TABLE `coloredlens` DISABLE KEYS */;
INSERT INTO `coloredlens` VALUES (1,'Hydron海昌百變濾藍光彩色日拋10片裝-星光可可',320.00,1,00000055.00,00000006.00,00000002.00,00000002.00,0),(2,'Hydron海昌百變濾藍光彩色日拋10片裝-星光焦糖',320.00,2,00000034.56,00000006.70,00000002.00,00000004.00,1),(3,'Hydron海昌百變濾藍光彩色日拋10片裝-星光黑',320.00,3,00000057.00,00000005.00,00000002.00,00000005.00,1),(4,'Hydron海昌星眸心機彩色日拋10片裝-心機琥珀',270.00,0,00000012.00,00000007.00,00000003.00,00000023.00,1),(5,'Hydron海昌百變濾藍光彩色日拋10片裝-星光咖',320.00,5,00000064.00,00000002.00,00000006.00,00000005.00,1),(6,'Hydron海昌百變彩色日拋10片裝-百變棕',280.00,7,00000032.00,00000007.00,00000005.00,00000003.00,1),(7,'Hydron海昌百變彩色日拋10片裝-時尚澄',280.00,6,00000012.00,00000003.00,00000002.00,00000001.00,1),(8,'Hydron海昌星眸彩色日拋10片裝-大銀河墨',220.00,3,00000035.00,00000006.00,00000001.00,00000023.00,0),(9,'Hydron海昌星眸彩色日拋10片裝-大銀河咖',220.00,89,00000022.00,00000008.00,00000002.00,00000005.00,0),(10,'Hydron海昌星眸彩色日拋10片裝-星鑽黑',220.00,2,00000006.60,00000005.00,00000031.00,00000002.00,0),(11,'Hydron海昌星眸彩色日拋10片裝-蜜糖棕',220.00,5,00000085.00,00000004.00,00000012.00,00000004.00,0),(12,'Hydron海昌星眸心機彩色日拋10片裝-心機抹茶',270.00,7,00000014.00,00000002.00,00000010.00,00000005.00,0);
/*!40000 ALTER TABLE `coloredlens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentID` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  `productID` varchar(45) NOT NULL,
  `memberID` int NOT NULL,
  `rate` int NOT NULL DEFAULT '0',
  `content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  UNIQUE KEY `commentID_UNIQUE` (`commentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'transparentlens','1',37,5,'我有大麻煩了'),(2,'transparentlens','1',37,5,'123'),(3,'transparentlens','1',41,1,'差評！！！'),(4,'transparentlens','1',41,5,'');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
  `instock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`productID`),
  UNIQUE KEY `idLiquid_UNIQUE` (`productID`),
  UNIQUE KEY `liquidName_UNIQUE` (`productName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquid`
--

LOCK TABLES `liquid` WRITE;
/*!40000 ALTER TABLE `liquid` DISABLE KEYS */;
INSERT INTO `liquid` VALUES (1,'Bausch+Lomb 博士倫Biotrue博士倫舒視能水漾平衡多效保養液300ML',240.00,20,'水','清爽','睡前使用','無',1),(2,'Bausch+Lomb 博士倫Biotrue博士倫舒視能舒潤液單支裝-30支',299.00,0,'蘆薈','清涼','乾燥時使用','不適用敏感肌',0),(3,'Bausch+Lomb 博士倫Renu博士倫瑞霖水漾清新多效保養液355ML',220.00,2,NULL,NULL,NULL,NULL,1),(4,'Bausch+Lomb 博士倫Boston博士倫博視頓先進護理液120ML',260.00,3,NULL,NULL,NULL,NULL,0),(5,'Bausch+Lomb 博士倫Boston博視頓新潔多功能護理液120ML',340.00,5,NULL,NULL,NULL,NULL,0),(6,'Bausch+Lomb 博士倫Boston博士倫博視頓舒潤液10ML',220.00,7,NULL,NULL,NULL,NULL,1),(7,'Bausch+Lomb 博士倫Boston博士倫博視頓酵素除蛋白清潔液5ML',220.00,6,NULL,NULL,NULL,NULL,1),(8,'Bausch+Lomb 博士倫Boston博士倫博視頓先進清潔液30ML',220.00,8,NULL,NULL,NULL,NULL,0),(9,'Hydron海昌美麗秘密長效保濕隱形眼鏡潤濕液15ml',120.00,5,NULL,NULL,NULL,NULL,1),(10,'Hydron海昌粉紅玻尿酸保養液360ml',240.00,3,NULL,NULL,NULL,NULL,1),(11,'海昌美麗主張無汞緩衝液360ml',30.00,4,NULL,NULL,NULL,NULL,0),(12,'Miacare美若康睛透多效保養液360ml',235.00,2,NULL,NULL,NULL,NULL,0);
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
INSERT INTO `member` VALUES (2,'LewisHamilton','Lewis','password','ham44@fmail.com','1985-01-07','male',300,350),(3,'劉曦鴻','','password','ham44@fmail.com','1997-03-14','male',300,0),(37,'darren52499','Darren','abc','test@gmail.com','2023-12-13','female',156,0),(41,'test','張三','123','test@gmail.com','2023-12-01','male',12,13),(43,'asd','李四','asd','test@gmail.com','2023-12-01','male',12,13);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `orderDate` varchar(30) NOT NULL,
  `productID` int NOT NULL,
  `productCategory` varchar(45) NOT NULL,
  `orderQty` int NOT NULL,
  `memberID` varchar(45) NOT NULL,
  `memberAddress` varchar(45) NOT NULL,
  `memberPhoneNum` int DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `subtotal` int NOT NULL,
  `cartID` int NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (8,'2024-01-05',1,'liquid',1,'41','asd',123,'1',240,34),(9,'2024-01-05',3,'liquid',2,'41','asd',123,'0',440,34),(10,'2024-01-05',4,'liquid',1,'41','asd',123,'0',260,34),(11,'2024-01-05',6,'liquid',1,'41','asd',123,'0',220,34),(12,'2024-01-05',7,'liquid',1,'41','asd',123,'0',220,34),(13,'2024-01-05',8,'liquid',1,'41','asd',123,'0',220,34),(14,'2024-01-05',9,'liquid',1,'41','asd',123,'0',120,34);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transparentlens`
--

DROP TABLE IF EXISTS `transparentlens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transparentlens` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int NOT NULL,
  `transparentLensWaterContent` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `transparentLensBaseCurve` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `transparentLensDiameter` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `transparentLensGraphicDiameter` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `instock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`productID`),
  UNIQUE KEY `idtransparentLens_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transparentlens`
--

LOCK TABLES `transparentlens` WRITE;
/*!40000 ALTER TABLE `transparentlens` DISABLE KEYS */;
INSERT INTO `transparentlens` VALUES (1,'Hydron海昌真水感濾藍光清透日拋30片裝',440.00,1,00000035.00,00000003.50,00000015.50,00000010.00,1),(2,'Hydron海昌真水感濾藍光清透日拋10片裝',190.00,2,00000035.70,00000004.50,00000017.00,00000011.00,1),(3,'LARGAN星歐透明日拋30片裝(升級版)',290.00,3,00000023.00,00000003.60,00000015.00,00000012.00,1),(4,'Hydron海昌純粹氧矽水膠日拋30片裝',499.00,0,00000023.00,00000005.00,00000011.00,00000013.20,1),(5,'Hydron海昌真水感透明日拋30片裝',399.00,4,00000050.00,00000007.40,00000011.50,00000015.50,1),(6,'Capell卡沛兒睛亮透明日拋30片裝',350.00,5,00000047.70,00000002.00,00000013.00,00000032.00,1),(7,'AQUAMAX水滋氧PMB透明日拋30片裝',350.00,4,00000055.00,00000045.00,00000022.00,00000013.00,1),(8,'CooperVision酷柏UltraFlex Air奧克拉優氧矽水膠日拋30片裝8.6mm',450.00,8,00000033.00,00000023.00,00000051.00,00000041.00,0),(9,'Ticon帝康光漾瞬間非球面透明日拋30片裝',390.00,3,00000044.20,00000022.00,00000014.00,00000012.50,0),(10,'Miacare美若康O2Cellence澄氧透明日拋20片裝',580.00,7,00000058.00,00000001.00,00000012.50,00000013.00,0),(11,'HBaush+Lomb博士倫ULTRA輕水氧奧澈矽水膠透明日拋30片裝',950.00,5,00000012.00,00000023.00,00000023.00,00000014.50,0),(12,'Ticon帝康國民日拋(非球面透明日拋)20片裝',260.00,5,00000075.00,00000002.00,00000023.00,00000015.00,0);
/*!40000 ALTER TABLE `transparentlens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitorcounter`
--

DROP TABLE IF EXISTS `visitorcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitorcounter` (
  `visitorNum` int NOT NULL,
  PRIMARY KEY (`visitorNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitorcounter`
--

LOCK TABLES `visitorcounter` WRITE;
/*!40000 ALTER TABLE `visitorcounter` DISABLE KEYS */;
INSERT INTO `visitorcounter` VALUES (46);
/*!40000 ALTER TABLE `visitorcounter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-06  1:43:46
