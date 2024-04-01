package com.EcoCiclo.reciclagens.service;

import com.EcoCiclo.reciclagens.dto.DoacaoDto;
import com.EcoCiclo.reciclagens.dto.UsuarioCadastroDto;
import com.EcoCiclo.reciclagens.dto.UsuarioDto;
import com.EcoCiclo.reciclagens.dto.UsuarioLoginDto;
import com.EcoCiclo.reciclagens.model.Doacao;
import com.EcoCiclo.reciclagens.model.Empresa;
import com.EcoCiclo.reciclagens.model.Usuario;
import com.EcoCiclo.reciclagens.model.enums.TipoEmpresaEnum;
import com.EcoCiclo.reciclagens.utils.EmailService;
import com.EcoCiclo.reciclagens.view.DoacaoRepository;
import com.EcoCiclo.reciclagens.view.EmpresaRepository;
import com.EcoCiclo.reciclagens.view.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UsuarioService {
    private final UsuarioRepository usuarioRepository;
    private final DoacaoRepository doacaoRepository;
    private final EmpresaRepository empresaRepository;
    private final EmailService emailService;
    public ResponseEntity<UsuarioDto> login(UsuarioLoginDto usuarioLogin) throws NoSuchFieldException {

        Optional<Usuario> usuarioLogado = usuarioRepository
                .findByEmailAndSenha(usuarioLogin.getEmail(), usuarioLogin.getSenha());

        if (usuarioLogado.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        UsuarioDto usuario = new UsuarioDto();
        usuario.setId(usuarioLogado.get().getId());
        usuario.setNome(usuarioLogado.get().getNome());
        usuario.setEmail(usuarioLogado.get().getEmail());
        usuario.setTelefone(usuarioLogado.get().getTelefone());
        usuario.setIsAdmin(usuarioLogado.get().getIsAdmin());

        return ResponseEntity.status(200).body(usuario);
    }
    public ResponseEntity<?> cadastro(UsuarioCadastroDto usuarioCadastro) {

        Usuario usuario = new Usuario();
        usuario.setNome(usuarioCadastro.getNome());
        usuario.setEmail(usuarioCadastro.getEmail());
        usuario.setSenha(usuarioCadastro.getSenha());
        usuario.setTelefone(usuarioCadastro.getTelefone());

        boolean existsByEmail = usuarioRepository.existsByEmail(usuarioCadastro.getEmail());

        if (existsByEmail){
            return ResponseEntity.status(HttpStatus.CONFLICT).body("O e-mail fornecido já está em uso.");
        }

        usuarioRepository.save(usuario);
        return  ResponseEntity.status(HttpStatus.CREATED).build();
    }

    public List<Doacao> doacoesUsuario(Long idUsuario) {
       return doacaoRepository.findByDoadorId(idUsuario);
    }

    public void doar(DoacaoDto doacao) {

        Optional<Empresa> empresa = empresaRepository.findById(doacao.getIdOng());
        Optional<Usuario> usuario = usuarioRepository.findById(doacao.getIdDoador());
        if (empresa.isEmpty()){
            throw new EntityNotFoundException("Empresa não encontrada");
        }
        if (!empresa.get().getTipo().equals(TipoEmpresaEnum.ong)){
            throw new EntityNotFoundException("So é possivel enviar uma doacao para uma ONG");
        }
        if (usuario.isEmpty()) {
            throw new EntityNotFoundException("Usuario não encontrado");
        }

        Doacao criacaoDoacao = new Doacao();
        criacaoDoacao.setDataDoacao(LocalDateTime.now());
        criacaoDoacao.setOng(empresa.get());
        criacaoDoacao.setDoador(usuario.get());
        criacaoDoacao.setMensagem(doacao.getMensagem());

        emailService.enviarEmail(doacao.getComprovante(), criacaoDoacao, criacaoDoacao.getDoador().getEmail());

        doacaoRepository.save(criacaoDoacao);
    }
    public void doar(DoacaoDto doacao, Boolean isEco) {

        Optional<Usuario> usuario = usuarioRepository.findById(doacao.getIdDoador());

        if (usuario.isEmpty()) {
            throw new EntityNotFoundException("Usuario não encontrado");
        }

        Doacao criacaoDoacao = new Doacao();
        criacaoDoacao.setDataDoacao(LocalDateTime.now());
        criacaoDoacao.setDoador(usuario.get());
        criacaoDoacao.setMensagem(doacao.getMensagem());
        emailService.enviarEmail(doacao.getComprovante(), criacaoDoacao, "ecociclo.br@gmail.com");

        doacaoRepository.save(criacaoDoacao);
    }
}
