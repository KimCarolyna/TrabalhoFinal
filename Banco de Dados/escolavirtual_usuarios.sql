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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `nome_completo` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `tipo` enum('ADMIN','PROFESSOR','ALUNO') NOT NULL,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'anna','Admanna1@','Anna Julia Correa','anna@escolavirtual.com',1,'ADMIN','2025-11-06 20:21:02'),(2,'felipe','Admfelipe1@','Felipe Campos','felipe@escolavirtual.com',1,'ADMIN','2025-11-06 20:21:02'),(3,'camilly','Admcamilly1@','Camilly Reis','camilly@escolavirtual.com',1,'ADMIN','2025-11-06 20:21:02'),(4,'carolina','Admcarolina1@','Carolina Duarte','carolina@escolavirtual.com',1,'ADMIN','2025-11-06 20:21:02'),(5,'linus','profLinus123','Linus Torvalds','linus@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(6,'grace','profGrace123','Grace Hopper','grace@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(7,'ada','profAda123','Ada Lovelace','ada@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(8,'james','profJames123','James Gosling','james@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(9,'guido','profGuido123','Guido van Rossum','guido@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(10,'dennis','profDennis123','Dennis Ritchie','dennis@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(11,'barbara','profBarbara123','Barbara Liskov','barbara@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(12,'bjarne','profBjarne123','Bjarne Stroustrup','bjarne@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(13,'tim','profTim123','Tim Berners-Lee','tim@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(14,'ken','profKen123','Ken Thompson','ken@escolavirtual.com',1,'PROFESSOR','2025-11-06 20:21:13'),(15,'alunoana','alunoAna123','Ana Costa','ana@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(16,'alunomateus','alunoMateus123','Mateus Oliveira','mateus@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(17,'alunolucas','alunoLucas123','Lucas Pereira','lucas@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(18,'alunobeatriz','alunoBeatriz123','Beatriz Lima','beatriz@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(19,'alunogabriel','alunoGabriel123','Gabriel Santos','gabriel@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(20,'alunojulia','alunoJulia123','Julia Mendes','julia@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(21,'alunorafael','alunoRafael123','Rafael Alves','rafael@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(22,'alunopaula','alunoPaula123','Paula Silva','paula@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(23,'alunopedro','alunoPedro123','Pedro Gomes','pedro@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(24,'alunocarla','alunoCarla123','Carla Souza','carla@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(25,'alunomarcos','alunoMarcos123','Marcos Ferreira','marcos@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(26,'alunorenata','alunoRenata123','Renata Castro','renata@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(27,'alunotiago','alunoTiago123','Tiago Cunha','tiago@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(28,'alunobruna','alunoBruna123','Bruna Rocha','bruna@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(29,'alunofelipe','alunoFelipe123','Felipe Campos','felipe@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(30,'alunolara','alunoLara123','Lara Martins','lara@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(31,'alunodaniel','alunoDaniel123','Daniel Pinto','daniel@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(32,'alunovanessa','alunoVanessa123','Vanessa Costa','vanessa@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(33,'alunorodrigo','alunoRodrigo123','Rodrigo Nunes','rodrigo@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(34,'alunolivia','alunoLivia123','Livia Duarte','livia@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(35,'alunocaio','alunoCaio123','Caio Ribeiro','caio@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(36,'alunomaria','alunoMaria123','Maria Figueiredo','maria@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(37,'alunocarlos','alunoCarlos123','Carlos Nogueira','carlos@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(38,'alunokarina','alunoKarina123','Karina Lopes','karina@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(39,'alunofrancisco','alunoFrancisco123','Francisco Teixeira','francisco@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(40,'alunorafaela','alunoRafaela123','Rafaela Azevedo','rafaela@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(41,'alunoluana','alunoLuana123','Luana Pires','luana@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(42,'alunogustavo','alunoGustavo123','Gustavo Andrade','gustavo@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(43,'alunojose','alunoJose123','José Almeida','jose@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41'),(44,'alunocamila','alunoCamila123','Camila Ramos','camila@escolavirtual.com',1,'ALUNO','2025-11-06 20:22:41');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
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
