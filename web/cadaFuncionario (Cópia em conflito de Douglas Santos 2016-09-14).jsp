<%-- 
    Document   : cadaRacao
    Created on : 31/08/2016, 20:55:49
    Author     : AspireM5
--%>

<%@page import="model.dao.TipoFuncionarioDAO"%>
<%@page import="model.bean.TipoFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Funcionário</title>
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationPassword.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
    </head>
    <body>
        <!--div Menu Superior-->
        <div>
            <%@include file="menuSuperior.jsp" %>
        </div>

        <!--div Menu Lateral-->
        <div>
            <%@include file="menuLateral.jsp" %>
        </div>

        <!--div Conteudo-->
        <div>
            <form action="ControllerFuncionario" method="POST">

                <!--=========== Area dos botoes Superiores-->
                <%@include file="pdrBtnSalvarSuperior.jsp" %>
                <!--=========== Area dos botoes Superiores-->

                <!--================ div logo-->
                <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
                    <img id="LogoPeixePontoCom" src="imgs/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
                </div>
                <!--div logo =================-->

                <!--=========== Inicio dos campos-->

                <div class="col-xs-12 col-md-6 ctrl-padding-top">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center"><h4>Cadastro de Funcionários</h4></div>
                        <div class="panel-body">
                            <div class="container-fluid">
                            <div class="row">
                                <div class="col-xs-12 col-md-8">
                                    <span id="sprytextfield1">
                                        <label for="inNome">Nome</label>
                                        <input type="text" name="inNome" id="inNome">
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                    </span> 
                                </div>

                                <div class="col-xs-12 col-md-3">                                    
                                        <label for="selTipoFuncionario">Tipo</label>
                                        <select name="selTipoFuncionario" id="selTipoFuncionario">
                                            <option value="" selected disabled></option>
                                            <%
                                                TipoFuncionarioDAO obTipoFuncionarioDAO = new TipoFuncionarioDAO();
                                                for (TipoFuncionario obTipoFuncionario: obTipoFuncionarioDAO.listarTipoFuncionario()) {
                                            %>  
                                            <option><%=obTipoFuncionario.getTipoFuncionarioDescricao()%></option>
                                            <%
                                                }
                                            %>
                                        </select>                                                                                                 		                                                                                                  
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <span id="sprytextfield2">
                                        <label for="inEmail">Email</label>
                                        <input type="text" name="inEmail" id="inEmail">
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        <span class="textfieldMinCharsMsg">Número mínimo de caracteres não atendido.</span>
                                    </span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12 col-md-3">
                                    <span id="sprytextfield3">
                                        <label for="inLogin">Login</label>
                                        <input type="text" name="inLogin" id="inLogin">
                                        <span class="textfieldMinCharsMsg">Número mínimo de caracteres não atendido.</span>
                                        <span class="textfieldMaxCharsMsg">Número máximo de caracteres excedido.</span>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-md-3">
                                    <span id="sprypassword1">
                                        <label for="inSenha2">Senha</label>
                                        <input type="password" name="inSenha" id="inSenha2">
                                        <span class="passwordMinCharsMsg">Número mínimo de caracteres não atendido.</span>
                                        <span class="passwordRequiredMsg">Um valor é necessário.</span>
                                    </span>
                                </div>
                            </div>

                            <div class="row">
                                <fieldset><legend>Telefones:</legend>
                                    <div class="col-xs-2 col-md-1">
                                        <span id="sprytextfield6">
                                            <label for="inPrefixoFixo">Prefixo</label>
                                            <input type="text" name="inPrefixoFixo" id="inPrefixoFixo">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        </span></div>

                                    <div class="col-xs-4 col-md-3">
                                        <span id="sprytextfield4">
                                            <label for="inTelefoneFixo2">Fixo</label>
                                            <input type="text" name="inTelefoneFixo" id="inTelefoneFixo2">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        </span></div>

                                    <div class="col-xs-2 col-md-1">
                                        <span id="sprytextfield7">
                                            <label for="inPrefixoCelular">Prefixo</label>
                                            <input type="text" name="inPrefixoCelular" id="inPrefixoCelular">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        </span></div>

                                    <div class="col-xs-4 col-md-3">
                                        <span id="sprytextfield5">
                                            <label for="inTelefoneCelular2">Celular</label>
                                            <input type="text" name="inTelefoneCelular" id="inTelefoneCelular2">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        </span> </div>
                                </fieldset>
                            </div>
                            <!--Fim dos Campos =========================-->

                            <!--=========== Area dos botoes Inferiores-->
                            <%@include file="pdrBtnSalvarInferior.jsp" %>
                            <!--Area dos botoes Inferiores =======================-->
                        </div> <!-- Container Fluid -->
                        </div>  <!-- Painel Body    ==============-->
                    </div>  <!--Painel          ==============--> 
                </div>
                <input type="hidden" name="pagina" value="cadaFuncionario"/>
            </form>
        </div> <!-- Div Conteudo -->

        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "email", {useCharacterMasking: true, minChars: 10});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", {minChars: 4, maxChars: 20});
            var sprypassword1 = new Spry.Widget.ValidationPassword("sprypassword1", {minChars: 6});
            var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "phone_number", {format: "phone_custom", pattern: "(00)", useCharacterMasking: true});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "phone_number", {format: "phone_custom", pattern: "0000-0000", useCharacterMasking: true});
            var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "phone_number", {format: "phone_custom", pattern: "(00)", useCharacterMasking: true});
            var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "phone_number", {format: "phone_custom", pattern: "00000-0000", useCharacterMasking: true});
            var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
        </script>
    </body>
</html>