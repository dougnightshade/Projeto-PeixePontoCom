<%-- 
    Document   : infoFornecedor
    Created on : 24/09/2016, 19:13:11
    Author     : Thiago
--%>

<%@page import="model.dao.TelefoneFornecedorDAO"%>
<%@page import="model.bean.TelefoneFornecedor"%>
<%@page import="model.dao.FornecedorDAO"%>
<%@page import="model.bean.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Fornecedor obFornecedor = new Fornecedor();
    FornecedorDAO obFornecedorDAO = new FornecedorDAO();
    obFornecedor = obFornecedorDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    TelefoneFornecedor obTelefoneFornecedor = new TelefoneFornecedor();
    TelefoneFornecedorDAO obTelefoneFornecedorDAO = new TelefoneFornecedorDAO();

%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Informações Fornecedor</title>
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

        <div><!-- Div Conteiner-->
            <form action="ControllerFornecedor" method="POST">


                <!--============== Painel -->
                <div class="col-xs-12 col-sm-12 col-md-7 ctrl-padding-top">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center"><h4>Informações do Fornecedor: <%=obFornecedor.getFornecedorNomeFantasia()%></h4>
                            <div class="panel-footer text-left">
                                <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                                Código Fornecedor: <%=obFornecedor.getFornecedorCodigo()%>
                            </div>
                        </div>
                        <div class="fix-panel-body panel-body">


                            <!--============ Area dos Campos-->
                            <input type="hidden" name="inCodigo" value="<%=obFornecedor.getFornecedorCodigo()%>">

                            <div class="row">
                                <div class="col-xs-12">
                                    <label for="inNome">Nome Fantasia:</label>
                                    <input type="text" name="inNomeFantasia" id="inNomeFantasia" value="<%=obFornecedor.getFornecedorNomeFantasia()%>" disabled="">
                                </div>

                                <div class="col-xs-12">
                                    <label for="inNome">Razão Social</label>
                                    <input type="text" name="inRazaoSocial" id="inRazaoSocial" value="<%=obFornecedor.getFornecedorRazaSocial()%>" disabled="">
                                </div>
                            </div>


                            <div class="row">

                                <div class="col-xs-12 col-sm-4">
                                    <label for="inCNPJ">CNPJ:</label>
                                    <input type="text" name="inCNPJ" id="inCNPJ" value="<%=obFornecedor.getFornecedorCnpj()%>" disabled="">
                                </div>

                                <div class="col-xs-12 col-sm-7">
                                    <label for="inEmail">@ E-mail:</label>
                                    <input type="email" name="inEmail" id="inEmail" value="<%=obFornecedor.getFornecedorEmail()%>" disabled="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <label for="inComentario">Comentário:</label>
                                    <textarea name="atComentarios" readonly="readonly"><%=obFornecedor.getFornecedorComentarios()%>
                                    </textarea>
                                    <!--<input type="text" name="inComentario" id="inComentario" value="<%=obFornecedor.getFornecedorComentarios()%>" disabled="">-->
                                </div>
                            </div>

                            <fieldset>
                                <legend>Endereço:</legend>
                                <div class="row">
                                    <div class="col-xs-9 col-sm-8 col-md-8">
                                        <label class="fix-fielset-label" for="inRua">Rua:</label>
                                        <input type="text" name="inRua" id="inRua" value="<%=obFornecedor.getFornecedorEndRua()%>" disabled="">
                                    </div>

                                    <div class="col-xs-3 col-sm-2 col-md-2">
                                        <label class="fix-fielset-label" for="inNumero">Nº:</label>
                                        <input type="text" name="inNumero" id="inNumero" value="<%=obFornecedor.getFornecedorEndNumero()%>" disabled="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-6 col-sm-5 col-md-5">
                                        <label for="inBairro">Bairro:</label>
                                        <input type="text" name="inBairro" id="inBairro" value="<%=obFornecedor.getFornecedorEndBairro()%>" disabled="">
                                    </div>

                                    <div class="col-xs-6 col-sm-3 col-md-3">
                                        <label for="inCep">CEP:</label>
                                        <input type="text" name="inCep" id="inCep" value="<%=obFornecedor.getFornecedorEndCep()%>" disabled="">
                                    </div>
                                </div> 
                            </fieldset>

                            <div class="row">
                                <fieldset>
                                    <legend>Telefones:</legend>
                                    <div class="col-xs-4 col-sm-1 col-md-1">
                                        <label class="fix-fielset-label" for="inPrefixoFixo">DDD:</label>
                                        <input type="text" name="inPrefixoFixo" id="inDDDFixo" value="<%=obTelefoneFornecedor.getTelefoneFornecedorDddfixo()%>" disabled="">
                                    </div>
                                    <div class="col-xs-8 col-sm-2 col-md-2">
                                        <label class="fix-fielset-label" for="inTelefoneFixo"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:</label>
                                        <input type="text" name="inTelefoneFixo" id="inTelefoneFixo" value="<%=obTelefoneFornecedor.getTelefoneFornecedorFixo()%>" disabled="">
                                    </div>

                                    <div class="col-xs-4 col-sm-1">
                                        <label class="fix-fielset-label" for="inPrefixoCelular">DDD:</label>
                                        <input type="text" name="inPrefixoCelular" id="inDDDCelular" value="<%=obTelefoneFornecedor.getTelefoneFornecedorDddcelular()%>" disabled="">
                                    </div>
                                    <div class="col-xs-8 col-sm-2">
                                        <label class="fix-fielset-label" for="inTelefoneCelular"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:</label>
                                        <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" value="<%=obTelefoneFornecedor.getTelefoneFornecedorCelular()%>" disabled="">
                                    </div>                                        
                                </fieldset>
                            </div>
                            <!--Fim dos Campos ===================-->

                            <!--=========== Area dos botoes Inferiores-->
                            <div class="row">
                                <div class="show-for-medium">   

                                    <div class="col-sm-3 col-sm-offset-6">
                                        <button type="button" class="btn btn-default btn-block" onclick="javascript:window.history.go(-1)">
                                            <i class="fa fa-reply" aria-hidden="true"></i> Voltar
                                        </button>
                                    </div>
                                    <div class="col-sm-3">
                                        <form action="ControllerRacao" method="POST">
                                            <input type="hidden" name="pagina" value="addFornecedor" />
                                            <input type="hidden" name="inFornecedorCodigo" value="<%=obFornecedor.getFornecedorCodigo()%>">
                                            <input type="hidden" name="inRacaoCodigo" value="<%=obRacao %>">
                                            <button type="button" class="btn btn-default btn-block">
                                                <span class="glyphicon glyphicon-transfer"></span> Adicionar
                                            </button>   
                                        </form>
                                    </div>                    
                                </div>

                                <!--====== Botões para telas pequenas -->
                                <div>
                                    <div class="btn-group btn-group-justified show-for-small-only">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default" onclick="location = 'alteFornecedor.jsp?codigo=<%=obFornecedor.getFornecedorCodigo()%>'"><span class="glyphicon glyphicon-pencil"></span> Alterar</button>
                                        </div>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-trash"></span> Excluir</button>
                                        </div>
                                    </div>
                                </div>
                                <!--====== Botões para telas pequenas -->

                            </div>
                            <!--Area dos botoes Inferiores ==============-->

                        </div>
                        <!--  Painel Body===========-->
                    </div>
                    <!--  Painel ==================-->
                </div>
            </form>
        </div>
        <%@include file="importsJS.jsp" %>
    </body>
</html>
