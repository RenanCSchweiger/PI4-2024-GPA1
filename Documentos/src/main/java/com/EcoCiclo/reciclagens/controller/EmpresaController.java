package com.EcoCiclo.reciclagens.controller;

import com.EcoCiclo.reciclagens.dto.EmpresaPropostaDto;
import com.EcoCiclo.reciclagens.model.Empresa;
import com.EcoCiclo.reciclagens.service.EmpresaService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "empresa")
public class EmpresaController {


    private final EmpresaService empresaService;


    @PostMapping(value = "/proposta", consumes = MediaType.ALL_VALUE)
    public void enviarProposta(@ModelAttribute EmpresaPropostaDto empresa,
                               @RequestParam(value = "comprovante", required = false) MultipartFile comprovante ,
                               @RequestParam(value = "logo", required = false) MultipartFile logo) throws NoSuchFieldException, IOException, MessagingException {

        byte[] fotoBytes = null;
        byte[] logoBytes = null;

        if (Objects.nonNull(comprovante)) {
            fotoBytes = comprovante.getBytes();
        }
        if (Objects.nonNull(logo)) {
            logoBytes = logo.getBytes();
        }

        empresaService.enviarPropostaDeCadastro(empresa, fotoBytes, logoBytes);
    }

    @PostMapping(value = "/cadastrar", consumes = MediaType.ALL_VALUE)
    public void cadastrarEmpresa(@RequestBody EmpresaPropostaDto empresa) throws NoSuchFieldException, IOException, MessagingException {
        empresaService.cadastrarEmpresa(empresa);
    }

    @GetMapping(value = "/all")
    public ResponseEntity<List<Empresa>> buscarEmpresas() {

        return ResponseEntity.ok(empresaService.buscarEmpresas());
    }
    @GetMapping(value = "/buscar")
    public ResponseEntity<List<Empresa>> buscarOng(@RequestParam String filtro) {

        return ResponseEntity.ok(empresaService.filtrarEmpresa(filtro));
    }

    @GetMapping(value = "")
    public ResponseEntity<Empresa> buscarPorId(@RequestParam Long idEmpresa) {

        return ResponseEntity.ok(empresaService.buscarPorId(idEmpresa));
    }

}
