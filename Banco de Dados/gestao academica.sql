create database gestão_academica;

use gestão_academica;

CREATE TABLE `aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `aluno` VALUES (1,'Ramon Dino','10000000001','1995-02-12','ramon.dino@aluno.com','61990000021','Academia da max'),(2,'Felipe Campos Hipólito','11111111111','2004-09-24','felipe.hipolito@aluno.com','61990000001','Ninho do urubu'),(3,'Carolina Duarte dos Santos','22222222222','2003-04-15','carolina.duarte@aluno.com','61990000002','Av. Central 234'),(4,'Anna Júlia Corrêa Roquete Silva','33333333333','2005-02-10','anna.julia@aluno.com','61990000003','Rua do Sol 333'),(5,'Érick Pereira de Andrade','44444444444','2002-12-02','erick.andrade@aluno.com','61990000004','Rua das Laranjeiras 98'),(6,'CAMILLY REIS BRAGA','44444444445','2000-11-23','camily.braga@aluno.com','61982090909','La na casa dela'),(7,'Giorgian Arrascaeta','55555555555','1994-06-01','giorgian.arrascaeta@aluno.com','61990000005','Rua do Uruguai 10'),(8,'Cristiano Ronaldo','77777777777','1985-02-05','cristiano.ronaldo@aluno.com','61990000006','Avenida de Portugal 7'),(9,'Steve Jobs','66666666666','1955-02-24','steve.jobs@aluno.com','61990000007','Infinite Loop 1'),(10,'Arthur Morgan','88888888888','1899-06-12','arthur.morgan@aluno.com','61990000008','Rancho Valentine, Oeste'),(11,'Walter White','99999999999','1960-09-07','walter.white@aluno.com','61990000009','Rua Albuquerque 101'),(12,'Sheldon Cooper','10101010101','1980-02-26','sheldon.cooper@aluno.com','61990000010','Avenida Pasadena 42'),(13,'Peter Parker','12121212121','2001-08-10','peter.parker@aluno.com','61990000011','Queens Street 12'),(14,'Bruce Wayne','13131313131','1980-04-17','bruce.wayne@aluno.com','61990000012','Mansão Wayne, Gotham'),(15,'Saul Goodman','14141414141','1975-11-12','saul.goodman@aluno.com','61990000013','Av. Albuquerque 505'),(16,'Tony Stark','15151515151','1970-05-29','tony.stark@aluno.com','61990000014','Malibu Point 10880'),(17,'Sherlock Holmes','16161616161','1983-07-12','sherlock.holmes@aluno.com','61990000015','Baker Street 221B'),(18,'Rick Sanchez','17171717171','1965-01-01','rick.sanchez@aluno.com','61990000016','Rua Dimensão C-137'),(19,'Morty Smith','18181818181','2005-03-15','morty.smith@aluno.com','61990000017','Rua Dimensão C-137'),(20,'Michael Jakson','19191919191','2002-11-08','reidopop@aluno.com','61990000018','Rua das Flores 19'),(21,'André Ferreira','21212121212','2000-08-24','andre.ferreira@aluno.com','61990000020','Rua Paraná 75');

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

CREATE TABLE `matricula` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_aluno` int NOT NULL,
  `id_disciplina` int NOT NULL,
  `data_matricula` date NOT NULL,
  `situacao` enum('ATIVA','TRANCADA','CONCLUIDA','CANCELADA') DEFAULT 'ATIVA',
  PRIMARY KEY (`id_matricula`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `matricula` VALUES (1,1,1,'2024-03-01','ATIVA'),(2,1,6,'2024-03-01','ATIVA'),(3,2,2,'2024-03-01','ATIVA'),(4,2,3,'2024-03-01','ATIVA'),(5,2,9,'2024-03-01','ATIVA'),(6,3,4,'2023-08-15','ATIVA'),(7,3,10,'2023-08-15','ATIVA'),(8,4,1,'2024-03-01','ATIVA'),(9,4,7,'2024-03-01','ATIVA'),(10,5,5,'2023-03-01','CONCLUIDA'),(11,5,8,'2023-03-01','ATIVA'),(12,6,1,'2024-03-01','ATIVA'),(13,6,4,'2024-03-01','ATIVA'),(14,7,2,'2023-08-15','ATIVA'),(15,7,3,'2023-08-15','ATIVA'),(16,8,5,'2023-03-01','ATIVA'),(17,8,7,'2023-03-01','ATIVA'),(18,9,1,'2024-03-01','ATIVA'),(19,9,10,'2024-03-01','ATIVA'),(20,10,6,'2024-03-01','ATIVA'),(21,10,8,'2024-03-01','TRANCADA'),(22,11,9,'2023-03-01','ATIVA'),(23,11,3,'2023-03-01','ATIVA'),(24,12,7,'2024-03-01','ATIVA'),(25,12,2,'2024-03-01','ATIVA'),(26,13,10,'2023-08-15','ATIVA'),(27,13,4,'2023-08-15','ATIVA'),(28,14,5,'2023-03-01','CONCLUIDA'),(29,14,6,'2023-03-01','ATIVA'),(30,15,8,'2024-03-01','ATIVA'),(31,15,9,'2024-03-01','ATIVA'),(32,16,1,'2023-03-01','CONCLUIDA'),(33,16,7,'2023-03-01','ATIVA'),(34,17,3,'2024-03-01','ATIVA'),(35,17,5,'2024-03-01','ATIVA'),(36,18,9,'2023-03-01','ATIVA'),(37,18,7,'2023-03-01','ATIVA'),(38,19,10,'2024-03-01','ATIVA'),(39,19,4,'2024-03-01','ATIVA'),(40,20,2,'2023-08-15','ATIVA'),(41,20,8,'2023-08-15','ATIVA'),(42,21,6,'2024-03-01','ATIVA'),(43,21,1,'2024-03-01','ATIVA');

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
INSERT INTO `usuario` (login, senha, perfil, id_aluno, id_professor)  VALUES ('gestor.admin@univ.com', 'senha_hash', 'ADMINISTRADOR', NULL, NULL);



DELIMITER $$

CREATE FUNCTION gerar_uuid_id()
RETURNS VARCHAR(36)
DETERMINISTIC
BEGIN
    RETURN UUID();
END$$

DELIMITER ;

ALTER TABLE usuario DROP FOREIGN KEY usuario_ibfk_1;
ALTER TABLE usuario DROP FOREIGN KEY usuario_ibfk_2;

ALTER TABLE matricula DROP FOREIGN KEY matricula_ibfk_1;
ALTER TABLE matricula DROP FOREIGN KEY matricula_ibfk_2;

ALTER TABLE disciplina DROP FOREIGN KEY disciplina_ibfk_1;

ALTER TABLE professor ADD COLUMN uuid_temp VARCHAR(36);

UPDATE professor SET uuid_temp = gerar_uuid_id();

SET SQL_SAFE_UPDATES = 0;


ALTER TABLE disciplina MODIFY id_professor VARCHAR(36);
ALTER TABLE usuario MODIFY id_professor VARCHAR(36);

UPDATE disciplina d
JOIN professor p ON d.id_professor = p.id_professor
SET d.id_professor = p.uuid_temp;

UPDATE usuario u
JOIN professor p ON u.id_professor = p.id_professor
SET u.id_professor = p.uuid_temp;

ALTER TABLE professor DROP PRIMARY KEY;
ALTER TABLE professor DROP COLUMN id_professor;
ALTER TABLE professor CHANGE COLUMN uuid_temp id_professor VARCHAR(36) NOT NULL PRIMARY KEY;

ALTER TABLE aluno ADD COLUMN uuid_temp VARCHAR(36);

UPDATE aluno SET uuid_temp = gerar_uuid_id();

ALTER TABLE matricula MODIFY id_aluno VARCHAR(36);
ALTER TABLE usuario MODIFY id_aluno VARCHAR(36);

UPDATE matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
SET m.id_aluno = a.uuid_temp;

UPDATE usuario u
JOIN aluno a ON u.id_aluno = a.id_aluno
SET u.id_aluno = a.uuid_temp;

ALTER TABLE aluno DROP PRIMARY KEY;
ALTER TABLE aluno DROP COLUMN id_aluno;
ALTER TABLE aluno CHANGE COLUMN uuid_temp id_aluno VARCHAR(36) NOT NULL PRIMARY KEY;

SET SQL_SAFE_UPDATES = 0;


ALTER TABLE professor ADD PRIMARY KEY (id_professor);
ALTER TABLE aluno ADD PRIMARY KEY (id_aluno);


ALTER TABLE disciplina MODIFY id_professor VARCHAR(36);
ALTER TABLE matricula MODIFY id_aluno VARCHAR(36);
ALTER TABLE matricula MODIFY id_disciplina VARCHAR(36);
ALTER TABLE usuario MODIFY id_professor VARCHAR(36);
ALTER TABLE usuario MODIFY id_aluno VARCHAR(36);


ALTER TABLE disciplina DROP FOREIGN KEY fk_disciplina_professor;
ALTER TABLE matricula DROP FOREIGN KEY fk_matricula_aluno;
ALTER TABLE matricula DROP FOREIGN KEY fk_matricula_disciplina;
ALTER TABLE usuario DROP FOREIGN KEY fk_usuario_aluno;
ALTER TABLE usuario DROP FOREIGN KEY fk_usuario_professor;

ALTER TABLE disciplina 
ADD CONSTRAINT fk_disciplina_professor 
FOREIGN KEY (id_professor) REFERENCES professor(id_professor);

ALTER TABLE matricula 
ADD CONSTRAINT fk_matricula_aluno 
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);

ALTER TABLE matricula 
ADD CONSTRAINT fk_matricula_disciplina 
FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina);

ALTER TABLE usuario 
ADD CONSTRAINT fk_usuario_aluno 
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);

ALTER TABLE usuario 
ADD CONSTRAINT fk_usuario_professor 
FOREIGN KEY (id_professor) REFERENCES professor(id_professor);

select * from aluno;

SHOW CREATE TABLE aluno;
SHOW CREATE TABLE professor;
SHOW CREATE TABLE disciplina;
SHOW CREATE TABLE matricula;
SHOW CREATE TABLE usuario;


INSERT INTO aluno (id_aluno, nome, cpf, email) 
VALUES (gerar_uuid_id(), 'Novo Aluno', '22233344455', 'novo.aluno@exemplo.com');


SELECT d.nome AS disciplina, p.nome AS professor
FROM disciplina d
JOIN professor p ON d.id_professor = p.id_professor;


SELECT a.nome AS aluno, m.situacao, d.nome AS disciplina
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id_disciplina;
