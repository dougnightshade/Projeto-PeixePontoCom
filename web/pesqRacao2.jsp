<%-- 
    Document   : pesqRacao2
    Created on : 19/09/2016, 20:05:36
    Author     : AspireM5
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.RacaoDAO"%>
<%@page import="model.bean.Racao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    List<Racao> listaRacao = new ArrayList<Racao>();
    Racao obRacao = new Racao();
    RacaoDAO obRacaoDAO = new RacaoDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.min.css">
        <title>JSP Page</title>

        <!--================= imports JS-->
        <%@include file="importsJS.jsp" %>
    </head>
    <body>
        <div>
            <h1 class="text-center">Teste Pesquisar</h1>
        </div>


        <div class="container">
            <div class="col-md-6 col-md-offset-3">
                <form  action="ControllerRacao" method="POST" class="form-inline">
                    <div class="form-group">
                        <label for="inPesquisar">Pesquisar</label>
                        <input type="text" name="inPesquisar" class="form-control" id="inPesquisar" placeholder="Nome da Ração">
                    </div>
                    <% String nome = request.getParameter("inPesquisar");%>
                   <input type="hidden" name="pagina" value="pesqRacao">
                    <button name="btnPesquisar" type="submit" class="btn btn-default">Pesquisar</button>
                </form>
            </div>
        </div>
        <hr>
        
        Nome Pesquisado: <%=nome%>
</body>
</html>
