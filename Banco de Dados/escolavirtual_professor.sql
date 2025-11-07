-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: escolavirtual
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `id_professor` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `formacao` varchar(100) DEFAULT NULL,
  `area_atuacao` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `remuneracao` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_professor`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,5,'Linus Torvalds','11111111115','Mestre em Computação','Tecnologia da Informação','linus@escolavirtual.com','(61)991386311',10178.76),(2,6,'Grace Hopper','11111111116','Mestre em Computação','Tecnologia da Informação','grace@escolavirtual.com','(61)951929068',8110.70),(3,7,'Ada Lovelace','11111111117','Mestre em Computação','Tecnologia da Informação','ada@escolavirtual.com','(61)974175526',10494.44),(4,8,'James Gosling','11111111118','Mestre em Computação','Tecnologia da Informação','james@escolavirtual.com','(61)941973410',9398.17),(5,9,'Guido van Rossum','11111111119','Mestre em Computação','Tecnologia da Informação','guido@escolavirtual.com','(61)939915096',12115.24),(6,10,'Dennis Ritchie','11111111110','Mestre em Computação','Tecnologia da Informação','dennis@escolavirtual.com','(61)920626154',8606.00),(7,11,'Barbara Liskov','11111111111','Mestre em Computação','Tecnologia da Informação','barbara@escolavirtual.com','(61)932661092',12476.76),(8,12,'Bjarne Stroustrup','11111111112','Mestre em Computação','Tecnologia da Informação','bjarne@escolavirtual.com','(61)974925400',12604.54),(9,13,'Tim Berners-Lee','11111111113','Mestre em Computação','Tecnologia da Informação','tim@escolavirtual.com','(61)949632813',10195.48),(10,14,'Ken Thompson','11111111114','Mestre em Computação','Tecnologia da Informação','ken@escolavirtual.com','(61)988694872',8273.24);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 20:56:24
