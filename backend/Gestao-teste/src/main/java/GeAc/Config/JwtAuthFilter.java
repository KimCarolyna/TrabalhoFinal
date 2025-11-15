public class JwtAuthFilter extends OncePerRequestFilter {
  @Autowired private JwtService jwtService;
  @Autowired private UsuarioRepo usuarioRepo;

  @Override
  protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
      throws ServletException, IOException {
    String header = req.getHeader("Authorization");
    if (header != null && header.startsWith("Bearer ")) {
      String token = header.substring(7);
      try {
        var claims = jwtService.parse(token).getBody();
        String username = claims.getSubject();
        String role = (String) claims.get("role");
        var userOpt = usuarioRepo.findByUsernameAndAtivoTrue(username);
        if (userOpt.isPresent()) {
          var auth = new UsernamePasswordAuthenticationToken(username, null,
              List.of(new SimpleGrantedAuthority("ROLE_" + role)));
          SecurityContextHolder.getContext().setAuthentication(auth);
        }
      } catch (Exception ignored) {}
    }
    chain.doFilter(req, res);
  }
}
