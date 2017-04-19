<%-- 
    Document   : infoCliente
    Created on : 14/08/2016, 16:40:44
    Author     : Thiago
--%>
<%@page import="model.dao.TelefoneClienteDAO"%>
<%@page import="model.bean.TelefoneCliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Informações do Cliente</title>
        <%@include file="importsCSS.jsp" %>
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


        <!--================================ Div Container-->
        <div>
            <form action="ControllerCliente" method="POST">

                <!--============== Painel -->
                <div class="col-xs-12 col-sm-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">

                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4><span class="bold">Informações do Cliente: </span><%=obCliente.getClienteNome()%></h4>
                            <div class="panel-footer text-left">
                                <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                                <span class="bold">Código Cliente: </span><%=obCliente.getClienteCodigo()%>
                            </div>
                        </div>
                        <div class="fix-panel-body panel-body">

                            <!--============ Area dos Campos-->
                            <input type="hidden" name="inCodigo" value="<%=obCliente.getClienteCodigo()%>"/>

                            <div class="row">
                                <div class="col-xs-12 col-sm-11 col-md-11">
                                    <label for="InNome">Nome:</label>
                                    <input type="text" name="inNome" id="InNome" value="<%=obCliente.getClienteNome()%>" readonly="">                         
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12 col-sm-5 col-md-4">                                
                                    <label for="inCNPJ">CNPJ:</label>
                                    <input type="text" name="inCNPJ" id="inCNPJ" value="<%=obCliente.getClienteCnpj()%>" readonly="">                                
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-7">
                                    <label for="inEmail">@ E-mail:</label>
                                    <input type="email" name="inEmail" id="inEmail" value="<%=obCliente.getClienteEmail()%>" readonly="">                                
                                </div>
                            </div>

                            <fieldset>
                                <legend>Endereço:</legend>
                                <div class="row">
                                    <div class="col-xs-9 col-sm-8 col-md-8">
                                        <label class="fix-fielset-label" for="inRua">Rua:</label>
                                        <input type="text" name="inRua" id="inRua" value="<%=obCliente.getClienteEndRua()%>" readonly="">
                                    </div>

                                    <div class="col-xs-3 col-sm-2 col-md-2">
                                        <label class="fix-fielset-label" for="inNumero">Nº:</label>
                                        <input type="text" name="inNumero" id="inNumero" value="<%=obCliente.getClienteEndNumero()%>" readonly="">
                                    </div>
                                </div>

                                <div class="row">   
                                    <div class="col-xs-6 col-sm-5 col-md-5">
                                        <label for="inBairro">Bairro:</label>
                                        <input type="text" name="inBairro" id="inBairro" value="<%=obCliente.getClienteEndBairro()%>" readonly="">
                                    </div>

                                    <div class="col-xs-6 col-sm-3 col-md-3">
                                        <label for="inCep">Cep:</label>
                                        <input type="text" name="inCep" id="inCep" value="<%=obCliente.getClienteEndCep()%>" readonly="">
                                    </div>
                                </div>
                            </fieldset>

                            <div class="row">
                                <fieldset>
                                    <legend>Telefones:</legend> 
                                    <div class="col-xs-3 col-sm-1 col-md-2 col-lg-1">
                                        <label class="fix-fielset-label" for="inDddFixo">DDD:</label>
                                        <input type="text" name="inDddFixo" id="inDddFixo" value="<%=obTelefoneCliente.getTelefoneClienteDddfixo()%>" readonly="">
                                    </div>

                                    <div class="col-xs-9 col-sm-3 col-md-3 col-lg-3">
                                        <label class="fix-fielset-label" for="inTelefoneFixo"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:</label>
                                        <input type="text" name="inTelefoneFixo" id="inTelefoneFixo" value="<%=obTelefoneCliente.getTelefoneClienteFixo()%>" readonly="">
                                    </div>

                                    <div class="col-xs-3 col-sm-1 col-md-2 col-lg-1">                                    
                                        <label class="fix-fielset-label" for="inDddCelular">DDD:</label> 
                                        <input type="text" name="inDddCelular" id="inDddCelular" value="<%=obTelefoneCliente.getTelefoneClienteDddcelular()%>" readonly="">
                                    </div>
                                    <div class="col-xs-9 col-sm-3 col-md-3 col-lg-3">                                    
                                        <label class="fix-fielset-label" for="inTelefoneCelular"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:</label>
                                        <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" value="<%=obTelefoneCliente.getTelefoneClienteCelular()%>" readonly="">
                                    </div>
                                </fieldset>
                            </div>
                            <!--=========== Fim dos Campos-->

                            <!--=========== Area dos botoes Inferiores-->
                            <div class="row margin-top-1em">
                                <div class="col-xs-12 col-sm-4 col-sm-offset-8">
                                    <button type="button" class="btn btn-default btn-block"><span class="glyphicon glyphicon-credit-card"></span> Realizar Venda</button>
                                </div>                                                
                            </div>
                            <!--Area dos botoes Inferiores ==============-->

                        </div><!-- Painel Body -->
                    </div><!--Painel Default-->
                </div><!--Div do Painel-->
            </form>
        </div>

        <%@include file="importsJS.jsp" %>        
    </body>
</html>