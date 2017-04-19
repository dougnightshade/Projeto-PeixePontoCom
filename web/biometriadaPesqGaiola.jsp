
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="model.bean.StatusGaiola"%>
<%@page import="model.dao.StatusGaiolaDAO"%>
<%@page import="model.bean.TipoEstrutura"%>
<%@page import="model.dao.TipoEstruturaDAO"%>
<%@page import="model.bean.RegistraLotedepeixe"%>
<%@page import="model.dao.RegistraLotedepeixeDAO"%>

<%
    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();
    List<Gaiola> listaGaiola = new ArrayList<Gaiola>();

    StatusGaiola obStatusGaiola = new StatusGaiola();
    StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();

    TipoEstrutura obTipoEstrutura = new TipoEstrutura();
    TipoEstruturaDAO obTipoEstruturaDAO = new TipoEstruturaDAO();

    RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

    Date data = new Date();
    SimpleDateFormat formartadata = new SimpleDateFormat("dd/MM/yyy");

    /*Listar automaticamente todas gaiolas existentes*/
    listaGaiola = obRegistraLotedepeixeDAO.ListarGaiolasEmUtilizacao();

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Selecionar Gaiola para Registro</title>

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
        <div class="col-xs-12 logo-fix">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->

        <!--===================== Controle da Pesquisa ou Listar-->
        <div>
            <!--============== div para a tabela -->
            <!--============== Painel -->
            <%
                /*So pra quebrar*/
                for (int index = 0;
                        index < listaGaiola.size();
                        index++) {

                    obStatusGaiola = obStatusGaiolaDAO.buscarCodigo(listaGaiola.get(index).getStatusGaiola().getStatusGaiolaCodigo());
                    obTipoEstrutura = obTipoEstruturaDAO.buscarCodigo(listaGaiola.get(index).getTipoEstrutura().getTipoEstruturaCodigo());
            %>
            <div class="col-sm-3 min-640px-margin-top-1em" onclick="location = 'biometriaDadosIniciais.jsp?codigo=<%=listaGaiola.get(index).getGaiolaCodigo()%>'">
                <div class="panel <%=obStatusGaiola.getStatusGaiolaClass()%> text-center rotacao pointer" >
                    <div class="panel-heading"><span class="text-primary bold "><span>Status: </span> </span> <%=obStatusGaiola.getStatusGaiolaDescricao()%>
                    </div>

                    <div class="panel-body row-margin text-left">
                        <div class="col-xs-12"><span><span class="bold">Tamanho Total: </span><%=listaGaiola.get(index).getGaiolaTamTotalM3()%> <span class="sobreescrito">m³</span></div>
                        <div class="sobreescrito col-xs-12">
                            <div class="col-xs-3"><span class="bold">Largura:<br></span><%=listaGaiola.get(index).getGaiolaTamLargura()%></div>
                            <div class="col-xs-6"><span class="bold">Comprimento:<br></span><%= listaGaiola.get(index).getGaiolaTamComprimento()%></div>
                            <div class="col-xs-3"><span class="bold">Altura:<br></span><%= listaGaiola.get(index).getGaiolaTamAltura()%></div>
                        </div>
                        <div class="col-xs-12">
                            <span class="bold">Data de Criação: </span>
                            <%= formartadata.format(listaGaiola.get(index).getGaiolaDataCriacao())%>
                        </div>
                        <div class="col-xs-12">
                            <span class="bold">Material: </span>
                            <%=obTipoEstrutura.getTipoEstruturaDescricao()%>
                        </div>
                    </div>

                    <div class="panel-footer text-left fix-panel-footer">
                        <span class="bold">Codigo: </span><%=listaGaiola.get(index).getGaiolaCodigo()%>
                    </div>
                </div>
            </div>
            <%}%>

        </div>
        <!--div para a tabela ==================-->

    </body>
</html>
