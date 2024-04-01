package com.EcoCiclo.reciclagens.model;

import javax.persistence.*;

@Entity
public class MaterialReciclavel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String tipoMaterial;

    private String descricao;

    private Double valorUnitario;

}
