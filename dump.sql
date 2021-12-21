-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: Music_Search_System
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Current Database: `Music_Search_System`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Music_Search_System` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Music_Search_System`;

--
-- Table structure for table `Access_Rights`
--

DROP TABLE IF EXISTS `Access_Rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Access_Rights` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Rights`
--

LOCK TABLES `Access_Rights` WRITE;
/*!40000 ALTER TABLE `Access_Rights` DISABLE KEYS */;
INSERT INTO `Access_Rights` VALUES (1,'Administrator'),(2,'User');
/*!40000 ALTER TABLE `Access_Rights` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `block_access_rights_insert` BEFORE INSERT ON `Access_Rights` FOR EACH ROW begin
    SIGNAL SQLSTATE '45000' 
       set MESSAGE_TEXT = 'Changes inside this table are disabled.';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `block_access_rights_update` BEFORE UPDATE ON `Access_Rights` FOR EACH ROW begin
    SIGNAL SQLSTATE '45000' 
       set MESSAGE_TEXT = 'Changes inside this table are disabled.';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `block_access_rights_delete` BEFORE DELETE ON `Access_Rights` FOR EACH ROW begin
    SIGNAL SQLSTATE '45000' 
       set MESSAGE_TEXT = 'Changes inside this table are disabled.';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Albums` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Author` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Release_date` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Author` (`ID_Author`),
  CONSTRAINT `Albums_ibfk_1` FOREIGN KEY (`ID_Author`) REFERENCES `Authors` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,NULL,'None',NULL),(2,5,'Los 90 Piketes','2020-04-17'),(3,19,'Remixes ','2016-10-28'),(4,26,'Se Prendió El Arbolito','2018-12-07'),(5,29,'Let’s Get Physical','2008-04-08'),(6,57,'Hinterhofjargon','2012-05-25'),(7,64,'Radical Dilemma','2013-12-04'),(8,65,'Stardust','2019-12-01'),(9,66,'Queen Naija','2018-07-27'),(10,69,'Compton','2015-08-07'),(11,83,'amo','2019-01-25'),(12,77,'Relapse','2009-05-15'),(13,90,'The Wild Youth EP','2011-10-02'),(14,94,'Radio 1 Rescores: Drive','2014-10-30'),(15,96,'Dark As Night','2013-07-13'),(16,83,'Live at Wembley','2015-06-22'),(17,83,'POST HUMAN: SURVIVAL HORROR','2020-10-30'),(18,83,'That’s The Spirit','2015-09-11'),(19,83,'Sempiternal','2013-04-01'),(20,100,'Monstercat 018 - Frontier','2014-08-06'),(21,100,'Monstercat 024 - Vanguard','2015-11-02'),(22,100,'Monstercat 019 - Endeavour','2014-10-22'),(23,100,'Monstercat 027 - Cataclysm','2016-06-03'),(24,98,'The Ancient & Arcane','2015-08-05'),(25,98,'My Prayers Have Become Ghosts - EP','2016-10-31'),(26,100,'Monstercat 013 - Awakening','2013-06-10'),(27,100,'Monstercat 025 - Threshold','2015-12-18'),(28,106,'Afterparty Babies','2008-02-23'),(29,107,'Hangman’s Holiday','1933-01-01'),(30,109,'Soul is Heavy','2012-03-30'),(31,113,'1999: The New Master','1999-02-02'),(32,115,'The Return of the Native','1878-01-01'),(33,116,'The Tenant of Wildfell Hall','1848-12-08'),(34,117,'Swann’s Way',NULL),(35,118,'Pensées dansantes','2008-02-20'),(36,120,'The Professor','1857-01-01'),(37,100,'Monstercat Instinct, Vol. 1','2018-06-15'),(38,100,'Monstercat 029 - Havoc','2016-11-18'),(39,100,'Monstercat 017 - Ascension','2014-05-21'),(40,100,'Monstercat 020 - Altitude','2014-12-15'),(41,100,'Monstercat 030 - Finale','2017-02-22'),(42,121,'Love & Hate','2016-10-14'),(43,100,'Monstercat 023 - Voyage','2015-08-17'),(44,121,'The Sound','2019-09-12'),(45,130,'ごーいん！ (GOIN’!)','2019-08-12'),(46,130,'Blackmagik Blazing','2019-08-12'),(47,130,'Thanks Twitter Followers 40K','2017-03-01'),(48,130,'Crystallized','2015-12-31'),(49,130,'GALAXY BURST','2018-03-21'),(50,130,'PLANET//SHAPER','2015-08-16'),(51,129,'Meltical sugar wave','2015-10-07'),(52,132,'FitBeat',NULL),(53,133,'Queen Of Qum','2019-05-17'),(54,109,'No Longer At Ease','2008-04-06'),(55,135,'Rapsodi','2011-03-21'),(56,136,'RaeBandz','2014-11-24'),(57,138,'Serene','2018-09-05'),(58,140,'The Pit of Excape or Misery',NULL),(59,143,'Press Kit','2019-08-09'),(60,65,'Heal Her','2021-11-24'),(61,146,'Mistress Intuition the Remixes','2012-09-14'),(62,149,'The Lights',NULL),(63,150,'Soul Amazing (Part Four)','2016-08-04'),(64,155,'Home Sweet Home','2005-06-27'),(65,155,'Wavy / Kano Stencils','2012-08-08'),(66,160,'Одиночная Психическая Атака (Single Psychic Attack)','2019-11-22'),(67,163,'Ultralife','2017-07-14'),(68,168,'Masterpiece','2016-05-27'),(69,169,'Fair & Square','2005-04-26'),(70,171,'Bottle of Humans','2000-08-08'),(71,179,'State of Mind ','2019-09-13'),(72,180,'Eaten Back to Life','1990-08-17'),(73,188,'The Works','1984-02-27'),(74,189,'Berserker','2019-05-03'),(75,190,'Дни GONZO (Days)',NULL),(76,191,'URC: Unreleased, Remixes, Collaborations','2011-04-14'),(77,193,'1919 Eternal','2002-10-15'),(78,195,'SWAMP2','2021-11-04'),(79,200,'Dark Nights: Death Metal Soundtrack','2021-06-18'),(80,100,'Monstercat - Best of 2019','2019-12-12'),(81,205,'Северная мистика (North Mystic)','2014-06-12'),(82,200,'Clerks: Music from the Motion Picture','1994-10-11'),(83,213,'Похороните меня за социум (Bury me behind society)','2018-10-20'),(84,217,'Tunes 2011-2019','2019-12-06'),(85,221,'Feral Roots','2019-01-25'),(86,223,'Rival','2017-06-30'),(87,225,'Ariel','1965-01-01'),(88,227,'NCS: Elevate ','2019-05-31'),(89,237,'Sad Looks Pretty On Me','2021-03-19'),(90,239,'Siren’s Anthems',NULL),(91,240,'Waste of Space: The Self-titled EP',NULL),(92,241,'Ps1','2020-01-26'),(93,244,'Origin Story: The Mixtape',NULL),(94,245,'Emergence','2018-07-11'),(95,253,'Exploring Together','2021-10-11'),(96,221,'Head Down','2012-09-17'),(97,254,'Shooter Ready','2021-09-10'),(98,255,'Useless Hands','2019-10-04'),(99,256,'The Kindness of Strangers',NULL),(100,261,'Gunz N Roses ','2015-12-03'),(101,263,'Destroy & Rebuild',NULL),(102,267,'The Cozart','2018-09-28'),(103,268,'Ghetto Gospel: The New Testament','2018-09-14'),(104,275,'The Best of Lil Herb & Lil Bibby: Heir Apparents','2013-05-04'),(105,277,'“Heroes”','1977-10-14'),(106,274,'PTSD','2020-02-28'),(107,285,'Lust For Life','2017-07-21'),(108,292,'The Papercut Chronicles II','2011-11-15'),(109,274,'Strictly 4 My Fans','2016-11-24'),(110,274,'Ballin’ Like I’m Kobe','2015-09-29'),(111,298,'Swervo','2018-07-27'),(112,292,'The Papercut Chronicles','2005-02-22'),(113,306,'RouterGate',NULL),(114,307,'Hero (Teminite Remix) [feat. Elizaveta] - Single',NULL),(115,307,'The Uncaged Remixes','2014-11-17'),(116,100,'Monstercat - Best of Dubstep','2016-12-19'),(117,313,'New Music Tuesday/Friday Playlists 2015','2015-01-01'),(118,100,'Monstercat Uncaged, Vol. 6','2019-02-21'),(119,100,'Monstercat - 5 Year Anniversary','2016-07-15'),(120,320,'Bring The Madness (The Remixes)','2015-03-23'),(121,100,'Monstercat 026 - Resistance','2016-03-21'),(122,100,'Monstercat Uncaged, Vol. 1','2017-05-12'),(123,316,'Renegade EP','2012-02-01'),(124,323,'Before the Storm','2000-09-18'),(125,326,'American Teen','2017-03-03'),(126,327,'Noir Désir','2012-01-23'),(127,328,'In Square Circle','1985-01-01'),(128,330,'Inside the Actors Studio',NULL),(129,336,'Haiz (Japan Version)','2015-11-13'),(130,338,'Homesick','2009-02-03'),(131,339,'TerribleTim Spreads Love','2007-01-01'),(132,340,'Wukileaks',NULL),(133,344,'FUTURE','2017-02-17'),(134,349,'G.O.A.T Album',NULL),(135,350,'The Bar Exam 4','2017-06-20');
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Authors` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Our Stolen Theory'),(2,'Myke Towers'),(3,'Jhay Cortez'),(4,'J Balvin'),(5,'Miky Woodz'),(6,'Felo Blonck'),(7,'Galindo Again'),(8,'El Fother'),(9,'Lito Kirino'),(10,'Químico Ultra Mega'),(11,'Jamby el Favo'),(12,'Madnass'),(13,'E. Tárraga'),(14,'Tron Dosh'),(15,'Pozo Musikandante'),(16,'Lesky'),(17,'Bambú (MC)'),(18,'Dash Shamash'),(19,'Bls a.k.a Rigor Mortis'),(20,'DJ Joaking'),(21,'Versoterismo'),(22,'Exopoetics'),(23,'ComboClap Crew'),(24,'Dalmata'),(25,'Jamsha'),(26,'Ñejo'),(27,'Shaggy'),(28,'Busta Rhymes'),(29,'Elephant Man'),(30,'La Exce'),(31,'Gigolo'),(32,'Pacho El Antifeka'),(33,'Juhn'),(34,'Pusho'),(35,'Darkiel'),(36,'Noriel'),(37,'Brytiago'),(38,'Benny Benni'),(39,'Gigolo Y La Exce'),(40,'Malik'),(41,'M3'),(42,'Doezis'),(43,'Tatwaffe'),(44,'Ben Salomo'),(45,'Azro 215'),(46,'Credibil'),(47,'Behrang'),(48,'Anoush'),(49,'Ray Rah'),(50,'Vlacho'),(51,'60/60'),(52,'Elijahu'),(53,'JURI'),(54,'Olexesh'),(55,'Celo'),(56,'Abdi'),(57,'Celo & Abdi'),(58,'​stic.man'),(59,'RodStarz'),(60,'Rakaa Iriscience'),(61,'M-1'),(62,'G1'),(63,'​dead prez'),(64,'Rebel Diaz'),(65,'Geoxor'),(66,'Queen Naija'),(67,'Kid Harpoon'),(68,'Harry Styles'),(69,'Dr. Dre'),(70,'Curtis Chambers'),(71,'Dem Jointz'),(72,'Candice Pillay'),(73,'Justus'),(74,'Focus…'),(75,'Anderson .Paak'),(76,'Mez'),(77,'Eminem'),(78,'Matt Nicholls'),(79,'Matt Kean'),(80,'Lee Malia'),(81,'Jordan Fish'),(82,'Oli Sykes'),(83,'Bring Me The Horizon'),(84,'Trevor Lawrence Jr.'),(85,'Dawaun Parker'),(86,'Mark Batson'),(87,'Remi Aguilella'),(88,'Igor Haefeli'),(89,'Elena Tonra'),(90,'Daughter'),(91,'George Daniel'),(92,'Matthew Healy'),(93,'The 1975'),(94,'BBC Radio'),(95,'Nahko'),(96,'Nahko And Medicine For The People'),(97,'Petar Lyondev'),(98,'Varien'),(99,'Laura Brehm'),(100,'Monstercat'),(101,'Cassandra Kay'),(102,'Skyelle'),(103,'Veela'),(104,'Razihel'),(105,'Mr FijiWiji'),(106,'Cadence Weapon'),(107,'Dorothy L. Sayers'),(108,'Disiz La Peste'),(109,'Nneka'),(110,'Prince'),(111,'Rosie Gaines'),(112,'Doug E. Fresh'),(113,'Prince and the Revolution'),(114,'Mary Shelley'),(115,'Thomas Hardy'),(116,'Anne Brontë'),(117,'Marcel Proust'),(118,'Bhale Bacce Crew'),(119,'George Berkeley'),(120,'Charlotte Brontë'),(121,'Aero Chord'),(122,'Nevve'),(123,'Q’aila'),(124,'Fractal'),(125,'Anna Yvette'),(126,'Tylor Maurer'),(127,'D Dark'),(128,'​slchld'),(129,'ななひら (Nanahira)'),(130,'かめりあ (Camellia)'),(131,'Genius English Translations'),(132,'Jaroslav Beck'),(133,'Blight Dolezal'),(134,'Wesley Williams'),(135,'Olamide'),(136,'Rae DoubleR'),(137,'Haywaya'),(138,'Wan Shey'),(139,'Donny Lujan'),(140,'Nothing at all. leave me alone'),(141,'The ART (Asquad)'),(142,'Marince Omario'),(143,'Marince Omario And The ART'),(144,'Xam the Rapper'),(145,'Helion'),(146,'Helion & Veela'),(147,'LIL PESH'),(148,'Marcelo Colares'),(149,'The Cigarettes'),(150,'Blu'),(151,'NorCal Nick'),(152,'Efunkomaya Jeremiah'),(153,'Bluskisngr'),(154,'JerryMaya'),(155,'Kano'),(156,'Genius Romanizations'),(157,'Rayan Seventeen17'),(158,'PRESCO LUCCI'),(159,'CAKE'),(160,'GONE.Fludd'),(161,'Anthony West'),(162,'Josephine Vander Gucht'),(163,'Oh Wonder'),(164,'DT'),(165,'Nick Mira'),(166,'Juice WRLD'),(167,'Adrianne Lenker'),(168,'Big Thief'),(169,'John Prine'),(170,'KLOUD'),(171,'Sole (US)'),(172,'Stephen Beerkens'),(173,'Samuel Tye'),(174,'Patrick Morrissey'),(175,'Linden Marissen'),(176,'Kill Dave'),(177,'Joshua Raven'),(178,'Bryce Fox'),(179,'The Faim'),(180,'Cannibal Corpse'),(181,'Alex Webster'),(182,'Paul Mazurkiewicz'),(183,'Bob Rusay'),(184,'Jack Owen'),(185,'Chris Barnes'),(186,'Roger Taylor'),(187,'Brian May'),(188,'Queen'),(189,'Amon Amarth'),(190,'SUPERIOR.CAT.PROTEUS'),(191,'Das Racist'),(192,'Zakk Wylde'),(193,'Black Label Society'),(194,'Gary Numan'),(195,'‌sewerperson'),(196,'Alex Westaway'),(197,'Dave Lombardo'),(198,'GUNSHIP'),(199,'Tyler Bates'),(200,'Various Artists'),(201,'Mazare'),(202,'Essenger'),(203,'ШЕFF (SHEFF)'),(204,'Ю-Ла (Yu-La)'),(205,'Bad Balance'),(206,'Scott Angley'),(207,'Kevin Smith'),(208,'Steve Smyth'),(209,'Love Among Freaks'),(210,'Harley Bird'),(211,'Rival'),(212,'Cadmium'),(213,'алёна швец. (alena shvets.)'),(214,'Unknown Brain'),(215,'Jex'),(216,'Rosendale'),(217,'Burial'),(218,'Scott Holiday'),(219,'Jay Buchanan'),(220,'Dave Cobb'),(221,'Rival Sons'),(222,'Maggie Eckford'),(223,'Ruelle'),(224,'CRVN'),(225,'Sylvia Plath'),(226,'Bryan Finlay'),(227,'NoCopyrightSounds'),(228,'Jon Becker'),(229,'Evate'),(230,'Roundstreet'),(231,'Max Hurrell'),(232,'Veronica Bravo'),(233,'Kalie Wolfe'),(234,'Micket Woodle'),(235,'John Espy'),(236,'Cody Stewart'),(237,'Rivals'),(238,'$NOT'),(239,'STONEMAN'),(240,'Probably Edible'),(241,'Pharaoh Santana'),(242,'Jose A. Blanco Jr.'),(243,'Deltron Blac'),(244,'JunSix'),(245,'Under The Black Shores'),(246,'Alexander Laitilla'),(247,'Christoffer Johansson'),(248,'Nils Rulewski Stenberg'),(249,'Victor Crone'),(250,'Calle Hellberg'),(251,'Arc North'),(252,'Rival x Arc North x Cadmium'),(253,'Frequency Music'),(254,'Twista'),(255,'Rival Town'),(256,'Silent Rival'),(257,'No Fatigue'),(258,'$avage of FGE'),(259,'Talley of 300'),(260,'Montana of 300'),(261,'Montana of 300 & Talley of 300'),(262,'BraveStarr'),(263,'YG Hootie'),(264,'Kendrick Lamar'),(265,'Alki David'),(266,'Jenn Em'),(267,'Chief Keef'),(268,'Ghetts'),(269,'Kojey Radical'),(270,'TED Talks'),(271,'MC Lars'),(272,'DJ L Beats'),(273,'Lil Bibby'),(274,'G Herbo'),(275,'G Herbo & Lil Bibby'),(276,'Brian Eno'),(277,'David Bowie'),(278,'Jim Lavigne'),(279,'Christopher Torpey'),(280,'Mikkey Halsted'),(281,'​d.a. got that dope'),(282,'Chance the Rapper'),(283,'Lil Uzi Vert'),(284,'Rick Nowels'),(285,'Lana Del Rey'),(286,'Robopop'),(287,'Ammar Malik'),(288,'Sterling Fox'),(289,'​benny blanco'),(290,'Adam Levine'),(291,'Travie McCoy'),(292,'Gym Class Heroes'),(293,'William Hart'),(294,'Thom Bell'),(295,'Juicy J'),(296,'DJ Paul'),(297,'Southside'),(298,'G Herbo & Southside'),(299,'Roger Hodgson'),(300,'Patrick Stump'),(301,'ATodd'),(302,'Andrew Warner'),(303,'Tom Lehman'),(304,'Chrissyy'),(305,'James Somers'),(306,'Heroku'),(307,'Pegboard Nerds'),(308,'Elizaveta'),(309,'Teminite'),(310,'Stonebank'),(311,'Snavs'),(312,'Toby Green'),(313,'Spotify'),(314,'NGHTMRE'),(315,'Krewella'),(316,'Noisestorm'),(317,'Foreign Beggars'),(318,'Mayor Apeshit'),(319,'Excision'),(320,'Excision & Pegboard Nerds'),(321,'SELEN'),(322,'ヒゲドライバー (Hige Driver)'),(323,'Darude'),(324,'Samo Sound Boy'),(325,'Jerome LOL'),(326,'Khalid'),(327,'Youssoupha'),(328,'Stevie Wonder'),(329,'Students of Pace School of Design'),(330,'James Lipton'),(331,'Dave Chappelle'),(332,'Robin Fredriksson'),(333,'Mattias Larsson'),(334,'Julia Michaels'),(335,'Justin Tranter'),(336,'Hailee Steinfeld'),(337,'Jeremy McKinnon'),(338,'A Day To Remember'),(339,'Terrible Tim'),(340,'Wuki'),(341,'Maondo'),(342,'dr jay _ dada official rylics'),(343,'DJ ESCO'),(344,'Future'),(345,'Tommy Butler'),(346,'Metro Boomin'),(347,'We The Sus Music'),(348,'Kidd Keo'),(349,'Galaxy Goats'),(350,'Royce da 5\'9\"'),(351,'Khaligraph Jones'),(352,'Genius Deutsche Übersetzungen'),(353,'Dave East');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genres`
--

DROP TABLE IF EXISTS `Genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genres` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Genre_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genres`
--

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
INSERT INTO `Genres` VALUES (1,'Not set');
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lyrics`
--

DROP TABLE IF EXISTS `Lyrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lyrics` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `URL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lyrics`
--

LOCK TABLES `Lyrics` WRITE;
/*!40000 ALTER TABLE `Lyrics` DISABLE KEYS */;
INSERT INTO `Lyrics` VALUES (1,'https://genius.com/Our-stolen-theory-united-laos-remix-lyrics'),(2,'https://genius.com/Miky-woodz-j-balvin-and-myke-towers-pinky-ring-remix-lyrics'),(3,'https://genius.com/Jamby-el-favo-quimico-ultra-mega-and-lito-kirino-klonk-remix-lyrics'),(4,'https://genius.com/Bls-aka-rigor-mortis-stargate-remix-lyrics'),(5,'https://genius.com/Nejo-navidad-2-lyrics'),(6,'https://genius.com/Elephant-man-the-way-we-roll-remix-lyrics'),(7,'https://genius.com/Elephant-man-the-way-we-roll-lyrics'),(8,'https://genius.com/Benny-benni-noriel-and-brytiago-el-gatito-de-mi-ex-remix-lyrics'),(9,'https://genius.com/Celo-and-abdi-parallelen-united-remix-1-lyrics'),(10,'https://genius.com/Rebel-diaz-which-side-are-you-on-remix-lyrics'),(11,'https://genius.com/Geoxor-nana-lyrics'),(12,'https://genius.com/Geoxor-nandayo-lyrics'),(13,'https://genius.com/Queen-naija-medicine-lyrics'),(14,'https://genius.com/Harry-styles-medicine-lyrics'),(15,'https://genius.com/Dr-dre-medicine-man-lyrics'),(16,'https://genius.com/Bring-me-the-horizon-medicine-lyrics'),(17,'https://genius.com/Eminem-medicine-ball-lyrics'),(18,'https://genius.com/Daughter-medicine-lyrics'),(19,'https://genius.com/The-1975-medicine-lyrics'),(20,'https://genius.com/Nahko-and-medicine-for-the-people-budding-trees-lyrics'),(21,'https://genius.com/Nahko-and-medicine-for-the-people-black-as-night-lyrics'),(22,'https://genius.com/Nahko-and-medicine-for-the-people-aloha-ke-akua-lyrics'),(23,'https://genius.com/Bring-me-the-horizon-mantra-lyrics'),(24,'https://genius.com/Bring-me-the-horizon-drown-lyrics'),(25,'https://genius.com/Bring-me-the-horizon-parasite-eve-lyrics'),(26,'https://genius.com/Bring-me-the-horizon-ludens-lyrics'),(27,'https://genius.com/Bring-me-the-horizon-happy-song-lyrics'),(28,'https://genius.com/Bring-me-the-horizon-follow-you-lyrics'),(29,'https://genius.com/Bring-me-the-horizon-can-you-feel-my-heart-lyrics'),(30,'https://genius.com/Bring-me-the-horizon-doomed-lyrics'),(31,'https://genius.com/Bring-me-the-horizon-throne-lyrics'),(32,'https://genius.com/Varien-valkyrie-lyrics'),(33,'https://genius.com/Varien-valkyrie-iii-atonement-lyrics'),(34,'https://genius.com/Varien-valkyrie-ii-lacuna-lyrics'),(35,'https://genius.com/Varien-sacred-woods-lyrics'),(36,'https://genius.com/Varien-ghost-spores-lyrics'),(37,'https://genius.com/Varien-dawn-will-bring-us-death-lyrics'),(38,'https://genius.com/Varien-hear-smith-of-heavens-lyrics'),(39,'https://genius.com/Varien-supercell-lyrics'),(40,'https://genius.com/Varien-and-razihel-toothless-hawkins-and-his-robot-jazz-band-lyrics'),(41,'https://genius.com/Varien-and-mr-fijiwiji-we-are-the-lights-lyrics'),(42,'https://genius.com/Cadence-weapon-tattoos-and-what-they-really-feel-like-lyrics'),(43,'https://genius.com/Dorothy-l-sayers-the-image-in-the-mirror-annotated'),(44,'https://genius.com/Nneka-shining-star-lyrics'),(45,'https://genius.com/Prince-and-the-revolution-1999-rosie-and-doug-e-in-a-deep-house-lyrics'),(46,'https://genius.com/Mary-shelley-frankenstein-letters-i-iv-annotated'),(47,'https://genius.com/Thomas-hardy-the-return-of-the-nativechap-43-annotated'),(48,'https://genius.com/Anne-bronte-the-tenant-of-wildfell-hall-chap-45-annotated'),(49,'https://genius.com/Marcel-proust-place-names-the-name-chapter-4-lyrics'),(50,'https://genius.com/Bhale-bacce-crew-combine-et-son-lyrics'),(51,'https://genius.com/George-berkeley-the-first-dialogue-between-hylas-and-philonous-annotated'),(52,'https://genius.com/Charlotte-bronte-the-professor-chap-4-annotated'),(53,'https://genius.com/Aero-chord-shadows-lyrics'),(54,'https://genius.com/Aero-chord-and-fractal-until-the-end-lyrics'),(55,'https://genius.com/Aero-chord-surface-lyrics'),(56,'https://genius.com/Aero-chord-break-them-lyrics'),(57,'https://genius.com/Aero-chord-resistance-lyrics'),(58,'https://genius.com/Aero-chord-and-tylor-maurer-gone-lyrics'),(59,'https://genius.com/Aero-chord-shootin-stars-lyrics'),(60,'https://genius.com/Aero-chord-4u-lyrics'),(61,'https://genius.com/Razihel-and-aero-chord-titans-lyrics'),(62,'https://genius.com/Aero-chord-take-me-home-lyrics'),(63,'https://genius.com/Slchld-camellia-lyrics'),(64,'https://genius.com/Camellia-nani-the-fuck-lyrics'),(65,'https://genius.com/Camellia-killerbeast-lyrics'),(66,'https://genius.com/Camellia-what-the-cat-lyrics'),(67,'https://genius.com/Camellia-crystallized-lyrics'),(68,'https://genius.com/Camellia-dyscontrolled-galaxy-apoptosis-long-ver-lyrics'),(69,'https://genius.com/Camellia-exit-this-earths-atomosphere-lyrics'),(70,'https://genius.com/Camellia-night-raid-with-a-dragon-lyrics'),(71,'https://genius.com/Genius-english-translations-camellia-bassdrop-freaks-long-ver-english-translation-lyrics'),(72,'https://genius.com/Camellia-we-could-get-more-machinegun-psystyle-and-more-genre-switches-lyrics'),(73,'https://genius.com/Jaroslav-beck-fitbeat-lyrics'),(74,'https://genius.com/Blight-dolezal-fat-pussy-legend-lyrics'),(75,'https://genius.com/Nneka-kangpe-annotated'),(76,'https://genius.com/Olamide-apa-ti-jabo-lyrics'),(77,'https://genius.com/Rae-doubler-why-lyrics'),(78,'https://genius.com/Haywaya-pon-pon-pon-lyrics'),(79,'https://genius.com/Wan-shey-tous-les-jours-lyrics'),(80,'https://genius.com/Nothing-at-all-leave-me-alone-my-demons-got-my-back-lyrics'),(81,'https://genius.com/Marince-omario-and-the-art-nike-lyrics'),(82,'https://genius.com/Xam-the-rapper-yuh-freestyle-lyrics'),(83,'https://genius.com/Geoxor-blusk-lyrics'),(84,'https://genius.com/Helion-and-veela-mistress-intuition-bluskay-remix-lyrics'),(85,'https://genius.com/Lil-pesh-bluskam-lyrics'),(86,'https://genius.com/The-cigarettes-blusky-lyrics'),(87,'https://genius.com/Norcal-nick-sk-h-lyrics'),(88,'https://genius.com/Jerrymaya-burst-my-brain-lyrics'),(89,'https://genius.com/Kano-brown-eyes-lyrics'),(90,'https://genius.com/Genius-romanizations-fyre-02-kylian-mbappe-romanized-lyrics'),(91,'https://genius.com/Rayan-seventeen17-astri-lyrics'),(92,'https://genius.com/Kano-wavy-lyrics'),(93,'https://genius.com/Gonefludd-humansuit-lyrics'),(94,'https://genius.com/Oh-wonder-high-on-humans-lyrics'),(95,'https://genius.com/Juice-wrld-toxic-humans-lyrics'),(96,'https://genius.com/Big-thief-humans-lyrics'),(97,'https://genius.com/John-prine-some-humans-aint-human-lyrics'),(98,'https://genius.com/Kloud-humans-lyrics'),(99,'https://genius.com/Sole-us-bottle-of-humans-lyrics'),(100,'https://genius.com/The-faim-humans-lyrics'),(101,'https://genius.com/Cannibal-corpse-shredded-humans-lyrics'),(102,'https://genius.com/Queen-machines-or-back-to-humans-lyrics'),(103,'https://genius.com/Amon-amarth-the-berserker-at-stamford-bridge-lyrics'),(104,'https://genius.com/Superiorcatproteus-berserker-lyrics'),(105,'https://genius.com/Das-racist-berserker-lyrics'),(106,'https://genius.com/Black-label-society-berserkers-lyrics'),(107,'https://genius.com/Gary-numan-berserker-lyrics'),(108,'https://genius.com/Sewerperson-berserker-lyrics'),(109,'https://genius.com/Gunship-and-tyler-bates-berserker-lyrics'),(110,'https://genius.com/Mazare-and-essenger-berserker-lyrics'),(111,'https://genius.com/Bad-balance-berserkers-lyrics'),(112,'https://genius.com/Love-among-freaks-berserker-lyrics'),(113,'https://genius.com/Rival-and-cadmium-seasons-lyrics'),(114,'https://genius.com/Alena-shvets-rival-lyrics'),(115,'https://genius.com/Unknown-brain-and-rival-control-lyrics'),(116,'https://genius.com/Rival-and-cadmium-willow-tree-lyrics'),(117,'https://genius.com/Burial-rival-dealer-lyrics'),(118,'https://genius.com/Rival-sons-do-your-worst-lyrics'),(119,'https://genius.com/Ruelle-rival-lyrics'),(120,'https://genius.com/Rival-be-gone-lyrics'),(121,'https://genius.com/Sylvia-plath-the-rival-annotated'),(122,'https://genius.com/Rival-walls-lyrics'),(123,'https://genius.com/Rival-and-cadmium-just-breathe-lyrics'),(124,'https://genius.com/Rival-and-cadmium-just-breathe-evate-remix-lyrics'),(125,'https://genius.com/Roundstreet-drive-lyrics'),(126,'https://genius.com/Rival-demons-lyrics'),(127,'https://genius.com/Rivals-little-mistakes-lyrics'),(128,'https://genius.com/Stoneman-muramasa-lyrics'),(129,'https://genius.com/Probably-edible-math-class-conceit-lyrics'),(130,'https://genius.com/Pharaoh-santana-roar-in-peace-lyrics'),(131,'https://genius.com/Junsix-dragon-year-lyrics'),(132,'https://genius.com/Under-the-black-shores-the-crystal-cracked-lyrics'),(133,'https://genius.com/Rival-x-arc-north-x-cadmium-coming-home-lyrics'),(134,'https://genius.com/Rival-sons-the-heist-lyrics'),(135,'https://genius.com/Twista-coming-home-lyrics'),(136,'https://genius.com/Rival-town-bridges-lyrics'),(137,'https://genius.com/Silent-rival-find-them-beautiful-lyrics'),(138,'https://genius.com/Montana-of-300-and-talley-of-300-fge-cypher-lyrics'),(139,'https://genius.com/Yg-hootie-two-presidents-lyrics'),(140,'https://genius.com/Chief-keef-chiraq-lyrics'),(141,'https://genius.com/Ghetts-black-rose-lyrics'),(142,'https://genius.com/Mc-lars-the-hip-hop-of-shakespeare-annotated'),(143,'https://genius.com/G-herbo-kill-shit-lyrics'),(144,'https://genius.com/David-bowie-heroes-lyrics'),(145,'https://genius.com/G-herbo-ptsd-lyrics'),(146,'https://genius.com/Lana-del-rey-heroin-lyrics'),(147,'https://genius.com/Gym-class-heroes-stereo-hearts-lyrics'),(148,'https://genius.com/G-herbo-pull-up-lyrics'),(149,'https://genius.com/G-herbo-rollin-lyrics'),(150,'https://genius.com/G-herbo-who-run-it-lyrics'),(151,'https://genius.com/Gym-class-heroes-cupids-chokehold-breakfast-in-america-lyrics'),(152,'https://genius.com/James-somers-herokus-ugly-secret-annotated'),(153,'https://genius.com/Pegboard-nerds-hero-lyrics'),(154,'https://genius.com/Pegboard-nerds-hero-teminite-remix-lyrics'),(155,'https://genius.com/Pegboard-nerds-hero-stonebank-remix-lyrics'),(156,'https://genius.com/Pegboard-nerds-hero-infected-mushroom-remix-lyrics'),(157,'https://genius.com/Pegboard-nerds-here-it-comes-lyrics'),(158,'https://genius.com/Pegboard-nerds-here-it-comes-snavs-and-toby-green-remix-lyrics'),(159,'https://genius.com/Monstercat-best-of-dubstep-mix-lyrics'),(160,'https://genius.com/Spotify-new-music-friday-12-11-15-annotated'),(161,'https://genius.com/Pegboard-nerds-and-nghtmre-superstar-lyrics'),(162,'https://genius.com/Noisestorm-crab-rave-lyrics'),(163,'https://genius.com/Noisestorm-breakout-lyrics'),(164,'https://genius.com/Noisestorm-leaving-now-lyrics'),(165,'https://genius.com/Noisestorm-this-feeling-lyrics'),(166,'https://genius.com/Excision-and-pegboard-nerds-bring-the-madness-noisestorm-remix-lyrics'),(167,'https://genius.com/Noisestorm-heist-lyrics'),(168,'https://genius.com/Noisestorm-antihero-lyrics'),(169,'https://genius.com/Noisestorm-breakdown-vip-lyrics'),(170,'https://genius.com/Noisestorm-escape-lyrics'),(171,'https://genius.com/Noisestorm-renegade-lyrics'),(172,'https://genius.com/Hige-driver-dadadadadadadadadada-lyrics'),(173,'https://genius.com/Genius-romanizations-hige-driver-dadadadadadadadadada-romanized-lyrics'),(174,'https://genius.com/Darude-sandstorm-lyrics'),(175,'https://genius.com/Khalid-another-sad-love-song-lyrics'),(176,'https://genius.com/Youssoupha-lamour-lyrics'),(177,'https://genius.com/Stevie-wonder-part-time-lover-lyrics'),(178,'https://genius.com/Dave-chappelle-inside-the-actors-studio-interview-annotated'),(179,'https://genius.com/Hailee-steinfeld-youre-such-a-lyrics'),(180,'https://genius.com/A-day-to-remember-the-downfall-of-us-all-lyrics'),(181,'https://genius.com/Terrible-tim-brothermanbill-lyrics'),(182,'https://genius.com/Wuki-dadadada-lyrics'),(183,'https://genius.com/Maondo-and-dr-jay-dada-official-rylics-maondo-and-dr-jay-official-rylislcs-written-by-maondo-lyrics'),(184,'https://genius.com/Future-mask-off-lyrics'),(185,'https://genius.com/Future-mask-off-remix-lyrics'),(186,'https://genius.com/We-the-sus-music-dream-mask-official-sus-remix-lyrics'),(187,'https://genius.com/Montana-of-300-mask-off-remix-lyrics'),(188,'https://genius.com/Kidd-keo-mask-off-remix-lyrics'),(189,'https://genius.com/Galaxy-goats-mask-off-minecraft-parody-lyrics'),(190,'https://genius.com/Royce-da-59-n-my-zone-mask-off-lyrics'),(191,'https://genius.com/Khaligraph-jones-toa-tint-mask-off-cover-lyrics'),(192,'https://genius.com/Genius-deutsche-ubersetzungen-future-mask-off-deutsche-ubersetzung-lyrics'),(193,'https://genius.com/Dave-east-mask-off-eastmix-lyrics');
/*!40000 ALTER TABLE `Lyrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Songs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `ID_Author` int DEFAULT NULL,
  `ID_Lyrics` int DEFAULT NULL,
  `ID_Genre` int DEFAULT NULL,
  `Release_date` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Author` (`ID_Author`),
  KEY `ID_Genre` (`ID_Genre`),
  KEY `ID_Lyrics` (`ID_Lyrics`),
  CONSTRAINT `Songs_ibfk_1` FOREIGN KEY (`ID_Author`) REFERENCES `Authors` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Songs_ibfk_2` FOREIGN KEY (`ID_Genre`) REFERENCES `Genres` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Songs_ibfk_3` FOREIGN KEY (`ID_Lyrics`) REFERENCES `Lyrics` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES (1,'United (L.A.O.S Remix)',1,1,1,'2012-09-21'),(2,'Pinky Ring (Remix)',2,2,1,'2019-12-27'),(3,'Pinky Ring (Remix)',3,2,1,'2019-12-27'),(4,'Pinky Ring (Remix)',4,2,1,'2019-12-27'),(5,'Pinky Ring (Remix)',5,2,1,'2019-12-27'),(6,'Klonk (Remix)',6,3,1,'2019-07-20'),(7,'Klonk (Remix)',7,3,1,'2019-07-20'),(8,'Klonk (Remix)',8,3,1,'2019-07-20'),(9,'Klonk (Remix)',9,3,1,'2019-07-20'),(10,'Klonk (Remix)',10,3,1,'2019-07-20'),(11,'Klonk (Remix)',11,3,1,'2019-07-20'),(12,'Stargate (Remix)',12,4,1,'2018-01-01'),(13,'Stargate (Remix)',13,4,1,'2018-01-01'),(14,'Stargate (Remix)',14,4,1,'2018-01-01'),(15,'Stargate (Remix)',15,4,1,'2018-01-01'),(16,'Stargate (Remix)',16,4,1,'2018-01-01'),(17,'Stargate (Remix)',17,4,1,'2018-01-01'),(18,'Stargate (Remix)',18,4,1,'2018-01-01'),(19,'Stargate (Remix)',19,4,1,'2018-01-01'),(20,'Stargate (Remix)',20,4,1,'2018-01-01'),(21,'Stargate (Remix)',21,4,1,'2018-01-01'),(22,'Stargate (Remix)',22,4,1,'2018-01-01'),(23,'Stargate (Remix)',23,4,1,'2018-01-01'),(24,'Navidad 2',24,5,1,'2018-12-10'),(25,'Navidad 2',25,5,1,'2018-12-10'),(26,'Navidad 2',26,5,1,'2018-12-10'),(27,'The Way We Roll (Remix)',27,6,1,NULL),(28,'The Way We Roll (Remix)',28,6,1,NULL),(29,'The Way We Roll (Remix)',29,6,1,NULL),(30,'The Way We Roll',29,7,1,NULL),(31,'El Gatito De Mi Ex (Remix)',30,8,1,'2017-11-04'),(32,'El Gatito De Mi Ex (Remix)',31,8,1,'2017-11-04'),(33,'El Gatito De Mi Ex (Remix)',32,8,1,'2017-11-04'),(34,'El Gatito De Mi Ex (Remix)',33,8,1,'2017-11-04'),(35,'El Gatito De Mi Ex (Remix)',34,8,1,'2017-11-04'),(36,'El Gatito De Mi Ex (Remix)',35,8,1,'2017-11-04'),(37,'El Gatito De Mi Ex (Remix)',36,8,1,'2017-11-04'),(38,'El Gatito De Mi Ex (Remix)',37,8,1,'2017-11-04'),(39,'El Gatito De Mi Ex (Remix)',38,8,1,'2017-11-04'),(40,'El Gatito De Mi Ex (Remix)',39,8,1,'2017-11-04'),(41,'Parallelen United Remix 1',40,9,1,'2012-12-15'),(42,'Parallelen United Remix 1',41,9,1,'2012-12-15'),(43,'Parallelen United Remix 1',42,9,1,'2012-12-15'),(44,'Parallelen United Remix 1',43,9,1,'2012-12-15'),(45,'Parallelen United Remix 1',44,9,1,'2012-12-15'),(46,'Parallelen United Remix 1',45,9,1,'2012-12-15'),(47,'Parallelen United Remix 1',46,9,1,'2012-12-15'),(48,'Parallelen United Remix 1',47,9,1,'2012-12-15'),(49,'Parallelen United Remix 1',48,9,1,'2012-12-15'),(50,'Parallelen United Remix 1',49,9,1,'2012-12-15'),(51,'Parallelen United Remix 1',50,9,1,'2012-12-15'),(52,'Parallelen United Remix 1',51,9,1,'2012-12-15'),(53,'Parallelen United Remix 1',52,9,1,'2012-12-15'),(54,'Parallelen United Remix 1',53,9,1,'2012-12-15'),(55,'Parallelen United Remix 1',54,9,1,'2012-12-15'),(56,'Parallelen United Remix 1',55,9,1,'2012-12-15'),(57,'Parallelen United Remix 1',56,9,1,'2012-12-15'),(58,'Which Side Are You On? (Remix)',58,10,1,'2013-12-04'),(59,'Which Side Are You On? (Remix)',59,10,1,'2013-12-04'),(60,'Which Side Are You On? (Remix)',60,10,1,'2013-12-04'),(61,'Which Side Are You On? (Remix)',61,10,1,'2013-12-04'),(62,'Which Side Are You On? (Remix)',62,10,1,'2013-12-04'),(63,'Which Side Are You On? (Remix)',63,10,1,'2013-12-04'),(64,'Which Side Are You On? (Remix)',64,10,1,'2013-12-04'),(65,'Nana',65,11,1,'2019-05-27'),(66,'Nandayo',65,12,1,'2021-06-22'),(67,'Medicine',66,13,1,'2017-12-31'),(68,'Medicine',67,14,1,NULL),(69,'Medicine',68,14,1,NULL),(70,'Medicine Man',69,15,1,'2015-08-07'),(71,'Medicine Man',70,15,1,'2015-08-07'),(72,'Medicine Man',71,15,1,'2015-08-07'),(73,'Medicine Man',72,15,1,'2015-08-07'),(74,'Medicine Man',73,15,1,'2015-08-07'),(75,'Medicine Man',74,15,1,'2015-08-07'),(76,'Medicine Man',75,15,1,'2015-08-07'),(77,'Medicine Man',76,15,1,'2015-08-07'),(78,'Medicine Man',77,15,1,'2015-08-07'),(79,'​medicine',78,16,1,'2019-01-03'),(80,'​medicine',79,16,1,'2019-01-03'),(81,'​medicine',80,16,1,'2019-01-03'),(82,'​medicine',81,16,1,'2019-01-03'),(83,'​medicine',82,16,1,'2019-01-03'),(84,'​medicine',83,16,1,'2019-01-03'),(85,'Medicine Ball',84,17,1,'2009-05-15'),(86,'Medicine Ball',85,17,1,'2009-05-15'),(87,'Medicine Ball',86,17,1,'2009-05-15'),(88,'Medicine Ball',69,17,1,'2009-05-15'),(89,'Medicine Ball',77,17,1,'2009-05-15'),(90,'Medicine',87,18,1,'2011-10-02'),(91,'Medicine',88,18,1,'2011-10-02'),(92,'Medicine',89,18,1,'2011-10-02'),(93,'Medicine',90,18,1,'2011-10-02'),(94,'Medicine',91,19,1,'2014-10-31'),(95,'Medicine',92,19,1,'2014-10-31'),(96,'Medicine',93,19,1,'2014-10-31'),(97,'Budding Trees',95,20,1,'2013-09-27'),(98,'Budding Trees',96,20,1,'2013-09-27'),(99,'Black As Night',95,21,1,'2013-09-27'),(100,'Black As Night',96,21,1,'2013-09-27'),(101,'Aloha Ke Akua',95,22,1,'2013-09-27'),(102,'Aloha Ke Akua',96,22,1,'2013-09-27'),(103,'MANTRA',78,23,1,'2018-08-21'),(104,'MANTRA',79,23,1,'2018-08-21'),(105,'MANTRA',80,23,1,'2018-08-21'),(106,'MANTRA',81,23,1,'2018-08-21'),(107,'MANTRA',82,23,1,'2018-08-21'),(108,'MANTRA',83,23,1,'2018-08-21'),(109,'Drown',80,24,1,'2014-10-21'),(110,'Drown',81,24,1,'2014-10-21'),(111,'Drown',78,24,1,'2014-10-21'),(112,'Drown',79,24,1,'2014-10-21'),(113,'Drown',82,24,1,'2014-10-21'),(114,'Drown',83,24,1,'2014-10-21'),(115,'Parasite Eve',78,25,1,'2020-06-25'),(116,'Parasite Eve',79,25,1,'2020-06-25'),(117,'Parasite Eve',80,25,1,'2020-06-25'),(118,'Parasite Eve',97,25,1,'2020-06-25'),(119,'Parasite Eve',82,25,1,'2020-06-25'),(120,'Parasite Eve',81,25,1,'2020-06-25'),(121,'Parasite Eve',83,25,1,'2020-06-25'),(122,'Ludens',82,26,1,'2019-11-06'),(123,'Ludens',81,26,1,'2019-11-06'),(124,'Ludens',83,26,1,'2019-11-06'),(125,'Happy Song',80,27,1,'2015-07-12'),(126,'Happy Song',81,27,1,'2015-07-12'),(127,'Happy Song',78,27,1,'2015-07-12'),(128,'Happy Song',79,27,1,'2015-07-12'),(129,'Happy Song',82,27,1,'2015-07-12'),(130,'Happy Song',83,27,1,'2015-07-12'),(131,'Follow You',80,28,1,'2015-09-11'),(132,'Follow You',81,28,1,'2015-09-11'),(133,'Follow You',78,28,1,'2015-09-11'),(134,'Follow You',79,28,1,'2015-09-11'),(135,'Follow You',82,28,1,'2015-09-11'),(136,'Follow You',83,28,1,'2015-09-11'),(137,'Can You Feel My Heart',81,29,1,'2013-08-19'),(138,'Can You Feel My Heart',80,29,1,'2013-08-19'),(139,'Can You Feel My Heart',82,29,1,'2013-08-19'),(140,'Can You Feel My Heart',83,29,1,'2013-08-19'),(141,'Doomed',81,30,1,'2015-09-11'),(142,'Doomed',80,30,1,'2015-09-11'),(143,'Doomed',78,30,1,'2015-09-11'),(144,'Doomed',79,30,1,'2015-09-11'),(145,'Doomed',82,30,1,'2015-09-11'),(146,'Doomed',83,30,1,'2015-09-11'),(147,'Throne',80,31,1,'2015-07-23'),(148,'Throne',81,31,1,'2015-07-23'),(149,'Throne',78,31,1,'2015-07-23'),(150,'Throne',79,31,1,'2015-07-23'),(151,'Throne',82,31,1,'2015-07-23'),(152,'Throne',83,31,1,'2015-07-23'),(153,'Valkyrie',98,32,1,'2014-06-19'),(154,'Valkyrie',99,32,1,'2014-06-19'),(155,'Valkyrie III: Atonement',98,33,1,'2015-10-16'),(156,'Valkyrie III: Atonement',99,33,1,'2015-10-16'),(157,'Valkyrie II: Lacuna',98,34,1,'2014-10-03'),(158,'Valkyrie II: Lacuna',101,34,1,'2014-10-03'),(159,'Sacred Woods',98,35,1,'2016-05-04'),(160,'Sacred Woods',102,35,1,'2016-05-04'),(161,'Ghost Spores',98,36,1,'2015-08-05'),(162,'Ghost Spores',99,36,1,'2015-08-05'),(163,'Dawn Will Bring Us Death',98,37,1,'2016-10-31'),(164,'Hear, Smith of Heavens',98,38,1,'2016-10-31'),(165,'Supercell',98,39,1,'2015-07-22'),(166,'Supercell',103,39,1,'2015-07-22'),(167,'Toothless Hawkins (And His Robot Jazz Band)',98,40,1,'2013-06-10'),(168,'Toothless Hawkins (And His Robot Jazz Band)',104,40,1,'2013-06-10'),(169,'We Are The Lights',98,41,1,'2015-11-20'),(170,'We Are The Lights',105,41,1,'2015-11-20'),(171,'Tattoos (And What They Really Feel Like)',106,42,1,'2008-03-04'),(172,'The Image in the Mirror',107,43,1,NULL),(173,'Shining Star',108,44,1,'2012-06-19'),(174,'Shining Star',109,44,1,'2012-06-19'),(175,'1999 (Rosie & Doug E. in a Deep House)',110,45,1,'1999-02-02'),(176,'1999 (Rosie & Doug E. in a Deep House)',111,45,1,'1999-02-02'),(177,'1999 (Rosie & Doug E. in a Deep House)',112,45,1,'1999-02-02'),(178,'1999 (Rosie & Doug E. in a Deep House)',113,45,1,'1999-02-02'),(179,'Frankenstein Letters I - IV',114,46,1,NULL),(180,'The Return of the Native(Chap. 4.3)',115,47,1,NULL),(181,'The Tenant of Wildfell Hall (Chap. 45)',116,48,1,NULL),(182,'Place-Names: The Name (Chapter 4)',117,49,1,NULL),(183,'Combine et son',118,50,1,NULL),(184,'The First Dialogue Between Hylas and Philonous',119,51,1,NULL),(185,'The Professor (Chap. 4)',120,52,1,NULL),(186,'Shadows',121,53,1,'2018-02-27'),(187,'Shadows',122,53,1,'2018-02-27'),(188,'Until The End',123,54,1,'2016-10-14'),(189,'Until The End',121,54,1,'2016-10-14'),(190,'Until The End',124,54,1,'2016-10-14'),(191,'Surface',121,55,1,'2014-04-23'),(192,'Break Them',121,56,1,'2014-11-24'),(193,'Break Them',125,56,1,'2014-11-24'),(194,'Resistance',121,57,1,'2017-01-16'),(195,'Gone',126,58,1,'2016-10-14'),(196,'Gone',121,58,1,'2016-10-14'),(197,'Shootin Stars',121,59,1,'2014-01-30'),(198,'Shootin Stars',127,59,1,'2014-01-30'),(199,'4U',121,60,1,'2015-08-03'),(200,'Titans',104,61,1,'2015-06-22'),(201,'Titans',121,61,1,'2015-06-22'),(202,'Take Me Home',122,62,1,'2019-04-15'),(203,'Take Me Home',121,62,1,'2019-04-15'),(204,'​camellia',128,63,1,'2019-01-01'),(205,'NANI THE FUCK!!',129,64,1,'2019-08-12'),(206,'NANI THE FUCK!!',130,64,1,'2019-08-12'),(207,'KillerBeast',130,65,1,'2019-08-12'),(208,'WHAT THE CAT!?',130,66,1,'2017-03-01'),(209,'Crystallized',130,67,1,'2015-12-31'),(210,'Dyscontrolled Galaxy (”Apoptosis” Long Ver.)',130,68,1,'2018-03-21'),(211,'Exit This Earth’s Atomosphere',130,69,1,'2015-08-16'),(212,'Night Raid With a Dragon',130,70,1,'2019-08-12'),(213,'Camellia - Bassdrop Freaks - Long Ver. (English Translation)',130,71,1,'2015-10-07'),(214,'Camellia - Bassdrop Freaks - Long Ver. (English Translation)',129,71,1,'2015-10-07'),(215,'Camellia - Bassdrop Freaks - Long Ver. (English Translation)',131,71,1,'2015-10-07'),(216,'We Could Get More Machinegun Psystyle! (And More Genre Switches)',130,72,1,'2019-08-12'),(217,'FitBeat',132,73,1,'2020-04-09'),(218,'Fat Pussy Legend',133,74,1,'2019-05-17'),(219,'Kangpe',134,75,1,NULL),(220,'Kangpe',109,75,1,NULL),(221,'Apa Ti Jabo',135,76,1,'2011-03-21'),(222,'Why',136,77,1,'1996-11-24'),(223,'Pon Pon Pon',137,78,1,'2015-03-06'),(224,'Tous Les Jours',138,79,1,'2018-09-05'),(225,'My Demons Got My Back!',139,80,1,'2019-09-10'),(226,'My Demons Got My Back!',140,80,1,'2019-09-10'),(227,'Nike',141,81,1,'2019-08-09'),(228,'Nike',142,81,1,'2019-08-09'),(229,'Nike',143,81,1,'2019-08-09'),(230,'Yuh Freestyle',144,82,1,'2019-05-29'),(231,'Blusk',65,83,1,'2021-11-24'),(232,'Mistress Intuition (BluSkay Remix)',145,84,1,'2012-06-10'),(233,'Mistress Intuition (BluSkay Remix)',103,84,1,'2012-06-10'),(234,'BLUSKAM',147,85,1,'2020-01-11'),(235,'‘blusky’',148,86,1,'2017-09-22'),(236,'‘blusky’',149,86,1,'2017-09-22'),(237,'Sk! H!',150,87,1,'2014-07-25'),(238,'Sk! H!',151,87,1,'2014-07-25'),(239,'Burst My Brain',152,88,1,'2019-12-19'),(240,'Burst My Brain',153,88,1,'2019-12-19'),(241,'Burst My Brain',154,88,1,'2019-12-19'),(242,'Brown Eyes',155,89,1,'2005-06-27'),(243,'FYRE 02 - Килиан Мбаппе (Kylian Mbappé) (Romanized)',156,90,1,'2018-08-15'),(244,'ASTRI',157,91,1,'2018-03-25'),(245,'Wavy',155,92,1,'2012-06-22'),(246,'HUMANSUIT',158,93,1,'2019-07-17'),(247,'HUMANSUIT',159,93,1,'2019-07-17'),(248,'HUMANSUIT',160,93,1,'2019-07-17'),(249,'High On Humans',161,94,1,'2017-06-09'),(250,'High On Humans',162,94,1,'2017-06-09'),(251,'High On Humans',163,94,1,'2017-06-09'),(252,'Toxic Humans*',164,95,1,NULL),(253,'Toxic Humans*',165,95,1,NULL),(254,'Toxic Humans*',166,95,1,NULL),(255,'Humans',167,96,1,'2016-02-04'),(256,'Humans',168,96,1,'2016-02-04'),(257,'Some Humans Ain’t Human',169,97,1,'2005-04-26'),(258,'HUMANS',170,98,1,'2019-10-16'),(259,'Bottle of Humans',171,99,1,'2000-08-08'),(260,'HUMANS',172,100,1,'2019-07-26'),(261,'HUMANS',173,100,1,'2019-07-26'),(262,'HUMANS',174,100,1,'2019-07-26'),(263,'HUMANS',175,100,1,'2019-07-26'),(264,'HUMANS',176,100,1,'2019-07-26'),(265,'HUMANS',177,100,1,'2019-07-26'),(266,'HUMANS',178,100,1,'2019-07-26'),(267,'HUMANS',179,100,1,'2019-07-26'),(268,'Shredded Humans',180,101,1,'1990-08-17'),(269,'Shredded Humans',181,101,1,'1990-08-17'),(270,'Shredded Humans',182,101,1,'1990-08-17'),(271,'Shredded Humans',183,101,1,'1990-08-17'),(272,'Shredded Humans',184,101,1,'1990-08-17'),(273,'Shredded Humans',185,101,1,'1990-08-17'),(274,'Machines (Or Back to Humans)',186,102,1,'1984-02-27'),(275,'Machines (Or Back to Humans)',187,102,1,'1984-02-27'),(276,'Machines (Or Back to Humans)',188,102,1,'1984-02-27'),(277,'The Berserker at Stamford Bridge',189,103,1,'2019-05-03'),(278,'BERSERKER',190,104,1,'2015-07-08'),(279,'Berserker',191,105,1,NULL),(280,'Berserkers',192,106,1,'2002-03-05'),(281,'Berserkers',193,106,1,'2002-03-05'),(282,'Berserker',194,107,1,'1984-11-03'),(283,'BERSERKER',195,108,1,'2021-11-04'),(284,'Berserker',196,109,1,'2021-06-18'),(285,'Berserker',197,109,1,'2021-06-18'),(286,'Berserker',198,109,1,'2021-06-18'),(287,'Berserker',199,109,1,'2021-06-18'),(288,'Berserker',201,110,1,'2019-08-08'),(289,'Berserker',202,110,1,'2019-08-08'),(290,'Берсерки (Berserkers)',203,111,1,'2014-05-29'),(291,'Берсерки (Berserkers)',204,111,1,'2014-05-29'),(292,'Берсерки (Berserkers)',205,111,1,'2014-05-29'),(293,'Berserker',206,112,1,'1994-10-11'),(294,'Berserker',207,112,1,'1994-10-11'),(295,'Berserker',208,112,1,'1994-10-11'),(296,'Berserker',209,112,1,'1994-10-11'),(297,'Seasons',210,113,1,'2018-04-04'),(298,'Seasons',211,113,1,'2018-04-04'),(299,'Seasons',212,113,1,'2018-04-04'),(300,'Соперница (Rival)',213,114,1,'2018-10-20'),(301,'Control',214,115,1,'2018-10-19'),(302,'Control',211,115,1,'2018-10-19'),(303,'Control',215,115,1,'2018-10-19'),(304,'Willow Tree',216,116,1,'2018-11-24'),(305,'Willow Tree',212,116,1,'2018-11-24'),(306,'Willow Tree',211,116,1,'2018-11-24'),(307,'Rival Dealer',217,117,1,'2013-12-16'),(308,'Do Your Worst',218,118,1,'2018-09-14'),(309,'Do Your Worst',219,118,1,'2018-09-14'),(310,'Do Your Worst',220,118,1,'2018-09-14'),(311,'Do Your Worst',221,118,1,'2018-09-14'),(312,'Rival',222,119,1,'2017-06-30'),(313,'Rival',223,119,1,'2017-06-30'),(314,'Be Gone',224,120,1,'2019-08-07'),(315,'Be Gone',211,120,1,'2019-08-07'),(316,'The Rival',225,121,1,NULL),(317,'Walls',211,122,1,'2019-05-16'),(318,'Walls',226,122,1,'2019-05-16'),(319,'Just Breathe',211,123,1,'2017-08-20'),(320,'Just Breathe',212,123,1,'2017-08-20'),(321,'Just Breathe',228,123,1,'2017-08-20'),(322,'Just Breathe (Evate Remix)',229,124,1,'2017-11-06'),(323,'Just Breathe (Evate Remix)',212,124,1,'2017-11-06'),(324,'Just Breathe (Evate Remix)',211,124,1,'2017-11-06'),(325,'Just Breathe (Evate Remix)',228,124,1,'2017-11-06'),(326,'Drive',230,125,1,'2017-02-27'),(327,'Demons',231,126,1,'2019-01-23'),(328,'Demons',232,126,1,'2019-01-23'),(329,'Demons',211,126,1,'2019-01-23'),(330,'Little Mistakes',233,127,1,'2021-03-19'),(331,'Little Mistakes',234,127,1,'2021-03-19'),(332,'Little Mistakes',235,127,1,'2021-03-19'),(333,'Little Mistakes',236,127,1,'2021-03-19'),(334,'Little Mistakes',237,127,1,'2021-03-19'),(335,'MURAMASA',238,128,1,'2017-06-25'),(336,'MURAMASA',239,128,1,'2017-06-25'),(337,'Math Class Conceit',240,129,1,NULL),(338,'Roar in Peace',241,130,1,NULL),(339,'DRAGON YEAR',242,131,1,'2020-11-20'),(340,'DRAGON YEAR',243,131,1,'2020-11-20'),(341,'DRAGON YEAR',244,131,1,'2020-11-20'),(342,'The Crystal Cracked',245,132,1,'2018-07-11'),(343,'Coming Home',246,133,1,'2021-11-15'),(344,'Coming Home',247,133,1,'2021-11-15'),(345,'Coming Home',248,133,1,'2021-11-15'),(346,'Coming Home',249,133,1,'2021-11-15'),(347,'Coming Home',250,133,1,'2021-11-15'),(348,'Coming Home',212,133,1,'2021-11-15'),(349,'Coming Home',211,133,1,'2021-11-15'),(350,'Coming Home',251,133,1,'2021-11-15'),(351,'Coming Home',252,133,1,'2021-11-15'),(352,'The Heist',218,134,1,'2012-09-17'),(353,'The Heist',219,134,1,'2012-09-17'),(354,'The Heist',221,134,1,'2012-09-17'),(355,'Coming Home',254,135,1,'2021-09-10'),(356,'Bridges',255,136,1,'2019-04-26'),(357,'Find Them Beautiful',256,137,1,'2017-05-12'),(358,'FGE Cypher',257,138,1,'2015-12-02'),(359,'FGE Cypher',258,138,1,'2015-12-02'),(360,'FGE Cypher',259,138,1,'2015-12-02'),(361,'FGE Cypher',260,138,1,'2015-12-02'),(362,'Two Presidents',262,139,1,'2013-11-29'),(363,'Two Presidents',263,139,1,'2013-11-29'),(364,'Two Presidents',264,139,1,'2013-11-29'),(365,'Chiraq',265,140,1,'2018-08-31'),(366,'Chiraq',266,140,1,'2018-08-31'),(367,'Chiraq',267,140,1,'2018-08-31'),(368,'Black Rose',268,141,1,'2018-08-29'),(369,'Black Rose',269,141,1,'2018-08-29'),(370,'The Hip-Hop of Shakespeare',270,142,1,'2012-11-29'),(371,'The Hip-Hop of Shakespeare',271,142,1,'2012-11-29'),(372,'Kill Shit',272,143,1,'2012-08-04'),(373,'Kill Shit',273,143,1,'2012-08-04'),(374,'Kill Shit',274,143,1,'2012-08-04'),(375,'“Heroes”',276,144,1,'1977-09-23'),(376,'“Heroes”',277,144,1,'1977-09-23'),(377,'PTSD',278,145,1,'2020-02-28'),(378,'PTSD',279,145,1,'2020-02-28'),(379,'PTSD',280,145,1,'2020-02-28'),(380,'PTSD',281,145,1,'2020-02-28'),(381,'PTSD',274,145,1,'2020-02-28'),(382,'PTSD',282,145,1,'2020-02-28'),(383,'PTSD',166,145,1,'2020-02-28'),(384,'PTSD',283,145,1,'2020-02-28'),(385,'Heroin',284,146,1,'2017-07-21'),(386,'Heroin',285,146,1,'2017-07-21'),(387,'Stereo Hearts',286,147,1,'2011-05-30'),(388,'Stereo Hearts',287,147,1,'2011-05-30'),(389,'Stereo Hearts',288,147,1,'2011-05-30'),(390,'Stereo Hearts',289,147,1,'2011-05-30'),(391,'Stereo Hearts',290,147,1,'2011-05-30'),(392,'Stereo Hearts',291,147,1,'2011-05-30'),(393,'Stereo Hearts',292,147,1,'2011-05-30'),(394,'Pull Up',274,148,1,'2016-08-20'),(395,'Rollin’',274,149,1,'2015-02-10'),(396,'Who Run It',293,150,1,'2018-03-22'),(397,'Who Run It',294,150,1,'2018-03-22'),(398,'Who Run It',295,150,1,'2018-03-22'),(399,'Who Run It',296,150,1,'2018-03-22'),(400,'Who Run It',297,150,1,'2018-03-22'),(401,'Who Run It',274,150,1,'2018-03-22'),(402,'Cupid’s Chokehold / Breakfast in America',299,151,1,NULL),(403,'Cupid’s Chokehold / Breakfast in America',291,151,1,NULL),(404,'Cupid’s Chokehold / Breakfast in America',300,151,1,NULL),(405,'Cupid’s Chokehold / Breakfast in America',292,151,1,NULL),(406,'Heroku’s Ugly Secret',301,152,1,'2013-02-13'),(407,'Heroku’s Ugly Secret',302,152,1,'2013-02-13'),(408,'Heroku’s Ugly Secret',303,152,1,'2013-02-13'),(409,'Heroku’s Ugly Secret',304,152,1,'2013-02-13'),(410,'Heroku’s Ugly Secret',305,152,1,'2013-02-13'),(411,'Hero',307,153,1,'2014-03-17'),(412,'Hero',308,153,1,'2014-03-17'),(413,'Hero (Teminite Remix)',309,154,1,'2014-05-30'),(414,'Hero (Teminite Remix)',308,154,1,'2014-05-30'),(415,'Hero (Teminite Remix)',307,154,1,'2014-05-30'),(416,'Hero (Stonebank Remix)',310,155,1,'2014-05-09'),(417,'Hero (Stonebank Remix)',308,155,1,'2014-05-09'),(418,'Hero (Stonebank Remix)',307,155,1,'2014-05-09'),(419,'Hero (Infected Mushroom Remix)',308,156,1,'2020-12-17'),(420,'Hero (Infected Mushroom Remix)',307,156,1,'2020-12-17'),(421,'Here It Comes',307,157,1,'2014-06-09'),(422,'Here It Comes (Snavs & Toby Green Remix)',311,158,1,'2014-11-17'),(423,'Here It Comes (Snavs & Toby Green Remix)',312,158,1,'2014-11-17'),(424,'Here It Comes (Snavs & Toby Green Remix)',307,158,1,'2014-11-17'),(425,'Best of Dubstep Mix',100,159,1,'2016-12-19'),(426,'New Music Friday 12/11/15',313,160,1,'2015-12-11'),(427,'Superstar',307,161,1,'2016-05-27'),(428,'Superstar',314,161,1,'2016-05-27'),(429,'Superstar',315,161,1,'2016-05-27'),(430,'Crab Rave',316,162,1,'2018-04-01'),(431,'Breakout',316,163,1,'2018-10-01'),(432,'Breakout',317,163,1,'2018-10-01'),(433,'Leaving Now',316,164,1,'2016-05-11'),(434,'This Feeling',316,165,1,'2016-07-11'),(435,'Bring The Madness (Noisestorm Remix)',316,166,1,'2015-03-23'),(436,'Bring The Madness (Noisestorm Remix)',318,166,1,'2015-03-23'),(437,'Bring The Madness (Noisestorm Remix)',319,166,1,'2015-03-23'),(438,'Bring The Madness (Noisestorm Remix)',307,166,1,'2015-03-23'),(439,'Heist',316,167,1,'2015-10-05'),(440,'Antihero',316,168,1,'2016-03-04'),(441,'Breakdown VIP',316,169,1,'2014-06-04'),(442,'Escape',316,170,1,'2017-03-01'),(443,'Renegade',316,171,1,'2012-02-01'),(444,'打打打打打打打打打打 (Dadadadadadadadadada)',321,172,1,'2014-11-01'),(445,'打打打打打打打打打打 (Dadadadadadadadadada)',322,172,1,'2014-11-01'),(446,'Hige Driver - Dadadadadadadadadada 打打打打打打打打打打 (Romanized)',156,173,1,NULL),(447,'Sandstorm',323,174,1,'1999-10-26'),(448,'Another Sad Love Song',324,175,1,'2017-03-03'),(449,'Another Sad Love Song',325,175,1,'2017-03-03'),(450,'Another Sad Love Song',326,175,1,'2017-03-03'),(451,'L’amour',327,176,1,'2012-01-23'),(452,'Part-Time Lover',328,177,1,'1985-08-24'),(453,'Inside The Actor’s Studio Interview',329,178,1,NULL),(454,'Inside The Actor’s Studio Interview',330,178,1,NULL),(455,'Inside The Actor’s Studio Interview',331,178,1,NULL),(456,'You’re Such A',332,179,1,'2015-11-13'),(457,'You’re Such A',333,179,1,'2015-11-13'),(458,'You’re Such A',334,179,1,'2015-11-13'),(459,'You’re Such A',335,179,1,'2015-11-13'),(460,'You’re Such A',336,179,1,'2015-11-13'),(461,'The Downfall of Us All',337,180,1,'2009-02-03'),(462,'The Downfall of Us All',338,180,1,'2009-02-03'),(463,'BrothermanBill',339,181,1,'2006-10-18'),(464,'DADADADA',340,182,1,'2017-05-10'),(465,'Maondo & dr jay official rylislcs written by maondo',341,183,1,'2018-03-31'),(466,'Maondo & dr jay official rylislcs written by maondo',342,183,1,'2018-03-31'),(467,'Mask Off',343,184,1,'2017-02-17'),(468,'Mask Off',344,184,1,'2017-02-17'),(469,'Mask Off',345,184,1,'2017-02-17'),(470,'Mask Off',346,184,1,'2017-02-17'),(471,'Mask Off (Remix)',343,185,1,'2017-05-23'),(472,'Mask Off (Remix)',345,185,1,'2017-05-23'),(473,'Mask Off (Remix)',346,185,1,'2017-05-23'),(474,'Mask Off (Remix)',264,185,1,'2017-05-23'),(475,'Mask Off (Remix)',344,185,1,'2017-05-23'),(476,'Dream - Mask (Official Sus Remix)',347,186,1,'2021-05-26'),(477,'Mask Off [Remix]',260,187,1,'2017-09-17'),(478,'Mask Off (Remix)',348,188,1,'2017-04-10'),(479,'Mask Off (Minecraft Parody)',349,189,1,'2017-03-30'),(480,'N My Zone : Mask Off',350,190,1,'2017-06-20'),(481,'Toa Tint (Mask Off Cover)',351,191,1,'2017-05-09'),(482,'Future - Mask Off (Deutsche Übersetzung)',352,192,1,'2017-02-17'),(483,'Mask Off (Eastmix)',353,193,1,'2017-04-10');
/*!40000 ALTER TABLE `Songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Songs_in_albums`
--

DROP TABLE IF EXISTS `Songs_in_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Songs_in_albums` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Song` int DEFAULT NULL,
  `ID_Album` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_Song` (`ID_Song`),
  KEY `ID_Album` (`ID_Album`),
  CONSTRAINT `Songs_in_albums_ibfk_1` FOREIGN KEY (`ID_Song`) REFERENCES `Songs` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Songs_in_albums_ibfk_2` FOREIGN KEY (`ID_Album`) REFERENCES `Albums` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs_in_albums`
--

LOCK TABLES `Songs_in_albums` WRITE;
/*!40000 ALTER TABLE `Songs_in_albums` DISABLE KEYS */;
INSERT INTO `Songs_in_albums` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,3),(13,13,3),(14,14,3),(15,15,3),(16,16,3),(17,17,3),(18,18,3),(19,19,3),(20,20,3),(21,21,3),(22,22,3),(23,23,3),(24,24,4),(25,25,4),(26,26,4),(27,27,5),(28,28,5),(29,29,5),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,6),(42,42,6),(43,43,6),(44,44,6),(45,45,6),(46,46,6),(47,47,6),(48,48,6),(49,49,6),(50,50,6),(51,51,6),(52,52,6),(53,53,6),(54,54,6),(55,55,6),(56,56,6),(57,57,6),(58,58,7),(59,59,7),(60,60,7),(61,61,7),(62,62,7),(63,63,7),(64,64,7),(65,65,8),(66,66,1),(67,67,9),(68,68,1),(69,69,1),(70,70,10),(71,71,10),(72,72,10),(73,73,10),(74,74,10),(75,75,10),(76,76,10),(77,77,10),(78,78,10),(79,79,11),(80,80,11),(81,81,11),(82,82,11),(83,83,11),(84,84,11),(85,85,12),(86,86,12),(87,87,12),(88,88,12),(89,89,12),(90,90,13),(91,91,13),(92,92,13),(93,93,13),(94,94,14),(95,95,14),(96,96,14),(97,97,15),(98,98,15),(99,99,15),(100,100,15),(101,101,15),(102,102,15),(103,103,11),(104,104,11),(105,105,11),(106,106,11),(107,107,11),(108,108,11),(109,109,16),(110,110,16),(111,111,16),(112,112,16),(113,113,16),(114,114,16),(115,115,17),(116,116,17),(117,117,17),(118,118,17),(119,119,17),(120,120,17),(121,121,17),(122,122,17),(123,123,17),(124,124,17),(125,125,18),(126,126,18),(127,127,18),(128,128,18),(129,129,18),(130,130,18),(131,131,18),(132,132,18),(133,133,18),(134,134,18),(135,135,18),(136,136,18),(137,137,19),(138,138,19),(139,139,19),(140,140,19),(141,141,18),(142,142,18),(143,143,18),(144,144,18),(145,145,18),(146,146,18),(147,147,18),(148,148,18),(149,149,18),(150,150,18),(151,151,18),(152,152,18),(153,153,20),(154,154,20),(155,155,21),(156,156,21),(157,157,22),(158,158,22),(159,159,23),(160,160,23),(161,161,24),(162,162,24),(163,163,25),(164,164,25),(165,165,24),(166,166,24),(167,167,26),(168,168,26),(169,169,27),(170,170,27),(171,171,28),(172,172,29),(173,173,30),(174,174,30),(175,175,31),(176,176,31),(177,177,31),(178,178,31),(179,179,1),(180,180,32),(181,181,33),(182,182,34),(183,183,35),(184,184,1),(185,185,36),(186,186,37),(187,187,37),(188,188,38),(189,189,38),(190,190,38),(191,191,39),(192,192,40),(193,193,40),(194,194,41),(195,195,42),(196,196,42),(197,197,1),(198,198,1),(199,199,43),(200,200,43),(201,201,43),(202,202,44),(203,203,44),(204,204,1),(205,205,45),(206,206,45),(207,207,46),(208,208,47),(209,209,48),(210,210,49),(211,211,50),(212,212,46),(213,213,51),(214,214,51),(215,215,51),(216,216,46),(217,217,52),(218,218,53),(219,219,54),(220,220,54),(221,221,55),(222,222,56),(223,223,1),(224,224,57),(225,225,58),(226,226,58),(227,227,59),(228,228,59),(229,229,59),(230,230,1),(231,231,60),(232,232,61),(233,233,61),(234,234,1),(235,235,62),(236,236,62),(237,237,63),(238,238,63),(239,239,1),(240,240,1),(241,241,1),(242,242,64),(243,243,1),(244,244,1),(245,245,65),(246,246,66),(247,247,66),(248,248,66),(249,249,67),(250,250,67),(251,251,67),(252,252,1),(253,253,1),(254,254,1),(255,255,68),(256,256,68),(257,257,69),(258,258,1),(259,259,70),(260,260,71),(261,261,71),(262,262,71),(263,263,71),(264,264,71),(265,265,71),(266,266,71),(267,267,71),(268,268,72),(269,269,72),(270,270,72),(271,271,72),(272,272,72),(273,273,72),(274,274,73),(275,275,73),(276,276,73),(277,277,74),(278,278,75),(279,279,76),(280,280,77),(281,281,77),(282,282,74),(283,283,78),(284,284,79),(285,285,79),(286,286,79),(287,287,79),(288,288,80),(289,289,80),(290,290,81),(291,291,81),(292,292,81),(293,293,82),(294,294,82),(295,295,82),(296,296,82),(297,297,1),(298,298,1),(299,299,1),(300,300,83),(301,301,1),(302,302,1),(303,303,1),(304,304,1),(305,305,1),(306,306,1),(307,307,84),(308,308,85),(309,309,85),(310,310,85),(311,311,85),(312,312,86),(313,313,86),(314,314,1),(315,315,1),(316,316,87),(317,317,88),(318,318,88),(319,319,1),(320,320,1),(321,321,1),(322,322,1),(323,323,1),(324,324,1),(325,325,1),(326,326,1),(327,327,1),(328,328,1),(329,329,1),(330,330,89),(331,331,89),(332,332,89),(333,333,89),(334,334,89),(335,335,90),(336,336,90),(337,337,91),(338,338,92),(339,339,93),(340,340,93),(341,341,93),(342,342,94),(343,343,95),(344,344,95),(345,345,95),(346,346,95),(347,347,95),(348,348,95),(349,349,95),(350,350,95),(351,351,95),(352,352,96),(353,353,96),(354,354,96),(355,355,97),(356,356,98),(357,357,99),(358,358,100),(359,359,100),(360,360,100),(361,361,100),(362,362,101),(363,363,101),(364,364,101),(365,365,102),(366,366,102),(367,367,102),(368,368,103),(369,369,103),(370,370,1),(371,371,1),(372,372,104),(373,373,104),(374,374,104),(375,375,105),(376,376,105),(377,377,106),(378,378,106),(379,379,106),(380,380,106),(381,381,106),(382,382,106),(383,383,106),(384,384,106),(385,385,107),(386,386,107),(387,387,108),(388,388,108),(389,389,108),(390,390,108),(391,391,108),(392,392,108),(393,393,108),(394,394,109),(395,395,110),(396,396,111),(397,397,111),(398,398,111),(399,399,111),(400,400,111),(401,401,111),(402,402,112),(403,403,112),(404,404,112),(405,405,112),(406,406,113),(407,407,113),(408,408,113),(409,409,113),(410,410,113),(411,411,39),(412,412,39),(413,413,114),(414,414,114),(415,415,114),(416,416,1),(417,417,1),(418,418,1),(419,419,1),(420,420,1),(421,421,20),(422,422,115),(423,423,115),(424,424,115),(425,425,116),(426,426,117),(427,427,23),(428,428,23),(429,429,23),(430,430,37),(431,431,118),(432,432,118),(433,433,23),(434,434,119),(435,435,120),(436,436,120),(437,437,120),(438,438,120),(439,439,21),(440,440,121),(441,441,20),(442,442,122),(443,443,123),(444,444,1),(445,445,1),(446,446,1),(447,447,124),(448,448,125),(449,449,125),(450,450,125),(451,451,126),(452,452,127),(453,453,128),(454,454,128),(455,455,128),(456,456,129),(457,457,129),(458,458,129),(459,459,129),(460,460,129),(461,461,130),(462,462,130),(463,463,131),(464,464,132),(465,465,1),(466,466,1),(467,467,133),(468,468,133),(469,469,133),(470,470,133),(471,471,133),(472,472,133),(473,473,133),(474,474,133),(475,475,133),(476,476,1),(477,477,1),(478,478,1),(479,479,134),(480,480,135),(481,481,1),(482,482,1),(483,483,1);
/*!40000 ALTER TABLE `Songs_in_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nickname` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `User_Mode` int DEFAULT NULL,
  `Phone` bigint DEFAULT NULL,
  `Last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_Mode` (`User_Mode`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`User_Mode`) REFERENCES `Access_Rights` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'RubyLegend','serhiihatcan@gmail.com','168234975',1,380676299188,'2021-12-21 23:37:21'),(2,'test2@gmail.com','test2@gmail.com','testpassword',2,NULL,'2021-12-18 21:37:37'),(3,'test3@gmail.com','test3@gmail.com','testpassword3',2,NULL,'2021-12-18 21:37:50'),(4,'test5@gmail.com','test5@gmail.com','16823497',2,NULL,'2021-12-19 19:00:28');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `song_author`
--

DROP TABLE IF EXISTS `song_author`;
/*!50001 DROP VIEW IF EXISTS `song_author`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `song_author` AS SELECT 
 1 AS `Name`,
 1 AS `Artists`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `song_data`
--

DROP TABLE IF EXISTS `song_data`;
/*!50001 DROP VIEW IF EXISTS `song_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `song_data` AS SELECT 
 1 AS `Name`,
 1 AS `Artists`,
 1 AS `Release date`,
 1 AS `Album`,
 1 AS `Genre`,
 1 AS `Lyrics URL`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `Music_Search_System`
--

USE `Music_Search_System`;

--
-- Final view structure for view `song_author`
--

/*!50001 DROP VIEW IF EXISTS `song_author`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `song_author` AS select `s`.`Name` AS `Name`,group_concat(`a`.`Name` separator ', ') AS `Artists` from (`Songs` `s` join `Authors` `a`) where (`a`.`ID` = `s`.`ID_Author`) group by `s`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `song_data`
--

/*!50001 DROP VIEW IF EXISTS `song_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `song_data` AS select `s`.`Name` AS `Name`,group_concat(`a`.`Name` separator ', ') AS `Artists`,`s`.`Release_date` AS `Release date`,`al`.`Name` AS `Album`,`g`.`Genre_name` AS `Genre`,`l`.`URL` AS `Lyrics URL` from (((((`Songs` `s` join `Authors` `a`) join `Songs_in_albums` `sia`) join `Albums` `al`) join `Genres` `g`) join `Lyrics` `l`) where ((`a`.`ID` = `s`.`ID_Author`) and (`sia`.`ID_Song` = `s`.`ID`) and (`sia`.`ID_Album` = `al`.`ID`) and (`s`.`ID_Genre` = `g`.`ID`) and (`l`.`ID` = `s`.`ID_Lyrics`)) group by `s`.`Name`,`s`.`Release_date`,`al`.`Name`,`g`.`Genre_name`,`l`.`URL` */;
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

-- Dump completed on 2021-12-21 23:55:05
