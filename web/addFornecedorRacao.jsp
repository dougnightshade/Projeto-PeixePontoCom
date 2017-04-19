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

    listaFornecedorHasRacao = obFornecedorHasRacaoDAO.listarPorRacaoNaoFornecedores(obRacao);

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Adicionar Fornecedor da Ração: <%=obRacao.getRacaoNome()%></title>

        <!--==================== import CSS-->
        <%@include file="importsCSS.jsp" %>

        <!--================= imports JS-->
        <%@include file="importsJS.jsp" %>

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

        <!--===================== Controle da Pesquisa ou Listar-->
        <div>
            <!--============== div para a tabela -->
            <!--============== Painel -->
            <div class="col-xs-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a class="panel-div-back-button pointer"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4 class="text-center"><span class="bold ">Adicionar Fornecedor da Ração: </span><%=obRacao.getRacaoNome()%></h4></div>
                    <div class="panel-body">
                        <!--===================== container-fluid-->
                        <!--                        <div class="container-fluid">-->
                        <table id="tabela" data-page-length="10"   class="table table-responsive table-striped table-condensed table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="text" name="" value="" id="txtColuna1" />
                                    </th>
                                    <th class="hide-for-small-only">
                                        <input type="text" name="" value="" id="txtColuna2" />
                                    </th>
                                    <th class="hide-for-small-only">
                                        <input type="text" name="" value="" id="txtColuna3" />
                                    </th>
                                    <th>
                                        <!--<input type="text" name="" value="" id="txtColuna4" />-->
                                    </th>
                                </tr>
                                <tr>
                                    <th class="col-xs-6 col-sm-3">Fornecedor</th>
                                    <th class="col-xs-2 hide-for-small-only">Razão Social</th>
                                    <th class="col-xs-2 hide-for-small-only">CNPJ</th>
                                    <th class="col-xs-2 col-sm-2">Ação</th>
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
                                    <td class="hide-for-small-only"><%=obFornecedor.getFornecedorCnpj()%></td>
                                    <td>
                                        <form action="ControllerRacao" method="POST">
                                            <!--Controle da de qual opção do controle será executada-->
                                            <input type="hidden" name="pagina" value="addFornecedor" />
                                            <!--Codigo dos objetos que serão salvos-->
                                            <input type="hidden" name="inFornecedorCodigo" value="<%=obFornecedor.getFornecedorCodigo()%>">
                                            <input type="hidden" name="inRacaoCodigo" value="<%=obRacao.getRacaoCodigo()%>">

                                            <button type="submit" class="btn btn-info btn-block margin-bottom-0em margin-top-0em">
                                                <span class="glyphicon glyphicon-plus"></span> Adicionar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <!--</div>-->
                        <!--container-fluid =============-->
                    </div>
                    <!--panel-body =============-->
                </div>
                <!--panel ============-->
            </div>
            <!--container-fluid ================-->
        </div>
        <!--Painel ==================-->

    </body>
</html>
