CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('ALUNO','PROFESSOR','ADMINISTRADOR') NOT NULL,
  `id_aluno` int DEFAULT NULL,
  `id_professor` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `login` (`login`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `usuario` VALUES (1,'ramon.dino@aluno.com','senha_hash','ALUNO',1,NULL),(2,'felipe.hipolito@aluno.com','senha_hash','ALUNO',2,NULL),(3,'carolina.duarte@aluno.com','senha_hash','ALUNO',3,NULL),(4,'anna.julia@aluno.com','senha_hash','ALUNO',4,NULL),(5,'erick.andrade@aluno.com','senha_hash','ALUNO',5,NULL),(6,'camily.braga@aluno.com','senha_hash','ALUNO',6,NULL),(7,'giorgian.arrascaeta@aluno.com','senha_hash','ALUNO',7,NULL),(8,'cristiano.ronaldo@aluno.com','senha_hash','ALUNO',8,NULL),(9,'steve.jobs@aluno.com','senha_hash','ALUNO',9,NULL),(10,'arthur.morgan@aluno.com','senha_hash','ALUNO',10,NULL),(11,'walter.white@aluno.com','senha_hash','ALUNO',11,NULL),(12,'sheldon.cooper@aluno.com','senha_hash','ALUNO',12,NULL),(13,'peter.parker@aluno.com','senha_hash','ALUNO',13,NULL),(14,'bruce.wayne@aluno.com','senha_hash','ALUNO',14,NULL),(15,'saul.goodman@aluno.com','senha_hash','ALUNO',15,NULL),(16,'tony.stark@aluno.com','senha_hash','ALUNO',16,NULL),(17,'sherlock.holmes@aluno.com','senha_hash','ALUNO',17,NULL),(18,'rick.sanchez@aluno.com','senha_hash','ALUNO',18,NULL),(19,'morty.smith@aluno.com','senha_hash','ALUNO',19,NULL),(20,'reidopop@aluno.com','senha_hash','ALUNO',20,NULL),(21,'andre.ferreira@aluno.com','senha_hash','ALUNO',21,NULL),(22,'samuel.novais@univ.com','senha_hash','PROFESSOR',NULL,1),(23,'laura.mendes@univ.com','senha_hash','PROFESSOR',NULL,2),(24,'carlos.lima@univ.com','senha_hash','PROFESSOR',NULL,3),(25,'marina.torres@univ.com','senha_hash','PROFESSOR',NULL,4),(26,'rodrigo.silva@univ.com','senha_hash','PROFESSOR',NULL,5),(27,'paula.martins@univ.com','senha_hash','PROFESSOR',NULL,6),(28,'ricardo.costa@univ.com','senha_hash','PROFESSOR',NULL,7),(29,'juliana.rocha@univ.com','senha_hash','PROFESSOR',NULL,8),(30,'fernando.pires@univ.com','senha_hash','PROFESSOR',NULL,9),(31,'amanda.duarte@univ.com','senha_hash','PROFESSOR',NULL,10),(32,'sergio.ribeiro@univ.com','senha_hash','PROFESSOR',NULL,11),(33,'beatriz.souza@univ.com','senha_hash','PROFESSOR',NULL,12),(34,'tiago.fernandes@univ.com','senha_hash','PROFESSOR',NULL,13),(35,'luciana.castro@univ.com','senha_hash','PROFESSOR',NULL,14),(36,'gabriel.monteiro@univ.com','senha_hash','PROFESSOR',NULL,15);
