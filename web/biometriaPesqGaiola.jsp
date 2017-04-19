
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
<%@page import="model.bean.BiometriaPeixeItem"%>
<%@page import="model.dao.BiometriaPeixeItemDAO"%>

<%
    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();
    List<Gaiola> listaGaiola = new ArrayList<Gaiola>();

    StatusGaiola obStatusGaiola = new StatusGaiola();
    StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();

    TipoEstrutura obTipoEstrutura = new TipoEstrutura();
    TipoEstruturaDAO obTipoEstruturaDAO = new TipoEstruturaDAO();
    
    BiometriaPeixeItem obBiometriaPeixeItem = new BiometriaPeixeItem();
    BiometriaPeixeItemDAO obBiometriaPeixeItemDAO = new BiometriaPeixeItemDAO();

    RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
    RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();
    List<RegistraLotedepeixe> listaRegistraLotedepeixe = obRegistraLotedepeixeDAO.listarLoteAtivosMenorQueEtapa4();

    Date data = new Date();
    SimpleDateFormat formartadata = new SimpleDateFormat("dd/MM/yyy");

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
                for (int index = 0; index < listaRegistraLotedepeixe.size(); index++) {
                    
                    obBiometriaPeixeItem = obBiometriaPeixeItemDAO.ultimaBiometriaPorRegistroDeLoteDePeixes(listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo());
                    
                    obGaiola = obGaiolaDAO.buscarCodigo(listaRegistraLotedepeixe.get(index).getGaiola().getGaiolaCodigo());

                    obStatusGaiola = obStatusGaiolaDAO.buscarCodigo(obGaiola.getStatusGaiola().getStatusGaiolaCodigo());
                    obTipoEstrutura = obTipoEstruturaDAO.buscarCodigo(obGaiola.getTipoEstrutura().getTipoEstruturaCodigo());
            %>
            <div class="col-sm-3 min-640px-margin-top-1em" onclick="location = 'biometriaDadosIniciais.jsp?codigo=<%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo() %>'">
                <div class="panel <%=obStatusGaiola.getStatusGaiolaClass()%> text-center rotacao pointer" >
                    <div class="panel-heading"><span class="text-primary bold "><span>Código do Lote </span> </span> <%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeCodigo() %>
                    </div>
                    <div class="panel-body row-margin text-left">
                        <div class="col-xs-12">
                            <span class="bold">Data de Registro: </span>
                            <%= formartadata.format(listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeDataDeRegistro())%>
                        </div>
                        <div class="col-xs-12">
                            <span class="bold">Quantidade de Peixes: </span>
                            <%=listaRegistraLotedepeixe.get(index).getRegistraLoteDePeixeQuantidade() %>
                        </div>
                        <div class="col-xs-12">
                            <span class="bold">Etapa: </span>
                            <%=obBiometriaPeixeItem.getBiometriaPeixeItemNumeroEtapa() %>
                        </div>
                    </div>

                    <div class="panel-footer text-left fix-panel-footer">
                        <span class="bold">Código Gaiola: </span><%=obGaiola.getGaiolaCodigo() %>
                    </div>
                </div>
            </div>
            <%}%>

        </div>
        <!--div para a tabela ==================-->

    </body>
</html>
