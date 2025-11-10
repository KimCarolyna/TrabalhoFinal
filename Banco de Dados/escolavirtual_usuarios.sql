DROP TABLE IF EXISTS `usuarios`;

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
