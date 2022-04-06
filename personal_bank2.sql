-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: personal_bank
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
-- Table structure for table `broker_account`
--

DROP TABLE IF EXISTS `broker_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_account` (
  `broker_id_profile_id` int(10) unsigned NOT NULL,
  `broker_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `broker_updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `broker_deleted_at` datetime DEFAULT NULL,
  `broker_contract` bigint(19) unsigned NOT NULL,
  `broker_cash` decimal(64,2) unsigned DEFAULT NULL,
  UNIQUE KEY `broker_contract_UNIQUE` (`broker_contract`),
  KEY `fk_broker_account_profile1_idx` (`broker_id_profile_id`),
  CONSTRAINT `fk_broker_account_profile1` FOREIGN KEY (`broker_id_profile_id`) REFERENCES `profile` (`id_profile_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_account`
--

LOCK TABLES `broker_account` WRITE;
/*!40000 ALTER TABLE `broker_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `card_id_profile_id` int(10) unsigned NOT NULL,
  `card_number` bigint(19) unsigned NOT NULL,
  `card_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `card_deleted_at` datetime DEFAULT NULL,
  `card_sum` decimal(64,2) unsigned DEFAULT NULL,
  `card_type` enum('Maestro','Visa','Mastercard') NOT NULL,
  UNIQUE KEY `card_number_UNIQUE` (`card_number`),
  KEY `fk_card_profile1_idx` (`card_id_profile_id`),
  CONSTRAINT `fk_card_profile1` FOREIGN KEY (`card_id_profile_id`) REFERENCES `profile` (`id_profile_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_services`
--

DROP TABLE IF EXISTS `com_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_services` (
  `id_com_services` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `com_services_name` varchar(300) NOT NULL,
  `com_services_inn` bigint(19) unsigned NOT NULL,
  `com_services_account` bigint(19) unsigned NOT NULL,
  `com_servicescol_account_sum` decimal(64,2) DEFAULT NULL,
  PRIMARY KEY (`id_com_services`),
  UNIQUE KEY `com_services_inn_UNIQUE` (`com_services_inn`),
  UNIQUE KEY `com_services_account_UNIQUE` (`com_services_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_services`
--

LOCK TABLES `com_services` WRITE;
/*!40000 ALTER TABLE `com_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit` (
  `credit_id_profile_id` int(10) unsigned NOT NULL,
  `credit_contract` bigint(19) unsigned NOT NULL,
  `credit_created_at` datetime NOT NULL,
  `credit_sum` decimal(64,2) unsigned NOT NULL,
  `credit_pay` decimal(64,2) unsigned NOT NULL,
  `credit_updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `credit_deleted_at` datetime DEFAULT NULL,
  KEY `fk_credit_profile1_idx` (`credit_id_profile_id`),
  CONSTRAINT `fk_credit_profile1` FOREIGN KEY (`credit_id_profile_id`) REFERENCES `profile` (`id_profile_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit` (
  `deposit_id_profile_id` int(10) unsigned NOT NULL,
  `deposit_contract` bigint(19) unsigned NOT NULL,
  `deposit_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deposit_updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deposit_deleted_at` datetime DEFAULT NULL,
  `deposit_sum` decimal(64,2) unsigned NOT NULL,
  UNIQUE KEY `deposit_contract_UNIQUE` (`deposit_contract`),
  KEY `fk_deposit_profile1_idx` (`deposit_id_profile_id`),
  CONSTRAINT `fk_deposit_profile1` FOREIGN KEY (`deposit_id_profile_id`) REFERENCES `profile` (`id_profile_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_share`
--

DROP TABLE IF EXISTS `my_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_share` (
  `brocer_account_my_share` int(10) unsigned NOT NULL,
  `share_my_share` int(10) unsigned NOT NULL,
  `purchase_day` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_day` datetime DEFAULT NULL,
  `purchase_price` decimal(64,2) unsigned NOT NULL,
  `price_now` decimal(64,2) unsigned NOT NULL,
  `quantity_my_share` int(10) unsigned NOT NULL,
  KEY `fk_share_myshare_idx` (`share_my_share`),
  KEY `fk_broker_share` (`brocer_account_my_share`),
  CONSTRAINT `fk_broker_share` FOREIGN KEY (`brocer_account_my_share`) REFERENCES `broker_account` (`broker_id_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_share_myshare` FOREIGN KEY (`share_my_share`) REFERENCES `share` (`id_share`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_share`
--

LOCK TABLES `my_share` WRITE;
/*!40000 ALTER TABLE `my_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id_profile_user` int(10) unsigned NOT NULL,
  `firstname` varchar(245) NOT NULL,
  `lastname` varchar(245) NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `birthday` date NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_profile_user`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`id_profile_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt` (
  `receipt_id_profile_id` int(10) unsigned NOT NULL,
  `receipt_id_com_services_id` int(10) unsigned NOT NULL,
  `contract` bigint(19) unsigned NOT NULL,
  `receipt_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `receipt_updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `receipt_sum` decimal(64,2) DEFAULT NULL,
  UNIQUE KEY `contract_UNIQUE` (`contract`),
  KEY `fk_receipt_profile1_idx` (`receipt_id_profile_id`),
  KEY `fk_receipt_com_services1_idx` (`receipt_id_com_services_id`),
  CONSTRAINT `fk_receipt_com_services1` FOREIGN KEY (`receipt_id_com_services_id`) REFERENCES `com_services` (`id_com_services`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receipt_profile1` FOREIGN KEY (`receipt_id_profile_id`) REFERENCES `profile` (`id_profile_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share`
--

DROP TABLE IF EXISTS `share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share` (
  `id_share` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_code` varchar(10) NOT NULL,
  `share_fullname` varchar(245) DEFAULT NULL,
  `share_shortname` varchar(50) NOT NULL,
  `share_isin` varchar(10) NOT NULL,
  `share_created_at` datetime NOT NULL,
  `share_lot` enum('1','10','100','1000') NOT NULL,
  `share_listing` enum('1','2','3') NOT NULL,
  `share_nominal` decimal(64,2) unsigned NOT NULL,
  `share_price_now` decimal(64,2) unsigned NOT NULL,
  `ishare_ssue volume` bigint(19) unsigned NOT NULL,
  PRIMARY KEY (`id_share`),
  UNIQUE KEY `share_name_UNIQUE` (`share_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share`
--

LOCK TABLES `share` WRITE;
/*!40000 ALTER TABLE `share` DISABLE KEYS */;
/*!40000 ALTER TABLE `share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password_hash` char(64) DEFAULT NULL,
  `email` varchar(245) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2021-07-08 22:51:52
