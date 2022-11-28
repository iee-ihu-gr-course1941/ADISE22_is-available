CREATE DATABASE  IF NOT EXISTS `ADISE22_is-available_v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ADISE22_is-available_v2`;
-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: ADISE22_is-available_v2
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-0+deb11u1-log

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
-- Table structure for table `dominoes`
--

DROP TABLE IF EXISTS `dominoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dominoes` (
  `id` tinyint(2) NOT NULL,
  `domino` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dominoes`
--

LOCK TABLES `dominoes` WRITE;
/*!40000 ALTER TABLE `dominoes` DISABLE KEYS */;
INSERT INTO `dominoes` VALUES (0,0),(1,10),(2,11),(3,20),(4,21),(5,22),(6,30),(7,31),(8,32),(9,33),(10,40),(11,41),(12,42),(13,43),(14,44),(15,50),(16,51),(17,52),(18,53),(19,54),(20,55),(21,60),(22,61),(23,62),(24,63),(25,64),(26,65),(27,66);
/*!40000 ALTER TABLE `dominoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` int(100) NOT NULL,
  `partyid` int(100) NOT NULL,
  `playerid` int(100) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `0` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `1` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `2` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `3` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `4` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `5` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `6` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `7` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `8` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `9` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `10` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `11` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `12` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `13` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `14` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `15` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `16` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `17` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `18` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `19` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `20` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `21` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `22` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `23` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `24` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `25` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `26` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  `27` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'boneyard',
  PRIMARY KEY (`id`),
  KEY `FK_game_party` (`partyid`),
  KEY `FK_game_party_2` (`playerid`),
  CONSTRAINT `FK_game_party` FOREIGN KEY (`partyid`) REFERENCES `party` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_game_party_2` FOREIGN KEY (`playerid`) REFERENCES `party` (`playerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,11,1,NULL,'2022-11-28 16:15:38','boneyard','boneyard','boneyard','2','boneyard','boneyard','1','2','1','boneyard','2','2','1','boneyard','boneyard','boneyard','boneyard','2','1','boneyard','1','1','2','boneyard','1','boneyard','2','boneyard');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `id` int(100) NOT NULL,
  `playerid` int(100) NOT NULL,
  PRIMARY KEY (`playerid`),
  KEY `id` (`id`),
  CONSTRAINT `FK_party_players` FOREIGN KEY (`playerid`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (11,1),(11,2);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(100) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `token` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'dokimi 1','asdfghjhkl'),(2,'dokimi 2','!@#%^&#$%^&&*()_');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ADISE22_is-available_v2'
--

--
-- Dumping routines for database 'ADISE22_is-available_v2'
--
/*!50003 DROP PROCEDURE IF EXISTS `back_to_default` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `back_to_default`(IN gameid INT(100))
BEGIN
	update `ADISE22_is-available_v2`.game
	set  `0` = 'boneyard',
    `1` = 'boneyard',
    `2` = 'boneyard',
    `3` = 'boneyard',
    `4` = 'boneyard',
    `5` = 'boneyard',
    `6` = 'boneyard',
    `7` = 'boneyard',
    `8` = 'boneyard',
    `9` = 'boneyard',
    `10` = 'boneyard',
    `11` = 'boneyard',
	`12` = 'boneyard',
    `13` = 'boneyard',
    `14` = 'boneyard',
    `15` = 'boneyard',
    `16` = 'boneyard',
    `17` = 'boneyard',
    `18` = 'boneyard',
    `19` = 'boneyard',
	`20` = 'boneyard',
    `21` = 'boneyard',
    `22` = 'boneyard',
    `23` = 'boneyard',
    `24` = 'boneyard',
    `25` = 'boneyard',
    `26` = 'boneyard',
    `27` = 'boneyard'
    where id=gameid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `max_podi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `max_podi`(IN gameid INT(100))
BEGIN
	DECLARE i INT Default 27 ;
    #######################################
	for_i_loop: LOOP 
		
        SET @query = CONCAT('SELECT `', i, '`INTO @kati FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
        
        IF (@kati <> "boneyard") THEN
			UPDATE `ADISE22_is-available_v2`.`game` 
			SET playerid = @kati
			WHERE id= gameid;
			
            SELECT domino INTO @metavliti 
            FROM `ADISE22_is-available_v2`.`dominoes` 
            WHERE id=i;
            Select @metavliti;
            
            LEAVE for_i_loop;
        END IF;    
		IF i=0 THEN 
			LEAVE for_i_loop;
		END IF;
		SET i=i-1; 
	END LOOP for_i_loop; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `megaliteroi_idioi_ariumi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `megaliteroi_idioi_ariumi`(IN gameid INT(100))
BEGIN
	DECLARE i INT Default 27 ;
    #######################################
	for_i_loop: LOOP 
		
        SET @query = CONCAT('SELECT `', i, '`INTO @kati FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;

        /*IF (@kati <> "boneyard") THEN
			IF (i=0 or i=2 or i=5 or i=9 or i=14 or i=20 or i=27) THEN
				UPDATE `ADISE22_is-available_v2`.`game` 
                SET playerid = @kati
                WHERE id= gameid;
                LEAVE for_i_loop;
            END IF;
        END IF;*/
        IF (@kati <> "boneyard") THEN
			SELECT domino INTO @metavliti 
            FROM `ADISE22_is-available_v2`.`dominoes` 
            WHERE id=i;
            IF (SUBSTRING(@metavliti,1,1)=SUBSTRING(@metavliti,2,1)) THEN
				UPDATE `ADISE22_is-available_v2`.`game` 
                SET playerid = @kati
                WHERE id= gameid;
                LEAVE for_i_loop;
            END IF;
        END IF;

		IF i=0 THEN 
			LEAVE for_i_loop;
		END IF;
		SET i=i-1; 
	END LOOP for_i_loop; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moirasma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moirasma`(IN gameid INT(100),IN partyid INT(100))
BEGIN
	DECLARE i INT;
	DECLARE j INT; 
    #######################################
    SET i = 0;
	for_i_loop: LOOP
		IF i=2 THEN 
			LEAVE for_i_loop;
		END IF;

		SET j=0; 
        for_j_loop: LOOP
			IF j=7 THEN 
				LEAVE for_j_loop;
			END IF;
	#######################################
			SET @columnName = FLOOR(RAND()*(27-0+1))+0;
                
			SET @query = CONCAT('SELECT `', CAST( @columnName AS CHAR CHARACTER SET utf8), '`INTO @kati FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
			PREPARE stmt FROM @query;
			EXECUTE stmt;

			IF (i=0 AND @kati LIKE "boneyard") THEN
				SET @query = CONCAT('UPDATE `ADISE22_is-available_v2`.`game` SET `', CAST( @columnName AS CHAR CHARACTER SET utf8), '`=(SELECT playerid FROM `ADISE22_is-available_v2`.party where id=', partyid, ' LIMIT 1) WHERE id=', gameid, ';');
				PREPARE stmt FROM @query;
				EXECUTE stmt;
                SET j = j +1;
			END IF;

			IF (i=1 AND @kati LIKE "boneyard") THEN
				SET @query = CONCAT('UPDATE `ADISE22_is-available_v2`.`game` SET `', CAST( @columnName AS CHAR CHARACTER SET utf8), '`=(SELECT playerid FROM `ADISE22_is-available_v2`.party where id=', partyid, ' LIMIT 1,1) WHERE id=', gameid, ';');
				PREPARE stmt FROM @query;
				EXECUTE stmt;
                SET j = j +1;
			END IF;
	#######################################
		END LOOP for_j_loop; 
    #######################################
		SET i=i+1; 
	END LOOP for_i_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 20:13:25
