<%-- 
    Document   : Teste-modelocorpo
    Created on : 14/08/2016, 16:40:44
    Author     : Owner
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="model.bean.StatusGaiola"%>
<%@page import="model.dao.StatusGaiolaDAO"%>

<%
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();
    List<Gaiola> listaGaiola = new ArrayList<Gaiola>();

    /*Listar automaticamente todas gaiolas existentes*/
    listaGaiola = obGaiolaDAO.listar();

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Teste Modelo de Corpo</title>

        <!--==================== import CSS-->
        <%@include file="importsCSS.jsp" %>

        <!--================= imports JS-->
        <%@include file="importsJS.jsp" %>
        

        <!--DataTables ativação-->
        <script>
            $(document).ready(function () {
                $('#tabela').DataTable({
                    "filter": false
                });
            });
        </script>

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
            <div class="col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><h4>Lista de Gaiolas</h4></div>
                    <div class="panel-body">
                        <div class="container-fluid">
                            <table id="tabela" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-xs-1 text-center">Codigo</th>
                                        <th>Tamanho Total</th>
                                        <th class="col-xs-2">Data de Criação</th>
                                    </tr>
                                    <tr>
                                        <th>
                                            <input type="text" name="" value="" id="inColuna1"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="inColuna2"/>
                                        </th>
                                        <th>
                                            <input type="text" name="" value="" id="inColuna3" />
                                        </th>
                                    </tr>

                                </thead>
                                <tbody>

                                    <%  /*so para quebrar*/
                                        for (int index = 0; index < listaGaiola.size(); index++) {
                                    %>
                                    <tr onclick="location = 'infoGaiola.jsp?codigo=<%=listaGaiola.get(index).getGaiolaCodigo()%>'">
                                        <td class="text-center"><%=listaGaiola.get(index).getGaiolaCodigo()%></td>
                                        <td><%=listaGaiola.get(index).getGaiolaTamTotalM3()%></td>
                                        <td><%=listaGaiola.get(index).getGaiolaDataCricao()%></td>
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
