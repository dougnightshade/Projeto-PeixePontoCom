<%-- 
    Document   : Teste-modelocorpo
    Created on : 14/08/2016, 16:40:44
    Author     : Owner
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Racao"%>
<%@page import="model.dao.RacaoDAO"%>
<!DOCTYPE html>
    <%                    
                    Racao obRacao = new Racao();                    
                    RacaoDAO obRacaoDAO = new RacaoDAO();
                    obRacao = obRacaoDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));
                
    %>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alterar: <%= obRacao.getRacaoNome()%> </title>     
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
                <%@include file="pdrBtnSalvarSuperior.jsp" %>
            </div>
            <!--Area dos botoes Superiores ==============--> 

            <!--================ div logo-->
            <div class="col-xs-12 col-md-4 hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="imgs/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->
            <form action="ControllerRacao" method="POST">
                
                
                
                <!--============== campos-->
                <div class="col-xs-12 col-md-7 ctrl-padding-top">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center"><h4>Alterar Ração: <%= obRacao.getRacaoNome()%></h4></div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-9 col-sm-10">                                
                                    <label>Ração:
                                        <input type="text" name="inNome" id="inNome"  value="<%= obRacao.getRacaoNome()%>">
                                    </label>                                     
                                </div>

                                <div class="col-xs-3 col-sm-2">                                
                                    <label>Codigo:
                                        <input type="number" name="inCodigo" id="inCodigo" value="<%=obRacao.getRacaoCodigo()%>" readonly>
                                    </label>                                   
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-4">                               
                                    <label>Estoque:
                                        <input type="text" name="inEstoque" id="inEstoque" value="<%=obRacao.getRacaoEstoque()%>">
                                    </label>                                    
                                </div>

                                <div class="col-xs-4">

                                    <label>Preço:
                                        <input type="text" name="inPreco" id="inPreco" value="<%=obRacao.getRacaoPreco()%>">
                                    </label>                                    
                                </div>
                            </div>

                            <!--=========== Area dos botoes Inferiores-->
                            <div class="row">

                                <div class="show-for-medium">

                                    <div class="col-xs-8"></div>

                                    <div class="col-xs-2">
                                        <button type="button" class="btn btn-default btn-block"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</button>
                                    </div>

                                    <div class="col-xs-2">
                                        <input type="hidden" name="pagina" value="alteRacao"/>
                                        <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>   
                                    </div>                   

                                </div>
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
