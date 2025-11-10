
DROP TABLE IF EXISTS `professor`;

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
