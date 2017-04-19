<%-- 
    Document   : pesqCliente
    Created on : 24/09/2016, 14:20:16
    Author     : Thiago
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.bean.TelefoneCliente"%>
<%@page import="model.dao.TelefoneClienteDAO"%>

<%
    ClienteDAO obClienteDAO = new ClienteDAO();
    List<Cliente> listaCliente = obClienteDAO.listar();

    TelefoneClienteDAO obTelefoneClienteDAO = new TelefoneClienteDAO();
    List<TelefoneCliente> listaTelefoneCliente;
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pesquisa Cliente</title>

        <!--==================== import CSS-->
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
        <!--===================== Controle da Pesquisa ou Listar-->
        <div>
            <!--============== div para a tabela -->
            <!--============== Painel -->
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4 class="bold">Lista de Clientes</h4></div>
                    <div class="panel-body">
                        <div>
                            <table id="tabela" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>

                                        <th class="show-for-medium">
                                            <!--<input type="text" name="" value="" id="txtColuna1"/>-->
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna1"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna2"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna3"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="txtColuna4"/>
                                        </th>
                                        <th>
                                            <!--<input type="text" name="" value="" id="txtColuna4"/>-->
                                        </th>
                                    </tr>
                                    <tr>
                                        <th class="col-xs-1 text-center show-for-medium">Cód.</th>
                                        <th>Cliente</th>
                                        <th class="col-xs-2">CNPJ</th>
                                        <th class="col-xs-3">E-mail</th>
                                        <th class="col-xs-2">Celular 1</th>
                                        <th class="col-xs-1">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%  /*so para quebrar*/
                                        for (int index = 0; index < listaCliente.size(); index++) {
                                            listaTelefoneCliente = obTelefoneClienteDAO.listarPorCliente(listaCliente.get(index).getClienteCodigo());
                                    %>



                                    <tr >
                                        <td class="text-center">
                                            <button class="btn btn-default col-xs-12 margin-bottom-0em margin-top-0em" onclick="location = 'infoCliente.jsp?codigo=<%=listaCliente.get(index).getClienteCodigo()%>'">
                                                <span class="glyphicon glyphicon-exclamation-sign"></span> Infor<br><%=listaCliente.get(index).getClienteCodigo()%>
                                            </button>
                                        </td>
                                        <td class=""><%=listaCliente.get(index).getClienteNome()%></td>
                                        <td class=""><%=listaCliente.get(index).getClienteCnpj()%></td>
                                        <td><%=listaCliente.get(index).getClienteEmail()%></td>
                                        <td><%=listaTelefoneCliente.get(0).getTelefoneClienteCelular() %></td>
                                        <td class="text-center">
                                            <button class="btn btn-default col-xs-12 margin-bottom-0em margin-top-0em" onclick="location = 'alteCliente.jsp?codigo=<%=listaCliente.get(index).getClienteCodigo()%>'">
                                                <span class="glyphicon glyphicon-pencil"></span> Alterar
                                            </button>

                                            <!-- =========== Modal -->
                                            <!--foi colocado o codigo do cliente no id do modal para que quando for ser chamado chamar o modal certo-->
                                            <div class="modal fade" id="myModal<%=listaCliente.get(index).getClienteCodigo()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                                            <form action="ControllerCliente" method="POST">
                                                                <div class="col-xs-6 col-sm-2 col-md-2">
                                                                    <input type="hidden" name="inCodigo" value="<%=listaCliente.get(index).getClienteCodigo()%>" />
                                                                    <input type="hidden" name="pagina" value="exclCliente">
                                                                    <button type="submit" name="btnExcluir" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-thumbs-up"></i> Sim</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>  <!--modal-content =============-->
                                                </div>      <!--modal-dialog ==================-->
                                            </div>          <!--model fade==========-->

                                            <button class="btn btn-default col-xs-12 margin-bottom-0em margin-top-0em" data-toggle="modal" data-target="#myModal<%=listaCliente.get(index).getClienteCodigo()%>">
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


        <!--================= imports JS-->
        <%@include file="importsJS.jsp" %>

    </body>
</html>
