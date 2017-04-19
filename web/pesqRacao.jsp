<%-- 
    Document   : PesqRacao
    Created on : 14/08/2016, 16:40:44
    Author     : Douglas
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Racao"%>
<%@page import="model.dao.RacaoDAO"%>

<%
    RacaoDAO obRacaoDAO = new RacaoDAO();
    List<Racao> listaRacao = new ArrayList<Racao>();

    /*Listar automaticamente todas gaiolas existentes*/
    listaRacao = obRacaoDAO.listar();

%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pesquisa Ração</title>

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
        <div class="col-xs-12 col-md-4 logo-fix">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->
        <!--===================== Controle da Pesquisa ou Listar-->
        <div>
            <!--============== div para a tabela -->
            <!--============== Painel -->
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4 class="bold">Lista de Rações</h4></div>
                    <div class="panel-body">
                        <div>
                            <table id="tabela" data-page-length="10"   class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <!--======================= Filtros-->
                                    <tr>
                                        <th></th>
                                        <th>
                                            <input class="hide-for-small-only" type="text" name="" value="" id="txtColuna1"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna2"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna3" />
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna4" />
                                        </th>
                                        <th></th>
                                    </tr>

                                    <!--========================= Titulos-->
                                    <tr>
                                        <th class="col-xs-1 text-center">Cód.</th>
                                        <th>Nome</th>
                                        <th class="col-xs-2 text-center">Preço Atual</th>
                                        <th class="col-xs-2 text-center">Proteina</th>
                                        <th class="col-xs-2 text-center">Estoque</th>
                                        <th class="col-xs-1 text-center">Ações</th>
                                    </tr>


                                </thead>
                                <tbody>

                                    <%  /*so para quebrar*/
                                        for (int index = 0; index < listaRacao.size(); index++) {
                                    %>

                                    <tr>

                                        <td class="text-center">
                                            <button class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" onclick="location = 'infoRacao.jsp?codigo=<%=listaRacao.get(index).getRacaoCodigo()%>'">
                                                <span class="glyphicon glyphicon-exclamation-sign"></span> Infor<br><%=listaRacao.get(index).getRacaoCodigo()%>
                                            </button>
                                        </td>
                                        <td><%=listaRacao.get(index).getRacaoNome()%></td>
                                        <td class="text-center"><%=listaRacao.get(index).getRacaoPrecoAtual()%></td>
                                        <td class="text-center"><%=listaRacao.get(index).getRacaoProteina()%></td>
                                        <td class="text-center"><%=listaRacao.get(index).getRacaoEstoque()%></td>
                                        <td class="text-center">
                                            <button class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" onclick="location = 'alteCliente.jsp?codigo=<%=listaRacao.get(index).getRacaoCodigo()%>'" >
                                                <span class="glyphicon glyphicon-pencil"></span> Alterar
                                            </button>

                                            <!--================ Modal-->
                                            <div class="modal fade" id="myModal<%=listaRacao.get(index).getRacaoCodigo()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">Exclusão</h4>
                                                        </div>
                                                        <div class="modal-body">

                                                            Deseja realmente excluir?

                                                        </div>
                                                        <div class="modal-footer padding-top-0em padding-bottom-0em">
                                                            <form method="POST" action="ControllerRacao">

                                                                <div class="col-sm-8 col-md-8"></div>
                                                                <div class="col-xs-6 col-sm-2 col-md-2">
                                                                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal"><i class="glyphicon glyphicon-thumbs-down"></i> Não</button>
                                                                </div>
                                                                <div class="col-xs-6 col-sm-2 col-md-2">
                                                                    <input type="hidden" name="inCodigo" value="<%=listaRacao.get(index).getRacaoCodigo()%>">
                                                                    <input type="hidden" name="pagina" value="exclRacao">
                                                                    <button type="submit" name="btnExcluir" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-thumbs-up"></i> Sim</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--================ Modal-->

                                            <button type="button" class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" data-toggle="modal" data-target="#myModal<%=listaRacao.get(index).getRacaoCodigo()%>">
                                                <span class="glyphicon glyphicon-trash"></span> Excluir
                                            </button>
                                        </td>

                                    </tr>
                                    <%}%> 
                                </tbody>
                            </table>

                        </div>
                        <!--div para a tabela ==================-->

                    </div>
                    <!--panel-body =============-->
                </div>
                <!--panel ============-->
            </div>
            <!--container-fluid ================-->
        </div>
        <!--Painel ==================-->
</html>
