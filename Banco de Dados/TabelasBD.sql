-- =========================
-- CRIAÇÃO DO BANCO DE DADOS
-- =========================


create database escolavirtual;
use escolavirtual;


-- =============================== 
-- ===TABELA DE ADMINISTRADORES===
-- ===============================


DROP TABLE IF EXISTS `administrador`;

CREATE TABLE `administrador` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `cpf` char(11) NOT NULL,
  `cargo` varchar(100) DEFAULT 'Administrador do Sistema',
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- =============================== 
-- ======= TABELA DE ALUNO =======
-- ===============================


DROP TABLE IF EXISTS `aluno`;

CREATE TABLE `aluno` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- =============================== 
-- ==== TABELA DE DISCIPLINA =====
-- ===============================


DROP TABLE IF EXISTS `disciplinas`;

CREATE TABLE `disciplinas` (
  `id_disciplina` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `carga_horaria` int DEFAULT NULL,
  `id_professor` int DEFAULT NULL,
  PRIMARY KEY (`id_disciplina`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- =============================== 
-- ==== TABELA DE GP_USUÁRIOS ====
-- ===============================


DROP TABLE IF EXISTS `grupos_usuarios`;

CREATE TABLE `grupos_usuarios` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `nome_grupo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  UNIQUE KEY `nome_grupo_unique` (`nome_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- =============================== 
-- ===== TABELA DE MATRÍCULAS ====
-- ===============================


DROP TABLE IF EXISTS `matriculas`;

CREATE TABLE `matriculas` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_aluno` int DEFAULT NULL,
  `id_disciplina` int DEFAULT NULL,
  `data_matricula` date DEFAULT (curdate()),
  PRIMARY KEY (`id_matricula`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- =============================== 
-- ======= TABELA DE NOTAS =======
-- ===============================


DROP TABLE IF EXISTS `notas`;

CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    N1 DECIMAL(5,2),
    N2 DECIMAL(5,2),
    N3 DECIMAL(5,2),
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);


-- =============================== 
-- ===== TABELA DE PROFESSOR =====
-- ===============================


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


-- =============================== 
-- ====== TABELA DE TURMAS =======
-- ===============================


DROP TABLE IF EXISTS `turmas`;

CREATE TABLE `turmas` (
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `id_disciplina` int NOT NULL,
  `id_professor` int NOT NULL,
  `nome_turma` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `id_disciplina` (`id_disciplina`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id_disciplina`),
  CONSTRAINT `turmas_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- =============================== 
-- ===== TABELA DE USUARIOS ======
-- ===============================


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
