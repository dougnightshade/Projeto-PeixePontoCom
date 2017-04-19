<%-- 
    Document   : cadaFornecedor
    Created on : 31/08/2016, 20:55:49
    Author     : Thiago
--%>

<%@page import="model.bean.Fornecedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.FornecedorDAO"%>

<%

    Fornecedor obFornecedor = new Fornecedor();
    FornecedorDAO obFornecedorDAO = new FornecedorDAO();

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastrar Fornecedor</title>
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
    </head>
    <body>
        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--div logo-->
        <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->

        <form action="ControllerFornecedor" method="POST">

            <div class="col-xs-12 col-md-7 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                       <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4>Cadastro de Fornecedor</h4></div>
                    <div class="fix-panel-body panel-body">
                        <!--======== Area dos Campos-->            

                        <div class="col-xs-12">
                            <span id="sprytextfield2">
                                <label for="inNome">Nome Fantasia:</label>
                                <input type="text" name="inNome" id="inNome" required>
                                <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                            </span>
                        </div>


                        <div class="col-xs-12">
                            <span id="sprytextfield13">
                                <label>Razão Social  </label>
                                <input type="text" name="inRazaoSocial" id="inRazaoSocial">

                                <span class="textfieldRequiredMsg">Um valor é necessário.</span><span class="textfieldMaxCharsMsg">Número máximo de caracteres excedido.</span></span> 
                        </div>

                        <div class="col-xs-12 col-sm-5">
                            <span id="sprytextfield1">
                                <label for="inCNPJ">CNPJ:</label>
                                <input type="text" name="inCNPJ" id="inCNPJ" required>
                                <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                            </span>
                        </div>


                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <span id="sprytextfield3" >
                                    <label for="inEmail">@ E-mail:</label>
                                    <input type="email" name="inEmail" id="inEmail" required>
                                    <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                    <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                    <span class="textfieldMinCharsMsg">Número mínimo de caracteres não atendido.</span>
                                </span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">

                                <span id="sprytextarea1">
                                    <label>Comentários
                                        <textarea name="taComentarios" id="taComentarios" cols="45" rows="3"></textarea>
                                        <span id="countsprytextarea1">&nbsp;</span></label>
                                    <span class="textareaMaxCharsMsg">Número máximo de caracteres excedido.</span></span> 
                            </div>
                        </div>

                        <fieldset><legend>Endereço:</legend>
                            <div class="row">
                                <div class="col-xs-8 col-sm-10">
                                    <span id="sprytextfield4">
                                        <label class="fix-fielset-label" for="inRua">Rua:</label>
                                        <input type="text" name="inRua" id="inRua" required>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                    </span>
                                </div>

                                <div class="col-xs-4 col-sm-2">
                                    <span id="sprytextfield6">
                                        <label class="fix-fielset-label" for="inNumero">Nº:</label>
                                        <input type="text" name="inNumero" id="inNumero" required>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                    </span> 
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-9">
                                <span id="sprytextfield5">
                                    <label for="inBairro">Bairro:</label>
                                    <input type="text" name="inBairro" id="inBairro" required>
                                    <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                </span>
                            </div>

                            <div class="col-xs-6 col-sm-3">
                                <span id="sprytextfield7">
                                    <label for="inCep">CEP:</label>
                                    <input type="text" name="inCep" id="inCep" required>
                                    <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                    <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                </span>
                            </div>
                        </fieldset>
                        <div class="row">
                            <fieldset><legend>Telefones:</legend>

                                <div class="row">
                                    <div class="col-xs-4 col-sm-2">
                                        <span id="sprytextfield8">
                                            <label class="fix-fielset-label" for="inDddFixo">DDD:</label>
                                            <input type="text" name="inDddFixo" id="inDddFixo">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span> </span>
                                    </div>

                                    <div class="col-xs-8 col-sm-3">
                                        <span id="sprytextfield9">
                                            <label class="fix-fielset-label" for="inTelefoneFixo"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:</label>
                                            <input type="text" name="inTelefoneFixo" id="inTelefoneFixo">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>

                                    <div>
                                        <button type="button" class="btn btn-default" onclick="incrementarFixo()">
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </button>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-4 col-sm-2">
                                        <span id="sprytextfield10">
                                            <label class="fix-fielset-label" for="inDddCelular">DDD:</label>
                                            <input type="text" name="inDddCelular" id="inDddCelular" >
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>
                                    <div class="col-xs-8 col-sm-3">
                                        <span id="sprytextfield11">
                                            <label class="fix-fielset-label" for="inTelefoneCelular"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:</label>
                                            <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" >
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>

                                    <div>
                                        <button type="button" onclick="" >
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </button>
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                        <!--Fim area dos Campos ===================-->

                        <input type="hidden" name="pagina" value="cadaFornecedor"/>

                        <!--=========== Area dos botoes Inferiores-->
                        <div>
                            <%@include file="pdrBtnSalvarInferior.jsp"%>
                        </div>
                        <!--Area dos botoes Inferiores =======================-->

                    </div><!--  Painel Body===========-->
                </div><!--  Painel ==================-->
        </form> 

        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "custom", {useCharacterMasking: true, pattern: "00.000.000/0000-00"});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none");
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "email", {minChars: 6, useCharacterMasking: true});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4");
            var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5");
            var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6");
            var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "zip_code", {format: "zip_custom", pattern: "00.000-000", useCharacterMasking: true});
            var sprytextfield8 = new Spry.Widget.ValidationTextField("sprytextfield8", "custom", {pattern: "000", useCharacterMasking: true, isRequired: false});
            var sprytextfield9 = new Spry.Widget.ValidationTextField("sprytextfield9", "phone_number", {format: "phone_custom", pattern: "0000-0000", useCharacterMasking: true, isRequired: false});
            var sprytextfield10 = new Spry.Widget.ValidationTextField("sprytextfield10", "custom", {pattern: "000", useCharacterMasking: true, isRequired: false});
            var sprytextfield11 = new Spry.Widget.ValidationTextField("sprytextfield11", "phone_number", {format: "phone_custom", pattern: "90000-0000", useCharacterMasking: true, isRequired: false});
            var sprytextfield13 = new Spry.Widget.ValidationTextField("sprytextfield13", "none", {maxChars: 45});
            var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {maxChars: 255, counterId: "countsprytextarea1", counterType: "chars_count", isRequired: false});
        </script>
    </body>
</html>