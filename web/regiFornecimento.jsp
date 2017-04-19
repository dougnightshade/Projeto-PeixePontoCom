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

    listaFornecedorHasRacao = obFornecedorHasRacaoDAO.listarFornecedoresDaRacao(obRacao);

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro de Fornecedor</title>     
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
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 ctrl-padding-top">
                <div class="panel panel-default">
                    <div class="panel-heading text-center"><h4>Fornecedores da Ração: <%=obRacao.getRacaoNome()%></h4>
                        <div class="panel-footer text-left">
                            <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                            Código da Ração: <%=obRacao.getRacaoCodigo()%>
                        </div>
                    </div>
                    <div class="panel-body zerar-padding-top">
                        <!--========================== Area dos Campos-->


                        <!--================= Area dos botoes-->
                        <div class="row col-sm-5 col-sm-offset-7">
                            <div class="btn-group btn-group-justified">
                                <div class="btn-group">
                                    <button type="button" class="zerar-margin-top btn btn-default btn-block " onclick="location = 'principal.jsp'"><span class="glyphicon glyphicon-floppy-remove"></span> Add Fornecedor Existente</button>
                                </div>
                                <div class="btn-group">
                                    <button type="submit" class="zerar-margin-top btn btn-default btn-block"><span class="glyphicon glyphicon-floppy-disk"></span> Add Novo Fornecedor</button>
                                </div>
                            </div>
                        </div>
                        <!--Area dos botoes ======================-->


                        <!--===================== tabela-->
                        <div class="container-fluid">
                            <table id="tabela" data-page-length="10"   class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna1" />
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna2" />
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna3" />
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna4" />
                                        </th>
                                    </tr>
                                    <tr>
                                        <th class="col-xs-6 col-sm-3">Fornecedor</th>
                                        <th class="col-xs-2">Razão Social</th>
                                        <th class="col-xs-2">CNPJ</th>
                                        <th class="col-xs-2 col-sm-2">E-mail</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <%
                                        for (FornecedorHasRacao obFornecedorHasRacao : listaFornecedorHasRacao) {
                                            obFornecedor = obFornecedorDAO.buscarCodigo(obFornecedorHasRacao.getFornecedor().getFornecedorCodigo());
                                    %>
                                    <tr>
                                        <td><%=obFornecedor.getFornecedorNomeFantasia()%></td>
                                        <td><%=obFornecedor.getFornecedorRazaSocial()%></td>
                                        <td><%=obFornecedor.getFornecedorCnpj()%></td>
                                        <td><%=obFornecedor.getFornecedorEmail()%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>

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
