@Entity @Table(name="usuarios")
public class Usuario {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer idUsuario;
  private String username;
  private String senhaHash;
  private String nomeCompleto;
  private String email;
  private Boolean ativo;
  @Enumerated(EnumType.STRING)
  private TipoUsuario tipo; // ADMIN, PROFESSOR, ALUNO
  private java.time.LocalDateTime criadoEm;

}

public enum TipoUsuario { ADMIN, PROFESSOR, ALUNO }