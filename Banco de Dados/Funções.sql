CREATE FUNCTION calcular_media(matricula_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(5,2);
    SELECT (N1 + N2 + N3) / 3 INTO media FROM notas WHERE id_matricula = matricula_id;
    RETURN media;
END;




DELIMITER //
CREATE PROCEDURE inserir_nota(
    IN p_id_matricula INT,
    IN p_N1 DECIMAL(5,2),
    IN p_N2 DECIMAL(5,2),
    IN p_N3 DECIMAL(5,2)
)
BEGIN
    INSERT INTO notas (id_matricula, N1, N2, N3, media)
    VALUES (p_id_matricula, p_N1, p_N2, p_N3, (p_N1 + p_N2 + p_N3)/3);
END //
DELIMITER ;




DELIMITER //
CREATE FUNCTION gerar_id_usuario()
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE novo_id VARCHAR(10);
    DECLARE ultimo INT;

    SELECT IFNULL(MAX(id_usuario), 0) + 1 INTO ultimo FROM usuarios;
    SET novo_id = CONCAT('USR', LPAD(ultimo, 4, '0'));
    RETURN novo_id;
END //
DELIMITER ;
