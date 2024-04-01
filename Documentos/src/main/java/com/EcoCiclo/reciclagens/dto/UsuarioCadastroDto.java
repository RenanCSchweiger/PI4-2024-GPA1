package com.EcoCiclo.reciclagens.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UsuarioCadastroDto {
    @NonNull
    private String nome;

    @NonNull
    private String email;

    private String telefone;

    @NonNull
    private String senha;
}
