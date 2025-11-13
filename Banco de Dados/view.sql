-- ==================
-- ===== VIEW 1 =====
-- ==================

CREATE VIEW vw_disciplinas_matriculas AS
SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS qtd_alunos
FROM disciplinas d
LEFT JOIN matriculas m ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome;

-- ==================
-- ===== VIEW 2 =====
-- ==================


CREATE VIEW vw_alunos_medias AS
SELECT a.nome AS aluno, n.N1, n.N2, n.N3, n.media
FROM aluno a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN notas n ON m.id_matricula = n.id_matricula;
