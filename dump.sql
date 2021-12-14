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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Rights`
--

LOCK TABLES `Access_Rights` WRITE;
/*!40000 ALTER TABLE `Access_Rights` DISABLE KEYS */;
INSERT INTO `Access_Rights` VALUES (1,'Administrator'),
(2,'User');
/*!40000 ALTER TABLE `Access_Rights` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,NULL,'None',NULL),
(1,5,'Los 90 Piketes','2020-04-17'),
(3,19,'Remixes ','2016-10-28'),
(4,26,'Se Prendió El Arbolito','2018-12-07'),
(5,29,'Let’s Get Physical','2008-04-08'),
(6,57,'Hinterhofjargon','2012-05-25'),
(7,64,'Radical Dilemma','2013-12-04'),
(8,65,'Cyphisonia','2016-10-30'),
(9,65,'GALAXY BURST','2018-03-21'),
(10,66,'O Glorioso Retorno de Quem Nunca Esteve Aqui','2013-08-21'),
(11,68,'Like the Word Love on the Lips of a Harlot',NULL),
(12,65,'heart of android','2018-12-30'),
(13,69,'11.167 Km',NULL),
(14,76,'Deep States','2021-08-20'),
(15,65,'Blackmagik Blazing','2019-08-12');
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Our Stolen Theory'),
(2,'Myke Towers'),
(3,'Jhay Cortez'),
(4,'J Balvin'),
(5,'Miky Woodz'),
(6,'Felo Blonck'),
(7,'Galindo Again'),
(8,'El Fother'),
(9,'Lito Kirino'),
(10,'Químico Ultra Mega'),
(11,'Jamby el Favo'),
(12,'Madnass'),
(13,'E. Tárraga'),
(14,'Tron Dosh'),
(15,'Pozo Musikandante'),
(16,'Lesky'),
(17,'Bambú (MC)'),
(18,'Dash Shamash'),
(19,'Bls a.k.a Rigor Mortis'),
(20,'DJ Joaking'),
(21,'Versoterismo'),
(22,'Exopoetics'),
(23,'ComboClap Crew'),
(24,'Dalmata'),
(25,'Jamsha'),
(26,'Ñejo'),
(27,'Shaggy'),
(28,'Busta Rhymes'),
(29,'Elephant Man'),
(30,'La Exce'),
(31,'Gigolo'),
(32,'Pacho El Antifeka'),
(33,'Juhn'),
(34,'Pusho'),
(35,'Darkiel'),
(36,'Noriel'),
(37,'Brytiago'),
(38,'Benny Benni'),
(39,'Gigolo Y La Exce'),
(40,'Malik'),
(41,'M3'),
(42,'Doezis'),
(43,'Tatwaffe'),
(44,'Ben Salomo'),
(45,'Azro 215'),
(46,'Credibil'),
(47,'Behrang'),
(48,'Anoush'),
(49,'Ray Rah'),
(50,'Vlacho'),
(51,'60/60'),
(52,'Elijahu'),
(53,'JURI'),
(54,'Olexesh'),
(55,'Celo'),
(56,'Abdi'),
(57,'Celo & Abdi'),
(58,'​stic.man'),
(59,'RodStarz'),
(60,'Rakaa Iriscience'),
(61,'M-1'),
(62,'G1'),
(63,'​dead prez'),
(64,'Rebel Diaz'),
(65,'かめりあ (Camellia)'),
(66,'Emicida'),
(67,'Wilson das Neves'),
(68,'Camilla Rhodes'),
(69,'Erminio Sinni'),
(70,'Kas Solo'),
(71,'Angry Mic'),
(72,'Gareth Liddiard'),
(73,'Lauren Hammel'),
(74,'Fiona Kitschin'),
(75,'Erica Dunn'),
(76,'Tropical Fuck Storm'),
(77,'Kakuzo Okakura');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lyrics`
--

LOCK TABLES `Lyrics` WRITE;
/*!40000 ALTER TABLE `Lyrics` DISABLE KEYS */;
INSERT INTO `Lyrics` VALUES (1,'https://genius.com/Our-stolen-theory-united-laos-remix-lyrics'),
(2,'https://genius.com/Miky-woodz-j-balvin-and-myke-towers-pinky-ring-remix-lyrics'),
(3,'https://genius.com/Jamby-el-favo-quimico-ultra-mega-and-lito-kirino-klonk-remix-lyrics'),
(4,'https://genius.com/Bls-aka-rigor-mortis-stargate-remix-lyrics'),
(5,'https://genius.com/Nejo-navidad-2-lyrics'),
(6,'https://genius.com/Elephant-man-the-way-we-roll-remix-lyrics'),
(7,'https://genius.com/Elephant-man-the-way-we-roll-lyrics'),
(8,'https://genius.com/Benny-benni-noriel-and-brytiago-el-gatito-de-mi-ex-remix-lyrics'),
(9,'https://genius.com/Celo-and-abdi-parallelen-united-remix-1-lyrics'),
(10,'https://genius.com/Rebel-diaz-which-side-are-you-on-remix-lyrics'),
(11,'https://genius.com/Camellia-ghost-lyrics'),
(12,'https://genius.com/Camellia-ghost-nova-lyrics'),
(13,'https://genius.com/Emicida-trepadeira-lyrics'),
(14,'https://genius.com/Camilla-rhodes-if-dreams-are-like-movies-then-memories-are-like-ghosts-lyrics'),
(15,'https://genius.com/Camellia-beyond-the-geostationary-orbit-level-lyrics'),
(16,'https://genius.com/Erminio-sinni-meno-di-niente-lyrics'),
(17,'https://genius.com/Angry-mic-new-affiliations-lyrics'),
(18,'https://genius.com/Tropical-fuck-storm-the-donkey-lyrics'),
(19,'https://genius.com/Camellia-nasty-nasty-spell-lyrics'),
(20,'https://genius.com/Kakuzo-okakura-the-book-of-tea-annotated');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES (1,'United (L.A.O.S Remix)',1,1,1,'2012-09-21'),
(2,'Pinky Ring (Remix)',2,2,1,'2019-12-27'),
(3,'Pinky Ring (Remix)',3,2,1,'2019-12-27'),
(4,'Pinky Ring (Remix)',4,2,1,'2019-12-27'),
(5,'Pinky Ring (Remix)',5,2,1,'2019-12-27'),
(6,'Klonk (Remix)',6,3,1,'2019-07-20'),
(7,'Klonk (Remix)',7,3,1,'2019-07-20'),
(8,'Klonk (Remix)',8,3,1,'2019-07-20'),
(9,'Klonk (Remix)',9,3,1,'2019-07-20'),
(10,'Klonk (Remix)',10,3,1,'2019-07-20'),
(11,'Klonk (Remix)',11,3,1,'2019-07-20'),
(12,'Stargate (Remix)',12,4,1,'2018-01-01'),
(13,'Stargate (Remix)',13,4,1,'2018-01-01'),
(14,'Stargate (Remix)',14,4,1,'2018-01-01'),
(15,'Stargate (Remix)',15,4,1,'2018-01-01'),
(16,'Stargate (Remix)',16,4,1,'2018-01-01'),
(17,'Stargate (Remix)',17,4,1,'2018-01-01'),
(18,'Stargate (Remix)',18,4,1,'2018-01-01'),
(19,'Stargate (Remix)',19,4,1,'2018-01-01'),
(20,'Stargate (Remix)',20,4,1,'2018-01-01'),
(21,'Stargate (Remix)',21,4,1,'2018-01-01'),
(22,'Stargate (Remix)',22,4,1,'2018-01-01'),
(23,'Stargate (Remix)',23,4,1,'2018-01-01'),
(24,'Navidad 2',24,5,1,'2018-12-10'),
(25,'Navidad 2',25,5,1,'2018-12-10'),
(26,'Navidad 2',26,5,1,'2018-12-10'),
(27,'The Way We Roll (Remix)',27,6,1,NULL),
(28,'The Way We Roll (Remix)',28,6,1,NULL),
(29,'The Way We Roll (Remix)',29,6,1,NULL),
(30,'The Way We Roll',29,7,1,NULL),
(31,'El Gatito De Mi Ex (Remix)',30,8,1,'2017-11-04'),
(32,'El Gatito De Mi Ex (Remix)',31,8,1,'2017-11-04'),
(33,'El Gatito De Mi Ex (Remix)',32,8,1,'2017-11-04'),
(34,'El Gatito De Mi Ex (Remix)',33,8,1,'2017-11-04'),
(35,'El Gatito De Mi Ex (Remix)',34,8,1,'2017-11-04'),
(36,'El Gatito De Mi Ex (Remix)',35,8,1,'2017-11-04'),
(37,'El Gatito De Mi Ex (Remix)',36,8,1,'2017-11-04'),
(38,'El Gatito De Mi Ex (Remix)',37,8,1,'2017-11-04'),
(39,'El Gatito De Mi Ex (Remix)',38,8,1,'2017-11-04'),
(40,'El Gatito De Mi Ex (Remix)',39,8,1,'2017-11-04'),
(41,'Parallelen United Remix 1',40,9,1,'2012-12-15'),
(42,'Parallelen United Remix 1',41,9,1,'2012-12-15'),
(43,'Parallelen United Remix 1',42,9,1,'2012-12-15'),
(44,'Parallelen United Remix 1',43,9,1,'2012-12-15'),
(45,'Parallelen United Remix 1',44,9,1,'2012-12-15'),
(46,'Parallelen United Remix 1',45,9,1,'2012-12-15'),
(47,'Parallelen United Remix 1',46,9,1,'2012-12-15'),
(48,'Parallelen United Remix 1',47,9,1,'2012-12-15'),
(49,'Parallelen United Remix 1',48,9,1,'2012-12-15'),
(50,'Parallelen United Remix 1',49,9,1,'2012-12-15'),
(51,'Parallelen United Remix 1',50,9,1,'2012-12-15'),
(52,'Parallelen United Remix 1',51,9,1,'2012-12-15'),
(53,'Parallelen United Remix 1',52,9,1,'2012-12-15'),
(54,'Parallelen United Remix 1',53,9,1,'2012-12-15'),
(55,'Parallelen United Remix 1',54,9,1,'2012-12-15'),
(56,'Parallelen United Remix 1',55,9,1,'2012-12-15'),
(57,'Parallelen United Remix 1',56,9,1,'2012-12-15'),
(58,'Which Side Are You On? (Remix)',58,10,1,'2013-12-04'),
(59,'Which Side Are You On? (Remix)',59,10,1,'2013-12-04'),
(60,'Which Side Are You On? (Remix)',60,10,1,'2013-12-04'),
(61,'Which Side Are You On? (Remix)',61,10,1,'2013-12-04'),
(62,'Which Side Are You On? (Remix)',62,10,1,'2013-12-04'),
(63,'Which Side Are You On? (Remix)',63,10,1,'2013-12-04'),
(64,'Which Side Are You On? (Remix)',64,10,1,'2013-12-04'),
(65,'GHOST',65,11,1,'2016-10-30'),
(66,'GHOST-NOVA',65,12,1,'2018-03-21'),
(67,'Trepadeira',66,13,1,'2013-08-21'),
(68,'Trepadeira',67,13,1,'2013-08-21'),
(69,'If Dreams Are Like Movies, Then Memories Are Like Ghosts',68,14,1,NULL),
(70,'Beyond the Geostationary Orbit Level',65,15,1,'2018-12-30'),
(71,'Meno Di Niente',69,16,1,NULL),
(72,'New affiliations',70,17,1,'2009-09-09'),
(73,'New affiliations',71,17,1,'2009-09-09'),
(74,'The Donkey',72,18,1,'2021-08-20'),
(75,'The Donkey',73,18,1,'2021-08-20'),
(76,'The Donkey',74,18,1,'2021-08-20'),
(77,'The Donkey',75,18,1,'2021-08-20'),
(78,'The Donkey',76,18,1,'2021-08-20'),
(79,'Nasty * Nasty * Spell',65,19,1,'2019-08-12'),
(80,'The Book Of Tea',77,20,1,'1906-01-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs_in_albums`
--

LOCK TABLES `Songs_in_albums` WRITE;
/*!40000 ALTER TABLE `Songs_in_albums` DISABLE KEYS */;
INSERT INTO `Songs_in_albums` VALUES (1,1,1),
(2,2,2),
(3,3,2),
(4,4,2),
(5,5,2),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1),
(11,11,1),
(12,12,3),
(13,13,3),
(14,14,3),
(15,15,3),
(16,16,3),
(17,17,3),
(18,18,3),
(19,19,3),
(20,20,3),
(21,21,3),
(22,22,3),
(23,23,3),
(24,24,4),
(25,25,4),
(26,26,4),
(27,27,5),
(28,28,5),
(29,29,5),
(30,30,1),
(31,31,1),
(32,32,1),
(33,33,1),
(34,34,1),
(35,35,1),
(36,36,1),
(37,37,1),
(38,38,1),
(39,39,1),
(40,40,1),
(41,41,6),
(42,42,6),
(43,43,6),
(44,44,6),
(45,45,6),
(46,46,6),
(47,47,6),
(48,48,6),
(49,49,6),
(50,50,6),
(51,51,6),
(52,52,6),
(53,53,6),
(54,54,6),
(55,55,6),
(56,56,6),
(57,57,6),
(58,58,7),
(59,59,7),
(60,60,7),
(61,61,7),
(62,62,7),
(63,63,7),
(64,64,7),
(65,65,8),
(66,66,9),
(67,67,10),
(68,68,10),
(69,69,11),
(70,70,12),
(71,71,13),
(72,72,1),
(73,73,1),
(74,74,14),
(75,75,14),
(76,76,14),
(77,77,14),
(78,78,14),
(79,79,15),
(80,80,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'asfasdfasf@gmail.com','asfasdfasf@gmail.com','sdfasdfasdf',2,NULL,NULL),
(2,'adsfasdfas@gmail.com','adsfasdfas@gmail.com','asdfasdf',2,NULL,NULL),
(3,'test@gmail.com','test@gmail.com','168234975',2,NULL,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-14 17:53:10
