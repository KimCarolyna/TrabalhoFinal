@Service
public class JwtService {
  @Value("${jwt.secret}") private String secret;
  @Value("${jwt.expiration}") private long expiration;

  public String generateToken(String username, String role) {
    Date now = new Date();
    Date exp = new Date(now.getTime() + expiration);
    return Jwts.builder()
      .setSubject(username)
      .claim("role", role)
      .setIssuedAt(now)
      .setExpiration(exp)
      .signWith(Keys.hmacShaKeyFor(secret.getBytes()), SignatureAlgorithm.HS256)
      .compact();
  }

  public Jws<Claims> parse(String token) {
    return Jwts.parserBuilder()
      .setSigningKey(Keys.hmacShaKeyFor(secret.getBytes()))
      .build().parseClaimsJws(token);
  }
}