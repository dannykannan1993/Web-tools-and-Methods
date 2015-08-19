CREATE DATABASE  IF NOT EXISTS `bookbucket` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bookbucket`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: bookbucket
-- ------------------------------------------------------
-- Server version	5.5.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `streetName` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `addressLine2` varchar(45) DEFAULT NULL,
  `personId` int(11) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `personId_idx` (`personId`),
  CONSTRAINT `personId` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) NOT NULL,
  `productCategory` varchar(45) DEFAULT NULL,
  `productType` varchar(45) DEFAULT NULL,
  `producCost` decimal(4,0) DEFAULT '0',
  `author` varchar(45) NOT NULL,
  `edition` varchar(45) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=12102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (12000,'Engineering Mechanics','Mechanics','Old',25,'Jane thomas','3',1),(12002,'Java Made Easy','Programming','Old',23,'Bala Karen','3',1),(12081,'Book1',NULL,'New',22,'Author1','Edition1',1),(12092,'Book6',NULL,'New',NULL,'Author3','Edition6',0),(12098,'jam',NULL,'New',23,'jam','jam1',1),(12099,'den',NULL,'New',NULL,'den','den1',0),(12100,'Book2',NULL,'New',23,'Author2','jam1',1),(12101,'Danny',NULL,'New',NULL,'Author2','Edition1',0);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `cardNumber` bigint(20) NOT NULL,
  `holderName` varchar(45) NOT NULL,
  `expiryMonth` int(11) NOT NULL,
  `cardType` varchar(45) NOT NULL,
  `customerId` int(11) NOT NULL,
  `cvc` int(11) NOT NULL,
  `expiryYear` int(11) NOT NULL,
  PRIMARY KEY (`cardNumber`),
  KEY `customerId_idx` (`customerId`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differentorder`
--

DROP TABLE IF EXISTS `differentorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differentorder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderType` varchar(45) NOT NULL,
  `orderDate` date NOT NULL,
  `orderStatus` varchar(45) NOT NULL,
  `orderAmount` decimal(7,2) DEFAULT NULL,
  `orderPersonId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `orderPersonId_idx` (`orderPersonId`),
  CONSTRAINT `orderPersonId` FOREIGN KEY (`orderPersonId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differentorder`
--

LOCK TABLES `differentorder` WRITE;
/*!40000 ALTER TABLE `differentorder` DISABLE KEYS */;
INSERT INTO `differentorder` VALUES (19,'Buyer Old','2015-04-24','Order Delivered',250.00,10005),(20,'Buyer New','2015-04-24','Order Updated',66.00,10005),(21,'Seller Old','2015-04-24','Order to be reviewed',NULL,10005),(22,'Buyer Old','2015-04-24','Order Delivered',50.00,10005),(23,'Buyer New','2015-04-24','Order Updated',280.80,10005),(24,'Seller Old','2015-04-24','Order to be reviewed',NULL,10005),(25,'Buyer Old','2015-04-24','Partially Delivered',46.00,10005),(26,'Buyer New','2015-04-24','Order to be reviewed',NULL,10005),(27,'Buyer Old','2015-04-24','Order to be reviewed',50.00,10012),(28,'Buyer New','2015-04-24','Order to be reviewed',276.00,10012),(29,'Seller Old','2015-04-24','Order to be reviewed',NULL,10012);
/*!40000 ALTER TABLE `differentorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributor` (
  `distributorId` int(11) NOT NULL,
  `distributorName` varchar(45) NOT NULL,
  `distributorAddressId` int(11) NOT NULL,
  `distributorInventoryId` int(11) DEFAULT NULL,
  `addressId` int(11) NOT NULL,
  PRIMARY KEY (`distributorId`),
  KEY `distributorAddressId_idx` (`distributorAddressId`),
  KEY `distributorInventoryId_idx` (`distributorInventoryId`),
  CONSTRAINT `distributorAddressId` FOREIGN KEY (`distributorAddressId`) REFERENCES `address` (`addressId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventoryitem`
--

DROP TABLE IF EXISTS `inventoryitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventoryitem` (
  `productinventoryId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `inventoryId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inventoryId`),
  KEY `productId_idx` (`productinventoryId`),
  CONSTRAINT `productinventoryId` FOREIGN KEY (`productinventoryId`) REFERENCES `book` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventoryitem`
--

LOCK TABLES `inventoryitem` WRITE;
/*!40000 ALTER TABLE `inventoryitem` DISABLE KEYS */;
INSERT INTO `inventoryitem` VALUES (12000,48,10),(12002,5,11),(12092,0,29),(12081,0,31),(12098,0,36),(12099,0,37),(12100,8,38),(12101,0,39);
/*!40000 ALTER TABLE `inventoryitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `orderitemId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `itemStatus` varchar(45) DEFAULT NULL,
  `tempCost` decimal(4,4) DEFAULT '0.0000',
  PRIMARY KEY (`orderitemId`),
  KEY `productId_idx` (`productId`),
  KEY `orderId_idx` (`orderId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `differentorder` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `book` (`productId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (7,10,12000,19,'All items delivered',0.0000),(8,3,12081,20,'11',0.0000),(9,7,12081,21,'23',0.0000),(10,9,12092,21,NULL,0.0000),(11,2,12000,22,'All items delivered',0.0000),(12,12,12098,23,'22',0.0000),(13,8,12081,24,NULL,0.0000),(14,22,12000,25,'All items delivered',0.0000),(15,2,12002,25,NULL,0.0000),(16,24,12081,26,NULL,0.0000),(17,2,12000,27,NULL,0.0000),(18,12,12100,28,'All items delivered',0.0000),(19,3,12101,29,'29',0.0000);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `paymentState` varchar(45) NOT NULL,
  `paymentAmount` decimal(4,0) NOT NULL,
  `paymentOrderId` int(11) NOT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `paymentOrderId_idx` (`paymentOrderId`),
  CONSTRAINT `paymentOrderId` FOREIGN KEY (`paymentOrderId`) REFERENCES `differentorder` (`orderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personId` int(11) NOT NULL AUTO_INCREMENT,
  `personFName` varchar(45) DEFAULT NULL,
  `personLName` varchar(45) DEFAULT NULL,
  `personAge` int(11) DEFAULT NULL,
  `perosnGender` varchar(45) DEFAULT NULL,
  `department` varchar(31) NOT NULL,
  `creditpoints` int(11) DEFAULT NULL,
  `userName` varchar(45) NOT NULL,
  `userPassword` varchar(45) NOT NULL,
  `emailId` varchar(45) NOT NULL,
  `personType` varchar(45) NOT NULL,
  `personGender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`personId`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (10004,'Kumaran','Jayasankaran',25,'Male','admin',NULL,'jaya','jaya','kumaran.jaya@gmail.com','admin',NULL),(10005,'Danisha','Vayalandi',22,'Female','customer',14,'danny','danisha','dannykannan1993@gmail.com','customer',NULL),(10006,'Ganesh','Kannan',29,'Male','operator',NULL,'ganesh','ganesh','ganesh@gmail.com','operator',NULL),(10007,NULL,NULL,0,NULL,'customer',NULL,'830','henry','danishakannan1993@gmail.com','customer',NULL),(10009,NULL,NULL,0,NULL,'customer',NULL,'kman','kman','danishakannan1993@gmail.com','customer',NULL),(10012,NULL,NULL,0,NULL,'customer',NULL,'kumaran','kumaran','dannykannan1993@gmail.com','customer',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `bookId` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (12000,1,23,1,2014),(12000,2,24,2,2014),(12000,3,38,3,2014),(12000,4,12,4,2014),(12000,5,11,5,2014),(12000,6,34,6,2014),(12000,7,12,7,2014),(12000,8,33,8,2014),(12000,9,24,9,2014),(12000,10,14,10,2014),(12000,11,56,11,2014),(12000,12,23,12,2014),(12003,1,45,13,2015),(12004,4,50,14,2015),(12000,1,65,15,2015);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelist`
--

DROP TABLE IF EXISTS `storelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelist` (
  `storeId` int(11) NOT NULL,
  `storeName` varchar(45) NOT NULL,
  `storeAddressId` int(11) DEFAULT NULL,
  `addressId` int(11) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`storeId`),
  KEY `storeAddressId_idx` (`storeAddressId`),
  CONSTRAINT `storeAddressId` FOREIGN KEY (`storeAddressId`) REFERENCES `address` (`addressId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelist`
--

LOCK TABLES `storelist` WRITE;
/*!40000 ALTER TABLE `storelist` DISABLE KEYS */;
INSERT INTO `storelist` VALUES (1,'Opera House',NULL,0,42.353992,-71.062318),(2,'NU',NULL,0,42.339807,-71.089172),(3,'Fenway Park',NULL,0,42.346676,-71.097218),(4,'Somerville',NULL,0,42.390354,-71.094354),(5,'',NULL,0,42.411208,-71.08283),(6,'',NULL,0,42.342786,-71.10549);
/*!40000 ALTER TABLE `storelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bookbucket'
--

--
-- Dumping routines for database 'bookbucket'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-24 15:47:25
