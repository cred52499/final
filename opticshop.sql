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
-- Table structure for table `coloredlens`
--

DROP TABLE IF EXISTS `coloredlens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coloredlens` (
  `idColoredLens` int NOT NULL AUTO_INCREMENT,
  `coloredLensName` varchar(100) NOT NULL,
  `coloredLensPrice` decimal(10,2) NOT NULL,
  `coloredLensStock` int NOT NULL,
  `coloredLensWaterContent` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `coloredLensBaseCurve` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `coloredLensDiameter` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `coloredLensGraphicDiameter` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `instock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idColoredLens`),
  UNIQUE KEY `idColoredLens_UNIQUE` (`idColoredLens`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coloredlens`
--

LOCK TABLES `coloredlens` WRITE;
/*!40000 ALTER TABLE `coloredlens` DISABLE KEYS */;
INSERT INTO `coloredlens` VALUES (1,'Hydron海昌百變濾藍光彩色日拋10片裝-星光可可',320.00,1,00000055.00,00000006.00,00000002.00,00000002.00,0),(2,'Hydron海昌百變濾藍光彩色日拋10片裝-星光焦糖',320.00,2,00000034.56,00000006.70,00000002.00,00000004.00,0),(3,'Hydron海昌百變濾藍光彩色日拋10片裝-星光黑',320.00,3,00000057.00,00000005.00,00000002.00,00000005.00,0),(4,'Hydron海昌星眸心機彩色日拋10片裝-心機琥珀',270.00,0,00000012.00,00000007.00,00000003.00,00000023.00,0),(5,'Hydron海昌百變濾藍光彩色日拋10片裝-星光咖',320.00,5,00000064.00,00000002.00,00000006.00,00000005.00,0),(6,'Hydron海昌百變彩色日拋10片裝-百變棕',280.00,7,00000032.00,00000007.00,00000005.00,00000003.00,0),(7,'Hydron海昌百變彩色日拋10片裝-時尚澄',280.00,6,00000012.00,00000003.00,00000002.00,00000001.00,0),(8,'Hydron海昌星眸彩色日拋10片裝-大銀河墨',220.00,3,00000035.00,00000006.00,00000001.00,00000023.00,0),(9,'Hydron海昌星眸彩色日拋10片裝-大銀河咖',220.00,89,00000022.00,00000008.00,00000002.00,00000005.00,0),(10,'Hydron海昌星眸彩色日拋10片裝-星鑽黑',220.00,2,00000006.60,00000005.00,00000031.00,00000002.00,0),(11,'Hydron海昌星眸彩色日拋10片裝-蜜糖棕',220.00,5,00000085.00,00000004.00,00000012.00,00000004.00,0),(12,'Hydron海昌星眸心機彩色日拋10片裝-心機抹茶',270.00,7,00000014.00,00000002.00,00000010.00,00000005.00,0);
/*!40000 ALTER TABLE `coloredlens` ENABLE KEYS */;
UNLOCK TABLES;

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
  `instock` tinyint(1) DEFAULT '0',
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
INSERT INTO `liquid` VALUES (1,'Bausch+Lomb 博士倫Biotrue博士倫舒視能水漾平衡多效保養液300ML',240.00,1,'水','清爽','睡前使用','無',0),(2,'Bausch+Lomb 博士倫Biotrue博士倫舒視能舒潤液單支裝-30支',299.00,0,'蘆薈','清涼','乾燥時使用','不適用敏感肌',0),(3,'Bausch+Lomb 博士倫Renu博士倫瑞霖水漾清新多效保養液355ML',220.00,2,NULL,NULL,NULL,NULL,0),(4,'Bausch+Lomb 博士倫Boston博士倫博視頓先進護理液120ML',260.00,3,NULL,NULL,NULL,NULL,0),(5,'Bausch+Lomb 博士倫Boston博視頓新潔多功能護理液120ML',340.00,5,NULL,NULL,NULL,NULL,0),(6,'Bausch+Lomb 博士倫Boston博士倫博視頓舒潤液10ML',220.00,7,NULL,NULL,NULL,NULL,0),(7,'Bausch+Lomb 博士倫Boston博士倫博視頓酵素除蛋白清潔液5ML',220.00,6,NULL,NULL,NULL,NULL,0),(8,'Bausch+Lomb 博士倫Boston博士倫博視頓先進清潔液30ML',220.00,8,NULL,NULL,NULL,NULL,0),(9,'Hydron海昌美麗秘密長效保濕隱形眼鏡潤濕液15ml',120.00,5,NULL,NULL,NULL,NULL,0),(10,'Hydron海昌粉紅玻尿酸保養液360ml',240.00,3,NULL,NULL,NULL,NULL,0),(11,'海昌美麗主張無汞緩衝液360ml',30.00,4,NULL,NULL,NULL,NULL,0),(12,'Miacare美若康睛透多效保養液360ml',235.00,2,NULL,NULL,NULL,NULL,0);
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
  `idTransparentLens` int NOT NULL AUTO_INCREMENT,
  `transparentLensName` varchar(100) NOT NULL,
  `transparentLensPrice` decimal(10,2) NOT NULL,
  `transparentLensStock` int NOT NULL,
  `transparentLensWaterContent` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `transparentLensBaseCurve` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `transparentLensDiameter` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `transparentLensGraphicDiameter` decimal(10,2) unsigned zerofill DEFAULT '00000000.00',
  `instock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idTransparentLens`),
  UNIQUE KEY `idtransparentLens_UNIQUE` (`idTransparentLens`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transparentlens`
--

LOCK TABLES `transparentlens` WRITE;
/*!40000 ALTER TABLE `transparentlens` DISABLE KEYS */;
INSERT INTO `transparentlens` VALUES (1,'Hydron海昌真水感濾藍光清透日拋30片裝',440.00,1,00000035.00,00000003.50,00000015.50,00000010.00,0),(2,'Hydron海昌真水感濾藍光清透日拋10片裝',190.00,2,00000035.70,00000004.50,00000017.00,00000011.00,0),(3,'LARGAN星歐透明日拋30片裝(升級版)',290.00,3,00000023.00,00000003.60,00000015.00,00000012.00,0),(4,'Hydron海昌純粹氧矽水膠日拋30片裝',499.00,0,00000023.00,00000005.00,00000011.00,00000013.20,0),(5,'Hydron海昌真水感透明日拋30片裝',399.00,4,00000050.00,00000007.40,00000011.50,00000015.50,0),(6,'Capell卡沛兒睛亮透明日拋30片裝',350.00,5,00000047.70,00000002.00,00000013.00,00000032.00,0),(7,'AQUAMAX水滋氧PMB透明日拋30片裝',350.00,4,00000055.00,00000045.00,00000022.00,00000013.00,0),(8,'CooperVision酷柏UltraFlex Air奧克拉優氧矽水膠日拋30片裝8.6mm',450.00,8,00000033.00,00000023.00,00000051.00,00000041.00,0),(9,'Ticon帝康光漾瞬間非球面透明日拋30片裝',390.00,3,00000044.20,00000022.00,00000014.00,00000012.50,0),(10,'Miacare美若康O2Cellence澄氧透明日拋20片裝',580.00,7,00000058.00,00000001.00,00000012.50,00000013.00,0),(11,'HBaush+Lomb博士倫ULTRA輕水氧奧澈矽水膠透明日拋30片裝',950.00,5,00000012.00,00000023.00,00000023.00,00000014.50,0),(12,'Ticon帝康國民日拋(非球面透明日拋)20片裝',260.00,5,00000075.00,00000002.00,00000023.00,00000015.00,0);
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

-- Dump completed on 2024-01-03 16:07:28
