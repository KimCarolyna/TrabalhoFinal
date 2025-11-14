package com.trabalhofinal.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
    private Integer idUsuario;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(name = "senha_hash", nullable = false)
    private String senhaHash;

    @Column(name = "nome_completo")
    private String nomeCompleto;

    private String email;

    private Boolean ativo;

    @Enumerated(EnumType.STRING)
    private TipoUsuario tipo;

    @Column(name = "criado_em")
    private LocalDateTime criadoEm;

    public enum TipoUsuario {
        ADMIN, PROFESSOR, ALUNO
    }

    // Getters e Setters
}
