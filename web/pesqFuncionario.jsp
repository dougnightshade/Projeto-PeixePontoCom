<%-- 
    Document   : pesqFuncionario
    Created on : 24/09/2016, 09:56:31
    Author     : Thiago
--%>
<%@page import="model.bean.TipoFuncionario"%>
<%@page import="model.dao.TipoFuncionarioDAO"%>
<%@page import="model.bean.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.FuncionarioDAO"%>

<%
    FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();
    List<Funcionario> listaFuncionario = new ArrayList<Funcionario>();

    listaFuncionario = obFuncionarioDAO.listar();

    TipoFuncionarioDAO obTipoFuncionarioDAO = new TipoFuncionarioDAO();
    List<TipoFuncionario> listaTipoFuncionario = new ArrayList<TipoFuncionario>();

    listaTipoFuncionario = obTipoFuncionarioDAO.listar();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pesquisa Funcionários</title>

        <!--==================== import CSS-->
        <%@include file="importsCSS.jsp" %>

        <!--================= imports JS-->
        <%@include file="importsJS.jsp" %>

    </head>
    <body>
        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp"%>
        </div>
        <!--Menu =================-->

        <!--================ div logo-->
        <div class="col-xs-12 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->
        <div>
            <!--============== div para a tabela -->
            <!--============== Painel -->
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 max-640px-margin-top-1em">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4>Lista de Funcionários</h4></div>
                    <div class="panel-body">
                        <div>
                            <table id="tabela" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <!--<input type="text" name="" value="" id="txtColuna1"/>-->
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna2"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna3"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna3"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna3"/>
                                        </th>
                                        <th>
                                            <!--<input type="text" name="" value="" id="txtColuna3"/>-->
                                        </th>
                                    </tr>


                                    <tr>
                                        <th class="col-xs-1 text-center">Cód.</th>
                                        <th>Nome</th>
                                        <th>E-mail</th>
                                        <th class="col-xs-2">Celular</th>
                                        <th class="col-sm-2">Login</th>
                                        <th class="col-sm-1">Ações</th>
                                    </tr>

                                </thead>
                                <tbody>

                                    <%  /*so para quebrar*/
                                        for (int index = 0; index < listaFuncionario.size(); index++) {
                                    %>

                                    <tr>
                                        <td class="text-center">
                                            <button class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" onclick="location = 'infoFuncionario.jsp?codigo=<%=listaFuncionario.get(index).getFuncionarioCodigo()%>'">
                                                <span class="glyphicon glyphicon-exclamation-sign"></span> Infor<br><%=listaFuncionario.get(index).getFuncionarioCodigo()%>
                                            </button>
                                        </td>

                                        <td><%=listaFuncionario.get(index).getFuncionarioNome()%></td>
                                        <td><%=listaFuncionario.get(index).getFuncionarioEmail()%></td>
                                        <td><%=listaFuncionario.get(index).getFuncionarioTelCelular()%></td>

                                        <td class="text-center"><%=listaFuncionario.get(index).getFuncionarioUsuLogin()%></td>
                                        <td class="text-center">
                                            <button class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" onclick="location = 'alteFuncionario.jsp?codigo=<%=listaFuncionario.get(index).getFuncionarioCodigo()%>'" >
                                                <span class="glyphicon glyphicon-pencil"></span> Alterar
                                            </button>

                                            <!--================ Modal-->
                                            <div class="modal fade" id="myModal<%=listaFuncionario.get(index).getFuncionarioCodigo()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                                            <form method="POST" action="ControllerFuncionario">

                                                                <div class="col-sm-8 col-md-8"></div>
                                                                <div class="col-xs-6 col-sm-2 col-md-2">
                                                                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal"><i class="glyphicon glyphicon-thumbs-down"></i> Não</button>
                                                                </div>
                                                                <div class="col-xs-6 col-sm-2 col-md-2">
                                                                    <input type="hidden" name="inCodigo" value="<%=listaFuncionario.get(index).getFuncionarioCodigo()%>">
                                                                    <input type="hidden" name="pagina" value="exclFuncionario">
                                                                    <button type="submit" name="btnExcluir" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-thumbs-up"></i> Sim</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--================ Modal-->

                                            <button type="button" class="btn btn-default col-xs-12 margin-top-0em margin-bottom-0em" data-toggle="modal" data-target="#myModal<%=listaFuncionario.get(index).getFuncionarioCodigo()%>">
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

    </body>
</html>
