<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Racao"%>
<%@page import="model.dao.RacaoDAO"%>
<%@page import="model.bean.Fornecedor"%>
<%@page import="model.dao.FornecedorDAO"%>
<%@page import="model.bean.FornecedorHasRacao"%>
<%@page import="model.dao.FornecedorHasRacaoDAO"%>
<%
    Racao obRacao = new Racao();
    RacaoDAO obRacaoDAO = new RacaoDAO();

    Fornecedor obFornecedor = new Fornecedor();
    FornecedorDAO obFornecedorDAO = new FornecedorDAO();

    List<FornecedorHasRacao> listaFornecedorHasRacao = new ArrayList<FornecedorHasRacao>();
    FornecedorHasRacaoDAO obFornecedorHasRacaoDAO = new FornecedorHasRacaoDAO();

    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    listaFornecedorHasRacao = obFornecedorHasRacaoDAO.listarPorRacao(obRacao);

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Fornecedores da Ração: <%=obRacao.getRacaoNome()%></title>     
        <%@include file="importsCSS.jsp" %>
        <%@include file="importsJS.jsp" %>      

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
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 min-640px-margin-top-2em max-640px-margin-top-1em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <div class="panel-div-close-button text-right">
                            <a href="principal.jsp"><span class="glyphicon glyphicon-remove cor-preta" aria-hidden="true"></span></a>
                        </div>
                        <h4><span class="bold">Fornecedores da Ração: </span><%=obRacao.getRacaoNome()%></h4>
                        <div class="panel-footer text-left">
                            <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                            <span class="bold">Código da Ração: </span><%=obRacao.getRacaoCodigo()%>
                        </div>
                    </div>
                    <div class="panel-body zerar-padding-top">
                        <!--========================== Area dos Campos-->


                        <!--================= Area dos botoes-->
                        <!--<div class="row-margin col-xs-12 col-sm-7 col-sm-offset-5 ctrl-padding-right">-->
                        <div class="row-margin col-sm-7 col-sm-offset-5">

                            <button type="button" class="btn btn-default col-xs-12 col-sm-7" onclick="location = 'addFornecedorRacao.jsp?codigo=<%=obRacao.getRacaoCodigo()%>'">
                                <span class="glyphicon glyphicon-asterisk"></span> Add Fornecedor Existente
                            </button>
                                
                            <button type="submit" class="btn btn-default col-xs-12 col-sm-5 max-640px-zerar-margin-top" onclick="location = 'cadaFornecedor.jsp'">
                                <span class="glyphicon glyphicon-plus"></span> Novo Fornecedor
                            </button>

                        </div>
                        <!--Area dos botoes ======================-->

                        <!--===================== container-fluid-->
                        <div class="container-fluid ">
                            <table id="tabela" data-page-length="10"   class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna1" />
                                        </th>
                                        <th class="hide-for-small-only">
                                            <input type="text" name="" value="" id="txtColuna2" />
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna3" />
                                        </th>
                                        <th class="hide-for-small-only">
                                            <input type="text" name="" value="" id="txtColuna4" />
                                        </th>
                                    </tr>
                                    <tr>
                                        <th class="col-xs-8 col-sm-3">Fornecedor</th>
                                        <th class="col-xs-2 col-sm-2 hide-for-small-only">Razão Social</th>
                                        <th class="col-xs-4 col-sm-2">CNPJ</th>
                                        <th class="col-xs-2 hide-for-small-only">E-mail</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <%
                                        for (FornecedorHasRacao obFornecedorHasRacao : listaFornecedorHasRacao) {
                                            obFornecedor = obFornecedorDAO.buscarCodigo(obFornecedorHasRacao.getFornecedor().getFornecedorCodigo());
                                    %>
                                    <tr onclick="location = 'infoFornecedor.jsp?codigo=<%=obFornecedor.getFornecedorCodigo()%>'">
                                        <td><%=obFornecedor.getFornecedorNomeFantasia()%></td>
                                        <td class="hide-for-small-only"><%=obFornecedor.getFornecedorRazaSocial()%></td>
                                        <td><%=obFornecedor.getFornecedorCnpj()%></td>
                                        <td class="hide-for-small-only"><%=obFornecedor.getFornecedorEmail()%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                        <!--container-fluid =============-->

                        <!--Area dos Campos ===================-->
                    </div>
                    <!--panel-body ===========-->
                </div>
                <!--panel ===============-->
            </div>
            <!--Painel ==================-->

        </div>


    </body>
</html>
