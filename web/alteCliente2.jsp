<%@page import="model.bean.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.dao.TelefoneClienteDAO"%>
<%@page import="model.bean.TelefoneCliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

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
        <title>Alteração do Cliente</title>
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
                <!--=========== Area dos botoes Superiores-->
                <%@include file="pdrBtnSalvarSuperior.jsp" %>
                <!--=========== Area dos botoes Superiores--> 

                <!--============== Painel -->
                <div class="col-xs-12 col-sm-12 col-md-7 ctrl-padding-top">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center"><h4>Alteração do Cliente: <%=obCliente.getClienteNome()%></h4></div>
                        <div class="panel-body">
                            <div class="container-fluid">
                                <!--====== Campos-->

                                <input type="hidden" name="inCodigo" value="<%=obCliente.getClienteCodigo()%>" /> 

                                <div class="row">
                                    <div class="col-xs-12 col-sm-11 col-md-11">
                                        <span id="sprytextfield2">
                                            <label for="InNome">Nome</label>
                                            <input type="text" name="inNome" id="InNome" value="<%=obCliente.getClienteNome()%>" required="">
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>                                    
                                        </span> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-3 col-md-3">
                                        <span id="sprytextfield1">
                                            <label for="inCNPJ">CNPJ</label>
                                            <input type="text" name="inCNPJ" id="inCNPJ" value="<%=obCliente.getClienteCnpjcpf()%>" required="">
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-5 col-md-5">    
                                        <span id="sprytextfield3">
                                            <label for="inEmail">E-mail</label>
                                            <input type="email" name="inEmail" id="inEmail" value="<%=obCliente.getClienteEmail()%>" required="">
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            <span class="textfieldMinCharsMsg">Número mínimo de caracteres não atendido.</span>                                    
                                        </span>
                                    </div>
                                </div>

                                <div class="row">
                                    <fieldset><legend>Telefones:</legend>
                                        <div class="col-xs-4 col-sm-1 col-md-1">
                                            <span id="sprytextfield6">
                                                <label>Prefixo
                                                    <input type="text" name="inPrefixoFixo" value="<%=obTelefoneCliente.getTelefoneClientePrefixoFixo()%>" id="inPrefixoFixo" required="" >
                                                </label>
                                                <span class="textfieldRequiredMsg">Um valor é necessário.</span><span class="textfieldInvalidFormatMsg">Formato inválido.</span></span> 
                                        </div>
                                        <div class="col-xs-8 col-sm-3 col-md-3">
                                            <span id="sprytextfield4">
                                                <label for="inTelefoneFixo">Fixo</label>
                                                <input type="text" name="inTelefoneFixo" value="<%=obTelefoneCliente.getTelefoneClienteFixo()%>" id="inTelefoneFixo" required="">
                                                <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                            </span>
                                        </div>

                                        <div class="col-xs-4 col-sm-1 col-md-1">
                                            <span id="sprytextfield7">
                                                <label>Prefixo
                                                    <input type="text" name="inPrefixoCelular" id="inPrefixoCelular" value="<%=obTelefoneCliente.getTelefoneClientePrefixoCelular()%>" required="">
                                                </label>
                                                <span class="textfieldRequiredMsg">Um valor é necessário.</span><span class="textfieldInvalidFormatMsg">Formato inválido.</span></span> 
                                        </div>
                                        <div class="col-xs-8 col-sm-3 col-md-3">
                                            <span id="sprytextfield5">
                                                <label for="inTelefoneCelular">Celular</label>
                                                <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" value="<%=obTelefoneCliente.getTelefoneClienteCelular()%>" required="">
                                                <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                            </span>
                                        </div>
                                    </fieldset>
                                </div>
                                <!--====== Campos-->
                                <!--=========== Area dos botoes Inferiores-->
                                <div class="row">
                                    <div class="show-for-medium">
                                        <div class="col-sm-8 col-md-8"></div>

                                        <div class="col-sm-2 col-md-2">
                                            <button type="button" class="btn btn-default btn-block" onclick="location = 'infoCliente.jsp?codigo=<%=obCliente.getClienteCodigo()%>'"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</button>
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="hidden" name="pagina" value="alteCliente">
                                            <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>   
                                        </div>                   
                                    </div>
                                </div>
                                <!--Area dos botoes Inferiores ==============-->
                            </div><!-- Container Fluid-->
                        </div><!-- Painel Body -->
                        
                        <div class="panel-footer">
                            <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                            Código Cliente: <%=obCliente.getClienteCodigo()%>
                        </div>
                    </div>
                </div>
                <!--Painel ==================-->
            </form>
        </div>

        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "custom", {useCharacterMasking: true, pattern: "00.000.000/0000-00"});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "email", {minChars: 10});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "phone_number", {format: "phone_custom", pattern: "0000-0000", useCharacterMasking: true});
            var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "phone_number", {format: "phone_custom", pattern: "00000-0000", useCharacterMasking: true});
            var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "custom", {useCharacterMasking: true, pattern: "(00)"});
            var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "custom", {pattern: "(00)", useCharacterMasking: true});
        </script>
    </body>
</html>