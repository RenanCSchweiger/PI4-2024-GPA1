package com.EcoCiclo.reciclagens.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String email;

    private String telefone;
    private String senha;
    private Boolean isAdmin;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "doador")
    private List<Doacao> doacao;
}
