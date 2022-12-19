package br.ufsm.cav.artedigital.falharpraforaapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ObraController {

    @GetMapping({"/", "/home"})
    public String getIndex(Model model) {
        //model.addAttribute("isGerente", true);
        return "home";
    }

    @RequestMapping(value = "/cadastro-obra.action", method = RequestMethod.GET)
    public String getCadastroObra(Model model, HttpServletRequest request) {
        //Usuario colaborador = usuarioService.find(idColab);

        //model.addAttribute("isGerente", true);
        return "cadastro-obra";
    }
}
