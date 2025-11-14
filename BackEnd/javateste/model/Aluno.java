package com.trabalhofinal.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "aluno")
public class Aluno {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_aluno")
    private Integer idAluno;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    private String nome;

    @Column(name = "data_nascimento")
    private Date dataNascimento;

    private String cpf;
    private String email;
    private String telefone;
    private String endereco;

    // Getters e Setters
}
