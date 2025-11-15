@RestController
@RequestMapping("/aluno")
public class AlunoController {
  @Autowired private UsuarioRepo usuarioRepo;
  @Autowired private AlunoRepo alunoRepo;
  @Autowired private MatriculaRepo matriculaRepo;
  @Autowired private NotaRepo notaRepo;

  public static record AlunoDisciplinaNotasDTO(String disciplina, BigDecimal n1, BigDecimal n2, BigDecimal n3, BigDecimal media) {}
  public static record PerfilAlunoDTO(String nome, List<AlunoDisciplinaNotasDTO> notas) {}

  @GetMapping("/me")
  public PerfilAlunoDTO meuPerfil(Authentication auth) {
    var user = usuarioRepo.findByUsernameAndAtivoTrue(auth.getName())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED));
    var aluno = alunoRepo.findByUsuario_IdUsuario(user.getIdUsuario())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.FORBIDDEN, "Não é aluno"));
    var matriculas = matriculaRepo.findByAluno_IdAluno(aluno.getIdAluno());
    List<AlunoDisciplinaNotasDTO> dados = new ArrayList<>();
    for (var m : matriculas) {
      var nota = notaRepo.findTopByMatricula_IdMatriculaOrderByIdNotaDesc(m.getIdMatricula()).orElse(null);
      BigDecimal media = null;
      if (nota != null) {
        media = calcularMedia(nota.getN1(), nota.getN2(), nota.getN3());
      } else {
        media = m.getMediaFinal();
      }
      dados.add(new AlunoDisciplinaNotasDTO(
        m.getDisciplina().getNome(),
        nota != null ? nota.getN1() : null,
        nota != null ? nota.getN2() : null,
        nota != null ? nota.getN3() : null,
        media
      ));
    }
    return new PerfilAlunoDTO(aluno.getNome(), dados);
  }

  private BigDecimal calcularMedia(BigDecimal n1, BigDecimal n2, BigDecimal n3) {
    BigDecimal s = (n1==null?BigDecimal.ZERO:n1)
        .add(n2==null?BigDecimal.ZERO:n2)
        .add(n3==null?BigDecimal.ZERO:n3);
    return s.divide(BigDecimal.valueOf(3), 2, RoundingMode.HALF_UP);
  }
}
