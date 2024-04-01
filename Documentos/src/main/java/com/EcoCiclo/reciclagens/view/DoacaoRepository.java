package com.EcoCiclo.reciclagens.view;

import com.EcoCiclo.reciclagens.model.Doacao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DoacaoRepository extends JpaRepository<Doacao, Long> {
    List<Doacao> findByDoadorId(Long idUsuario);
}
