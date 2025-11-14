package com.trabalhofinal.model;

import jakarta.persistence.*;

@Entity
@Table(name = "disciplinas")
public class Disciplina {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_disciplina")
    private Integer idDisciplina;

    private String nome;

    @Column(name = "carga_horaria")
    private Integer cargaHoraria;

    @ManyToOne
    @JoinColumn(name = "id_professor")
    private Professor professor;

    // Getters e Setters
}
