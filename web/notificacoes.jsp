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

<%  /*So para identar*/
    for (int index = 0; index < listaNotificacao.size(); index++) {

        obTipoNotificacao = obTipoNotificacaoDAO.buscarCodigo(listaNotificacao.get(index).getTipoNotificacao().getTipoNotificacaoCodigo());
%>

<li>
    <div class="panel-heading zerar-padding-button">
        <span class="panel-title"><%=listaNotificacao.get(index).getNotificacaoTitulo()%></span>
        <span class="pull-right text-muted">
            <%=listaNotificacao.get(index).getNotificacaoData()%>
            <%=listaNotificacao.get(index).getNotificacaoHora()%>
        </span>
    </div>
    <div class="panel-body zerar-padding-top">
        <%=listaNotificacao.get(index).getNotificacaoDescricao()%>
    </div>
</li>

<li class="divider"></li>
  


<%}%>