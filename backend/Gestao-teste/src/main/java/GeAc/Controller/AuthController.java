@RestController
@RequestMapping("/auth")
public class AuthController {
  @Autowired private UsuarioRepo usuarioRepo;
  @Autowired private JwtService jwtService;

  public static record LoginRequest(String username, String password) {}
  public static record LoginResponse(String token, String role, String nomeCompleto) {}

  @PostMapping("/login")
  public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest req) {
    var user = usuarioRepo.findByUsernameAndAtivoTrue(req.username())
                 .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Usuário não encontrado/ativo"));
    if (!Objects.equals(user.getSenhaHash(), req.password())) {
      throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Senha inválida");
    }
    String token = jwtService.generateToken(user.getUsername(), user.getTipo().name());
    return ResponseEntity.ok(new LoginResponse(token, user.getTipo().name(), user.getNomeCompleto()));
  }
}
