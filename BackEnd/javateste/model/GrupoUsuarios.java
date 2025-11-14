package com.trabalhofinal.model;

import jakarta.persistence.*;

@Entity
@Table(name = "grupos_usuarios")
public class GrupoUsuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_grupo")
    private Integer idGrupo;

    @Column(name = "nome_grupo", nullable = false, unique = true)
    private String nomeGrupo;

    private String descricao;

    // Getters e Setters
}
