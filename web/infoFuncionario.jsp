<%-- 
    Document   : infoFuncionario
    Created on : 31/08/2016, 20:55:49
    Author     : Thiago
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.FuncionarioDAO"%>
<%@page import="model.bean.Funcionario"%>
<%@page import="model.dao.TipoFuncionarioDAO"%>
<%@page import="model.bean.TipoFuncionario"%>

<%
    Funcionario obFuncionario = new Funcionario();
    FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();
    obFuncionario = obFuncionarioDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    TipoFuncionario obTipoFuncionario = new TipoFuncionario();
    TipoFuncionarioDAO obTipoFuncionarioDAO = new TipoFuncionarioDAO();
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações do Funcionário</title>
        <%@include file="importsCSS.jsp" %> 
    </head>
    <body>
        <!--================ Modal-->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Exclusão</h4>
                    </div>
                    <div class="modal-body">
                        Deseja realmente excluir?
                    </div>
                    <div class="modal-footer">
                        <form method="POST" action="ControllerFuncionario">
                            <input type="hidden" name="inCodigo2" value="<%=obFuncionario.getFuncionarioCodigo()%>">
                            <button type="button" class="btn btn-default" data-dismiss="modal"> Não </button>
                            <input type="hidden" name="pagina" value="exclFuncionario">
                            <button type="submit" name="btnExcluir" class="btn btn-danger" >Sim</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--================ Modal-->

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

        <!--div Conteudo-->
        <div>
            <form action="ControllerFuncionario" method="POST">

                <div class="col-xs-12 col-sm-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4>Informações do Funcionário: <%= obFuncionario.getFuncionarioNome()%></h4>
                            <div class="panel-footer text-left">
                                <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                                <span class="bold">Código Funcionário: </span><%=obFuncionario.getFuncionarioCodigo()%>
                            </div>
                        </div>
                        <div class="fix-panel-body panel-body">
                            <!--=========== Inicio dos campos-->

                                <div class="col-xs-12">                     
                                    <label for="inNome">Nome:</label>
                                    <input type="text" name="inNome" id="inNome" value="<%= obFuncionario.getFuncionarioNome()%>" readonly="">                                                                           
                                </div>

                                <input type="hidden" name="inCodigo" value="<%=obFuncionario.getFuncionarioCodigo()%>">

                                <div class="col-xs-12 col-sm-4">
                                    <label for="selTipoFuncionario">Tipo Funcionário:</label>
                                    <select name="selTipoFuncionario" id="selTipoFuncionario" required="" disabled="">
                                        <%
                                            obTipoFuncionario = obTipoFuncionarioDAO.buscarCodigo(obFuncionario.getTipoFuncionario().getTipoFuncionarioCodigo());
                                        %>
                                        <option value="<%=obTipoFuncionario.getTipoFuncionarioCodigo()%>" selected ><%=obTipoFuncionario.getTipoFuncionarioDescricao()%></option>
                                    </select>                                                                              
                                </div>


                                <div class="row">
                                    <div class="col-xs-12 col-sm-7">
                                        <label for="inEmail">@ E-mail:</label>
                                        <input type="text" name="inEmail" id="inEmail" value="<%= obFuncionario.getFuncionarioEmail()%>" readonly="">
                                    </div>
                                </div>

                                <div class="row">
                                    <!--================== fieldset usuario-->
                                    <fieldset>
                                        <legend>Usuário</legend>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-4">                           
                                                <label for="inLogin">Login:</label>
                                                <input type="text" name="inLogin" id="inLogin" value="<%= obFuncionario.getFuncionarioUsuLogin()%>" readonly="">
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="row">
                                    <fieldset><legend>Telefones:</legend>
                                        <div class="col-xs-3 col-sm-2 col-lg-1" >               
                                            <label class="fix-fielset-label">DDD:</label>
                                            <input type="text" name="inDDDFixo" id="inDDDFixo" value="<%= obFuncionario.getFuncionarioTelDddfixo()%>" readonly="">
                                        </div>

                                        <div class="col-xs-9 col-sm-3">                       
                                            <label class="fix-fielset-label">
                                                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:
                                            </label>
                                            <input type="text" name="inTelefoneFixo" id="inTelefoneFixo2" value="<%= obFuncionario.getFuncionarioTelFixo()%>" readonly="">
                                        </div>

                                        <div class="col-xs-3 col-sm-2 col-lg-1" >                         
                                            <label class="fix-fielset-label">DDD:</label>
                                            <input type="text" name="inPrefixoCelular" id="inPrefixoCelular" value="<%= obFuncionario.getFuncionarioTelDddcelular()%>" readonly="">
                                        </div>

                                        <div class="col-xs-8 col-sm-3">                                    
                                            <label class="fix-fielset-label" for="inTelefoneCelular">
                                                <span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:
                                            </label>
                                            <input type="text" name="inTelefoneCelular" id="inTelefoneCelular2" value="<%= obFuncionario.getFuncionarioTelCelular()%>" readonly="">
                                        </div>
                                    </fieldset>
                                </div>
                                <!--Fim dos Campos =========================-->

                        </div> <!-- Painel Body-->
                    </div>  <!-- Painel Body    ==============-->
                </div>  <!--Painel          ==============--> 
            </form>
        </div> <!-- Div Conteudo -->

        <%@include file="importsJS.jsp" %>        
    </body>
</html>