<%-- 
    Document   : pesqCliente
    Created on : 24/09/2016, 14:20:16
    Author     : Thiago
--%>
<%@page import="model.bean.BiometriaPeixeItem"%>
<%@page import="model.dao.BiometriaPeixeItemDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.RegistraLotedepeixe"%>
<%@page import="model.dao.RegistraLotedepeixeDAO"%>
<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="model.bean.Funcionario"%>
<%@page import="model.dao.FuncionarioDAO"%>


<%
    RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
    RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();

    Funcionario obFuncionario = new Funcionario();
    FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();
    List<RegistraLotedepeixe> listaRegistraLotedepeixe = obRegistraLotedepeixeDAO.listarLoteAtivos();

    BiometriaPeixeItem obBiometriaPeixeItem = new BiometriaPeixeItem();
    BiometriaPeixeItemDAO obBiometriaPeixeItemDAO = new BiometriaPeixeItemDAO();
    List<BiometriaPeixeItem> listaBiometriaPeixeItem;

%> 

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pesquisa Cliente</title>

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
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4 class="bold">Lista de Registros de Lotes Ativos</h4></div>
                    <div class="panel-body">
                        <div>
                            <table id="tabela" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>

                                        <th class="show-for-medium">
                                            <input type="text" name="" value="" id="txtColuna1"/>
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
                                            <input type="text" name="" value="" id="txtColuna4"/>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th class="col-xs-1 text-center show-for-medium">Cód.</th>
                                        <th>N. Gaiola</th>
                                        <th class="col-xs-2">Qtd Peixes</th>
                                        <th class="col-xs-2">Custo</th>
                                        <th class="col-xs-3">Funcionário</th>
                                        <th class="col-xs-2">Data de Registro</th>
                                        <!--<th class="col-xs-1">Ações</th>-->
                                    </tr>
                                </thead>
                                <tbody>

                                    <%  /*so para quebrar*/
                                        for (int index = 0; index < listaRegistraLotedepeixe.size(); index++) {
                                            
                                            obBiometriaPeixeItem = obBiometriaPeixeItemDAO.ultimaBiometriaPorRegistroDeLoteDePeixes(listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo());

                                            /*Configura os objetos referentes a gaiola*/
                                            obGaiola = obGaiolaDAO.buscarCodigo(listaRegistraLotedepeixe.get(index).getGaiola().getGaiolaCodigo());

                                            /*Configura os objetos referents ao funcionario*/
                                            obFuncionario = obFuncionarioDAO.buscarCodigo(listaRegistraLotedepeixe.get(index).getFuncionario().getFuncionarioCodigo());
                                    %>

                                    <tr >
                                        <td class="text-center">
                                            <button class="btn btn-default col-xs-12 margin-bottom-0em margin-top-0em" onclick="location = 'biometriaInfo.jsp?codigo=<%=obBiometriaPeixeItem.getBiometriaPeixeItemCodigo() %>'">
                                                <span class="glyphicon glyphicon-exclamation-sign"></span> Infor<br><%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo()%>
                                            </button>
                                        </td>
                                        <td>Gaiola: <%=obGaiola.getGaiolaCodigo()%></td>
                                        <td class=""><%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeQuantidade()%></td>
                                        <td class=""><%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCustoLote()%></td>
                                        <td class=""><%=obFuncionario.getFuncionarioNome()%></td>
                                        <td><%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeDataDeRegistro()%></td>

                                        <!--                                        <td class="text-center">
                                                                                    <button class="btn btn-default col-xs-12 margin-bottom-0em margin-top-0em" onclick="location = 'alteCliente.jsp?codigo=<%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo()%>'">
                                                                                        <span class="glyphicon glyphicon-pencil"></span> Alterar
                                                                                    </button>
                                        
                                                                                     =========== Modal 
                                                                                    foi colocado o codigo do cliente no id do modal para que quando for ser chamado chamar o modal certo
                                                                                    <div class="modal fade" id="myModal<%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                                                                                            <input type="hidden" name="inCodigo" value="<%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo()%>" />
                                                                                                            <input type="hidden" name="pagina" value="exclCliente">
                                                                                                            <button type="submit" name="btnExcluir" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-thumbs-up"></i> Sim</button>
                                                                                                        </div>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>  modal-content =============
                                                                                        </div>      modal-dialog ==================
                                                                                    </div>          model fade==========
                                        
                                                                                    <button class="btn btn-default col-xs-12 margin-bottom-0em margin-top-0em" data-toggle="modal" data-target="#myModal<%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo()%>">
                                                                                        <span class="glyphicon glyphicon-trash"></span> Excluir
                                                                                    </button>
                                                                                </td>-->
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
