-- função teste pra calcular a média de notas dos alunos

CREATE FUNCTION calcular_media(matricula_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(5,2);
    SELECT (N1 + N2 + N3) / 3 INTO media FROM notas WHERE id_matricula = matricula_id;
    RETURN media;
END;
