<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="model.bean.StatusGaiola"%>
<%@page import="model.dao.StatusGaiolaDAO"%>
<%@page import="model.bean.TipoEstrutura"%>
<%@page import="model.dao.TipoEstruturaDAO"%>
<%@page import="model.bean.RegistraLotedepeixe"%>
<%@page import="model.dao.RegistraLotedepeixeDAO"%>
<%@page import="model.bean.TipoPeixes"%>
<%@page import="model.dao.TipoPeixesDAO"%>

<%

    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();
    List<Gaiola> listaGaiola = new ArrayList<Gaiola>();

    StatusGaiola obStatusGaiola = new StatusGaiola();
    StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();

    TipoEstrutura obTipoEstrutura = new TipoEstrutura();
    TipoEstruturaDAO obTipoEstruturaDAO = new TipoEstruturaDAO();

    RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

    TipoPeixesDAO obTipoPeixesDAO = new TipoPeixesDAO();
    List<TipoPeixes> listaTipoPeixes = obTipoPeixesDAO.listar();

    obGaiola = obGaiolaDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro Entrada Lote de Peixes</title>     
        <link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css">
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>
        <%@include file="importsJS.jsp" %>      

        <script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
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
            <div class="col-xs-12 col-md-7 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">

                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4 class="bold">Registro Entrada Lote de Peixes</h4>

                    </div>
                    <div class="panel-body">

                        <form action="ControllerRegistroLoteDePeixes" method="POST">
                            <!--========================== Area dos Campos-->

                            <div class="row">
                                <div class="col-xs-4">
                                    <span id="spryselect1">
                                        <label>Gaiola Selecionada</label>
                                        <select name="selGaiola" id="selGaiola" disabled="">
                                            <option value="<%=obGaiola.getGaiolaCodigo()%>"><%=obGaiola.getGaiolaCodigo()%></option>
                                        </select>
                                        <span class="selectRequiredMsg">Selecione um item.</span>
                                    </span>
                                </div>


                                <div class="col-xs-5">
                                    <span id="spryselect2">
                                        <label>Qtde Máxima M³</label>
                                        <select name="selQtdMaxM3" id="selQtdMaxM3">
                                            <option value="" selected disabled>Selecione uma quantidade</option>
                                            <%
                                                for (int index = 50; index < 150; index += 20) {
                                            %>
                                            <option value="<%=index%>"><%=index%> peixes por Metro³</option>
                                            <%}%>
                                        </select>
                                        <span class="selectRequiredMsg">Selecione um item.</span> 
                                    </span>
                                </div>

                                <div class="col-xs-3">
                                    <span id="sprytextfield1">
                                        <label>Qtde de Peixes </label>
                                        <input type="number" name="inQtdPeixes" id="inQtdPeixes" required>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span><span class="textfieldMinValueMsg">Valor mínimo 0</span><span class="textfieldMaxValueMsg">O valor digitado é maior que o máximo permitido.</span>
                                    </span>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-xs-4">
                                    <span id="spryselect3">
                                        <label>Nome Popular
                                            <select name="selNomePopular" id="selNomePopular">
                                                <option disabled selected value="">Selecione um nome</option>
                                                <%
                                                    for (int index = 0; index < listaTipoPeixes.size(); index++) {
                                                %>
                                                <option value="<%=listaTipoPeixes.get(index).getTipoPeixesCodigo()%>"><%=listaTipoPeixes.get(index).getTipoPeixesNomePopular()%></option>
                                                <%}%>
                                            </select>
                                        </label>
                                        <span class="selectRequiredMsg">Selecione um item.</span> 
                                    </span>
                                </div>

                                <div class="col-xs-4">
                                    <span id="sprytextfield2">
                                        <label>Custo dos Peixes</label>
                                        <input type="text" name="inCusto" id="inCusto">
                                        <span class="sobreescrito"><span class="bold">Exemplo: </span>1000,00</span><br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span><span class="textfieldMinValueMsg">O valor digitado é menor que o mínimo necessário.</span><span class="textfieldMaxValueMsg">O valor digitado é maior que o máximo permitido.</span></span>
                                </div>

                                <div class="col-xs-4">
                                    <span id="sprytextfield3">
                                    <label>Data de Registro</label>
                                    <input class="datepicker" type="text" name="inDataDeRegistro" id="inDataDeRegistro">
                                    <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span></span>
                                </div>
                            </div>
                            <!--Area dos Campos ===================-->


                            <!--=============== Area dos Botões-->
                            <div>
                                <input type="hidden" name="inGaiola" value="<%=obGaiola.getGaiolaCodigo()%>" />
                                <input type="hidden" name="pagina" value="cadaRegistro" />
                                <%@include file="pdrBtnSalvarInferior.jsp" %>
                            </div>
                            <!--Area dos Botões =======================-->

                        </form>
                    </div>
                </div>
            </div>
            <!--Painel ==================-->

        </div>
        <script type="text/javascript">
            var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
            var spryselect2 = new Spry.Widget.ValidationSelect("spryselect2");
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "currency", {format: "dot_comma", minValue: 0, maxValue: 10000, useCharacterMasking: true});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "date", {format:"dd/mm/yyyy", useCharacterMasking:true});
            var spryselect3 = new Spry.Widget.ValidationSelect("spryselect3");
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "integer", {useCharacterMasking: true, minValue: 1, maxValue: 10000});
        </script>
    </body>
</html>
