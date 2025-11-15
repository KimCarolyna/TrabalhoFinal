public interface UsuarioRepo extends JpaRepository<Usuario, Integer> {
  Optional<Usuario> findByUsernameAndAtivoTrue(String username);
}

public interface ProfessorRepo extends JpaRepository<Professor, Integer> {
  Optional<Professor> findByUsuario_IdUsuario(Integer idUsuario);
}

public interface AlunoRepo extends JpaRepository<Aluno, Integer> {
  Optional<Aluno> findByUsuario_IdUsuario(Integer idUsuario);
}

public interface DisciplinaRepo extends JpaRepository<Disciplina, Integer> {
  List<Disciplina> findByProfessor_IdProfessor(Integer idProfessor);
  Optional<Disciplina> findByNome(String nome);
}

public interface MatriculaRepo extends JpaRepository<Matricula, Integer> {
  List<Matricula> findByAluno_IdAluno(Integer idAluno);
  List<Matricula> findByDisciplina_IdDisciplina(Integer idDisciplina);
}

public interface NotaRepo extends JpaRepository<Nota, Integer> {
  Optional<Nota> findTopByMatricula_IdMatriculaOrderByIdNotaDesc(Integer idMatricula);
}
