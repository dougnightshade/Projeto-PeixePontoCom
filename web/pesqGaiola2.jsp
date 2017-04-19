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
//    List<Racao> listaRacoes = new ArrayList<Racao>();
    List<Racao> listaRacoes;

    listaRacoes = obRacaoDAO.listar();
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Rações</title>

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
        <!--===================== Controle da Pesquisa ou Listar-->
        <div>

            <!--============== Painel -->
            <div class="col-xs-12 col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><h4>Lista de Rações</h4></div>
                    <div class="panel-body">

                        <!--==================== Campo de Pesquisa-->
                        <div class="row">
                            <div class="col-xs-1"></div>
                            <div class="col-xs-10">
                                <span id="spryselect1">
                                    <label class="hide-for-small-only"><b>Estado</b></label>
                                    <select name="selPesq" id="selPesq" class="">
                                        <!--========== Controle de Seleções
                                        Coloquei para mostrar um como um placeholder 
                                        -->
                                        <option>Selecione um Estado</option>
                                        <!--Controle de Seleções ==================-->

                                        <!--============ Opções--> 
                                        <optgroup label="Estados">
                                            <option value="">Coisa 1</option>
                                        </optgroup>
                                        <!--Opções ========-->

                                    </select>
                                    <span class="selectRequiredMsg">Selecione um item.</span></span> 
                            </div>
                            <div class="col-xs-1"></div>
                        </div>
                        <!--Campo de Pesquisa ===============-->


                        <!--=============== Area dos Botões++-->
                        <div class="row">
                            <div class="col-xs-1"></div>
                            <div class="col-xs-5 col-sm-3 btnPesq-fix">
                                <button type="submit" name="list" class="btn btn-block btn-default btn-border-bottom-left-radius btnPesq"><span class="glyphicon glyphicon-list"></span> Listar</button>
                            </div>
                            <div class="col-xs-5 col-sm-3 col-sm-offset-4 btnPesq-fix">
                                <button type="submit" name="filtrar" class="btn btn-block btn-default btn-border-bottom-right-radius btnPesq"><span class="glyphicon glyphicon-search"></span> Filtrar</button>
                            </div>
                            <div class="col-xs-1"></div>
                        </div>
                        <!--Area dos Botões ==================-->

                        <!--============== div para listar -->
                        <div class="ctrl-Lista row">
                            <table class="table table-responsive table-striped table-condensed table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="col-xs-1">Codigo</th>
                                        <th class="">Ração</th>
                                        <th class="col-xs-2">Estoque</th>
                                        <th class="col-xs-2">Preço</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int index = 0; index < listaRacoes.size(); index++) {
                                    %>
                                    <tr onclick="location = 'infoRacao.jsp?codigo=<%=listaRacoes.get(index).getRacaoCodigo() %>'">
                                        <td><%=listaRacoes.get(index).getRacaoCodigo() %></td>
                                        <td><%=listaRacoes.get(index).getRacaoNome() %></td>
                                        <td><%=listaRacoes.get(index).getRacaoEstoque() %></td>
                                        <td><%=listaRacoes.get(index).getRacaoPreco() %></td>
                                    </tr>
                                    <%}%>                        
                                </tbody>


                            </table>

                        </div>
                        <!--div para listar ==================-->

                    </div>
                </div>
            </div>
            <!--Painel ==================-->

        </div>
        <!--Controle da Pesquisa ou Listar ========================-->

        <%@include file="importsJS.jsp" %>        

        <script type="text/javascript">
            var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
        </script>
    </body>
</html>
