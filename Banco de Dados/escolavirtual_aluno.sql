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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,15,'Ana Costa','22222222215','ana@escolavirtual.com','(61)968507293','Rua Ana Costa nº87'),(2,16,'Mateus Oliveira','22222222216','mateus@escolavirtual.com','(61)953384754','Rua Mateus Oliveira nº151'),(3,17,'Lucas Pereira','22222222217','lucas@escolavirtual.com','(61)937744717','Rua Lucas Pereira nº89'),(4,18,'Beatriz Lima','22222222218','beatriz@escolavirtual.com','(61)956686861','Rua Beatriz Lima nº328'),(5,19,'Gabriel Santos','22222222219','gabriel@escolavirtual.com','(61)917347944','Rua Gabriel Santos nº426'),(6,20,'Julia Mendes','22222222220','julia@escolavirtual.com','(61)989429222','Rua Julia Mendes nº137'),(7,21,'Rafael Alves','22222222221','rafael@escolavirtual.com','(61)913023767','Rua Rafael Alves nº759'),(8,22,'Paula Silva','22222222222','paula@escolavirtual.com','(61)972588592','Rua Paula Silva nº200'),(9,23,'Pedro Gomes','22222222223','pedro@escolavirtual.com','(61)991969383','Rua Pedro Gomes nº955'),(10,24,'Carla Souza','22222222224','carla@escolavirtual.com','(61)914120999','Rua Carla Souza nº362'),(11,25,'Marcos Ferreira','22222222225','marcos@escolavirtual.com','(61)970574554','Rua Marcos Ferreira nº279'),(12,26,'Renata Castro','22222222226','renata@escolavirtual.com','(61)943827575','Rua Renata Castro nº43'),(13,27,'Tiago Cunha','22222222227','tiago@escolavirtual.com','(61)917552970','Rua Tiago Cunha nº293'),(14,28,'Bruna Rocha','22222222228','bruna@escolavirtual.com','(61)929058278','Rua Bruna Rocha nº181'),(15,29,'Felipe Campos','22222222229','felipe@escolavirtual.com','(61)934130580','Rua Felipe Campos nº798'),(16,30,'Lara Martins','22222222230','lara@escolavirtual.com','(61)926956546','Rua Lara Martins nº546'),(17,31,'Daniel Pinto','22222222231','daniel@escolavirtual.com','(61)924999182','Rua Daniel Pinto nº194'),(18,32,'Vanessa Costa','22222222232','vanessa@escolavirtual.com','(61)952375583','Rua Vanessa Costa nº771'),(19,33,'Rodrigo Nunes','22222222233','rodrigo@escolavirtual.com','(61)950143473','Rua Rodrigo Nunes nº915'),(20,34,'Livia Duarte','22222222234','livia@escolavirtual.com','(61)931345775','Rua Livia Duarte nº441'),(21,35,'Caio Ribeiro','22222222235','caio@escolavirtual.com','(61)954278497','Rua Caio Ribeiro nº138'),(22,36,'Maria Figueiredo','22222222236','maria@escolavirtual.com','(61)929179498','Rua Maria Figueiredo nº652'),(23,37,'Carlos Nogueira','22222222237','carlos@escolavirtual.com','(61)965904012','Rua Carlos Nogueira nº150'),(24,38,'Karina Lopes','22222222238','karina@escolavirtual.com','(61)989560790','Rua Karina Lopes nº971'),(25,39,'Francisco Teixeira','22222222239','francisco@escolavirtual.com','(61)928518938','Rua Francisco Teixeira nº115'),(26,40,'Rafaela Azevedo','22222222240','rafaela@escolavirtual.com','(61)995812745','Rua Rafaela Azevedo nº425'),(27,41,'Luana Pires','22222222241','luana@escolavirtual.com','(61)933771758','Rua Luana Pires nº46'),(28,42,'Gustavo Andrade','22222222242','gustavo@escolavirtual.com','(61)949348714','Rua Gustavo Andrade nº49'),(29,43,'José Almeida','22222222243','jose@escolavirtual.com','(61)993679773','Rua José Almeida nº504'),(30,44,'Camila Ramos','22222222244','camila@escolavirtual.com','(61)975777311','Rua Camila Ramos nº143');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
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
