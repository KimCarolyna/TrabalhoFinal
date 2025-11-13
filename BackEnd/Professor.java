@Entity
@Table(name = "usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_usuario;

    private String username;
    private String senhaHash;
    private String nomeCompleto;
    private String email;
    private Boolean ativo;
    private String tipo;
}
