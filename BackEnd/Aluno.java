@Entity
@Table(name = "aluno")
public class Aluno {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_aluno;

    private String nome;
    private String cpf;
    private string email;
    private String telefone;
    private String enereco;
    private String dataNacimento;
}
