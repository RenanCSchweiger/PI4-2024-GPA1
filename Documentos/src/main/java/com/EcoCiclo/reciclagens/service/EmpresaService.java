package com.EcoCiclo.reciclagens.service;

import com.EcoCiclo.reciclagens.dto.EmpresaPropostaDto;
import com.EcoCiclo.reciclagens.model.Empresa;
import com.EcoCiclo.reciclagens.model.enums.TipoEmpresaEnum;
import com.EcoCiclo.reciclagens.utils.EmailService;
import com.EcoCiclo.reciclagens.view.EmpresaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.util.List;
import java.util.Optional;


@RequiredArgsConstructor
@Service
public class EmpresaService {
    private final EmpresaRepository empresaRepository;
    private final EmailService emailService;
    public void enviarPropostaDeCadastro(EmpresaPropostaDto empresa, byte[] fotoBytes, byte[] logoBytes) throws MessagingException {
        emailService.enviarEmailComAnexo(fotoBytes, empresa,logoBytes );
    }

    public void cadastrarEmpresa(EmpresaPropostaDto empresa ){

        Empresa empresa1 = new Empresa();
        empresa1.setCnpj(empresa.getCnpj());
        empresa1.setNome(empresa.getNome());
        empresa1.setTipo(TipoEmpresaEnum.valueOf(empresa.getTipo()));
        empresa1.setLogo(empresa.getLogoEmpresa());
        empresa1.setEmail(empresa.getEmail());
        empresa1.setPix(empresa.getPix());
        empresa1.setEndereco(empresa.getEndereco());
        empresa1.setTelefone(empresa.getTelefone());
        empresa1.setDescricao(empresa.getDescricao());
        empresa1.setSiteEmpresa(empresa.getSite());

        empresaRepository.save(empresa1);
    }

    public List<Empresa> buscarEmpresas() {
        List<Empresa> all = empresaRepository.findAll();
        return all;
    }

    public List<Empresa> filtrarEmpresa(String filtro) {

        List<Empresa> all = empresaRepository.findByTipo(TipoEmpresaEnum.valueOf(filtro));
        return all;
    }
    public Empresa buscarPorId(Long idEmpresa) {

        Optional<Empresa> byId = empresaRepository.findById(idEmpresa);
        return byId.get();
    }

}
