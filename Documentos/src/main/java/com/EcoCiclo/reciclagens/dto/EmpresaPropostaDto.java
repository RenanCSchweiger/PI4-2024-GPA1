package com.EcoCiclo.reciclagens.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EmpresaPropostaDto {

    private String nome;

    private String cnpj;

    private String tipo;

    private byte[]  logoEmpresa;

    private byte[] comprovanteEmpresa;

    private String email;
    private String telefone;
    private String endereco;

    private String pix;

    private String descricao;
    private String site;

}
