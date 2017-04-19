<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.bean.RegistraLotedepeixe"%>
<%@page import="model.dao.RegistraLotedepeixeDAO"%>
<%@page import="model.bean.Gaiola"%>
<%@page import="model.dao.GaiolaDAO"%>
<%@page import="model.bean.BiometriaPeixeItem"%>
<%@page import="model.dao.BiometriaPeixeItemDAO"%>

<%
    RegistraLotedepeixe obRegistraLotedepeixe = new RegistraLotedepeixe();
    RegistraLotedepeixeDAO obRegistraLotedepeixeDAO = new RegistraLotedepeixeDAO();

    Gaiola obGaiola = new Gaiola();
    GaiolaDAO obGaiolaDAO = new GaiolaDAO();

    BiometriaPeixeItem obBiometriaPeixeItem = new BiometriaPeixeItem();
    BiometriaPeixeItemDAO obBiometriaPeixeItemDAO = new BiometriaPeixeItemDAO();

    /*Recebe o codigo da biometria geranda na interface anterior */
    obBiometriaPeixeItem = obBiometriaPeixeItemDAO.buscarPorCodigo(Integer.parseInt(request.getParameter("codigo")));

    obRegistraLotedepeixe = obRegistraLotedepeixeDAO.buscarCodigo(obBiometriaPeixeItem.getRegistraLotedepeixe().getRegistraLoteDePeixeCodigo());

    /*Pega o codigo da fk da gaiola na obBiometriaPeixeItem e busca a gaiola no banco*/
    obGaiola = obGaiolaDAO.buscarCodigo(obRegistraLotedepeixe.getGaiola().getGaiolaCodigo());

%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Teste Modelo de Corpo</title>     
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
            <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
                <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
            </div>
            <!--div logo =================-->

            <!--============== Painel -->
            <div class="col-xs-12 col-md-7 max-640px-margin-top-1em min-640px-margin-top-2em">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                        <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                        <h4>Cadastrar Peso</h4></div>
                    <div class="panel-body">
                        <!--========================== Area dos Campos-->

                        <div>
                            <form action="ControllerBiometria" method="POST">
                                
                                <div class="row">
                                    <%  /*So para quebrar*/
                                        for (int index = 0; index < obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra(); index++) {
                                    %>
                                    <div class="col-xs-3">
                                        <span id="sprytextfield1<%=index%>">
                                        <label>Peso <span class="sobreescrito">KG</span> - Peixe <%=(index + 1)%></label>
                                        <input type="text" name="inIndexPeixe<%=index%>" id="inIndexPeixe">
                                        <span class="sobreescrito"><span class="bold">Exemplo: </span> 100,378</span> <span class="textfieldRequiredMsg">Um valor é necessário.</span> <span class="textfieldInvalidFormatMsg">Formato inválido.</span><span class="textfieldMinValueMsg">O valor digitado é menor 0.</span><span class="textfieldMaxValueMsg">O valor digitado é maior 101</span></span>
                                    </div>
                                    <%}%>
                                </div>

                                <div class="margin-top-1em">      
                                    <div class="col-xs-6 col-sm-3 col-xs-offset-6 col-sm-offset-9">
                                        <input type="hidden" name="BiometriaPeixeItemCodigo" value="<%=obBiometriaPeixeItem.getBiometriaPeixeItemCodigo()%>" />
                                        <input type="hidden" name="pagina" value="calcularArracoamento" />
                                        <button type="submit" class="btn btn-default btn-block"><span class="glyphicon glyphicon-copyright-mark"></span> Calcular</button>   
                                    </div>
                                </div>

                            </form>
                        </div>
                        <!--div conteudo =============-->


                        <!--Area dos Campos ===================-->
                    </div>
                </div>
            </div>
            <!--Painel ==================-->

        </div>
        <script type="text/javascript">
            <%
                for (int index = 0; index < obBiometriaPeixeItem.getBiometriaPeixeItemQtdAmostra(); index++) {
            %>
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1<%=index%>", "real", {useCharacterMasking:true, minValue:0, maxValue:101});
            <%}%>
        </script>
    </body>
</html>
