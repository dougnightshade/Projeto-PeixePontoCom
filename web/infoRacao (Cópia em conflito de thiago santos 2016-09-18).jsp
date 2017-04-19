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
        <title>Informações da Ração</title>     
        <%@include file="importsCSS.jsp" %>

    </head>
    <body>
        <!-- =========== Modal =========== -->
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
                        <form method="POST" action="ControllerRacao">
                            <input type="hidden" name="inCodigo2" id="inCodigo2" value="<%=obRacao.getRacaoCodigo()%>">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                            <input type="hidden" name="pagina" value="exclRacao" />
                            <button type="submit" name="btnExcluir" class="btn btn-default" >Sim</button>
                        </form>
                    </div>
                </div>  <!--modal-content =============-->
            </div>      <!--modal-dialog ==================-->
        </div>          <!--model fade==========-->

        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--div Conteudo-->
        <div>         
            <!--================ div logo-->
            <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->

            <!--======= campos -->
            <form action="ControllerRacao" method="POST">
                <!--====== Botões para telas pequenas -->
                <div>
                    <div class="btn-group btn-group-justified show-for-small-only">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" onclick="location = 'alteRacao.jsp?codigo=<%=obRacao.getRacaoCodigo()%>'"><span class="glyphicon glyphicon-pencil"></span> Alterar</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-trash"></span> Excluir</button>
                        </div>
                    </div>
                </div>
                <!--====== Botões para telas pequenas -->


                <div class="col-xs-12 col-md-7 ctrl-padding-top">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <h4>Informações da Ração: <%= obRacao.getRacaoNome()%></h4>                            
                        </div>
                        <div class="panel-body">
                            <div class="container-fluid">

                                <!--Campos ==================-->
                                <input type="hidden" name="inCodigo" id="inCodigo" value="<%=obRacao.getRacaoCodigo()%>">

                                <div class="row">
                                    <div class="col-xs-12 col-sm-10 col-md-11">                                
                                        <label>Ração:
                                            <input type="text" name="inNome" id="inNome" disabled="" value="<%= obRacao.getRacaoNome()%>">
                                        </label>                                     
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-6 col-sm-4 col-md-4">                               
                                        <label>Estoque:
                                            <input type="number" name="inEstoque" id="inEstoque" disabled="" value="<%=obRacao.getRacaoEstoque()%>">
                                        </label>                                    
                                    </div>

                                    <div class="col-xs-6 col-md-4">

                                        <label>Preço (KG):
                                            <input type="number" name="inPreco" id="inPreco" disabled="" value="<%=obRacao.getRacaoPreco()%>">
                                        </label>                                    
                                    </div>
                                </div>
                                <!--Campos ==================-->

                                <!--=========== Area dos botoes -->

                                <!--Area dos botoes Inferiores Medios ==============-->
                                <div class="row">

                                    <div class="show-for-medium">   
                                        <div class="col-sm-8 col-md-8">
                                            <button type="button" class="btn btn-default "><span class="glyphicon glyphicon-exclamation-sign"></span> Fornecedores</button>
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <button type="button" class="btn btn-default btn-block" onclick="location = 'alteRacao.jsp?codigo=<%=obRacao.getRacaoCodigo()%>'"><span class="glyphicon glyphicon-pencil"></span> Alterar</button>
                                        </div>

                                        <div class="col-sm-2 col-md-2">
                                            <button type="button" class="btn btn-default btn-block" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-trash"></span> Excluir</button>   
                                        </div>                    
                                    </div>
                                    <!--Area dos botoes Inferiores Medios ==============-->

                                </div>                                
                            </div> <!-- Container-Fluid-->
                        </div>
                        <div class="panel-footer">
                            <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                            Código da Ração: <%=obRacao.getRacaoCodigo()%>
                        </div>
                    </div><!-- Panel default-->
                </div>
            </form>
        </div>

        <%@include file="importsJS.jsp" %>       
    </body>
</html>
