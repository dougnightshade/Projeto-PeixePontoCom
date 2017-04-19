<%-- 
    Document   : Teste-modelocorpo
    Created on : 14/08/2016, 16:40:44
    Author     : Owner
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Racao"%>
<%@page import="model.dao.RacaoDAO"%>

<%
    Racao obRacao = new Racao();
    RacaoDAO obRacaoDAO = new RacaoDAO();

    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Informações da Ração: <%= obRacao.getRacaoNome()%></title>     
        <%@include file="importsCSS.jsp" %>

    </head>
    <body>
        <!--div Menu Superior-->
        <div>
            <%@include file="menuSuperior.jsp" %>
        </div>

        <!--div Menu Lateral-->
        <div>
            <%@include file="menuLateral.jsp" %>
        </div>

        <!--div Conteudo-->
        <div>         

            <!--=========== Area dos botoes Superiores-->
            <div>
                <%@include file="pdrBtnInfoSuperior.jsp" %>
            </div>
            <!--Area dos botoes Superiores ==============--> 

            <!--================ div logo-->
            <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="imgs/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->
            <form action="ControllerRacao" method="POST">

                <!--============== campos-->
                <div class="col-xs-12 col-md-7 ctrl-padding-top">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center"><h4>Informações da Ração: <%= obRacao.getRacaoNome()%></h4></div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-9 col-sm-10">                                
                                    <label>Ração:
                                        <input type="text" name="inNome" id="inNome" value="<%= obRacao.getRacaoNome()%>" readonly>
                                    </label>                                     
                                </div>

                                <div class="col-xs-3 col-sm-2">                                
                                    <label>Codigo:
                                        <input type="text" name="inCodigo" id="inCodigo" value="<%=obRacao.getRacaoCodigo()%>" readonly>
                                    </label>                                   
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-4">                               
                                    <label>Estoque:
                                        <input type="text" name="inEstoque" id="inEstoque" value="<%=obRacao.getRacaoEstoque()%>" readonly>
                                    </label>                                    
                                </div>

                                <div class="col-xs-4">

                                    <label>Preço:
                                        <input type="text" name="inPreco" id="inPreco" value="<%=obRacao.getRacaoPreco()%>" readonly>
                                    </label>                                    
                                </div>
                            </div>

                            <!--=========== Area dos botoes Inferiores-->
                            <div class="row">

                                <div class="show-for-medium">   
                                    <div class="col-xs-2">
                                        <button type="button" class="btn btn-default "><span class="glyphicon glyphicon-exclamation-sign"></span> Fornecedores</button>
                                    </div>


                                    <div class="col-xs-6"></div>

                                    <div class="col-xs-2">
                                        <button type="button" class="btn btn-default btn-block" onclick="location = 'alteRacao.jsp?codigo=<%=obRacao.getRacaoCodigo()%>'"><span class="glyphicon glyphicon-pencil"></span> Alterar</button>
                                    </div>

                                    <div class="col-xs-2">
                                        <button type="button" class="btn btn-default btn-block" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-trash"></span> Excluir</button>   
                                    </div>                    

                                </div>

                                <!--================ Modal-->                               
                                <div class="modal fade" id="exclRacao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                                                                                                    
                                                <button type="submit" name="exclRacao" class="btn btn-default" >Sim</button>
                                            </div>                                        
                                        </div>
                                    </div>
                                </div>
                                <!--================ Modal-->                           
                            </div>
                            <!--Area dos botoes Inferiores ==============-->
                        </div>
                    </div>
                </div>
                <!--Campos ==================-->
            </form>
        </div>

        <%@include file="importsJS.jsp" %>       
    </body>
</html>
