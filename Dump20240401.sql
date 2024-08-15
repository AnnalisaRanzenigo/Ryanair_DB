-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: final_project_ryanair
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `id_passenger` varchar(5) NOT NULL,
  `home_country` varchar(50) DEFAULT NULL,
  `traveller_type` varchar(50) DEFAULT NULL,
  `id_travel` varchar(4) DEFAULT NULL,
  `id_seat` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_passenger`),
  KEY `id_Travel` (`id_travel`),
  KEY `id_Seat` (`id_seat`),
  CONSTRAINT `id_Seat` FOREIGN KEY (`id_seat`) REFERENCES `seats` (`id_seat`),
  CONSTRAINT `id_Travel` FOREIGN KEY (`id_travel`) REFERENCES `travels` (`id_travel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES ('Id_01','Portugal','Solo Leisure','T_1','S_1'),('Id_02','United Kingdom','Solo Leisure','T_2','S_1'),('Id_03','United Kingdom','Family Leisure','T_3','S_1'),('Id_04','Germany','Family Leisure','T_4','S_2'),('Id_05','United Kingdom','Business','T_5','S_2'),('Id_06','Greece','Solo Leisure','T_6','S_1'),('Id_07','United States','Solo Leisure','T_7','S_1'),('Id_08','United States','Family Leisure','T_7','S_1'),('Id_09','Austria','Business','T_8','S_2'),('Id_10','United States','Solo Leisure','T_9','S_1'),('Id_11','United Kingdom','Solo Leisure','T_10','S_1'),('Id_12','United States','Couple Leisure','T_11','S_1'),('Id_13','Netherlands','Couple Leisure','T_8','S_1'),('Id_14','United States','Solo Leisure','T_7','S_1'),('Id_15','United Kingdom','Solo Leisure','T_12','S_1'),('Id_16','United States','Couple Leisure','T_13','S_1'),('Id_17','Switzerland','Business','T_14','S_2'),('Id_18','United States','Family Leisure','T_7','S_1'),('Id_19','Ireland','Couple Leisure','T_15','S_2'),('Id_20','United Kingdom','Family Leisure','T_16','S_2');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `id_plane` varchar(3) NOT NULL,
  `aircraft` varchar(50) NOT NULL,
  `airline` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_plane`),
  CONSTRAINT `planes_chk_1` CHECK ((`airline` = _utf8mb4'Ryanair'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES ('P_1','Boeing 737-800','Ryanair'),('P_2','A-340','Ryanair'),('P_3','Boeing 737','Ryanair'),('P_4','A-320','Ryanair'),('P_5','Boeing 737 max','Ryanair');
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ratinganalysis`
--

DROP TABLE IF EXISTS `ratinganalysis`;
/*!50001 DROP VIEW IF EXISTS `ratinganalysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ratinganalysis` AS SELECT 
 1 AS `ID_Passenger`,
 1 AS `Home_Country`,
 1 AS `Traveller_type`,
 1 AS `Origin`,
 1 AS `Destination`,
 1 AS `DateFlown`,
 1 AS `OverallRating`,
 1 AS `DatePublished`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id_rating` varchar(4) NOT NULL,
  `overallRating` int NOT NULL,
  `datePublished` date NOT NULL,
  `cabinStaffService` decimal(10,0) DEFAULT NULL,
  `groundService` decimal(10,0) DEFAULT NULL,
  `recommended` enum('yes','no') DEFAULT NULL,
  `id_passenger` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_rating`),
  KEY `id_passenger` (`id_passenger`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`id_passenger`) REFERENCES `passengers` (`id_passenger`),
  CONSTRAINT `ratings_chk_1` CHECK ((`overallRating` between 1 and 10)),
  CONSTRAINT `ratings_chk_2` CHECK ((`cabinStaffService` between 1.0 and 5.0)),
  CONSTRAINT `ratings_chk_3` CHECK ((`groundService` between 1.0 and 5.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES ('R_1',3,'2023-12-08',2,2,'no','Id_01'),('R_10',4,'2015-06-29',3,1,'no','Id_10'),('R_11',10,'2022-04-23',1,5,'yes','Id_11'),('R_12',1,'2019-03-01',1,2,'yes','Id_12'),('R_13',1,'2017-09-24',NULL,NULL,'yes','Id_13'),('R_14',4,'2015-06-29',3,1,'no','Id_14'),('R_15',8,'2022-05-02',1,2,'yes','Id_15'),('R_16',3,'2017-02-23',1,2,'yes','Id_16'),('R_17',1,'2019-09-07',NULL,NULL,'yes','Id_17'),('R_18',4,'2015-06-29',3,1,'no','Id_18'),('R_19',10,'2013-10-18',5,4,'yes','Id_19'),('R_2',1,'2018-11-15',1,1,'no','Id_02'),('R_20',8,'2015-05-01',4,5,'yes','Id_20'),('R_3',8,'2015-08-29',4,3,'no','Id_03'),('R_4',8,'2015-08-16',5,4,'yes','Id_04'),('R_5',1,'2015-07-10',1,1,'no','Id_05'),('R_6',5,'2015-06-18',4,2,'no','Id_06'),('R_7',4,'2015-06-29',3,1,'no','Id_07'),('R_8',4,'2015-06-29',3,1,'no','Id_08'),('R_9',1,'2017-09-09',1,1,'yes','Id_09');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatRatings`
--

DROP TABLE IF EXISTS `seatRatings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seatRatings` (
  `id_passenger` varchar(5) NOT NULL,
  `seatComfort` decimal(10,0) DEFAULT NULL,
  `id_seat` varchar(3) DEFAULT NULL,
  `id_plane` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_passenger`),
  KEY `id_seat` (`id_seat`),
  KEY `id_plane` (`id_plane`),
  CONSTRAINT `seatratings_ibfk_1` FOREIGN KEY (`id_seat`) REFERENCES `seats` (`id_seat`),
  CONSTRAINT `seatratings_ibfk_2` FOREIGN KEY (`id_plane`) REFERENCES `planes` (`id_plane`),
  CONSTRAINT `seatratings_chk_1` CHECK ((`seatComfort` between 1.0 and 5.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatRatings`
--

LOCK TABLES `seatRatings` WRITE;
/*!40000 ALTER TABLE `seatRatings` DISABLE KEYS */;
INSERT INTO `seatRatings` VALUES ('Id_01',3,'S_1','P_1'),('Id_02',1,'S_1','P_3'),('Id_03',3,'S_1','P_4'),('Id_04',4,'S_2','P_1'),('Id_05',1,'S_2','P_3'),('Id_06',3,'S_1','P_1'),('Id_07',1,'S_1','P_1'),('Id_08',1,'S_1','P_1'),('Id_09',2,'S_2','P_1'),('Id_10',1,'S_1','P_5'),('Id_11',3,'S_1','P_3'),('Id_12',3,'S_1','P_3'),('Id_13',2,'S_1','P_1'),('Id_14',1,'S_1','P_1'),('Id_15',3,'S_1','P_2'),('Id_16',3,'S_1','P_3'),('Id_17',2,'S_2','P_1'),('Id_18',1,'S_1','P_1'),('Id_19',5,'S_2','P_5'),('Id_20',4,'S_2','P_2');
/*!40000 ALTER TABLE `seatRatings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `id_seat` varchar(3) NOT NULL,
  `seatType` varchar(50) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_seat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES ('S_1','Standard','Economy Class'),('S_2','Premium','Economy Class');
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travels`
--

DROP TABLE IF EXISTS `travels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travels` (
  `id_travel` varchar(4) NOT NULL,
  `origin` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `dateFlown` date NOT NULL,
  `id_plane` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_travel`),
  KEY `id_plane` (`id_plane`),
  CONSTRAINT `travels_ibfk_1` FOREIGN KEY (`id_plane`) REFERENCES `planes` (`id_plane`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

LOCK TABLES `travels` WRITE;
/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
INSERT INTO `travels` VALUES ('T_1','Lisbon','Tirana via Stansted London','2023-12-06','P_1'),('T_10','Prague','Manchester','2022-04-04','P_3'),('T_11','London','Madrid','2019-02-26','P_3'),('T_12','London','Rome Ciampino','2022-04-24','P_2'),('T_13','Prestwick','Dublin','2017-02-17','P_3'),('T_14','Bern','Madrid','2019-09-05','P_1'),('T_15','ATH','Malta','2013-10-17','P_5'),('T_16','Frankfurt-Hahn','Dublin','2015-04-20','P_2'),('T_2','Malaga','Prestwick','2018-11-09','P_3'),('T_3','Bournemouth','Malta','2015-08-10','P_4'),('T_4','Frankfurt-Hahn','Rome Ciampino','2015-08-10','P_1'),('T_5','London','Dublin','2015-07-05','P_3'),('T_6','ATH','CRL','2015-02-17','P_1'),('T_7','Santiago','Madrid','2015-06-19','P_1'),('T_8','Vienna','Madrid','2017-09-02','P_1'),('T_9','Santiago','Madrid','2015-06-08','P_5');
/*!40000 ALTER TABLE `travels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'final_project_ryanair'
--

--
-- Dumping routines for database 'final_project_ryanair'
--
/*!50003 DROP FUNCTION IF EXISTS `GetCountryName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCountryName`(city VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE country VARCHAR(50);
    
    CASE city
        WHEN 'Lisbon' THEN SET country := 'Portugal';
        WHEN 'Frankfurt-Hahn' THEN SET country := 'Germany';
        WHEN 'Bern' THEN SET country := 'Switzerland';
        WHEN 'Malaga' THEN SET country := 'Spain';
        WHEN 'Prague' THEN SET country := 'Czech Republic';
        WHEN 'Prestwick' THEN SET country := 'United Kingdom';
        WHEN 'London' THEN SET country := 'United Kingdom';
        WHEN 'ATH' THEN SET country := 'Greece';
        WHEN 'Bournemouth' THEN SET country := 'United Kingdom';
        WHEN 'Santiago' THEN SET country := 'Spain';
        WHEN 'Tirana via Stansted London' THEN SET country := 'Albania';
        WHEN 'Dublin' THEN SET country := 'Ireland';
        WHEN 'Malta' THEN SET country := 'Malta';
        WHEN 'Madrid' THEN SET country := 'Spain';
        WHEN 'Rome Ciampino' THEN SET country := 'Italy';
        WHEN 'CRL' THEN SET country := 'Belgium';
        WHEN 'Manchester' THEN SET country := 'United Kingdom';
        WHEN 'Vienna' THEN SET country := 'Austria';
    END CASE;
    
    RETURN country;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ratinganalysis`
--

/*!50001 DROP VIEW IF EXISTS `ratinganalysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ratinganalysis` AS select `P`.`id_passenger` AS `ID_Passenger`,`P`.`home_country` AS `Home_Country`,`P`.`traveller_type` AS `Traveller_type`,`T`.`origin` AS `Origin`,`T`.`destination` AS `Destination`,`T`.`dateFlown` AS `DateFlown`,`R`.`overallRating` AS `OverallRating`,`R`.`datePublished` AS `DatePublished` from ((`ratings` `R` join `passengers` `P` on((`R`.`id_passenger` = `P`.`id_passenger`))) join `travels` `T` on((`P`.`id_travel` = `T`.`id_travel`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 23:55:37
