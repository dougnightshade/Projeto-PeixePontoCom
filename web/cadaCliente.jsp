<%-- 
    Document   : cadaCliente
    Created on : 18/09/2016, 00:15:43
    Author     : Thiago
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Bairros"%>
<%@page import="model.bean.Cidades"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.CidadesDAO"%>
<%@page import="model.dao.BairrosDAO"%>

<%
    CidadesDAO obCidadesDAO = new CidadesDAO();

    List<Cidades> listaCidades;
    listaCidades = obCidadesDAO.listar();

    BairrosDAO obBairrosDAO = new BairrosDAO();
    List<Bairros> listaBairros;
    listaBairros = obBairrosDAO.listar();

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <title>Cadastro Cliente</title>
        <%@include file="importsCSS.jsp" %>
        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <script src="js/ajax.js" type="text/javascript"></script>
    </head>
    <body>
        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--================ div logo -->
        <div class="col-xs-12 col-sm-4 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>

        <!--div logo =================-->

        <!--div Container-->
        <div class="">
            <form action="ControllerCliente" method="POST">

                <!--============== Painel -->
                <div class="col-xs-12 col-md-7 max-640px-margin-top-1em min-640px-margin-top-2em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4>Cadastro de Cliente</h4></div>
                        <div class="fix-panel-body panel-body">
                            <!--========================== Area dos Campos-->
                            <div class="">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-11 col-md-11">
                                        <span id="sprytextfield2">
                                            <label for="inNome">Nome:</label>
                                            <input type="text" name="inNome" id="InNome" required>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>                                    
                                        </span> 
                                    </div>                                                                                                 
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-5 col-md-4">
                                        <span id="sprytextfield1">
                                            <label for="inCNPJ">CNPJ:</label>
                                            <input type="text" name="inCNPJ" id="inCNPJ" required>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                        </span>
                                    </div>                                                                

                                    <div class="col-xs-12 col-sm-6 col-md-7">    
                                        <span id="sprytextfield3">
                                            <label for="inEmail">@ E-mail:</label>
                                            <input type="email" name="inEmail" id="inEmail" required>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>
                                </div>

                                <fieldset>
                                    <legend>Endereço:</legend>
                                    <div class="row">
                                        <div class="col-xs-9 col-sm-8 col-md-8">
                                            <span id="sprytextfield8">
                                                <label class="fix-fielset-label" for="inRua">Rua:</label>
                                                <input type="text" name="inRua" id="inRua">
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                                <span class="textfieldMaxCharsMsg">Número máximo de caracteres excedido.</span>
                                            </span>
                                        </div>

                                        <div class="col-xs-3 col-sm-2 col-md-2">
                                            <span id="sprytextfield9">
                                                <label class="fix-fielset-label" for="inNumero">Nº:</label>
                                                <input type="text" name="inNumero" id="inNumero">
                                                <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                                <span class="textfieldMaxCharsMsg">Número máximo de caracteres excedido.</span>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-6 col-sm-5 col-md-5">
                                            <label for="selCidade">Cidade:</label>
                                            <select name="selCidade" id="selCidade" required="">
                                                <option value="" selected disabled>Cidade</option>
                                                <%
                                                    /*So para quebrar*/
                                                    for (int index = 0; index < listaCidades.size(); index++) {
                                                %>
                                                <option value="<%=listaCidades.get(index).getCidadesCodigo()%>"><%=listaCidades.get(index).getCidadesNome()%></option>
                                                <%}%>
                                            </select>
                                        </div>

                                        <div class="col-xs-6 col-sm-5 col-md-5">
                                            <label for="inBairro">Bairro:</label>
                                            <select name="inBairro" id="inBairro">
                                                <option value=""> Escolha estado</option>
                                            </select>
                                        </div>
                                    </div>
                                </fieldset>

                                <div class="row">
                                    <fieldset>
                                        <legend>Telefones:</legend>
                                        <div class="col-xs-3 col-sm-1 col-md-2 col-lg-1">
                                            <span id="sprytextfield6">
                                                <label class="fix-fielset-label">DDD:</label>
                                                <input  type="text" name="inDddFixo" id="inPrefixoFixo">
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            </span> 
                                        </div>

                                        <div class="col-xs-9 col-sm-3 col-md-3 col-lg-3">
                                            <span id="sprytextfield4">
                                                <label for="inTelefoneFixo" class="fix-fielset-label"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:</label>
                                                <input type="text" name="inTelefoneFixo" id="inTelefoneFixo">
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                            </span>
                                        </div>
                                        <div>
                                            <div class="col-xs-3 col-sm-1 col-md-2 col-lg-1">
                                                <span id="sprytextfield7">
                                                    <label class="fix-fielset-label">DDD:</label>
                                                    <input type="text" name="inDddCelular" id="inPrefixoCelular">
                                                    <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                                    
                                                </span> 
                                            </div>

                                            <div class="col-xs-9 col-sm-3 col-md-3 col-lg-3">
                                                <span id="sprytextfield5">
                                                    <label for="inTelefoneCelular" class="fix-fielset-label"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:</label>
                                                    <input type="text" name="inTelefoneCelular" id="inTelefoneCelular">
                                                    <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                                </span>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!--Area dos Campos ===================-->


                                <!--=========== Area dos botoes -->
                                <div>
                                    <input type="hidden" name="pagina" value="cadaCliente"/>
                                    <%@include file="pdrBtnSalvarInferior.jsp"%>
                                </div>
                                <!--Area dos botoes =======================-->

                            </div> <!-- Container Fluid-->
                        </div><!--  Painel Body===========-->
                    </div><!--  Painel ==================-->
                </div>  
            </form>


        </div>

        <%@include file="importsJS.jsp" %>       

        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "custom", {useCharacterMasking: true, pattern: "00.000.000/0000-00"});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "email", {useCharacterMasking: true});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "phone_number", {format: "phone_custom", pattern: "0000-0000", useCharacterMasking: true, isRequired: false});
            var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "phone_number", {format: "phone_custom", pattern: "00000-0000", useCharacterMasking: true, isRequired: false});
            var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "phone_number", {isRequired: false, format: "phone_custom", pattern: "000", useCharacterMasking: true});
            var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "custom", {pattern: "000", useCharacterMasking: true, isRequired: false});
            var sprytextfield8 = new Spry.Widget.ValidationTextField("sprytextfield8", "none", {maxChars: 120});
            var sprytextfield9 = new Spry.Widget.ValidationTextField("sprytextfield9", "none", {maxChars: 6});
        </script>
    </body>
</html>