<%-- 
    Document   : cadaGaiola
    Created on : 31/08/2016, 20:55:49
    Author     : Douglas
--%>

<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.StatusGaiola"%>
<%@page import="model.dao.StatusGaiolaDAO"%>
<%@page import="model.bean.TipoEstrutura"%>
<%@page import="model.dao.TipoEstruturaDAO"%>

<%

    StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();
    List<StatusGaiola> listaStatusGaiola;
    listaStatusGaiola = obStatusGaiolaDAO.listar();

    TipoEstruturaDAO obTipoEstruturaDAO = new TipoEstruturaDAO();
    List<TipoEstrutura> listaTipoEstrutura;
    listaTipoEstrutura = obTipoEstruturaDAO.listar();

%>


<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastrar Nova Gaiola</title>     
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
            <form action="ControllerGaiola" method="POST">
                <!--============== Painel -->
                <div class="col-xs-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4 class="bold">Cadastro de Gaiola</h4></div>
                        <div class="fix-panel-body panel-body">



                            <!--========================== Area dos Campos-->
                            <div class="row">
                                <div class="col-xs-4">
                                    <span id="sprytextfield1">
                                        <label>Altura:<span class="sobreescrito">(m)</span></label>
                                        <input type="text" name="inAltura" id="inAltura" value="1,70">
                                        <span class="sobreescrito">Exemplo: 1,70</span> <br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span><span class="textfieldInvalidFormatMsg">Formato inválido.</span><span class="textfieldMaxValueMsg">Valor mínimo: 0</span><span class="textfieldMinValueMsg">Valor máximo: 10</span></span> 
                                </div>

                                <div class="col-xs-4">
                                    <span id="sprytextfield2">
                                        <label class="hide-for-small-only">Comprimento:<span class="sobreescrito">(m)</span></label>
                                        <label class="show-for-small-only">Compri<span class="sobreescrito"> (m)</span></label>
                                        <input type="text" name="inComprimento" id="inComprimento">
                                        <span class="sobreescrito">Exemplo: 1,70</span><br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span><span class="textfieldMinValueMsg">Valor mínimo: 0</span><span class="textfieldMaxValueMsg">Valor máximo: 10</span></span>
                                </div>


                                <div class="col-xs-4">
                                    <span id="sprytextfield3">
                                        <label>Largura:<span class="sobreescrito">(m)</span></label>
                                        <input type="text" name="inLargura" id="inLargura">
                                        <span class="sobreescrito">Exemplo: 1,70</span> <br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span><span class="textfieldMinValueMsg">Valor mínimo: 0</span><span class="textfieldMaxValueMsg">Valor máximo: 10</span></span>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-xs-8 col-sm-4">
                                    <span id="spryselect1">
                                        <label>Tipo de Estrutura</label>
                                        <select name="selTipoDeEstrutura" id="selTipoDeEstrutura">
                                            <%
                                                /*So para quebrar*/
                                                for (int index = 0; index < listaTipoEstrutura.size(); index++) {
                                            %>
                                            <option value="<%=listaTipoEstrutura.get(index).getTipoEstruturaCodigo()%>"><%=listaTipoEstrutura.get(index).getTipoEstruturaDescricao()%></option>
                                            <%}%>
                                        </select>
                                        <span class="selectRequiredMsg">Selecione um item.</span>
                                    </span>
                                </div>



                                <div class="col-xs-6 col-sm-3">
                                    <span id="sprytextfield4">
                                        <label>Data de Criação</label>
                                        <input class="datepicker" type="text" name="inDataDeCriacao" id="inDataDeCriacao">
                                        <span class="sobreescrito">Ex: dd/mm/aaaa</span><br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                    </span>
                                </div>
                            </div>


                            <div class="row">
                                <span id="sprytextarea1" class="col-xs-12">
                                    <label>Comentários</label>
                                    <textarea name="taComentarios" id="taComentarios" rows="3"></textarea>
                                    <span id="countsprytextarea1">&nbsp;</span>
                                    <span class="textareaMaxCharsMsg">Número máximo de caracteres excedido.</span></span>
                            </div>

                            <!--Area dos Campos ===================-->

                            <!--=========== Area dos botoes-->


                            <div>
                                <input type="hidden" name="pagina" value="cadaGaiola" />
                                <%@include file="pdrBtnSalvarInferior.jsp"%>
                            </div>
                            <!--Area dos botoes ==============--> 
                        </div>
                    </div>
                </div><!--Painel ==================-->
            </form>                


        </div>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "real", {useCharacterMasking: true, maxValue: 10, minValue: 0});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "real", {useCharacterMasking: true, minValue: 0, maxValue: 10});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "real", {useCharacterMasking: true, minValue: 0, maxValue: 10});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "date", {useCharacterMasking: true, format: "dd/mm/yyyy"});
            var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
            var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {counterId: "countsprytextarea1", maxChars: 255, counterType: "chars_count", isRequired: false});
        </script>
    </body>
</html>
