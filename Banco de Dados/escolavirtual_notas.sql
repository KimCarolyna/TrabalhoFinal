CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    N1 DECIMAL(5,2),
    N2 DECIMAL(5,2),
    N3 DECIMAL(5,2),
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);
