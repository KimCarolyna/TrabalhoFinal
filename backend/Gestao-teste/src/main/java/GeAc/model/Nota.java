@Entity @Table(name="notas")
public class Nota {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer idNota;
  @ManyToOne @JoinColumn(name="id_matricula")
  private Matricula matricula;
  private java.math.BigDecimal n1;
  private java.math.BigDecimal n2;
  private java.math.BigDecimal n3;
  // getters/setters
}
