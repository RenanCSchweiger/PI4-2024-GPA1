package com.EcoCiclo.reciclagens.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Lob;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DoacaoDto {

    private Long idDoador;

    private Long idOng;

    @Lob
    private byte[] comprovante;
    private String mensagem;

}
