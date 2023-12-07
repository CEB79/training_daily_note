-- MariaDB dump 10.19  Distrib 10.4.31-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mybakery
-- ------------------------------------------------------
-- Server version	10.4.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `userNo` varchar(10) NOT NULL,
  `mnuId` char(4) NOT NULL,
  KEY `basket_user_userNo` (`userNo`),
  KEY `basket_menu_mnuId` (`mnuId`),
  CONSTRAINT `basket_menu_mnuId` FOREIGN KEY (`mnuId`) REFERENCES `menu` (`mnuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `basket_user_userNo` FOREIGN KEY (`userNo`) REFERENCES `user` (`userNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES ('1','1001'),('1','1002'),('1','1003'),('10','1001'),('10','1005'),('3','2001'),('3','2002'),('7','2003'),('8','2001'),('8','2001'),('9','3001');
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `bordId` int(11) NOT NULL,
  `userNo` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `con` varchar(2000) NOT NULL,
  `regDa` date NOT NULL,
  `upDa` date NOT NULL,
  PRIMARY KEY (`bordId`),
  KEY `board_user_userNo` (`userNo`),
  CONSTRAINT `board_user_userNo` FOREIGN KEY (`userNo`) REFERENCES `user` (`userNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'1','신제품 1+1 이벤트','신제품 1+1 이벤트','2022-01-09','2022-01-20'),(2,'8','설 선물 이벤트','설 선물 이벤트','2022-01-15','2022-01-15'),(3,'1','선물하기 이벤트','선물하기 이벤트','2022-03-28','2023-10-11'),(4,'8','SNS 공유 이벤트','SNS 공유 이벤트','2022-04-22','2023-01-23'),(5,'8','1+1 이벤트','1+1 이벤트','2022-07-11','2022-08-01'),(6,'8','추석선물 이벤트','추석선물 이벤트','2022-09-10','2022-09-10'),(7,'1','신제품 출시','신제품 출시','2022-09-21','2022-10-01'),(8,'8','가을 이벤트','가을 이벤트','2022-09-28','2022-09-28'),(9,'8','크리스마스 30%세일','크리스마스 30%세일','2022-12-21','2022-12-23'),(10,'1','추첨 이벤트','추첨 이벤트','2022-12-30','2022-01-02');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `mnuId` char(4) NOT NULL,
  `mnuNa` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `inven` int(11) DEFAULT NULL,
  `evntYN` tinyint(4) DEFAULT NULL,
  `mnuca` varchar(20) NOT NULL,
  `nmuYN` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`mnuId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('1001','에그마요 샌드위치',5200,10,1,'샐러드',0),('1002','햄치즈 샌드위치',5000,10,0,'샐러드',0),('1003','시저샐러드',4800,5,0,'샐러드',0),('1004','치킨샐러드',5400,5,0,'샐러드',0),('1005','BLT샌드위치',5000,5,0,'샐러드',1),('2001','아메리카노',5200,1000,0,'음료',0),('2002','카페라떼',5000,1000,0,'음료',0),('2003','카라멜마끼아또',4800,1000,0,'음료',0),('2004','그린티',5400,1000,1,'음료',0),('2005','밀크티',5000,1000,0,'음료',1),('3001','단팥빵',1500,30,0,'브레드',0),('3002','슈크림빵',1500,30,0,'브레드',0),('3003','바게트',2000,15,0,'브레드',0),('3004','연유바게트',3500,10,0,'브레드',0),('3005','소금빵',3400,30,1,'브레드',0),('3006','소세지빵',3500,25,0,'브레드',0),('4001','순우유',25000,5,0,'케이크',0),('4002','바스크치즈',18000,5,0,'케이크',0),('4003','샤를로트',27000,5,1,'케이크',0),('4004','생크림',22000,5,0,'케이크',0),('4005','초콜릿',26000,5,0,'케이크',1),('5001','에그타르트',5200,15,0,'디저트',0),('5002','레몬타르트',5000,15,0,'디저트',0),('5003','마들렌',4800,30,0,'디저트',0),('5004','마카롱',5400,30,0,'디저트',0),('5005','바움쿠엔',5000,30,0,'디저트',0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ordNo` int(11) NOT NULL,
  `userNo` varchar(10) NOT NULL,
  `mnuId` char(4) NOT NULL,
  `ordDa` datetime NOT NULL,
  `ordPri` int(11) NOT NULL,
  PRIMARY KEY (`ordNo`) USING BTREE,
  KEY `orders_menu_mnuId` (`mnuId`),
  CONSTRAINT `orders_menu_mnuId` FOREIGN KEY (`mnuId`) REFERENCES `menu` (`mnuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'문우현','1001','2022-01-09 00:00:00',5200),(2,'문우현','1002','2022-01-15 00:00:00',5000),(3,'문우현','1003','2022-03-28 00:00:00',4800),(4,'정민준','2003','2022-04-22 00:00:00',4800),(5,'한시하','3005','2022-07-11 00:00:00',3400),(6,'한시하','2003','2022-09-10 00:00:00',4800),(7,'송경아','3006','2022-09-21 00:00:00',3500),(8,'풍다혜','4001','2022-09-28 00:00:00',18000),(9,'황소민','4004','2022-12-21 00:00:00',22000),(10,'황소민','5005','2022-12-30 00:00:00',5000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1',1,'성동석','서울특별시 관악구','010-1234-5678','rgijg0oywm','6bzct'),('10',0,'김은하','서울특별시 서대문구','010-9365-7391','c8yxfl5m84','0l65u'),('2',0,'문우현','서울특별시 강동구','010-9081-2102','gf2r8ag7kg','2c2xm'),('3',0,'정민준','서울특별시 강서구','010-7391-4851','i11dd77c30','dk0ep'),('4',0,'한시하','서울특별시 강북구','010-8339-5135','l2gcr3jsum','agk04'),('5',0,'송경아','서울특별시 광진구','010-2039-9365','jf78g0t65g','dovtp'),('6',0,'풍다혜','서울특별시 구로구','010-1564-4082','cxo2old1iy','uo883'),('7',0,'황소민','서울특별시 금천구','010-5922-4943','gacpk8rnht','103gj'),('8',1,'조태웅','서울특별시 노원구','010-6842-7245','zcu8zavebd','iets2'),('9',0,'정철진','서울특별시 마포구','010-3729-0374','wtnratn4hi','xmx5h');
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

-- Dump completed on 2023-10-16  9:25:14
CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
)CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
)-- MariaDB dump 10.19  Distrib 10.4.31-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mybakery
-- ------------------------------------------------------
-- Server version	10.4.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `userNo` varchar(10) NOT NULL,
  `mnuId` char(4) NOT NULL,
  KEY `basket_user_userNo` (`userNo`),
  KEY `basket_menu_mnuId` (`mnuId`),
  CONSTRAINT `basket_menu_mnuId` FOREIGN KEY (`mnuId`) REFERENCES `menu` (`mnuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `basket_user_userNo` FOREIGN KEY (`userNo`) REFERENCES `user` (`userNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES ('1','1001'),('1','1002'),('1','1003'),('10','1001'),('10','1005'),('3','2001'),('3','2002'),('7','2003'),('8','2001'),('8','2001'),('9','3001');
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `bordId` int(11) NOT NULL,
  `userNo` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `con` varchar(2000) NOT NULL,
  `regDa` date NOT NULL,
  `upDa` date NOT NULL,
  PRIMARY KEY (`bordId`),
  KEY `board_user_userNo` (`userNo`),
  CONSTRAINT `board_user_userNo` FOREIGN KEY (`userNo`) REFERENCES `user` (`userNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'1','신제품 1+1 이벤트','신제품 1+1 이벤트','2022-01-09','2022-01-20'),(2,'8','설 선물 이벤트','설 선물 이벤트','2022-01-15','2022-01-15'),(3,'1','선물하기 이벤트','선물하기 이벤트','2022-03-28','2023-10-11'),(4,'8','SNS 공유 이벤트','SNS 공유 이벤트','2022-04-22','2023-01-23'),(5,'8','1+1 이벤트','1+1 이벤트','2022-07-11','2022-08-01'),(6,'8','추석선물 이벤트','추석선물 이벤트','2022-09-10','2022-09-10'),(7,'1','신제품 출시','신제품 출시','2022-09-21','2022-10-01'),(8,'8','가을 이벤트','가을 이벤트','2022-09-28','2022-09-28'),(9,'8','크리스마스 30%세일','크리스마스 30%세일','2022-12-21','2022-12-23'),(10,'1','추첨 이벤트','추첨 이벤트','2022-12-30','2022-01-02');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `mnuId` char(4) NOT NULL,
  `mnuNa` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `inven` int(11) DEFAULT NULL,
  `evntYN` tinyint(4) DEFAULT NULL,
  `mnuca` varchar(20) NOT NULL,
  `nmuYN` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`mnuId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('1001','에그마요 샌드위치',5200,10,1,'샐러드',0),('1002','햄치즈 샌드위치',5000,10,0,'샐러드',0),('1003','시저샐러드',4800,5,0,'샐러드',0),('1004','치킨샐러드',5400,5,0,'샐러드',0),('1005','BLT샌드위치',5000,5,0,'샐러드',1),('2001','아메리카노',5200,1000,0,'음료',0),('2002','카페라떼',5000,1000,0,'음료',0),('2003','카라멜마끼아또',4800,1000,0,'음료',0),('2004','그린티',5400,1000,1,'음료',0),('2005','밀크티',5000,1000,0,'음료',1),('3001','단팥빵',1500,30,0,'브레드',0),('3002','슈크림빵',1500,30,0,'브레드',0),('3003','바게트',2000,15,0,'브레드',0),('3004','연유바게트',3500,10,0,'브레드',0),('3005','소금빵',3400,30,1,'브레드',0),('3006','소세지빵',3500,25,0,'브레드',0),('4001','순우유',25000,5,0,'케이크',0),('4002','바스크치즈',18000,5,0,'케이크',0),('4003','샤를로트',27000,5,1,'케이크',0),('4004','생크림',22000,5,0,'케이크',0),('4005','초콜릿',26000,5,0,'케이크',1),('5001','에그타르트',5200,15,0,'디저트',0),('5002','레몬타르트',5000,15,0,'디저트',0),('5003','마들렌',4800,30,0,'디저트',0),('5004','마카롱',5400,30,0,'디저트',0),('5005','바움쿠엔',5000,30,0,'디저트',0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ordNo` int(11) NOT NULL,
  `userNo` varchar(10) NOT NULL,
  `mnuId` char(4) NOT NULL,
  `ordDa` datetime NOT NULL,
  `ordPri` int(11) NOT NULL,
  PRIMARY KEY (`ordNo`) USING BTREE,
  KEY `orders_menu_mnuId` (`mnuId`),
  CONSTRAINT `orders_menu_mnuId` FOREIGN KEY (`mnuId`) REFERENCES `menu` (`mnuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'문우현','1001','2022-01-09 00:00:00',5200),(2,'문우현','1002','2022-01-15 00:00:00',5000),(3,'문우현','1003','2022-03-28 00:00:00',4800),(4,'정민준','2003','2022-04-22 00:00:00',4800),(5,'한시하','3005','2022-07-11 00:00:00',3400),(6,'한시하','2003','2022-09-10 00:00:00',4800),(7,'송경아','3006','2022-09-21 00:00:00',3500),(8,'풍다혜','4001','2022-09-28 00:00:00',18000),(9,'황소민','4004','2022-12-21 00:00:00',22000),(10,'황소민','5005','2022-12-30 00:00:00',5000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1',1,'성동석','서울특별시 관악구','010-1234-5678','rgijg0oywm','6bzct'),('10',0,'김은하','서울특별시 서대문구','010-9365-7391','c8yxfl5m84','0l65u'),('2',0,'문우현','서울특별시 강동구','010-9081-2102','gf2r8ag7kg','2c2xm'),('3',0,'정민준','서울특별시 강서구','010-7391-4851','i11dd77c30','dk0ep'),('4',0,'한시하','서울특별시 강북구','010-8339-5135','l2gcr3jsum','agk04'),('5',0,'송경아','서울특별시 광진구','010-2039-9365','jf78g0t65g','dovtp'),('6',0,'풍다혜','서울특별시 구로구','010-1564-4082','cxo2old1iy','uo883'),('7',0,'황소민','서울특별시 금천구','010-5922-4943','gacpk8rnht','103gj'),('8',1,'조태웅','서울특별시 노원구','010-6842-7245','zcu8zavebd','iets2'),('9',0,'정철진','서울특별시 마포구','010-3729-0374','wtnratn4hi','xmx5h');
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

-- Dump completed on 2023-10-16  9:25:14
CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
)CREATE TABLE `user` (
  `userNo` varchar(10) NOT NULL,
  `adm` tinyint(4) DEFAULT NULL,
  `userNa` varchar(50) NOT NULL,
  `adress` varchar(1000) NOT NULL,
  `phNo` char(13) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(20) NOT NULL,
  PRIMARY KEY (`userNo`) USING BTREE
)ordersmybakerymybakerymybakeryordersordersordersorders