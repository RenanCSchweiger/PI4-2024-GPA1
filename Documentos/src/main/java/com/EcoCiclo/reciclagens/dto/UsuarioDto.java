package com.EcoCiclo.reciclagens.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UsuarioDto {
    private Long id;

    private String nome;

    private String email;
    private String telefone;
    private Boolean isAdmin;
}
