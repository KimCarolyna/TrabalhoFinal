@RestController
@RequestMapping("/admin")
public class AdminController {
  @Autowired private UsuarioRepo usuarioRepo;
  @Autowired private AlunoRepo alunoRepo;
  @Autowired private ProfessorRepo professorRepo;
  @Autowired private DisciplinaRepo disciplinaRepo;

  public static record NovoUsuarioDTO(String username, String senha, String nomeCompleto, String email, String tipo) {}
  public static record NovoAlunoDTO(Integer idUsuario, String nome, String cpf, String email, String telefone, String endereco, String dataNascimento) {}
  public static record NovoProfessorDTO(Integer idUsuario, String nome, String cpf, String email, String telefone, String formacao, String areaAtuacao, BigDecimal remuneracao) {}
  public static record NovaDisciplinaDTO(String nome, Integer cargaHoraria, Integer idProfessor) {}

  // Criar usuário
  @PostMapping("/usuarios")
  public ResponseEntity<Integer> criarUsuario(@RequestBody NovoUsuarioDTO dto) {
    if (usuarioRepo.findByUsernameAndAtivoTrue(dto.username()).isPresent()) {
      throw new ResponseStatusException(HttpStatus.CONFLICT, "Username já existe");
    }
    Usuario u = new Usuario();
    u.setUsername(dto.username());
    u.setSenhaHash(dto.senha());
    u.setNomeCompleto(dto.nomeCompleto());
    u.setEmail(dto.email());
    u.setAtivo(true);
    u.setTipo(TipoUsuario.valueOf(dto.tipo()));
    usuarioRepo.save(u);
    return ResponseEntity.ok(u.getIdUsuario());
  }

  // Criar aluno
  @PostMapping("/alunos")
  public ResponseEntity<Integer> criarAluno(@RequestBody NovoAlunoDTO dto) {
    var user = usuarioRepo.findById(dto.idUsuario())
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuário não encontrado"));
    if (user.getTipo() != TipoUsuario.ALUNO) throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuário não é ALUNO");
    Aluno a = new Aluno();
    a.setUsuario(user); a.setNome(dto.nome()); a.setCpf(dto.cpf()); a.setEmail(dto.email());
    a.setTelefone(dto.telefone()); a.setEndereco(dto.endereco());
    a.setDataNascimento(java.time.LocalDate.parse(dto.dataNascimento())); // formato ISO: yyyy-MM-dd
    alunoRepo.save(a);
    return ResponseEntity.ok(a.getIdAluno());
  }

  // Criar professor
  @PostMapping("/professores")
  public ResponseEntity<Integer> criarProfessor(@RequestBody NovoProfessorDTO dto) {
    var user = usuarioRepo.findById(dto.idUsuario())
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuário não encontrado"));
    if (user.getTipo() != TipoUsuario.PROFESSOR) throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuário não é PROFESSOR");
    Professor p = new Professor();
    p.setUsuario(user); p.setNome(dto.nome()); p.setCpf(dto.cpf()); p.setEmail(dto.email());
    p.setTelefone(dto.telefone()); p.setFormacao(dto.formacao()); p.setAreaAtuacao(dto.areaAtuacao());
    p.setRemuneracao(dto.remuneracao());
    professorRepo.save(p);
    return ResponseEntity.ok(p.getIdProfessor());
  }

  // Criar disciplina
  @PostMapping("/disciplinas")
  public ResponseEntity<Integer> criarDisciplina(@RequestBody NovaDisciplinaDTO dto) {
    var p = professorRepo.findById(dto.idProfessor())
        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Professor não encontrado"));
    Disciplina d = new Disciplina();
    d.setNome(dto.nome()); d.setCargaHoraria(dto.cargaHoraria()); d.setProfessor(p);
    disciplinaRepo.save(d);
    return ResponseEntity.ok(d.getIdDisciplina());
  }

  // Listagens livres para ADMIN
  @GetMapping("/dump/usuarios") public List<Usuario> usuarios(){ return usuarioRepo.findAll(); }
  @GetMapping("/dump/alunos") public List<Aluno> alunos(){ return alunoRepo.findAll(); }
  @GetMapping("/dump/professores") public List<Professor> professores(){ return professorRepo.findAll(); }
  @GetMapping("/dump/disciplinas") public List<Disciplina> disciplinas(){ return disciplinaRepo.findAll(); }
}
