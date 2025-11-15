@Entity @Table(name="aluno")
public class Aluno {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer idAluno;
  @ManyToOne @JoinColumn(name="id_usuario")
  private Usuario usuario;
  private String nome;
  private java.time.LocalDate dataNascimento;
  private String cpf;
  private String email;
  private String telefone;
  private String endereco;
  // getters/setters
}
