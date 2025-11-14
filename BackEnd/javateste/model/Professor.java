package com.trabalhofinal.model;

import jakarta.persistence.*;

@Entity
@Table(name = "professor")
public class Professor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_professor")
    private Integer idProfessor;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    private String nome;
    private String cpf;
    private String formacao;
    private String areaAtuacao;
    private String email;
    private String telefone;
    private Double remuneracao;

    // Getters e Setters
}
