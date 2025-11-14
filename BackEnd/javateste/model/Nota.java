package com.trabalhofinal.model;

import jakarta.persistence.*;

@Entity
@Table(name = "notas")
public class Nota {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_nota")
    private Integer idNota;

    @ManyToOne
    @JoinColumn(name = "id_matricula")
    private Matricula matricula;

    private Double n1;
    private Double n2;
    private Double n3;

    // Getters e Setters
}
