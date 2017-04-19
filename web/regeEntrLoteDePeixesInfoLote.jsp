<%@page import="java.math.BigDecimal"%>
<%@page import="model.bean.TaxaDeAlimentacao"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="model.bean.StatusGaiola"%>
<%@page import="model.dao.StatusGaiolaDAO"%>
<%@page import="model.bean.TipoEstrutura"%>
<%@page import="model.dao.TipoEstruturaDAO"%>
<%@page import="model.bean.RegistraLotedepeixe"%>
<%@page import="model.dao.RegistraLotedepeixeDAO"%>
<%@page import="model.bean.Funcionario"%>
<%@page import="model.dao.FuncionarioDAO"%>
<%@page import="model.bean.TaxaDeAlimentacao"%>
<%@page import="model.dao.TaxaDeAlimentacaoDAO"%>
<%@page import="model.bean.BiometriaPeixeItem"%>
<%@page import="model.dao.BiometriaPeixeItemDAO"%>

<%
    RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
    RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();

    Funcionario obFuncionario = new Funcionario();
    FuncionarioDAO obFuncionarioDAO = new FuncionarioDAO();

    SimpleDateFormat formData = new SimpleDateFormat("dd/MM/yyyy");

    StatusGaiola obStatusGaiola = new StatusGaiola();
    StatusGaiolaDAO obStatusGaiolaDAO = new StatusGaiolaDAO();
    List<StatusGaiola> listaStatusGaiola;
    listaStatusGaiola = obStatusGaiolaDAO.listar();

    TipoEstrutura obTipoEstrutura = new TipoEstrutura();
    TipoEstruturaDAO obTipoEstruturaDAO = new TipoEstruturaDAO();
    List<TipoEstrutura> listaTipoEstrutura;
    listaTipoEstrutura = obTipoEstruturaDAO.listar();

    obRegistraLotedepeixe = obRegistraLotedepeixeDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    /*Configura os objetos referentes a gaiola*/
    obGaiola = obGaiolaDAO.buscarCodigo(obRegistraLotedepeixe.getGaiola().getGaiolaCodigo());
    obStatusGaiola = obStatusGaiolaDAO.buscarCodigo(obGaiola.getStatusGaiola().getStatusGaiolaCodigo());
    obTipoEstrutura = obTipoEstruturaDAO.buscarCodigo(obGaiola.getTipoEstrutura().getTipoEstruturaCodigo());

    /*Configura os objetos referents ao funcionario*/
    obFuncionario = obFuncionarioDAO.buscarCodigo(obRegistraLotedepeixe.getFuncionario().getFuncionarioCodigo());

    BiometriaPeixeItem obBiometriaPeixeItem = new BiometriaPeixeItem();
    BiometriaPeixeItemDAO obBiometriaPeixeItemDAO = new BiometriaPeixeItemDAO();
    obBiometriaPeixeItem = obBiometriaPeixeItemDAO.ultimaBiometriaPorRegistroDeLoteDePeixes(obRegistraLotedepeixe.getRegistraLoteDePeixeCodigo());

    TaxaDeAlimentacao obTaxaDeAlimentacao = new TaxaDeAlimentacao();
    TaxaDeAlimentacaoDAO obTaxaDeAlimentacaoDAO = new TaxaDeAlimentacaoDAO();
    obTaxaDeAlimentacao = obTaxaDeAlimentacaoDAO.buscarCodigo(obBiometriaPeixeItem.getTaxaDeAlimentacao().getTaxaDeAlimentacaoCodigo());
%>


<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Informações Gaiola</title>     
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>


        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
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
            <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->

            <!--============== Painel -->
            <div class="col-xs-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4 class="bold">Informações do Registro</h4>
                    </div>
                    <div class="panel-body">
                        <!--========================== Area dos Campos-->

                        <fieldset>
                            <legend>Dados do Registro</legend>
                            <div>

                                <div class="col-xs-4">
                                    <span>
                                        <label>Número do lote</label>
                                        <input type="text" name="inCusto" value="<%=obRegistraLotedepeixe.getRegistraLoteDePeixeCodigo()%>" readonly="" />
                                        <span></span>
                                    </span>
                                </div>

                                <div class="col-xs-4">
                                    <span>
                                        <label>Custo</label>
                                        <input type="text" name="inCusto" value="<%=obRegistraLotedepeixe.getRegistraLoteDePeixeCustoLote()%>" readonly="" />
                                        <span></span>
                                    </span>
                                </div>

                                <div class="col-xs-4">
                                    <span>
                                        <label>Quantidade de Peixes</label>
                                        <input type="text" name="inQtdPeixes" value="<%=obRegistraLotedepeixe.getRegistraLoteDePeixeQuantidade()%>" readonly="" />
                                        <span></span>
                                    </span>
                                </div>


                                <div class="col-xs-4">
                                    <span>
                                        <label>Data de Registro</label>
                                        <input type="text" name="inDataDeRegistro" value="<%=formData.format(obRegistraLotedepeixe.getRegistraLoteDePeixeDataDeRegistro())%>" readonly="" />
                                        <span></span>
                                    </span>
                                </div>
                            </div>

                            <div class="col-xs-4">
                                <span>
                                    <label>Alimentação Diária:<span class="sobreescrito">kg</span></label>
                                    <input type="text" name="inDataDeRegistro" value="<%=obBiometriaPeixeItem.getBiometriaPeixeItemTaxaArracoamento()%>" readonly="" />
                                    <span></span>
                                </span>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Dados Funcionário</legend>
                            <div>
                                <div class="col-xs-5">
                                    <span>
                                        <label>Nome</label>
                                        <input type="text" name="inNomeFuncionario" value="<%=obFuncionario.getFuncionarioNome()%>" readonly="" />
                                        <span></span>
                                    </span>
                                </div>

                                <div class="col-xs-5">
                                    <span>
                                        <label>Login</label>
                                        <input type="text" name="inLogin" value="<%=obFuncionario.getFuncionarioUsuLogin()%>" readonly="" />
                                        <span></span>
                                    </span>
                                </div>


                            </div>

                        </fieldset>

                        <fieldset>
                            <legend>Dados Gaiola</legend>
                            <div class="row">
                                <div class="col-xs-6 col-sm-4">
                                    <span>
                                        <label>Tamanho Total: <span class="sobreescrito">m³</span></label>
                                        <input type="text" name="inTotalAream3" value="<%=obGaiola.getGaiolaTamTotalM3()%>m³" readonly="" />
                                        <span></span>
                                    </span>
                                </div>
                                <div class="row"> 
                                    <div class="col-xs-3">
                                        <label class="hide-for-medium">Compri: <span class="sobreescrito"></span></label>
                                        <label class="hide-for-small-only">Comprimento: <span class="sobreescrito"></span></label>
                                        <input type="text" name="inComprimeto" value="<%=obGaiola.getGaiolaTamComprimento()%>m" readonly="readonly" />
                                    </div>
                                    <div class="col-xs-3">
                                        <label class="hide-for-medium">Altura: <span class="sobreescrito"></span></label>
                                        <label class="hide-for-small-only">Altura: <span class="sobreescrito"></span></label>
                                        <input type="text" name="inComprimeto" value="<%=obGaiola.getGaiolaTamAltura()%>m" readonly="readonly" />
                                    </div>
                                    <div class="col-xs-2    ">
                                        <label class="hide-for-medium">Largura: <span class="sobreescrito"></span></label>
                                        <label class="hide-for-small-only">Largura: <span class="sobreescrito"></span></label>
                                        <input type="text" name="inComprimeto" value="<%=obGaiola.getGaiolaTamLargura()%>m" readonly="readonly" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-xs-6 col-sm-4">
                                    <label>Tipo de Estrutura</label>
                                    <input type="text" name="selTipoDeEstrutura" value="<%=obTipoEstrutura.getTipoEstruturaDescricao()%>" readonly=""/>
                                </div>
                                <div class="col-xs-6 col-sm-3">
                                    <label>Status</label>
                                    <input type="text" name="selStatus" value="<%=obStatusGaiola.getStatusGaiolaDescricao()%>" readonly="" />
                                </div>


                                <div class="col-xs-6 col-sm-3">
                                    <span id="sprytextfield4">
                                        <label>Data de Criação</label>
                                        <%
                                            Date data = new Date();
                                            SimpleDateFormat formartadata = new SimpleDateFormat("dd/MM/yyy");
                                        %>
                                        <input type="text" name="inDataDeCriacao" id="inDataDeCriacao" value="<%= formartadata.format(obGaiola.getGaiolaDataCriacao())%>" readonly="">
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span></span>
                                </div>
                            </div>

                            <div class="row">
                                <span class="col-xs-12">
                                    <label>Comentários</label>
                                    <textarea name="taComentarios" rows="3" readonly="readonly"><% if (obGaiola.getGaiolaComentarios() != null) {%><%= obGaiola.getGaiolaComentarios()%><%}%></textarea>
                                </span>
                            </div>
                        </fieldset>

                        <!--Area dos Campos ===================-->

                    </div> 
                    <!--panel-body =====-->
                </div>
                <!--panel ===========-->
            </div>

            <!--ctrl-panel ===========-->
        </div>
        <!--Painel ==================-->
        <%@include file="importsJS.jsp" %>       
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "currency", {format: "dot_comma", useCharacterMasking: true});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "currency", {format: "dot_comma", useCharacterMasking: true});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "currency", {format: "dot_comma", useCharacterMasking: true});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "date", {useCharacterMasking: true, format: "dd/mm/yyyy"});
            var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
            var spryselect2 = new Spry.Widget.ValidationSelect("spryselect2");
        </script>
    </body>
</html>
