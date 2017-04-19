<%-- 
    Document   : pesqFornecedor
    Created on : 24/09/2016, 19:05:57
    Author     : Thiago
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.Fornecedor"%>
<%@page import="model.dao.FornecedorDAO"%>
<%@page import="model.bean.TelefoneFornecedor"%>
<%@page import="model.dao.TelefoneFornecedorDAO"%>

<%
    FornecedorDAO obFornecedorDAO = new FornecedorDAO();
    List<Fornecedor> listaFornecedor = obFornecedorDAO.listar();

    TelefoneFornecedorDAO obTelefoneFornecedorDAO = new TelefoneFornecedorDAO();
    List<TelefoneFornecedor> listaTelefoneFornecedor;
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pesquisa Fornecedor</title>

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
        <div class="col-xs-12 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->
        <!--===================== Controle da Pesquisa ou Listar-->
        <div>
            <!--============== div para a tabela -->

            <!--============== Painel -->
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4 class="text-center">Lista de Fornecedores</h4></div>
                    <div class="panel-body">
                        <div>
                            <table id="tabela" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <td>
                                            <!--<input type="text" name="" value="" id="txtColuna1"/>-->
                                        </td>
                                        <td class="show-for-medium">
                                            <input type="text" name="" value="" id="txtColuna1"/>
                                        </td>
                                        <td>
                                            <input type="text" name="" value="" id="txtColuna2"/>
                                        </td>
                                        <td>
                                            <input type="text" name="" value="" id="txtColuna3"/>
                                        </td>
                                        <td>
                                            <input type="text" name="" value="" id="txtColuna3"/>
                                        </td>
                                        <td>
                                            <!--<input type="text" name="" value="" id="txtColuna3"/>-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="col-xs-1">Cód.</th>
                                        <th class="">Nome</th>
                                        <th>CNPJ</th>
                                        <th>E-mail</th>
                                        <th>Celular 1</th>
                                        <th class="col-xs-1">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%  /*so para quebrar*/
                                        for (int index = 0; index < listaFornecedor.size(); index++) {
                                            listaTelefoneFornecedor = obTelefoneFornecedorDAO.listarPorFornecedor(listaFornecedor.get(index).getFornecedorCodigo());
                                    %>
                                    <tr>
                                        <td>
                                            <button class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" onclick="location = 'infoFornecedor.jsp?codigo=<%=listaFornecedor.get(index).getFornecedorCodigo()%>'">
                                                <span class="glyphicon glyphicon-exclamation-sign"></span> Infor<br><%=listaFornecedor.get(index).getFornecedorCodigo()%>
                                            </button>
                                        </td>
                                        <td><%=listaFornecedor.get(index).getFornecedorNomeFantasia()%></td>
                                        <td><%=listaFornecedor.get(index).getFornecedorCnpj()%></td>
                                        <td><%=listaFornecedor.get(index).getFornecedorEmail()%></td>
                                        <td><%=listaTelefoneFornecedor.get(1).getTelefoneFornecedorCelular() %></td>
                                        <td>
                                            <button class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" onclick="location = 'alteFornecedor.jsp?codigo=<%=listaFornecedor.get(index).getFornecedorCodigo()%>'" >
                                                <span class="glyphicon glyphicon-pencil"></span> Alterar
                                            </button>

                                            <!--================ Modal-->
                                            <div class="modal fade" id="myModal<%=listaFornecedor.get(index).getFornecedorCodigo()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                                            <div class="col-sm-8 col-md-8"></div>
                                                            <div class="col-xs-6 col-sm-2 col-md-2">
                                                                <button type="button" class="btn btn-default btn-block" data-dismiss="modal"><i class="glyphicon glyphicon-thumbs-down"></i> Não</button>
                                                            </div>
                                                            <div class="col-xs-6 col-sm-2 col-md-2">
                                                                <form method="POST" action="ControllerFornecedor">
                                                                    <input type="hidden" name="inFornecedorCodigo" value="<%=listaFornecedor.get(index).getFornecedorCodigo()%>">
                                                                    <input type="hidden" name="pagina" value="exclFornecedor">
                                                                    <button type="submit" name="btnExcluir" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-thumbs-up"></i> Sim</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--================ Modal-->

                                            <button class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" data-toggle="modal" data-target="#myModal<%=listaFornecedor.get(index).getFornecedorCodigo()%>">
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
    </body>
</html>
