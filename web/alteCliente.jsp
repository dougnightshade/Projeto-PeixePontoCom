<%-- 
    Document   : alteCliente
    Created on : 14/08/2016, 16:40:44
    Author     : Thiago
--%>
<%@page import="model.dao.TelefoneClienteDAO"%>
<%@page import="model.bean.TelefoneCliente"%>
<%@page import="model.bean.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>

<%
    Cliente obCliente = new Cliente();
    ClienteDAO obClienteDAO = new ClienteDAO();
    obCliente = obClienteDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    TelefoneCliente obTelefoneCliente = new TelefoneCliente();
    TelefoneClienteDAO obTelefoneClienteDAO = new TelefoneClienteDAO();
    obTelefoneCliente = obTelefoneClienteDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alterações do Cliente</title>
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
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

        <!--div Container-->
        <div>
            <form action="ControllerCliente" method="POST">

                <!--============== Painel -->
                <div class="col-xs-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>

                            <h4><span class="bold">Alteração do Cliente: </span><%=obCliente.getClienteNome()%></h4>
                            <div class="panel-footer text-left">
                                <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                                <span class="bold">Código Cliente: </span><%=obCliente.getClienteCodigo()%>
                            </div>
                        </div>
                        <div class="panel-body fix-panel-body">
                            <!--=============== Campos-->
                            <div class="row">
                                <div class="col-xs-12 col-sm-11 col-md-11">
                                    <span id="sprytextfield2">
                                        <label for="inNome">Nome:</label>
                                        <input type="text" name="inNome" id="inNome" value="<%=obCliente.getClienteNome()%>" required>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                    </span>
                                </div>
                            </div>

                            <input type="hidden" name="inCodigo" value="<%=obCliente.getClienteCodigo()%>">

                            <div class="row">
                                <div class="col-xs-12 col-sm-5 col-md-4">
                                    <span id="sprytextfield1">
                                        <label for="inCNPJ">CNPJ:</label>
                                        <input type="text" name="inCNPJ" id="inCNPJ" value="<%=obCliente.getClienteCnpj()%>" required>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                        <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-7">    
                                    <span id="sprytextfield3">
                                        <label for="inEmail">@ E-mail:</label>
                                        <input type="email" name="inEmail" id="inEmail" value="<%=obCliente.getClienteEmail()%>" required>
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
                                            <input type="text" name="inRua" id="inRua" value="<%=obCliente.getClienteEndRua()%>">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            <span class="textfieldMaxCharsMsg">Número máximo de caracteres excedido.</span>
                                        </span>
                                    </div>

                                    <div class="col-xs-3 col-sm-2 col-md-2">
                                        <span id="sprytextfield9">
                                            <label class="fix-fielset-label" for="inNumero">Nº:</label>
                                            <input type="text" name="inNumero" id="inNumero" value="<%=obCliente.getClienteEndNumero()%>">
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldMaxCharsMsg">Número máximo de caracteres excedido.</span>
                                        </span>
                                    </div>
                                </div>

                                <div class="row">   
                                    <div class="col-xs-6 col-sm-5 col-md-5">
                                        <span id="sprytextfield10">
                                            <label for="inBairro">Bairro:</label>
                                            <input type="text" name="inBairro" id="inBairro" value="<%=obCliente.getClienteEndBairro()%>">
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldMaxCharsMsg">Número máximo de caracteres excedido.</span>
                                        </span>
                                    </div>

                                    <div class="col-xs-6 col-sm-3 col-md-3">
                                        <span id="sprytextfield11">
                                            <label for="inCep">Cep:</label>
                                            <input type="text" name="inCep" id="inCep" value="<%=obCliente.getClienteEndCep()%>">
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>
                                </div>
                            </fieldset>

                            <div class="row">
                                <fieldset>
                                    <legend>Telefones:</legend>
                                    <div class="col-xs-3 col-sm-1 col-md-2">
                                        <span id="sprytextfield6">
                                            <label class="fix-fielset-label" for="inDddFixo">DDD:</label>
                                            <input type="text" name="inDddFixo" id="inDddFixo" value="<%=obTelefoneCliente.getTelefoneClienteDddfixo()%>">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span> 
                                    </div>
                                    <div class="col-xs-9 col-sm-3 col-md-3">
                                        <span id="sprytextfield4">
                                            <label class="fix-fielset-label" for="inTelefoneFixo"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:</label>
                                            <input type="text" name="inTelefoneFixo" id="inTelefoneFixo" value="<%=obTelefoneCliente.getTelefoneClienteFixo()%>">
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>

                                    <div>
                                        <div class="col-xs-3 col-sm-1 col-md-2">
                                            <span id="sprytextfield7">
                                                <label class="fix-fielset-label" for="inDddCelular">DDD:</label>
                                                <input type="text" name="inDddCelular" id="inDddCelular" value="<%=obTelefoneCliente.getTelefoneClienteDddcelular()%>">
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                                    
                                            </span> 
                                        </div>

                                        <div class="col-xs-9 col-sm-3 col-md-3">
                                            <span id="sprytextfield5">
                                                <label class="fix-fielset-label" for="inTelefoneCelular"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:</label>
                                                <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" value="<%=obTelefoneCliente.getTelefoneClienteCelular()%>">
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            </span>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>

                            <!--Area dos Campos ===================-->

                            <!--=========== Area dos botoes Inferiores Médios-->
                            <div class="row margin-top-1em">
                                <div class="col-sm-6 col-md-6"></div>
                                <div class="col-xs-12 col-sm-3 col-md-3">
                                    <button type="button" class="btn btn-default btn-block" onclick="location = 'infoCliente.jsp?codigo=<%=obCliente.getClienteCodigo()%>'"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</button>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3">
                                    <input type="hidden" name="pagina" value="alteCliente"/>
                                    <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
                                </div>
                            </div>
                            <!--Area dos botoes Inferiores ==============-->
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
            var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "custom", {useCharacterMasking: true, pattern: "000", isRequired: false});
            var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "custom", {pattern: "000", useCharacterMasking: true, isRequired: false});
            var sprytextfield8 = new Spry.Widget.ValidationTextField("sprytextfield8", "none", {maxChars: 120});
            var sprytextfield9 = new Spry.Widget.ValidationTextField("sprytextfield9", "none", {maxChars: 6});
            var sprytextfield10 = new Spry.Widget.ValidationTextField("sprytextfield10", "none", {maxChars: 45});
            var sprytextfield11 = new Spry.Widget.ValidationTextField("sprytextfield11", "zip_code", {format: "zip_custom", pattern: "00.000-000", useCharacterMasking: true});
        </script>
    </body>
</html>