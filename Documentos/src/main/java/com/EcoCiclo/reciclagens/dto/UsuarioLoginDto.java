package com.EcoCiclo.reciclagens.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UsuarioLoginDto {

    private String email;

    private String senha;
}
