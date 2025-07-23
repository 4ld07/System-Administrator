-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: Ospedale
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

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
-- Table structure for table `Dottore`
--

DROP TABLE IF EXISTS `Dottore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dottore` (
  `id_dottore` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `specializzazione` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_dottore`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dottore`
--

LOCK TABLES `Dottore` WRITE;
/*!40000 ALTER TABLE `Dottore` DISABLE KEYS */;
INSERT INTO `Dottore` VALUES (1,'Giulia','Rossi','Cardiologia','giulia.rossi@example.com'),(2,'Luca','Verdi','Ortopedia','luca.verdi@example.com'),(3,'Francesca','Bianchi','Pediatria','francesca.bianchi@example.com'),(4,'Marco','Russo','Neurologia','marco.russo@example.com'),(5,'Sara','Gallo','Dermatologia','sara.gallo@example.com');
/*!40000 ALTER TABLE `Dottore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paziente`
--

DROP TABLE IF EXISTS `Paziente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paziente` (
  `id_paziente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `data_nascita` date NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_paziente`),
  UNIQUE KEY `codice_fiscale` (`codice_fiscale`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paziente`
--

LOCK TABLES `Paziente` WRITE;
/*!40000 ALTER TABLE `Paziente` DISABLE KEYS */;
INSERT INTO `Paziente` VALUES (1,'Anna','Conti','1985-02-15','CNTNNA85B55H501T','3331234567'),(2,'Matteo','Ferrari','1990-06-30','FRRMTT90H30H501U','3347654321'),(3,'Elena','Romano','1978-11-10','RMNLNE78S50H501Z','3359876543'),(4,'Davide','Marino','2000-04-22','MRNDVD00D22H501E','3364567890'),(5,'Chiara','De Luca','1995-08-19','DLCCHR95M59H501F','3371122334');
/*!40000 ALTER TABLE `Paziente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reparto`
--

DROP TABLE IF EXISTS `Reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reparto` (
  `id_reparto` int NOT NULL AUTO_INCREMENT,
  `nome_reparto` varchar(255) NOT NULL,
  `piano` int DEFAULT NULL,
  PRIMARY KEY (`id_reparto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reparto`
--

LOCK TABLES `Reparto` WRITE;
/*!40000 ALTER TABLE `Reparto` DISABLE KEYS */;
INSERT INTO `Reparto` VALUES (1,'Cardiologia',1),(2,'Ortopedia',2),(3,'Pediatria',3),(4,'Neurologia',4),(5,'Dermatologia',5);
/*!40000 ALTER TABLE `Reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ricovero`
--

DROP TABLE IF EXISTS `Ricovero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ricovero` (
  `id_ricovero` int NOT NULL AUTO_INCREMENT,
  `id_paziente` int NOT NULL,
  `id_reparto` int NOT NULL,
  `data_ricovero` date NOT NULL,
  `data_dimissione` date DEFAULT NULL,
  `diagnosi` text,
  PRIMARY KEY (`id_ricovero`),
  KEY `id_paziente` (`id_paziente`),
  KEY `id_reparto` (`id_reparto`),
  CONSTRAINT `Ricovero_ibfk_1` FOREIGN KEY (`id_paziente`) REFERENCES `Paziente` (`id_paziente`),
  CONSTRAINT `Ricovero_ibfk_2` FOREIGN KEY (`id_reparto`) REFERENCES `Reparto` (`id_reparto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ricovero`
--

LOCK TABLES `Ricovero` WRITE;
/*!40000 ALTER TABLE `Ricovero` DISABLE KEYS */;
INSERT INTO `Ricovero` VALUES (1,1,1,'2025-06-01','2025-06-10','Infarto miocardico acuto'),(2,2,2,'2025-05-15','2025-05-20','Frattura del femore'),(3,3,3,'2025-07-01',NULL,'Febbre alta e infezione virale'),(4,4,4,'2025-04-05','2025-04-12','Emicrania cronica'),(5,5,5,'2025-03-10','2025-03-15','Eczema atopico');
/*!40000 ALTER TABLE `Ricovero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trattamento`
--

DROP TABLE IF EXISTS `Trattamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trattamento` (
  `id_trattamento` int NOT NULL AUTO_INCREMENT,
  `id_paziente` int NOT NULL,
  `id_dottore` int NOT NULL,
  `descrizione` text,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  PRIMARY KEY (`id_trattamento`),
  KEY `id_paziente` (`id_paziente`),
  KEY `id_dottore` (`id_dottore`),
  CONSTRAINT `Trattamento_ibfk_1` FOREIGN KEY (`id_paziente`) REFERENCES `Paziente` (`id_paziente`),
  CONSTRAINT `Trattamento_ibfk_2` FOREIGN KEY (`id_dottore`) REFERENCES `Dottore` (`id_dottore`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trattamento`
--

LOCK TABLES `Trattamento` WRITE;
/*!40000 ALTER TABLE `Trattamento` DISABLE KEYS */;
INSERT INTO `Trattamento` VALUES (1,1,1,'Terapia farmacologica post-infarto','2025-06-10','2025-07-10'),(2,2,2,'Riabilitazione ortopedica','2025-05-21','2025-06-15'),(3,3,3,'Antibiotici e controllo febbre','2025-07-02',NULL),(4,4,4,'Terapia antinfiammatoria','2025-04-13','2025-05-01'),(5,5,5,'Crema cortisonica e controllo settimanale','2025-03-16','2025-04-01');
/*!40000 ALTER TABLE `Trattamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visita`
--

DROP TABLE IF EXISTS `Visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visita` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `id_paziente` int NOT NULL,
  `id_dottore` int NOT NULL,
  `data_visita` datetime NOT NULL,
  `esito` text,
  `id_reparto` int DEFAULT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `id_paziente` (`id_paziente`),
  KEY `id_dottore` (`id_dottore`),
  KEY `id_reparto` (`id_reparto`),
  CONSTRAINT `Visita_ibfk_1` FOREIGN KEY (`id_paziente`) REFERENCES `Paziente` (`id_paziente`),
  CONSTRAINT `Visita_ibfk_2` FOREIGN KEY (`id_dottore`) REFERENCES `Dottore` (`id_dottore`),
  CONSTRAINT `Visita_ibfk_3` FOREIGN KEY (`id_reparto`) REFERENCES `Reparto` (`id_reparto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visita`
--

LOCK TABLES `Visita` WRITE;
/*!40000 ALTER TABLE `Visita` DISABLE KEYS */;
INSERT INTO `Visita` VALUES (1,1,1,'2025-05-30 10:00:00','Necessario ricovero immediato',1),(2,2,2,'2025-05-14 15:00:00','Frattura confermata con radiografia',2),(3,3,3,'2025-06-30 09:00:00','Monitorare la febbre',3),(4,4,4,'2025-04-04 11:30:00','Esclusa patologia grave',4),(5,5,5,'2025-03-09 14:00:00','Eczema da trattare con pomata',5);
/*!40000 ALTER TABLE `Visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-23  9:27:50
