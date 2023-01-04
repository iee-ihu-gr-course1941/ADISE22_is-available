CREATE DATABASE  IF NOT EXISTS `adise22_is-available_v2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `adise22_is-available_v2`;
-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: adise22_is-available_v2
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

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
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `start_end`
--

DROP TABLE IF EXISTS `start_end`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `start_end` (
  `startD` int(11) DEFAULT NULL,
  `endD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `start_end`
--

LOCK TABLES `start_end` WRITE;
/*!40000 ALTER TABLE `start_end` DISABLE KEYS */;
/*!40000 ALTER TABLE `start_end` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `tempcolumn` int(11) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'adise22_is-available_v2'
--

--
-- Dumping routines for database 'adise22_is-available_v2'
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
/*!50003 DROP PROCEDURE IF EXISTS `boneyard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `boneyard`(IN gameid INT(100))
BEGIN
	DECLARE i INT;
    
    Set i=0;
    
	SELECT playerid INTO @player 
    FROM `ADISE22_is-available_v2`.`game` 
    where id=gameid;
    
    for_i_loop: LOOP
		IF i=27 THEN 
			LEAVE for_i_loop;
		END IF;
        
        SET @columnName = FLOOR(RAND()*(27-0+1))+0;
        
		SET @query = CONCAT('SELECT `',@columnName, '` INTO @content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
        
        IF (@content like 'boneyard') THEN
        
			SET @query = CONCAT('UPDATE `adise22_is-available_v2`.`game` SET `',@columnName,'`=',@player,' WHERE id =', gameid, ';');
			PREPARE stmt FROM @query;
			EXECUTE stmt;
            
            CALL `adise22_is-available_v2`.`emfanise_ta_plakidia_toy_pekti`(gameid);
            
            LEAVE for_i_loop;
            
        END IF;
        
        SET i=i+1; 
	END LOOP for_i_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `domino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `domino`(IN gameid INT(100),IN iddomino INT(100),out kati VARCHAR(100))
BEGIN
	DECLARE i INT;
    DECLARE sum INT;
    DECLARE suma INT;
    DECLARE flag BOOLEAN;
    DECLARE kat INT;
    DECLARE per INT;
    
    Set i=0;
    set sum=0;
    
    for_i_loop: LOOP
		IF i=28 THEN 
			LEAVE for_i_loop;
		END IF;
	#######################################
    
		SET @query = CONCAT('SELECT `',i, '` INTO @content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
        
        IF (@content Like "used%") THEN
			set sum = sum + 1;
        END IF;
	#######################################  
        SET i=i+1; 
	END LOOP for_i_loop;
    
##############################################################################     
    
    SELECT domino INTO @dom FROM dominoes where id=iddomino;
    
    Set flag=false;
    if (sum=0)THEN
        
        DELETE FROM `adise22_is-available_v2`.`start_end`;
        
        INSERT INTO `adise22_is-available_v2`.`start_end`(`startD`,`endD`)VALUES(SUBSTRING(@dom,1,1),SUBSTRING(@dom,2,1));
        Set kat=0;
        Set per=0;
        Set flag=true;
	END IF;
    IF  (sum>0)THEN

		SELECT startD into @sta FROM `adise22_is-available_v2`.start_end ;
        SELECT endD  into @en FROM `adise22_is-available_v2`.start_end ;
        
		if (SUBSTRING(@dom,1,1) = @sta)THEN #arxi me arxi
			#SELECT "mpike1";
            UPDATE `adise22_is-available_v2`.`start_end` SET `startD`=SUBSTRING(@dom,2,1);
            Set kat=0;
			Set per=1;
            Set flag=true;
            
        ELSEIF (SUBSTRING(@dom,1,1) = @en)THEN #arxi me telos
			#SELECT "mpike2";
            UPDATE `adise22_is-available_v2`.`start_end` SET `endD`=SUBSTRING(@dom,2,1);
            Set kat=1;
			Set per=0;
            Set flag=true;

        ELSEIF (SUBSTRING(@dom,2,1) = @sta)THEN #telos me arxi
			#SELECT "mpike3";
            UPDATE `adise22_is-available_v2`.`start_end` SET `startD`=SUBSTRING(@dom,1,1);
            Set kat=0;
			Set per=0;
            Set flag=true;
	
        ELSEIF (SUBSTRING(@dom,2,1) = @en)THEN #telos me telos
			#SELECT "mpike4";
            UPDATE `adise22_is-available_v2`.`start_end` SET `endD`=SUBSTRING(@dom,1,1);
            Set kat=1;
			Set per=1;
            Set flag=true;
		END IF;
        
    END IF;
    
    if(flag)THEN
		
		SET @query = CONCAT('UPDATE `adise22_is-available_v2`.`game` SET`',iddomino,'`= "used',sum,kat,per,'" WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
        
        select partyid,playerid into @party,@player
		from `adise22_is-available_v2`.`game`  
		WHERE id= gameid;
        
		select playerid into @nextplayer
		from `adise22_is-available_v2`.`party`  
        WHERE id= @party and playerid!=@player;
        
        Set i=0;
		set suma=0;

		for_i_loop: LOOP
			IF i=28 THEN 
				LEAVE for_i_loop;
			END IF;
		#######################################
			SET @query = CONCAT('SELECT `',i, '` INTO @content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
			PREPARE stmt FROM @query;
			EXECUTE stmt;
        
			IF (@content Like @player) THEN
				set suma = suma + 1;
			END IF;
		#######################################  
			SET i=i+1; 
		END LOOP for_i_loop;
        IF (suma=0) THEN
			set kati="winner:"+@player;
		else
			set kati="ok";
		END IF;

        UPDATE `adise22_is-available_v2`.`game`
		SET
		`playerid` = @nextplayer
		WHERE `id` = gameid;
        CALL `adise22_is-available_v2`.`emfanise_ta_plakidia_toy_pekti`(gameid);
	ELSEIF (flag=false)THEN
		set kati="wrong";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emfanise_ta_plakidia_toy_pekti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emfanise_ta_plakidia_toy_pekti`(IN gameid INT(100))
BEGIN
	DECLARE i INT;
    DECLARE j INT;
    DECLARE sum INT;
    
    Set i=0;
    set sum=0;
    
    DELETE FROM `adise22_is-available_v2`.`temp`;
    
    INSERT INTO `adise22_is-available_v2`.`temp`(`gameid`)VALUES (gameid);
    
    SELECT playerid INTO @player 
    FROM `ADISE22_is-available_v2`.`game` 
    where id=gameid;
    
	for_i_loop: LOOP
		IF i=28 THEN 
			LEAVE for_i_loop;
		END IF;
	#######################################
    
		SET @query = CONCAT('SELECT `',i, '` INTO @content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
        
        IF (@content!=@player AND @content!='boneyard' AND @content NOT Like "used%") THEN
			set sum = sum + 1;
        END IF;
	#######################################  
        SET i=i+1; 
	END LOOP for_i_loop;
    
    INSERT INTO `adise22_is-available_v2`.`temp`(`tempcolumn`)VALUES (sum);
    #select sum;
    
    Set i=0;
    for_i_loop: LOOP
		IF i=28 THEN 
			LEAVE for_i_loop;
		END IF;
	#######################################
        
		SET @query = CONCAT('SELECT ',i, ' INTO @colname FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ' AND `', i, '`=', @player, ' ;');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
        
        IF (@colname!='' OR @colname='0') THEN
        
			SELECT domino INTO @dom 
            FROM `ADISE22_is-available_v2`.`dominoes` 
            where id=@colname;
            
            INSERT INTO `adise22_is-available_v2`.`temp`(`tempcolumn`)VALUES (@dom);
            #select @dom;
            Set @colname='';
		END IF;
	#######################################   
        SET i=i+1; 
	END LOOP for_i_loop;
    
    INSERT INTO `adise22_is-available_v2`.`temp`(`tempcolumn`)VALUES (-1);
    
    Set i=27;
    for_i_loop: LOOP
		IF i=-1 THEN 
			LEAVE for_i_loop;
		END IF;
	#######################################
        Set j=0;
		for_j_loop: LOOP
			IF j=28 THEN 
				LEAVE for_j_loop;
			END IF;
            #######################################
			
            SET @query = CONCAT('SELECT ',j,',`', j,'` INTO @colname,@content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ' AND `',j,'` Like "%',i,'__" ;');
			PREPARE stmt FROM @query;
			EXECUTE stmt;
        
			IF (@colname!='' OR @colname='0' ) THEN
				IF(SUBSTRING(@content,6,1) like '0' and i<10 and SUBSTRING(@content,5,1) like i)THEN
                
					SELECT domino INTO @dom 
					FROM `ADISE22_is-available_v2`.`dominoes` 
					where id=@colname;
                    
                    #SELECT i,j;
					INSERT INTO `adise22_is-available_v2`.`temp`(`tempcolumn`)VALUES (CONCAT(@dom,SUBSTRING(@content,5)));
                    
					Set @colname='';
				END IF;
                IF(SUBSTRING(@content,7,1) like '0' and i>=10 and SUBSTRING(@content,5,2) like i)THEN
                
					SELECT domino INTO @dom 
					FROM `ADISE22_is-available_v2`.`dominoes` 
					where id=@colname;
                    
					INSERT INTO `adise22_is-available_v2`.`temp`(`tempcolumn`)VALUES (CONCAT(@dom,SUBSTRING(@content,5)));
                    
					Set @colname='';
				END IF;
			END IF;
            Set @colname='';
			#######################################   
			SET j=j+1; 
		END LOOP for_j_loop;
	#######################################   
        SET i=i-1; 
	END LOOP for_i_loop;
#####################################################################################################################         
    Set i=0;
    for_i_loop: LOOP
		IF i=28 THEN 
			LEAVE for_i_loop;
		END IF;
	#######################################
        Set j=0;
		for_j_loop: LOOP
			IF j=28 THEN 
				LEAVE for_j_loop;
			END IF;
            #######################################
			
            SET @query = CONCAT('SELECT ',j,',`', j,'` INTO @colname,@content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ' AND `',j,'` Like "%',i,'__" ;');
			PREPARE stmt FROM @query;
			EXECUTE stmt;
        
			IF (@colname!='' OR @colname='0' ) THEN
				IF(SUBSTRING(@content,6,1) like '1' and i<10 and SUBSTRING(@content,5,1) like i)THEN
                
					SELECT domino INTO @dom 
					FROM `ADISE22_is-available_v2`.`dominoes` 
					where id=@colname;
                    
					INSERT INTO `adise22_is-available_v2`.`temp`(`tempcolumn`)VALUES (CONCAT(@dom,SUBSTRING(@content,5)));
                    
					Set @colname='';
				END IF;
                IF(SUBSTRING(@content,7,1) like '1' and i>=10 and SUBSTRING(@content,5,2) like i)THEN
                
					SELECT domino INTO @dom 
					FROM `ADISE22_is-available_v2`.`dominoes` 
					where id=@colname;
                    
					INSERT INTO `adise22_is-available_v2`.`temp`(`tempcolumn`)VALUES (CONCAT(@dom,SUBSTRING(@content,5)));
                    
					Set @colname='';
				END IF;
			END IF;
            Set @colname='';
			#######################################   
			SET j=j+1; 
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
/*!50003 DROP PROCEDURE IF EXISTS `max_podi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `max_podi`(IN gameid INT(100))
BEGIN
	DECLARE i INT Default 27 ;
    #######################################
	for_i_loop: LOOP 
		
        SET @query = CONCAT('SELECT `', i, '`INTO @content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
        
        IF (@content <> "boneyard") THEN
        
			UPDATE `ADISE22_is-available_v2`.`game` 
			SET playerid = @content
			WHERE id= gameid;
            
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
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `megaliteroi_idioi_ariumi`(IN gameid INT(100))
BEGIN
	DECLARE i INT Default 27 ;
    #######################################
	for_i_loop: LOOP 
		
        SET @query = CONCAT('SELECT `', i, '`INTO @content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
		PREPARE stmt FROM @query;
		EXECUTE stmt;

        IF (@content <> "boneyard") THEN
        
			SELECT domino INTO @metavliti 
            FROM `ADISE22_is-available_v2`.`dominoes` 
            WHERE id=i;
            
            IF (SUBSTRING(@metavliti,1,1)=SUBSTRING(@metavliti,2,1) or @metavliti=0) THEN
            
				UPDATE `ADISE22_is-available_v2`.`game` 
                SET playerid = @content
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
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moirasma`(IN gameid INT(100))
BEGIN
	DECLARE i INT;
	DECLARE j INT; 

    select partyid into @party from `ADISE22_is-available_v2`.`game` WHERE id= gameid;
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
                
			SET @query = CONCAT('SELECT `',@columnName,'`INTO @content FROM `ADISE22_is-available_v2`.`game` WHERE id=', gameid, ';');
			PREPARE stmt FROM @query;
			EXECUTE stmt;

			IF (i=0 AND @content LIKE "boneyard") THEN
            
				SET @query = CONCAT('UPDATE `ADISE22_is-available_v2`.`game` SET `',@columnName,'`=(SELECT playerid FROM `ADISE22_is-available_v2`.party where id=', @party, ' LIMIT 1) WHERE id=', gameid, ';');
				PREPARE stmt FROM @query;
				EXECUTE stmt;
                
                SET j = j +1;
			END IF;

			IF (i=1 AND @content LIKE "boneyard") THEN
            
				SET @query = CONCAT('UPDATE `ADISE22_is-available_v2`.`game` SET `',@columnName,'`=(SELECT playerid FROM `ADISE22_is-available_v2`.party where id=', @party, ' LIMIT 1,1) WHERE id=', gameid, ';');
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
/*!50003 DROP PROCEDURE IF EXISTS `start_game` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `start_game`(IN partyid INT(100))
BEGIN
    SELECT COUNT(id) into @gameid FROM game;
	SET @gameid = @gameid + 1;
    
    INSERT INTO `adise22_is-available_v2`.`game`(id, partyid) VALUES (@gameid, partyid);
    CALL `adise22_is-available_v2`.`moirasma`(@gameid);
	CALL `adise22_is-available_v2`.`megaliteroi_idioi_ariumi`(@gameid);
    
    SELECT count(playerid) INTO @playerid FROM `adise22_is-available_v2`.`game` where id=@gameid;
    IF (@playerid = 0 ) THEN
		CALL `adise22_is-available_v2`.`max_podi`(@gameid);
	END IF;
    CALL `adise22_is-available_v2`.`emfanise_ta_plakidia_toy_pekti`(@gameid);
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

-- Dump completed on 2023-01-04 13:04:52
