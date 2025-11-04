CREATE TABLE `disciplina` (
  `id_disciplina` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int DEFAULT NULL,
  `periodo` varchar(20) DEFAULT NULL,
  `id_professor` int NOT NULL,
  PRIMARY KEY (`id_disciplina`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `disciplina` VALUES (1,'ENG001','Engenharia de Software',80,'3º Semestre',1),(2,'MAT101','Cálculo I',60,'1º Semestre',2),(3,'FIS102','Física Geral',60,'1º Semestre',3),(4,'ELE103','Minecraft',60,'2º Semestre',4),(5,'ADM104','Gestão de Projetos',60,'4º Semestre',5),(6,'CIV105','Mecânica',80,'5º Semestre',6),(7,'COMP106','Inteligência Artificial',80,'6º Semestre',7),(8,'EDU107','Como ligar tomadas',60,'2º Semestre',8),(9,'QUI108','Química Orgânica',60,'1º Semestre',9),(10,'BIO109','Desenvolvimento de Jogos',60,'2º Semestre',10);
