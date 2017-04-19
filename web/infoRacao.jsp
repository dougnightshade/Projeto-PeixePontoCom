<%-- 
    Document   : infoRacao
    Created on : 14/08/2016, 16:40:44
    Author     : Owner
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Racao"%>
<%@page import="model.dao.RacaoDAO"%>
<%@page import="model.bean.Fornecedor"%>
<%@page import="model.dao.FornecedorDAO"%>
<%@page import="model.bean.Fornece"%>
<%@page import="model.dao.ForneceDAO"%>
<%
    Racao obRacao = new Racao();
    RacaoDAO obRacaoDAO = new RacaoDAO();

    Fornecedor obFornecedor = new Fornecedor();
    FornecedorDAO obFornecedorDAO = new FornecedorDAO();

    Fornece obFornece = new Fornece();
    ForneceDAO obForneceDAO = new ForneceDAO();
    List<Fornece> listaFornecimentosPorRacao;

    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    listaFornecimentosPorRacao = obForneceDAO.fornecimentosPorRacao(obRacao.getRacaoCodigo());

%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Informações da Ração</title>     
        <%@include file="importsCSS.jsp" %>     
    </head>
    <body>

        <!-- Menu-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!-- Menu-->        

        <!--================ Modal-->
        <div class="modal fade" id="myModalFornecededores" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><span class="bold">Lista de Fornecedores</span></h4>
                    </div>
                    <div class="modal-body">

                        <table id="tabela" data-page-length="10"   class="table table-responsive table-striped table-condensed table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="col-xs-9">Fornecedor</th>
                                    <th class="col-xs-9">Qtd</th>
                                    <th class="col-xs-2">Custo</th>
                                    <th class="col-xs-2">Custo</th>
                                    <th class="col-xs-1">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                  /**/
                                    for (int index = 0; index < listaFornecimentosPorRacao.size(); index++) {
                                        obFornecedor = obFornecedorDAO.buscarCodigo(listaFornecimentosPorRacao.get(index).getFornecedor().getFornecedorCodigo());
                                %>
                                <tr>
                                    <td><%=obFornecedor.getFornecedorNomeFantasia()%></td>
                                    <td><%=listaFornecimentosPorRacao.get(index).getForneceQtdRacao()%><span class="sobreescrito bold">kg</span></td>
                                    <td><%=(listaFornecimentosPorRacao.get(index).getForneceCustoDeCompra().multiply(listaFornecimentosPorRacao.get(index).getForneceQtdRacao()).setScale(2)).toString().replace(".", ",") %></td>
                                    <td><%=obFornecedor.getFornecedorCnpj()%></td>
                                    <td class="text-center">
                                        <form action="ControllerRacao" method="POST">
                                            <input type="hidden" name="pagina" value="exclFornecedorHasRacao" />
                                            <input type="hidden" name="inRacaoCodigo" value="<%=obRacao.getRacaoCodigo()%>" />
                                            <input type="hidden" name="inFornecedorHasRacaoCodigo" value="<% %>" />
                                            <button disabled="" type="submit" class="btn btn-default btn-block margin-bottom-0em margin-top-0em">
                                                 <i class="fa fa-pagelines"></i> Comprar Ração
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>

                    </div>
                    <!--                    <div class="modal-footer">
                    
                                            ================= Area dos botoes
                                            <div class="row">
                    
                                                <button type="button" class="btn btn-default col-xs-6" onclick="location = 'addFornecedorRacao.jsp?codigo=<%%>'">
                                                    <span class="glyphicon glyphicon-asterisk"></span> Add Fornecedor Existente
                                                </button>
                    
                                                <button type="button" class="btn btn-default col-xs-6" onclick="location = 'cadaFornecedor.jsp'">
                                                    <span class="glyphicon glyphicon-plus"></span> Novo Fornecedor
                                                </button>
                    
                                            </div>
                                            Area dos botoes ======================
                    
                                        </div>-->
                </div>
            </div>
        </div>
        <!--================ Modal-->

        <!--================ div logo-->
        <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->

        <!--div Conteudo-->
        <div>
            <div class="col-xs-12 col-sm-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4>Informações da Ração: <%= obRacao.getRacaoNome()%></h4>
                        <div class="panel-footer text-left">
                            <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                            <span class="bold">Código da Ração: </span><%=obRacao.getRacaoCodigo()%>
                        </div>
                    </div>
                    <div class="fix-panel-body panel-body">
                        <!-- Area dos campos==-->

                        <input type="hidden" name="inCodigo" value="<%=obRacao.getRacaoCodigo()%>">

                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <label for="inNome">Ração:</label>
                                <input type="text" name="inNome" id="inNome" readonly="" value="<%= obRacao.getRacaoNome()%>">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <label for="inEstoque">Estoque: <span class="sobreescrito">(KG)</span></label> 
                                <input type="text" name="inEstoque" id="inEstoque" readonly="" value="<%=obRacao.getRacaoEstoque()%>">
                            </div>

                            <div class="col-xs-6 col-sm-3 col-md-3">
                                <label for="inPreco">Preço: <span class="sobreescrito">(KG)</span></label>
                                <input type="text" name="inPreco" id="inPreco" readonly="" value="<%=obRacao.getRacaoPrecoAtual()%>">
                            </div>

                            <div class="col-xs-6 col-sm-3 col-md-3">
                                <label for="inProteina">Proteina<span class="sobreescrito">(%)</span>:</label>
                                <input type="text" name="inProteina" id="inProteina" readonly="" value="<%=obRacao.getRacaoProteina()%>">
                            </div>
                        </div>
                        <!-- Fim Area dos campos==-->

                        <!--=========== Area dos botoes-->
                        <div class="row margin-top-1em">
                            <div class="col-xs-12 col-sm-4 col-sm-offset-3">
                                <button type="button" class="btn btn-default btn-block" data-toggle="modal" data-target="#myModalFornecededores">
                                    <i class="fa fa-archive"></i> Fornecimentos
                                </button>
                            </div>
                            <div class="col-xs-12 col-sm-5">
                                <button disabled="" type="button" class="btn btn-default btn-block" onclick="location = 'registrarEntradaRacao.jsp?codigo=<%=obRacao.getRacaoCodigo()%>'">
                                     <i class="fa fa-pagelines"></i> Registrar Entrada Ração
                                </button>
                            </div>
                        </div>
                        <!--Area dos botoes ==============-->
                    </div><!-- Painel Body-->
                </div><!-- Painel-->
            </div>
            <!--panel container principal ==============-->

        </div>
        <%@include file="importsJS.jsp" %>
    </body>
</html>
