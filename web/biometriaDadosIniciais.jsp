<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="model.bean.RegistraLotedepeixe"%>
<%@page import="model.dao.RegistraLotedepeixeDAO"%>

<%

    Date obDate = new Date();
    SimpleDateFormat obSimpleDateFormat = new SimpleDateFormat("dd/MM/yyy");

    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();

    RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
    RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

    obRegistraLotedepeixe = obRegistraLotedepeixeDAO.buscarCodigo(Integer.parseInt(request.getParameter("codigo")));

    /*Requere os dados da gaiola há que o lote se refere*/
    obGaiola = obGaiolaDAO.buscarCodigo(obRegistraLotedepeixe.getGaiola().getGaiolaCodigo());

%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Selecionar Quantidade de Peixes</title>     
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>
        <%@include file="importsJS.jsp" %>      

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
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
            <div class="col-xs-4 logo-fix hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->

            <!--============== Painel -->
            <div class="col-xs-12 col-md-7 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4 class="bold">Dados Iniciais</h4>
                    </div>
                    <div class="panel-body">
                        <!--========================== Area dos Campos-->

                        <div class="row">
                            <div class="col-xs-2">
                                <label>Gaiola</label>
                                <input type="text" value="<%=obGaiola.getGaiolaCodigo()%>" readonly="">
                            </div>
                            <div class="col-xs-2">
                                <label>Lote</label>
                                <input type="text" value="<%=obRegistraLotedepeixe.getRegistraLoteDePeixeCodigo() %>" readonly="">
                            </div>

                            <div class="col-xs-4">
                                <label>Quantidade de Peixes</label>
                                <input type="text" value="<%=obRegistraLotedepeixe.getRegistraLoteDePeixeQuantidade()%>" readonly="">
                            </div>

                            <div class="col-xs-4">
                                <label>10% da Quantidade</label>
                                <%
                                BigDecimal ob10Porcento;
                                ob10Porcento = BigDecimal.valueOf((obRegistraLotedepeixe.getRegistraLoteDePeixeQuantidade() / 100) * 10);
                                %>
                                <input type="text" value="<%=ob10Porcento.setScale(0, RoundingMode.UP) %>" readonly="">
                            </div>

                        </div>

                        <form action="ControllerBiometria" method="POST">
                            <div class="row">
                                <div class="col-xs-6">
                                    <span id="sprytextfield2">
                                        <label>Quantidade de Peixes</label>
                                        <input type="text" name="inQuantidade" id="inQuantidade">
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> 
                                    </span>
                                </div>

                                <div class="col-xs-6">
                                    <span id="sprytextfield1">
                                        <label>Data     </label>
                                        <input type="text" name="inData" id="inData" class="datepicker" value="<%=obSimpleDateFormat.format(obDate)%>">
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span> 
                                    </span>    
                                </div>
                            </div>

                            <div class="col-xs-5 col-xs-offset-7 margin-top-1em">
                                <input type="hidden" name="pagina" value="iniciarBiometria" />
                                <input type="hidden" name="RegistraLoteDePeixeCodigo" value="<%=obRegistraLotedepeixe.getRegistraLoteDePeixeCodigo()%>" />
                                <button type="submit" class="btn btn-default btn-block">Iníciar</button>
                            </div>
                        </form>


                        <!--Area dos Campos ===================-->


                    </div>
                </div>
            </div>
            <!--Painel ==================-->

        </div>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
        </script>
    </body>
</html>
