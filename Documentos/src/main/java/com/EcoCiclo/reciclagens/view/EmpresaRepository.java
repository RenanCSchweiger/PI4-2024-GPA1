package com.EcoCiclo.reciclagens.view;

import com.EcoCiclo.reciclagens.model.Empresa;
import com.EcoCiclo.reciclagens.model.enums.TipoEmpresaEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmpresaRepository extends JpaRepository<Empresa, Long> {

    List<Empresa> findByTipo(TipoEmpresaEnum tipo);
}
