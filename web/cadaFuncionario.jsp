<%@page import="java.util.List"%>
<%@page import="model.dao.TipoFuncionarioDAO"%>
<%@page import="model.bean.TipoFuncionario"%>

<%
    TipoFuncionarioDAO obTipoFuncionarioDAO = new TipoFuncionarioDAO();
    List<TipoFuncionario> listaTipoFuncionario;
    listaTipoFuncionario = obTipoFuncionarioDAO.listar();
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastro Funcionário</title>
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationPassword.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
    </head>
    <body>
        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--================ div logo-->
        <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->

        <!--div Conteudo-->
        <div>
            <form action="ControllerFuncionario" method="POST">

                <div class="col-xs-12 col-sm-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                           <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4>Cadastro de Funcionário</h4></div>
                        <div class="fix-panel-body panel-body">

                            <!--=========== Inicio dos campos-->

                            <div class="col-xs-12">
                                <span id="sprytextfield1">
                                    <label for="inNome">Nome:</label>
                                    <input type="text" name="inNome" id="inNome" required>
                                    <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                </span> 
                            </div>

                            <div class="col-xs-12 col-sm-4">
                                <span id="spryselect1">
                                    <label for="selTipoFuncionario">Tipo Funcionário:</label>
                                    <select name="selTipoFuncionario" id="selTipoFuncionario" required="">
                                        <option value="" selected disabled>Selecione Tipo</option>
                                        <%
                                            /*So para quebrar*/
                                            for (int index = 0; index < listaTipoFuncionario.size(); index++) {
                                        %>
                                        <option value="<%=listaTipoFuncionario.get(index).getTipoFuncionarioCodigo()%>"><%=listaTipoFuncionario.get(index).getTipoFuncionarioDescricao()%></option>
                                        <%}%>
                                    </select>
                                    <span class="selectRequiredMsg">Selecione um item.</span>
                                </span>
                            </div>


                            <div class="row">
                                <div class="col-xs-12 col-sm-7">
                                    <span id="sprytextfield2">
                                        <label for="inEmail">@ E-mail:</label>
                                        <input type="email" name="inEmail" id="inEmail" required>
                                        <span class="sobreescrito"><span class="bold">Exemplo: </span>exemplo@servidor.com</span><br>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        <span class="textfieldMinCharsMsg">Número mínimo de caracteres não atendido.</span>
                                    </span>
                                </div>
                            </div>


                            <div class="row">
                                <!--================== fieldset usuario-->
                                <fieldset>
                                    <legend>Usuário</legend>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-4">
                                            <span id="sprytextfield3">
                                                <label class="fix-fielset-label">Login:</label>
                                                <input type="text" name="inLogin" id="inLogin">
                                                <span class="sobreescrito">No mínimo 4 caracteres</span><br>
                                                <span class="textfieldMinCharsMsg"><br>Número mínimo de caracteres não atendido.</span>
                                                <span class="textfieldMaxCharsMsg"><br>Número mínimo de caracteres excedido.</span>
                                                <span class="textfieldRequiredMsg"><br>Um valor é necessário.</span>
                                            </span>
                                        </div>

                                        <div class="col-xs-12 col-sm-4">
                                            <span id="sprypassword1">
                                                <label class="fix-fielset-label">Senha:</label>
                                                <input type="password" name="inSenha" id="inSenha" autocomplete="off">
                                                <span class="sobreescrito">No mínimo 6 caracteres</span>
                                                <span class="passwordMinCharsMsg"><br>Número mínimo de caracteres não atendido.</span>
                                                <span class="passwordRequiredMsg"><br>Um valor é necessário.</span>
                                            </span>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <!--usuário ===========-->

                            <div class="row">
                                <fieldset>
                                    <legend>Telefones:</legend>
                                    <div class="col-xs-3 col-sm-2 col-lg-1" >
                                        <span id="sprytextfield6">
                                            <label class="fix-fielset-label">DDD:</label>
                                            <input type="text" name="inDddFixo" id="inDddFixo" >
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>

                                    <div class="col-xs-9 col-sm-3">
                                        <span id="sprytextfield4" >
                                            <label class="fix-fielset-label">
                                                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:
                                            </label>
                                            <input type="text" name="inTelefoneFixo" id="inTelefoneFixo" >
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>

                                    <div class="col-xs-3 col-sm-2 col-lg-1">
                                        <span id="sprytextfield7">
                                            <label class="fix-fielset-label">DDD:</label>
                                            <input type="text" name="inDddCelular" id="inDddCelular">
                                            <span class="textfieldInvalidFormatMsg">Formato inválidoo.</span>
                                        </span>
                                    </div>

                                    <div class="col-xs-9 col-sm-3">
                                        <span id="sprytextfield5">
                                            <label class="fix-fielset-label" for="inTelefoneCelular">
                                                <span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:
                                            </label>
                                            <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" >
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>
                                </fieldset>
                            </div>
                            <!--Fim dos Campos =========================-->

                            <!--=========== Area dos botoes-->
                            <input type="hidden" name="pagina" value="cadaFuncionario"/>
                            <div>
                                <%@include file="pdrBtnSalvarInferior.jsp" %>
                            </div>

                            <!--Area dos botoes =======================-->

                        </div>  <!-- Painel Body    ==============-->
                    </div>  <!--Painel          ==============--> 
                </div>               
            </form>
        </div> <!-- Div Conteudo -->

        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "email", {useCharacterMasking: true, minChars: 10});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", {minChars: 4, maxChars: 20});
            var sprypassword1 = new Spry.Widget.ValidationPassword("sprypassword1", {minChars: 6});
            var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "phone_number", {format: "phone_custom", pattern: "000", useCharacterMasking: true, isRequired: false});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "phone_number", {format: "phone_custom", pattern: "0000-0000", useCharacterMasking: true, isRequired: false});
            var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "phone_number", {format: "phone_custom", pattern: "000", useCharacterMasking: true, isRequired: false});
            var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "phone_number", {format: "phone_custom", pattern: "00000-0000", useCharacterMasking: true, isRequired: false});
            var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
        </script>
    </body>
</html>