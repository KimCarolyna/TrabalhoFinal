CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);
