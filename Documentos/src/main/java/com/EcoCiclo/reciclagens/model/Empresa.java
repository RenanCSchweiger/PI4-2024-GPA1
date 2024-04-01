package com.EcoCiclo.reciclagens.model;

import com.EcoCiclo.reciclagens.model.enums.TipoEmpresaEnum;
import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Empresa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    private String cnpj;

    @Enumerated(EnumType.STRING)
    private TipoEmpresaEnum tipo;
    @Lob
    private byte[] logo;
    private String email;
    private String telefone;
    private String endereco;

    private String pix;

    private String descricao;

    private String siteEmpresa;


}
