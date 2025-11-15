@RestController
@RequestMapping("/professor")
public class ProfessorController {
  @Autowired private UsuarioRepo usuarioRepo;
  @Autowired private ProfessorRepo professorRepo;
  @Autowired private DisciplinaRepo disciplinaRepo;
  @Autowired private MatriculaRepo matriculaRepo;
  @Autowired private NotaRepo notaRepo;

  public static record AlunoNotaDTO(Integer idMatricula, String aluno, BigDecimal n1, BigDecimal n2, BigDecimal n3, BigDecimal media) {}
  public static record LancaNotaRequest(BigDecimal n1, BigDecimal n2, BigDecimal n3) {}

  @GetMapping("/disciplinas")
  public List<String> minhasDisciplinas(Authentication auth) {
    var prof = getProfessorAutenticado(auth);
    return disciplinaRepo.findByProfessor_IdProfessor(prof.getIdProfessor())
                         .stream().map(Disciplina::getNome).toList();
  }

  @GetMapping("/disciplinas/{idDisciplina}/alunos")
  public List<AlunoNotaDTO> alunosDaDisciplina(Authentication auth, @PathVariable Integer idDisciplina) {
    var prof = getProfessorAutenticado(auth);
    validarDisciplinaDoProfessor(idDisciplina, prof.getIdProfessor());
    return matriculaRepo.findByDisciplina_IdDisciplina(idDisciplina).stream().map(m -> {
      var nota = notaRepo.findTopByMatricula_IdMatriculaOrderByIdNotaDesc(m.getIdMatricula()).orElse(null);
      BigDecimal media = null;
      if (nota != null) media = calcularMedia(nota.getN1(), nota.getN2(), nota.getN3());
      else media = m.getMediaFinal();
      return new AlunoNotaDTO(m.getIdMatricula(), m.getAluno().getNome(),
          nota!=null?nota.getN1():null, nota!=null?nota.getN2():null, nota!=null?nota.getN3():null, media);
    }).toList();
  }

  @PostMapping("/disciplinas/{idDisciplina}/lancar/{idMatricula}")
  public ResponseEntity<Void> lancarNotas(Authentication auth,
      @PathVariable Integer idDisciplina, @PathVariable Integer idMatricula,
      @RequestBody LancaNotaRequest req) {
    var prof = getProfessorAutenticado(auth);
    validarDisciplinaDoProfessor(idDisciplina, prof.getIdProfessor());

    var matriculas = matriculaRepo.findByDisciplina_IdDisciplina(idDisciplina);
    boolean pertence = matriculas.stream().anyMatch(m -> m.getIdMatricula().equals(idMatricula));
    if (!pertence) throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Matrícula não pertence à disciplina");

    Nota n = new Nota();
    n.setMatricula(matriculas.stream().filter(m -> m.getIdMatricula().equals(idMatricula)).findFirst().get());
    n.setN1(req.n1()); n.setN2(req.n2()); n.setN3(req.n3());
    notaRepo.save(n);

    BigDecimal media = calcularMedia(req.n1(), req.n2(), req.n3());
    var m = n.getMatricula();
    m.setMediaFinal(media);
    matriculaRepo.save(m);

    return ResponseEntity.ok().build();
  }

  private Professor getProfessorAutenticado(Authentication auth) {
    var user = usuarioRepo.findByUsernameAndAtivoTrue(auth.getName())
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED));
    return professorRepo.findByUsuario_IdUsuario(user.getIdUsuario())
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.FORBIDDEN, "Não é professor"));
  }
  private void validarDisciplinaDoProfessor(Integer idDisciplina, Integer idProfessor) {
    var d = disciplinaRepo.findById(idDisciplina)
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Disciplina não encontrada"));
    if (!d.getProfessor().getIdProfessor().equals(idProfessor)) {
      throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Disciplina não pertence ao professor");
    }
  }
  private BigDecimal calcularMedia(BigDecimal n1, BigDecimal n2, BigDecimal n3) {
    BigDecimal s = (n1==null?BigDecimal.ZERO:n1)
        .add(n2==null?BigDecimal.ZERO:n2)
        .add(n3==null?BigDecimal.ZERO:n3);
    return s.divide(BigDecimal.valueOf(3), 2, RoundingMode.HALF_UP);
  }
}
