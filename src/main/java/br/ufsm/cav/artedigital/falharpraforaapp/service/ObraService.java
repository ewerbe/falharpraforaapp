package br.ufsm.cav.artedigital.falharpraforaapp.service;

import br.ufsm.cav.artedigital.falharpraforaapp.model.Obra;
import br.ufsm.cav.artedigital.falharpraforaapp.repository.ObraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ObraService {

    @Autowired
    private ObraRepository obraRepository;

    private Obra showObra() {
        Obra newObra = getNewObra();
        return newObra;
    }

    private Obra getNewObra() {
        Obra newObra = null;
        //TODO: desenvolver lógica para gerar um id de obra válido e então buscar/retornar obra.
        return newObra;
    }

    private Long countObras() {
        return obraRepository.count();
    }

    public Obra find(Long idObra) {
        return obraRepository.findById(idObra).orElse(null);
    }

    public void save(Obra obra) {
        obraRepository.save(obra);
    }

    public List<Obra> findAll() {
        return obraRepository.findAll();
    }

    public void delete(Long idObra) {
        obraRepository.deleteById(idObra);
    }
}
