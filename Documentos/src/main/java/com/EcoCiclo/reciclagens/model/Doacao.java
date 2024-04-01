package com.EcoCiclo.reciclagens.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
public class Doacao {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario doador; 

    @ManyToOne
    private Empresa ong;

    @ManyToOne
    private MaterialReciclavel materialReciclavel;

    private Double quantidadeDoado;

    private String mensagem;
    private LocalDateTime dataDoacao;
}
