@Entity @Table(name="matriculas")
public class Matricula {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer idMatricula;
  @ManyToOne @JoinColumn(name="id_aluno")
  private Aluno aluno;
  @ManyToOne @JoinColumn(name="id_disciplina")
  private Disciplina disciplina;
  private java.time.LocalDate dataMatricula;
  private java.math.BigDecimal mediaFinal;
  // getters/setters
}
