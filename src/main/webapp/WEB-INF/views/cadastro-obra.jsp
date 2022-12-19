<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ include file="navbar.jspf" %>--%>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body style="background-color: darkgrey;">
<form id="cadastroObra" enctype="multipart/form-data" >
    <div align="center" style="margin-top: 3%;">
        <c:choose>
            <c:when test="${obra != null}">
                <h1 style="color: grey; font-weight: bold;
            font-size: 460%;">editar obra</h1>
                <input type="hidden" id="idObra" name="idObra" value="${obra.getId()}"
            </c:when>
            <c:otherwise>
                <h1 style="color: grey; font-weight: bold;
            font-size: 460%;">nova obra</h1>
            </c:otherwise>
        </c:choose>
    </div>
    <div id="formContainer" style="width: 500px; margin: auto;">
        <div class="mb-3" align="left">
            <label for="tituloObra" class="form-label" style="color: #262630;
                   font-weight: bold;">título</label>
            <input type="text" class="form-control bg-dark" id="tituloObra" name="tituloObra"
                   value="${obra.getTitulo()}"
                   placeholder="título da obra" style="color: antiquewhite; align-content: space-around;"
                   required>
        </div>

        <%--        select para o artista da obra--%>
        <div class="mb-3" align="left">
            <label for="artistaToObra" class="form-label" style="color: #262630;
                   font-weight: bold;">artista</label>
            <select class="form-control bg-dark" id="artistaToObra" name="artistaToObra"
                    value="${obra.getArtista().getNome()}"
                    required style="color: cornsilk;">
                <c:forEach var="artistaToObra" items="${artistasToObra}">
                    <c:choose>
                        <c:when test="${obra.getArtista() != null}">
                            <c:if test="${obra.getArtista() == artistaToObra}">
                                <option value="${obra.getArtista().getId()}" selected>${artistaToObra.getNome()}</option>
                            </c:if>
                            <option value="${artistaToObra.getId()}">${artistaToObra.getNome()}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${artistaToObra.getId()}">${artistaToObra.getNome()}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>

        <%--        select para a linguagem da obra--%>
        <div class="mb-3" align="left">
            <label for="linguagemToObra" class="form-label" style="color: #262630;
                   font-weight: bold;">linguagem</label>
            <select class="form-control bg-dark" id="linguagemToObra" name="linguagemToObra"
                    value="${obra.getLinguagem().getDescricao()}"
                    required style="color: cornsilk;">
                <c:forEach var="linguagemToObra" items="${linguagensToObra}">
                    <c:choose>
                        <c:when test="${obra.getLinguagem() != null}">
                            <c:if test="${obra.getLinguagem() == linguagemToObra}">
                                <option value="${obra.getLinguagem().getId()}" selected>${linguagemToObra.getDescricao()}</option>
                            </c:if>
                            <option value="${linguagemToObra.getId()}">${linguagemToObra.getDescricao()}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${linguagemToObra.getId()}">${linguagemToObra.getDescricao()}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>

        <%--        select para a técnica da obra--%>
        <div class="mb-3" align="left">
            <label for="tecnicaToObra" class="form-label" style="color: #262630;
                   font-weight: bold;">técnica</label>
            <select class="form-control bg-dark" id="tecnicaToObra" name="tecnicaToObra"
                    value="${obra.getTecnica().getDescricao()}"
                    required style="color: cornsilk;">
                <c:forEach var="tecnicaToObra" items="${tecnicasToObra}">
                    <c:choose>
                        <c:when test="${obra.getTecnica() != null}">
                            <c:if test="${obra.getTecnica() == tecnicaToObra}">
                                <option value="${obra.getTecnica().getId()}" selected>${tecnicaToObra.getDescricao()}</option>
                            </c:if>
                            <option value="${tecnicaToObra.getId()}">${tecnicaToObra.getDescricao()}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${tecnicaToObra.getId()}">${tecnicaToObra.getDescricao()}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>

        <%--        select para a prateleira da obra, caso seja parte do acervo--%>
        <div class="mb-3" align="left">
            <label for="prateleiraToObra" class="form-label" style="color: #262630;
                   font-weight: bold;">prateleira do acervo</label>
            <select class="form-control bg-dark" id="prateleiraToObra" name="prateleiraToObra"
                    value="${obra.getPrateleira().getDescricao()}"
                    required style="color: cornsilk;">
                <c:forEach var="prateleiraToObra" items="${prateleirasToObra}">
                    <c:choose>
                        <c:when test="${obra.getPrateleira() != null}">
                            <c:if test="${obra.getPrateleira() == prateleiraToObra}">
                                <option value="${obra.getPrateleira().getId()}" selected>${prateleiraToObra.getDescricao()}</option>
                            </c:if>
                            <option value="${prateleiraToObra.getId()}">${prateleiraToObra.getDescricao()}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${prateleiraToObra.getId()}">${prateleiraToObra.getDescricao()}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>

        <%--        div para imagem atual da obra--%>
        <div align="center" style="margin-bottom: 5%;">
            <c:if test="${obra != null}">
                <p class="form-label">imagem atual</p>
                <img src="/obra-view.action?id=${obra.getId()}" alt="" style="alignment: center;" width="70%;">
                <%--                <img src="data:image/png;base64,${obra.getImagemString()}"--%>
                <%--                     alt="" style="alignment: center;" width="70%;">--%>
            </c:if>
        </div>

        <%--input para upload da imagem da obra--%>
        <div class="input-group mb-3">
            <input type="file" class="form-control bg-dark" id="imagemToObra" name="img" value="${obra.getImagem()}"
                   formenctype="multipart/form-data">
            <label class="input-group-text" for="imagemToObra">upload</label>
        </div>

        <%--input number para altura da obra--%>
        <div class="mb-3" align="left">
            <label for="alturaObra" class="form-label" style="color: #262630;
                    font-weight: bold;">altura</label>
            <input type="number" min="0" step="0.01" class="form-control bg-dark" id="alturaObra" name="alturaObra"
                   value="${obra.getAltura()}"
                   placeholder="medida da altura da obra" style="color: antiquewhite;"
                   required>
        </div>

        <%--input number para largura da obra--%>
        <div class="mb-3" align="left">
            <label for="larguraObra" class="form-label" style="color: #262630;
                    font-weight: bold;">largura</label>
            <input type="number" min="0" step="0.01" class="form-control bg-dark" id="larguraObra" name="larguraObra"
                   value="${obra.getLargura()}"
                   placeholder="medida da largura da obra" style="color: antiquewhite;">
        </div>

        <%--input number para o ano da obra--%>
        <div class="mb-3" align="left">
            <label for="anoToObra" class="form-label" style="color: #262630;
                    font-weight: bold;">ano</label>
            <input type="number" min="1900" max="2022" maxlength="4" class="form-control bg-dark" id="anoToObra" name="anoToObra"
                   value="${obra.getAno()}"
                   placeholder="ano da obra" style="color: antiquewhite;">
        </div>

        <%--botões de salvar e excluir para obra--%>
        <div align="left">
            <button type="button" class="btn btn-outline-dark btn-lg" data-bs-toggle="modal" data-bs-target="#modalConfirmacaoObra">
                salvar
            </button>
            <c:if test="${obra != null}">
                <button type="button" class="btn btn-outline-danger btn-lg" data-bs-toggle="modal" data-bs-target="#modalConfirmacaoObra">
                    excluir
                </button>
                <input type="submit" class="btn btn-dark" data-bs-dismiss="modal"
                       formaction="/obras.action?idColab=${colaborador.getId()}" value="cancelar" formmethod="get" style="margin-left: 30%;"/>
            </c:if>
        </div>

        <!-- Modal de confirmação de cadastro-->
        <div class="modal fade" id="modalConfirmacaoObra" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="modalConfirmacaoObraLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-dark" style="color: hotpink;" >
                        <h5 class="modal-title"id="modalConfirmacaoObraLabel">confirme as alterações</h5>
                        <button type="button" class="btn-close btn-outline-dark" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body bg-dark" style="color: antiquewhite;" align="left">
                        deseja salvar estas alterações?
                    </div>
                    <div class="modal-footer bg-dark">
                        <input type="submit" class="btn btn-outline-light" data-bs-dismiss="modal"
                               formaction="/obra/salvar-obra.action?idColab=${colaborador.getId()}" formmethod="post" value="salvar"/>
                        <c:if test="${obra != null}">
                            <input type="submit" class="btn btn-outline-danger" data-bs-dismiss="modal"
                                   formaction="/obra/excluir-obra.action?idColab=${colaborador.getId()}" value="excluir" formmethod="post">
                        </c:if>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</form>
</body>
<%--<%@ include file="footer.jspf" %>--%>