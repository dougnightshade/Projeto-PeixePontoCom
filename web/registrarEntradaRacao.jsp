<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.bean.TipoNotificacao"%>
<%@page import="model.bean.Notificacao"%>
<%@page import="model.dao.TipoNotificacaoDAO"%>
<%@page import="model.dao.NotificacaoDAO"%>

<%
    TipoNotificacaoDAO obTipoNotificacaoDAO = new TipoNotificacaoDAO();
    NotificacaoDAO obNotificacaoDAO = new NotificacaoDAO();

    Notificacao obNotificacao = new Notificacao();
    TipoNotificacao obTipoNotificacao = new TipoNotificacao();

    List<TipoNotificacao> listaTipoNotificacao = new ArrayList<TipoNotificacao>();
    List<Notificacao> listaNotificacao = new ArrayList<Notificacao>();

    listaTipoNotificacao = obTipoNotificacaoDAO.listar();
    listaNotificacao = obNotificacaoDAO.listar();
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notificações</title>     
        <%@include file="importsCSS.jsp" %>
        <%@include file="importsJS.jsp" %>      

    </head>
    <body>
        <!--============= div Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu ==============-->

        <!--div Container-->
        <div class="">            

            <!--================ div logo-->
            <div class="col-xs-12 logo-fix hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->

            <!--============== Painel -->
            <%  /*So para identar*/
                for (int index = 0; index < listaNotificacao.size(); index++) {

                    obTipoNotificacao = obTipoNotificacaoDAO.buscarCodigo(listaNotificacao.get(index).getTipoNotificacao().getTipoNotificacaoCodigo());
            %>
            <div class="col-xs-12 col-sm-4 ctrl-padding-top">
                <div class="panel <%=obTipoNotificacao.getTipoNotificacaoClass()%>">
                    <div class="panel-heading ">
                        <div>
                            <strong class="panel-title"></strong>
                            <span class="pull-right text-muted">
                                <%
                                    Date data = new Date();
                                    SimpleDateFormat formartadata = new SimpleDateFormat("dd/ MM/ yyy");
                                %>
                                <em><%=formartadata.format(listaNotificacao.get(index).getNotificacaoData())%></em>
                                <em><%=listaNotificacao.get(index).getNotificacaoHora()%></em>
                            </span>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div>
                            <%=listaNotificacao.get(index).getNotificacaoTitulo()%>
                        </div>
                        <div>
                            <%=listaNotificacao.get(index).getNotificacaoDescricao()%>
                        </div>
                    </div>
                    <!--panel-body ============-->
                    <div class="panel-footer fix-panel-footer">
                        <span>Codigo: </span>
                        <%=listaNotificacao.get(index).getNotificacaoCodigo()%>
                    </div>
                    <!--panel-footer ==============-->
                </div>
                <!--panel ============-->
            </div>
            <!--caixa ===========-->
            <%}%>

        </div>
    </body>
</html>
