package br.ufsm.cav.artedigital.falharpraforaapp.controller;

import br.ufsm.cav.artedigital.falharpraforaapp.model.Obra;
import br.ufsm.cav.artedigital.falharpraforaapp.service.ObraService;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;


@Controller
public class ObraController {

    @Autowired
    private ObraService obraService;

    @GetMapping({"/", "/home"})
    public String getIndex(Model model) {

        //contar quantas obras tem no banco pra ter o númeor de ID para gerar randomicamente na tela.
//        model.addAttribute("idObra", getIdObraToShow());
        model.addAttribute("idObra", getIdObraToShow());
       // Long maxId = getTotalObras();

        return "hellostrange";
    }

    @RequestMapping(value = "/cadastro-obra.action", method = RequestMethod.POST)
    public String getCadastroObra(Model model, HttpServletRequest request) {
        //Usuario colaborador = usuarioService.find(idColab);

        //model.addAttribute("isGerente", true);
        return "cadastro-obra";
    }

    @RequestMapping(value = "/obras.action", method = RequestMethod.GET)
    public String getObras(Model model, HttpServletRequest request) {

        List<Obra> obras = obraService.findAll();

        model.addAttribute("obras", obras);
        return "obras";
    }

    @RequestMapping(value= "/obra-view.action", method = RequestMethod.GET)
    public void getObraBytesToView(HttpServletResponse response,
                                   @RequestParam(value = "id")Long id) throws IOException {
        byte[] imagemByte = obraService.find(id).getImagem();
        InputStream inputStream = new ByteArrayInputStream(imagemByte);
        IOUtils.copy(inputStream, response.getOutputStream());
    }

    @RequestMapping(value = "/obra/salvar-obra.action", method = RequestMethod.POST)
    public String salvarObra(HttpServletRequest request, Model model,
                             @RequestParam( value = "img", required = false) MultipartFile img)
            throws IOException {
        String idObraString;
        Long idObra = null;
        byte[] imagem;

        idObraString = request.getParameter("idObra");
        if(idObraString!=null) {
            idObra = Long.valueOf(idObraString);
        }

        if(img.getSize() == 0) {
            imagem = obraService.find(idObra).getImagem();
        }else {
            imagem = multipartFileToByte(img);
        }

        Obra obra = new Obra();
        obra.setId(idObra);
        obra.setImagem(imagem);

        obraService.save(obra);

        return "redirect:/obras.action";
    }

    @RequestMapping(value = "/obra/editar-obra.action", method = RequestMethod.POST)
    public String editarObra(Model model, HttpServletRequest request,
                             @RequestParam(value = "id") Long idObra)
            throws UnsupportedEncodingException {
        Obra obra = obraService.find(idObra);

        model.addAttribute("obra", obra);
        return "cadastro-obra";
    }


    @RequestMapping(value = "/obra/excluir-obra.action", method = RequestMethod.POST)
    public String excluirObra(HttpServletRequest request, Model model) {
        Long idObra = Long.parseLong(request.getParameter("idObra"));
        obraService.delete(idObra);
        return "redirect:/obras.action";
    }

    //////////////////////////////////////////////

    private byte[] multipartFileToByte(MultipartFile img) throws IOException {
        byte[] bytesImg = img.getBytes();
        return bytesImg;
    }

    private int getTotalObras() {
        int total = obraService.countObras();
        return total;
    }

    private Long getIdObraToShow() {
//        Long idObraToShow = new Random().nextInt()
        Random random = new Random();
        int upperbound = getTotalObras();
        Long idObraToShow;

        do{
            idObraToShow = Long.valueOf(random.nextInt(upperbound));
        } while(idObraToShow == 0 || idObraToShow == null || idObraToShow == 2);

        return idObraToShow;
    }
}
