<%-- 
    Document   : alteRacao
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
        <title>Alteração da Ração</title>     
        <%@include file="importsCSS.jsp" %>    
    </head>
    <body>
        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--================ div logo-->
        <div class="col-xs-12 col-md-4 hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =============-->

        <!--div Conteudo-->
        <div>         
            <form action="ControllerRacao" method="POST">

                <!--============== campos-->
                <div class="col-xs-12 col-sm-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4>Alteração da Ração: <%= obRacao.getRacaoNome()%></h4>
                            <div class="panel-footer text-left">
                                <span class="glyphicon glyphicon-barcode" aria-hidden="true"></span>
                                Código da Ração: <%=obRacao.getRacaoCodigo()%>
                            </div>
                        </div>
                        <div class="fix-panel-body panel-body">
                            <div>
                                <!--====== Area dos Campos    -->
                                <input type="hidden" name="inCodigo" value="<%=obRacao.getRacaoCodigo()%>">

                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">                                
                                        <label>Ração:
                                            <input type="text" name="inNome" id="inNome"  value="<%= obRacao.getRacaoNome()%>" required="">
                                        </label>                                     
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-3 col-md-3">                               
                                        <label for="inEstoque">Estoque:<span class="sobreescrito">(KG)</span></label>
                                        <input type="text" name="inEstoque" id="inEstoque" value="<%=obRacao.getRacaoEstoque()%>" required="" readonly="">                                   
                                    </div>

                                    <div class="col-xs-6 col-sm-3 col-md-3">
                                        <label for="inPreco">Preço:<span class="sobreescrito">(KG)</span></label>
                                        <input type="text" name="inPreco" id="inPreco" value="<%=obRacao.getRacaoPrecoAtual()%>" required="" readonly="">                             
                                    </div>

                                    <div class="col-xs-6 col-sm-3 col-md-3">
                                        <label for="inProteina">Proteina:<span class="sobreescrito">(%)</span></label>
                                        <input type="text" name="inProteina" id="inProteina" value="<%=obRacao.getRacaoProteina()%>" required="" readonly="">                                 
                                    </div>
                                </div>                            
                                <!--Fim Area dos Campos ==================--> 

                                <!--=========== Area dos botoes Inferiores Médios-->
                                <div class="row margin-top-1em">
                                    <div class="col-sm-6 col-md-6"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3">
                                        <button type="button" class="btn btn-default btn-block" onclick="location = 'infoRacao.jsp?codigo=<%=obRacao.getRacaoCodigo()%>'"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</button>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3">
                                        <input type="hidden" name="pagina" value="alteRacao"/>
                                        <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>   
                                    </div>                   
                                </div>
                                <!--Area dos botoes Inferiores ==============-->                               
                            </div>
                        </div> <!-- Container Fluid -->
                    </div>
                </div>
            </form>
        </div>
        <%@include file="importsJS.jsp" %>
    </body>
</html>
