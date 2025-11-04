CREATE TABLE `professor` (
  `id_professor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `formacao` varchar(150) DEFAULT NULL,
  `area_atuacao` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `remuneracao` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_professor`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `professor` VALUES (1,'Samuel Novais','11122233344','Engenharia de Software','Desenvolvimento Web','samuel.novais@univ.com','61988887777',8500.00),(2,'Laura Mendes','22233344455','Matemática','Estatística','laura.mendes@univ.com','61988887711',7000.00),(3,'Carlos Lima','33344455566','Física','Mecânica Clássica','carlos.lima@univ.com','61988887712',7200.00),(4,'Marina Torres','44455566677','Engenharia Elétrica','Circuitos Digitais','marina.torres@univ.com','61988887713',7600.00),(5,'Rodrigo Silva','55566677788','Administração','Gestão de Projetos','rodrigo.silva@univ.com','61988887714',6800.00),(6,'Paula Martins','66677788899','Engenharia Civil','Estruturas','paula.martins@univ.com','61988887715',7400.00),(7,'Ricardo Costa','77788899900','Computação','IA e Machine Learning','ricardo.costa@univ.com','61988887716',9100.00),(8,'Juliana Rocha','88899900011','Educação Física','Treinamento Esportivo','juliana.rocha@univ.com','61988887717',6700.00),(9,'Fernando Pires','99900011122','Química','Química Orgânica','fernando.pires@univ.com','61988887718',7300.00),(10,'Amanda Duarte','00011122233','Biologia','Genética','amanda.duarte@univ.com','61988887719',6900.00),(11,'Sérgio Ribeiro','11133355577','Psicologia','Comportamento Humano','sergio.ribeiro@univ.com','61988887720',7100.00),(12,'Beatriz Souza','22244466688','Design','Design de Interfaces','beatriz.souza@univ.com','61988887721',7700.00),(13,'Tiago Fernandes','33355577799','Sociologia','Teoria Social','tiago.fernandes@univ.com','61988887722',6600.00),(14,'Luciana Castro','44466688800','Filosofia','Ética','luciana.castro@univ.com','61988887723',6900.00),(15,'Gabriel Monteiro','55577799911','Engenharia Mecânica','Termodinâmica','gabriel.monteiro@univ.com','61988887724',8200.00);
