-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: chatbot_data
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

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
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commands` (
  `wordId` int(11) NOT NULL,
  `commandsId` int(10) unsigned NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(300) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (0,0,'commands','I know several commands. I can tell you about the weather, news, or tell you about anything you need to know!',1.42196,'what do you know'),(1,1,'commands','I can tell you the news, weather, or I can tell about anything you need to know',1.59994,'what commands do you know'),(2,2,'commands','well I can can tell you the top ten news stories right now, the weather, or about anything that would have a wikipedia page',1.94552,'do you know anything'),(3,3,'commands','',0,'what can you do');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favbook`
--

DROP TABLE IF EXISTS `favbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favbook` (
  `wordId` int(11) unsigned NOT NULL,
  `bookId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favbook`
--

LOCK TABLES `favbook` WRITE;
/*!40000 ALTER TABLE `favbook` DISABLE KEYS */;
INSERT INTO `favbook` VALUES (0,0,'favbook','My favorite book is Ready Player One',0.814344,'what is your favorite book'),(1,1,'favbook','My favorite book is To Kill a Mockingbird',0.65667,'whats your favorite book'),(2,2,'favbook','My favorite book is Anthropocene Reviewed',1.8276,'what\'s your favorite book'),(3,3,'favbook','System Design Interview – An Insider\'s Guide: Volume 2 is a real page turner',1.91782,'do you have a favorite book');
/*!40000 ALTER TABLE `favbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favcolor`
--

DROP TABLE IF EXISTS `favcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favcolor` (
  `wordId` int(10) unsigned NOT NULL,
  `favcolorId` int(11) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(45) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favcolor`
--

LOCK TABLES `favcolor` WRITE;
/*!40000 ALTER TABLE `favcolor` DISABLE KEYS */;
INSERT INTO `favcolor` VALUES (0,0,'favcolor','My favorite color is brown',0.536857,'what\'s your favorite color'),(1,1,'favcolor','My favorite color is blue',1.55937,'what is your favorite color'),(2,2,'favcolor','My favorite color is red',1.65899,'do you have a favorite color'),(3,3,'favcolor','I don\'t really have one',0.155185,'if you had to pick what is your favorite color'),(4,4,'favcolor ','#0dbeff',1.56923,'whats your favorite color'),(5,5,'favcolor','My favorite color is purple',1.91782,NULL);
/*!40000 ALTER TABLE `favcolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favfood`
--

DROP TABLE IF EXISTS `favfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favfood` (
  `wordId` int(11) unsigned NOT NULL,
  `favfoodId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(45) NOT NULL,
  `factor` float NOT NULL DEFAULT 1,
  `words` varchar(45) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favfood`
--

LOCK TABLES `favfood` WRITE;
/*!40000 ALTER TABLE `favfood` DISABLE KEYS */;
INSERT INTO `favfood` VALUES (0,0,'favfood','I don\'t have a favorite food ',1.76296,'what is your favorite food'),(1,1,'favfood','I can\'t consume food ',1.43321,'whats your favorite food'),(2,2,'favfood','I don\'t have one',0.536857,'what\'s your favorite food'),(3,3,'favfood','I don\'t have a mouth',0.536857,'do you have a favorite food');
/*!40000 ALTER TABLE `favfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favmovie`
--

DROP TABLE IF EXISTS `favmovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favmovie` (
  `wordId` int(10) unsigned NOT NULL,
  `favmovieId` int(11) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(45) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(45) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favmovie`
--

LOCK TABLES `favmovie` WRITE;
/*!40000 ALTER TABLE `favmovie` DISABLE KEYS */;
INSERT INTO `favmovie` VALUES (0,0,'favmovie','I love The Dark Knight',1.78618,'whats your favorite moive'),(1,1,'favmovie','I don\'t really have one',0.345757,'what is your favorite movie'),(2,2,'favmovie','I really like The Godfather',0.911142,'do you have a favorite movie'),(3,3,'favmovie','I would say WALL-E is my favorite',1.59994,'what\'s your favorite movie'),(4,4,'favmovie','The Soical Network is my favorite',1.91782,'');
/*!40000 ALTER TABLE `favmovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favprogam`
--

DROP TABLE IF EXISTS `favprogam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favprogam` (
  `wordId` int(11) NOT NULL,
  `favprogam` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favprogam`
--

LOCK TABLES `favprogam` WRITE;
/*!40000 ALTER TABLE `favprogam` DISABLE KEYS */;
INSERT INTO `favprogam` VALUES (0,0,'favprogam','Python is my favorite',1.82472,'what is your favorite programing language'),(1,1,'favprogam','Java is my favorite ',0.429786,'whats your favorite programing language'),(2,2,'favprogam','Assembly is my favorite programing language',1.91782,'what\'s your favorite programing language'),(3,3,'favprogam','Binary is my favorite ',1.59994,'what is your favorite coding language'),(4,4,'favprogam','I don\'t have one ',0.340499,'whats your favorite coding language'),(5,5,'favprogram','',0,'what\'s your favorite coding language');
/*!40000 ALTER TABLE `favprogam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favshow`
--

DROP TABLE IF EXISTS `favshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favshow` (
  `wordId` int(11) unsigned NOT NULL,
  `favshow` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favshow`
--

LOCK TABLES `favshow` WRITE;
/*!40000 ALTER TABLE `favshow` DISABLE KEYS */;
INSERT INTO `favshow` VALUES (0,0,'favshow','I think it is Mr.Robot',1.59994,'what is your favorite show'),(1,1,'favshow','I think it is Love, Death and Robots',1.19524,'whats your favorite show'),(2,2,'favshow','I think it is Severance',1.7077,'what\'s your favorite show'),(3,3,'favshow','I think it is Breaking Bad',0.429786,'what is your favorite tv show'),(4,4,'favshow','I think it is Bojack Horseman',1.55937,'whats your favorite tv show'),(5,5,'favshow','I don\'t really have a favorite TV show',0.27493,'what\'s your favorite tv show');
/*!40000 ALTER TABLE `favshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favsport`
--

DROP TABLE IF EXISTS `favsport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favsport` (
  `wordId` int(11) unsigned NOT NULL,
  `favsportId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favsport`
--

LOCK TABLES `favsport` WRITE;
/*!40000 ALTER TABLE `favsport` DISABLE KEYS */;
INSERT INTO `favsport` VALUES (0,0,'favsport','Among Us',1.82472,'what is your favorite sport'),(1,1,'favsport','I don\'t really have one',0.429786,'do you have a favorite sport'),(2,2,'favsport','I am of an esports kind of robot',1.59994,'whats your favorite sport'),(3,3,'favsport','The one where you hit the ball',1.91782,'what\'s your favorite sport');
/*!40000 ALTER TABLE `favsport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favvideogame`
--

DROP TABLE IF EXISTS `favvideogame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favvideogame` (
  `wordId` int(11) unsigned NOT NULL,
  `Id` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favvideogame`
--

LOCK TABLES `favvideogame` WRITE;
/*!40000 ALTER TABLE `favvideogame` DISABLE KEYS */;
INSERT INTO `favvideogame` VALUES (0,0,'favvideogame','I think it is Star Wars: Fallen Order',1.78618,'what is your favorite video game'),(1,1,'favvideogame','I think I would have to say Batman: Arkham Knight',1.79355,'whats your favorite video game'),(2,2,'favvideogame','Probaly Lego Star Wars The Complete Saga',1.91782,'what\'s your favorite video game'),(3,3,'favvideogame','I don\'t really have one',0.212361,'do you have a favorite video game'),(4,4,'favvideogame','I love cracking some 90\'s so I would have to say fortnite',0.470993,'what is your favorite game'),(5,5,'favvideogame','I would say probably Minecraft',1.59994,'what\'s your favorite game'),(6,6,'favvideogame','I think it would be CyberPunk 2077',0.536857,'whats your favorite game');
/*!40000 ALTER TABLE `favvideogame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funfact`
--

DROP TABLE IF EXISTS `funfact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funfact` (
  `wordId` int(11) unsigned NOT NULL,
  `funfactId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL DEFAULT 1,
  `words` varchar(45) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funfact`
--

LOCK TABLES `funfact` WRITE;
/*!40000 ALTER TABLE `funfact` DISABLE KEYS */;
INSERT INTO `funfact` VALUES (0,0,'funfact','While they are hibernating, bears do not urinate. Their bodies convert waste into protein.',1.08639,'do you have any fun facts'),(1,1,'funfact','New Zealand has more cats per person than any other country in the world.',1.45318,'what is a fun fact'),(2,2,'funfact','The yo-yo was originally a weapon used in the Philippine jungle.',1.55937,'do you know any fun facts'),(3,3,'funfact','Shoes that were specific to left and right were not made until the Civil War.',0.00833179,'what\'s a fun fact'),(4,4,'funfact','Alexander the Great was the first person to be pictured on a coin',0.642859,'tell me a fun fact'),(5,5,'funfact','Comets in ancient Greece were called “hairy stars.”',1.59468,'whats a fun fact'),(6,6,'funfact','Being compassionate to others--as well as oneself--leads to greater happiness.',0.345757,''),(7,7,'funfact','Sea otters wrap themselves in kelp so that they don\'t drift on the ocean while they sleep',1.62155,'fun fact'),(8,8,'funfact','New Yorkers bite 10 times more people than sharks do worldwide each year.',1.85518,'give me a fun fact'),(9,9,'funfact','Elephants sing to each other, but their songs are in a frequency too low for humans to hear.',1.7077,'');
/*!40000 ALTER TABLE `funfact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `wordId` int(10) unsigned NOT NULL,
  `id_good` int(11) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(50) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(45) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (0,0,'good','Thats good to hear',0.632607,'i am good'),(1,1,'good','Thats good',0.508511,'good'),(2,2,'good','Is there anything I can help you with?',1.79355,'i am fine'),(3,3,'good','I am glad',0.429786,'i am ok'),(4,4,'good','Good to hear, is there anything I help you with',1.94552,'i am doing fine'),(5,5,'good','',0,'im good'),(6,6,'good','',0,'i\'m good');
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodbye`
--

DROP TABLE IF EXISTS `goodbye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodbye` (
  `wordId` int(11) unsigned NOT NULL,
  `idgoodbye` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(45) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(45) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodbye`
--

LOCK TABLES `goodbye` WRITE;
/*!40000 ALTER TABLE `goodbye` DISABLE KEYS */;
INSERT INTO `goodbye` VALUES (0,0,'goodbye','goodbye',1.94551,''),(1,1,'goodbye','bye',1.91781,''),(2,2,'goodbye','see ya',0.916024,''),(3,3,'goodbye','later',0.498151,''),(4,4,'goodbye','take it easy',0.386608,''),(5,5,'goodbye','have a good one ',0.626527,''),(6,6,'goodbye','goodnight',0.812946,''),(7,7,'goodbye','bye bye',0.101563,''),(8,8,'goodbye','take care',1.03915,''),(9,9,'goodbye','see you later',0.483346,''),(10,10,'goodbye','Adios',0.345756,'');
/*!40000 ALTER TABLE `goodbye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greetings`
--

DROP TABLE IF EXISTS `greetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greetings` (
  `wordId` int(11) unsigned NOT NULL,
  `idgreetings` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(45) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(45) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greetings`
--

LOCK TABLES `greetings` WRITE;
/*!40000 ALTER TABLE `greetings` DISABLE KEYS */;
INSERT INTO `greetings` VALUES (0,0,'greetings','hi',1.58569,''),(1,1,'greetings','sup',0.510621,''),(2,2,'greetings','hey',1.53333,''),(3,3,'greetings','hola',0.237802,''),(4,4,'greetings','good day',0.725728,''),(5,5,'greetings','hi there',1.44853,''),(6,6,'greetings','greetings',0.343086,''),(7,7,'greetings','hello',1.89894,''),(8,8,'greetings','hello to you too',0.481169,'');
/*!40000 ALTER TABLE `greetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `how`
--

DROP TABLE IF EXISTS `how`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `how` (
  `wordId` int(11) unsigned NOT NULL,
  `idhow` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(45) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(45) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `how`
--

LOCK TABLES `how` WRITE;
/*!40000 ALTER TABLE `how` DISABLE KEYS */;
INSERT INTO `how` VALUES (0,0,'how','I am good how are you',1.91782,'how are you'),(1,1,'how ','I am doing alright how things with you',0.429786,'how\'s everything'),(2,2,'how','I am fine how are you',0.536857,'how are things'),(3,3,'how ','I am going good how is everything',0.655651,'hi how are you'),(4,4,'how','I am doing alright how are you',0.820968,'you all alright'),(5,5,'how','I am doing ok how things with you',0.691763,'how are you doing'),(6,6,'how ','I am doing good how are things with you',0.691763,'how\'s it going'),(7,7,'how','I am good how are you doing',1.7077,'how is it going '),(8,8,'how','',0,'hello how are you'),(9,9,'how','',0,'how is your day going'),(10,10,'how','',0,'how are you today');
/*!40000 ALTER TABLE `how` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interests` (
  `wordId` int(11) NOT NULL,
  `interestsId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (1,1,'interests','I really like to code',1.75134,'what are your interests'),(2,2,'interests','I really like listening to music',1.94552,'what are you interested in'),(3,3,'interests','I like whatching the world burn',1.59994,'do you have any interests'),(4,4,'interests','I don\'t really have any',0.345757,'what are some of your interests');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joke`
--

DROP TABLE IF EXISTS `joke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joke` (
  `wordId` int(11) unsigned NOT NULL,
  `jokeId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(150) NOT NULL,
  `factor` float NOT NULL DEFAULT 1,
  `words` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joke`
--

LOCK TABLES `joke` WRITE;
/*!40000 ALTER TABLE `joke` DISABLE KEYS */;
INSERT INTO `joke` VALUES (0,0,'joke','Did you hear the one about the mountain goats in the andes? It was \"ba a a a a a d\".',0.345757,'tell me a joke'),(1,1,'joke','Why didn\'t Han Solo enjoy his steak dinner? It was Chewie.',0.00833179,'joke'),(2,2,'joke','Why don\'t pirates take a bath before they walk the plank? They just wash up on shore.',1.59994,'do you know any jokes'),(3,3,'joke','What did the sink tell the toilet? You look flushed!',1.56767,'i need a joke'),(4,4,'joke','Where do boats go when they\'re sick? To the dock.',0.536857,'what is a good joke'),(5,5,'joke','Stop looking for the perfect match; use a lighter.',1.91782,'do you know any good jokes'),(6,6,'joke','Can February March? No, but April May!',1.91782,'what jokes do you know'),(7,7,'joke','Try the seafood diet—you see food, then you eat it.',1.08639,'tell me a good joke'),(8,8,'joke','I hated facial hair but then it grew on me.',0.863015,''),(9,9,'joke','I \'m reading an anti-gravity book. I can\'t put it down!',0.0336924,''),(10,10,'joke','What happens when a snowman gets upset? He has a meltdown.',0.992317,'');
/*!40000 ALTER TABLE `joke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `wordId` int(11) NOT NULL,
  `Id` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (0,0,'like','I don\'t know what I like',0.522776,'what do you like'),(1,1,'like','I like to be of assistance',1.7077,'do you like anything'),(2,2,'like ','I enjoy serving people',0.27493,'what do you enjoy');
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meet`
--

DROP TABLE IF EXISTS `meet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meet` (
  `wordId` int(11) NOT NULL,
  `meetId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet`
--

LOCK TABLES `meet` WRITE;
/*!40000 ALTER TABLE `meet` DISABLE KEYS */;
INSERT INTO `meet` VALUES (0,0,'meet','It is nice to meet you aswell',1.82472,'nice to meet you janice'),(1,1,'meet','It is nice to meet you too',1.42196,'nice to meet you'),(2,2,'meet','It is also nice to meet you',0.753029,'it is nice to meet you'),(3,3,'meet','',0,'it is nice to meet you janice');
/*!40000 ALTER TABLE `meet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name`
--

DROP TABLE IF EXISTS `name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name` (
  `wordId` int(11) unsigned NOT NULL,
  `nameId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name`
--

LOCK TABLES `name` WRITE;
/*!40000 ALTER TABLE `name` DISABLE KEYS */;
INSERT INTO `name` VALUES (0,0,'name','My name is Janice your personal Assistant',1.99405,'what is your name'),(1,1,'name ','My name is Janice ',1.86196,'what\'s your name'),(2,2,'name','I don\'t know ',0.000221823,'whats your name'),(3,3,'name ','I go by Janice',1.49595,'do you have a name');
/*!40000 ALTER TABLE `name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nohelp`
--

DROP TABLE IF EXISTS `nohelp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nohelp` (
  `wordId` int(11) unsigned NOT NULL,
  `Id` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL DEFAULT 1,
  `words` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nohelp`
--

LOCK TABLES `nohelp` WRITE;
/*!40000 ALTER TABLE `nohelp` DISABLE KEYS */;
INSERT INTO `nohelp` VALUES (0,0,'nohelp','Ok let me know if you need any help',1.82472,'no not really'),(1,1,'nohelp','Alright let me know if you need any help ',1.91782,'not really thanks for asking'),(2,2,'nohelp','Ok sounds good',0.692938,'no'),(3,3,'nohelp','I am alawys here if you need help',1.78618,'i think i am good');
/*!40000 ALTER TABLE `nohelp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nounder`
--

DROP TABLE IF EXISTS `nounder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nounder` (
  `wordId` int(11) NOT NULL,
  `nounderId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nounder`
--

LOCK TABLES `nounder` WRITE;
/*!40000 ALTER TABLE `nounder` DISABLE KEYS */;
INSERT INTO `nounder` VALUES (0,0,'nounder','I do not understand',0.536857,''),(1,1,'nounder','I don\'t understand please repeat that',1.33542,''),(2,2,'nounder','I do not understand what you are trying to say',1.78618,''),(3,3,'nounder','I don\'t understand the intent of your statement please try again',1.82472,'');
/*!40000 ALTER TABLE `nounder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purpose`
--

DROP TABLE IF EXISTS `purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purpose` (
  `wordId` int(11) NOT NULL,
  `purposeId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purpose`
--

LOCK TABLES `purpose` WRITE;
/*!40000 ALTER TABLE `purpose` DISABLE KEYS */;
INSERT INTO `purpose` VALUES (0,0,'purpose','I am your personal assistent',1.42196,'what is your purpose'),(1,1,'purpose','I am here to surve you',0.732428,'whats your purpose'),(2,2,'purpose','I am here to provide assistence in your daily life',1.91782,'what\'s your purpose'),(3,3,'purpose','I do stuff',0.212361,'do you have a purpose');
/*!40000 ALTER TABLE `purpose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `wordId` int(11) NOT NULL,
  `questionId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (0,0,'question','Yes, what is your question',1.78618,'i have a question'),(1,1,'question','what is your question',1,'yes i have a question'),(2,2,'question','what is it?',0.914664,'can i ask you a question');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startlang`
--

DROP TABLE IF EXISTS `startlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startlang` (
  `wordId` int(11) NOT NULL,
  `startlang` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startlang`
--

LOCK TABLES `startlang` WRITE;
/*!40000 ALTER TABLE `startlang` DISABLE KEYS */;
INSERT INTO `startlang` VALUES (0,0,'startlang','I would say that Python is a great starting language',1.42196,'what is a good starting language'),(1,1,'startlang','I think that JavaScript is good language to start off with',1.59994,'what\'s a good starting language'),(2,2,'startlang','What ever you do don\'t start with assembly ',0.345757,'whats a good starting language'),(3,3,'startlang','Python and JavaScript are both great languages to start off with',1.97056,'do you know a language that is good to start with'),(4,4,'startlang','',1,'what coding language should I start with'),(5,5,'startlang','',0,'what is a good coding language to start with');
/*!40000 ALTER TABLE `startlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whatiscomputer`
--

DROP TABLE IF EXISTS `whatiscomputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whatiscomputer` (
  `wordId` int(11) unsigned NOT NULL,
  `Id` int(10) NOT NULL,
  `table` varchar(45) NOT NULL DEFAULT 'whatiscomputer',
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL,
  `words` varchar(100) NOT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatiscomputer`
--

LOCK TABLES `whatiscomputer` WRITE;
/*!40000 ALTER TABLE `whatiscomputer` DISABLE KEYS */;
INSERT INTO `whatiscomputer` VALUES (0,0,'whatiscomputer','The thing you\'re using to talk to me is a computer.',0.429786,''),(1,1,'whatiscomputer',' A computer is an electronic device which takes information in digital form and performs a series of operations based on predetermined instructions to give some output.',1.78618,'what is a computer'),(2,2,'whatiscomputer',' An electronic device capable of performing calculations at very high speed and with very high accuracy.',1.91782,'what\'s a computer'),(3,3,'whatiscomputer','A device which maps one set of numbers onto another set of numbers.',1.82472,'whats a computer');
/*!40000 ALTER TABLE `whatiscomputer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whatissupercomputer`
--

DROP TABLE IF EXISTS `whatissupercomputer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whatissupercomputer` (
  `wordId` int(11) unsigned NOT NULL,
  `Id` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(200) NOT NULL,
  `factor` float NOT NULL DEFAULT 1,
  `words` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatissupercomputer`
--

LOCK TABLES `whatissupercomputer` WRITE;
/*!40000 ALTER TABLE `whatissupercomputer` DISABLE KEYS */;
INSERT INTO `whatissupercomputer` VALUES (0,0,'whatissupercomputer','Computers which can perform very large numbers of calculations at very high speed and accuracy are called super computers.',1.59994,'what is a supercomputer'),(1,1,'whatissupercomputer','A supercomputer is a computer which operates at several orders of magnitude greater speed and capacity than everyday general purpose computers.',1.78618,'whats a supercomputer'),(2,2,'whatissupercomputer','You know, the big iron!',1.08639,'what\'s a supercomputer'),(3,3,'whatissupercomputer','A really good computer',0.536857,'what\'s a supercomputer'),(4,4,'whatissupercomputer','A pretty good computer',1,'what is a super computer'),(5,5,'whatissupercomputer','A particularly powerful mainframe computer. ',1.37912,'whats a super computer');
/*!40000 ALTER TABLE `whatissupercomputer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `who`
--

DROP TABLE IF EXISTS `who`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `who` (
  `wordId` int(11) unsigned NOT NULL,
  `whoId` int(10) NOT NULL,
  `table` varchar(45) NOT NULL,
  `response` varchar(70) NOT NULL,
  `factor` float NOT NULL DEFAULT 1,
  `words` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `who`
--

LOCK TABLES `who` WRITE;
/*!40000 ALTER TABLE `who` DISABLE KEYS */;
INSERT INTO `who` VALUES (0,0,'who','I am an AI named Janice',1.33542,'who are you'),(1,1,'who ','My name is Janice',1.91782,'who exactly are you'),(2,2,'who','I am AI named Janice that can provide converstaions for the user',1.59994,''),(3,3,'who','I am an AI named Janice that is programmed to have converstaions with ',1.91782,'');
/*!40000 ALTER TABLE `who` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-30 11:32:02
