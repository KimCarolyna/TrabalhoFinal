-- ===================
-- ==== TRIGGER 1 ====
-- ===================


CREATE TRIGGER valida_data_nascimento
BEFORE INSERT ON aluno
FOR EACH ROW
BEGIN
    DECLARE idade INT;
    
    SET idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE());
    
    IF NEW.data_nascimento > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Data de nascimento não pode ser futura.';
    END IF;
    
    IF idade < 17 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Aluno deve ter pelo menos 17 anos.';
    END IF;
END;


-- ===================
-- ==== TRIGGER 2 ====
-- ===================


CREATE TRIGGER atualizar_media
BEFORE INSERT ON notas
FOR EACH ROW
BEGIN
    SET NEW.media = (NEW.N1 + NEW.N2 + NEW.N3) / 3;
END;
