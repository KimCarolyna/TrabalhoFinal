@Entity @Table(name="professor")
public class Professor {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer idProfessor;
  @ManyToOne @JoinColumn(name="id_usuario")
  private Usuario usuario;
  private String nome;
  private String cpf;
  private String formacao;
  private String areaAtuacao;
  private String email;
  private String telefone;
  private java.math.BigDecimal remuneracao;
  // getters/setters
}
