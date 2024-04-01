package com.EcoCiclo.reciclagens.controller;

import com.EcoCiclo.reciclagens.dto.DoacaoDto;
import com.EcoCiclo.reciclagens.dto.UsuarioCadastroDto;
import com.EcoCiclo.reciclagens.dto.UsuarioDto;
import com.EcoCiclo.reciclagens.dto.UsuarioLoginDto;
import com.EcoCiclo.reciclagens.model.Doacao;
import com.EcoCiclo.reciclagens.service.UsuarioService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "usuario")
public class UsuarioController {
    private final UsuarioService usuarioService;
    @PostMapping("/login")
    public ResponseEntity<UsuarioDto> logar(@RequestBody UsuarioLoginDto usuarioLogin) throws NoSuchFieldException {
        return usuarioService.login(usuarioLogin);
    }
    @PostMapping("/cadastro")
    public ResponseEntity<?> logar(@RequestBody UsuarioCadastroDto usuarioLogin)  {
        return usuarioService.cadastro(usuarioLogin);
    }

    @GetMapping("/doacoes")
    public List<Doacao> logar(@RequestParam Long idUsuario) {
        return usuarioService.doacoesUsuario(idUsuario);
    }

    @PostMapping("/doacao/eco")
    public void doarEco(@RequestBody DoacaoDto doacaoDto) {
        usuarioService.doar(doacaoDto, true);
    }

    @PostMapping("/doacao")
    public void doar(@RequestBody DoacaoDto doacaoDto) {
        usuarioService.doar(doacaoDto);
    }
}
