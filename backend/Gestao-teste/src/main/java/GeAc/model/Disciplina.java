@Entity @Table(name="disciplinas")
public class Disciplina {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer idDisciplina;
  private String nome;
  private Integer cargaHoraria;
  @ManyToOne @JoinColumn(name="id_professor")
  private Professor professor;
  // getters/setters
}
