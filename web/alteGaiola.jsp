<%-- 
    Document   : alteGaiola
    Created on : 31/08/2016, 20:55:49
    Author     : Douglas
--%>

<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="model.bean.StatusGaiola"%>
<%@page import="model.dao.StatusGaiolaDAO"%>
<%@page import="model.bean.TipoEstrutura"%>
<%@page import="model.dao.TipoEstruturaDAO"%>

<%

    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();

    StatusGaiola obStatusGaiola = new StatusGaiola();
    StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();
    List<StatusGaiola> listaStatusGaiola;
    listaStatusGaiola = obStatusGaiolaDAO.listar();

    TipoEstrutura obTipoEstrutura = new TipoEstrutura();
    TipoEstruturaDAO obTipoEstruturaDAO = new TipoEstruturaDAO();
    List<TipoEstrutura> listaTipoEstrutura;
    listaTipoEstrutura = obTipoEstruturaDAO.listar();

    /*Recebe o paramentro para buscar o objeto no banco*/
    obGaiola = obGaiolaDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

%>


<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alteração de Gaiola</title>     
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>
        <%@include file="importsJS.jsp" %>       

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
    </head>
    <body>
        <!--============= div Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu ==============-->

        <!--div Container-->
        <div class="">            

            <!--================ div logo-->
            <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->

            <!--============== Painel -->
            <div class="col-xs-12 col-md-7 ctrl-padding-top">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4><span class="bold">Alteração de Gaiola</span></h4>
                        <div class="panel-footer text-left">
                            <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                            <span class="bold">Código da Gaiola: </span><%=obGaiola.getGaiolaCodigo()%>
                        </div>
                        <!--panel-footer =============-->
                    </div>
                    <div class="panel-body">

                        <form action="ControllerGaiola" method="POST">
                            <input type="hidden" name="pagina" value="alteGaiola" />
                            <input type="hidden" name="inCodigo" value="<%=obGaiola.getGaiolaCodigo()%>" />

                            <!--========================== Area dos Campos-->
                            <div class="row">
                                <div class="col-xs-4">
                                    <span id="sprytextfield1">
                                        <label>Altura<span class="sobreescrito"> (m)</span> </label>
                                        <input type="text" name="inAltura" id="inAltura" value="<%=obGaiola.getGaiolaTamAltura().toString().replace(".", ",")%>">
                                        <span class="sobreescrito">Exemplo: 1,70</span> <br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span><span class="textfieldInvalidFormatMsg">Formato inválido.</span></span> 
                                </div>

                                <div class="col-xs-4">
                                    <span id="sprytextfield2">
                                        <label class="hide-for-small-only">Comprimento<span class="sobreescrito"> (m)</span></label>
                                        <label class="show-for-small-only">Compri<span class="sobreescrito"> (m)</span></label>
                                        <input type="text" name="inComprimento" id="inComprimento" value="<%=obGaiola.getGaiolaTamComprimento().toString().replace(".", ",")%>">
                                        <span class="sobreescrito">Exemplo: 1,70</span> <br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span></span>
                                </div>


                                <div class="col-xs-4">
                                    <span id="sprytextfield3">
                                        <label>Largura<span class="sobreescrito"> (m)</span></label>
                                        <input type="text" name="inLargura" id="inLargura" value="<%=obGaiola.getGaiolaTamLargura().toString().replace(".", ",")%>">
                                        <span class="sobreescrito">Exemplo: 1,70</span> <br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span></span>
                                </div>
                            </div>


                            <div class="row">

                                <div class="col-xs-6 col-sm-4">

                                    <span id="spryselect1">
                                        <label>Tipo de Estrutura</label>
                                        <select name="selTipoDeEstrutura" id="selTipoDeEstrutura">
                                            <%
                                                obTipoEstrutura = obTipoEstruturaDAO.buscarCodigo(obGaiola.getTipoEstrutura().getTipoEstruturaCodigo());
                                            %>
                                            <option value="<%=obTipoEstrutura.getTipoEstruturaCodigo()%>"><%=obTipoEstrutura.getTipoEstruturaDescricao()%></option>
                                            <%
                                                /*So para quebrar*/
                                                for (int index = 0; index < listaTipoEstrutura.size(); index++) {
                                                    if (listaTipoEstrutura.get(index).getTipoEstruturaCodigo() != obTipoEstrutura.getTipoEstruturaCodigo()) {

                                            %>
                                            <option value="<%=listaTipoEstrutura.get(index).getTipoEstruturaCodigo()%>"><%=listaTipoEstrutura.get(index).getTipoEstruturaDescricao()%></option>
                                            <%}/**/
                                                }%>
                                        </select>

                                        <span class="selectRequiredMsg">Selecione um item.</span> </span>

                                </div>

                                <div class="col-xs-6 col-sm-3">
                                    <span id="sprytextfield4">
                                        <label>Data de Criação</label>
                                        <%
                                            Date data = new Date();
                                            SimpleDateFormat formartadata = new SimpleDateFormat("dd/MM/yyy");
                                        %>
                                        <input class="datepicker" type="text" name="inDataDeCriacao" id="inDataDeCriacao" value="<%=formartadata.format(obGaiola.getGaiolaDataCriacao())%>">
                                        <span class="sobreescrito">Ex: dd/mm/aaaa</span><br>
                                        <span class="textfieldRequiredMsg row">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg row">Formato inválido.</span></span>
                                </div>
                            </div>

                            <div class="row">
                                <span id="sprytextarea1" class="col-xs-12">
                                    <label class="padding-top-0em">Comentários</label>
                                    <textarea name="taComentarios" id="taComentarios" rows="3"><%=obGaiola.getGaiolaComentarios()%></textarea>
                                </span>
                            </div>


                            <!--Area dos Campos ===================-->

                            <!--=========== Area dos botoes-->
                            <div class="row margin-top-1em">
                                <%@include file="pdrBtnSalvarInferior.jsp" %>
                            </div>
                            <!--Area dos botoes ==============--> 
                        </form>
                    </div>
                </div>
            </div>
            <!--Painel ==================-->

        </div>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "real", {useCharacterMasking: true});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "real", {useCharacterMasking: true});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "real", {useCharacterMasking: true});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "date", {useCharacterMasking: true, format: "dd/mm/yyyy"});
            var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
            var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {maxChars: 255, isRequired: false, counterId: "countsprytextarea1"});
        </script>
    </body>
</html>
