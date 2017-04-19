<%-- 
    Document   : cadaRacao
    Created on : 31/08/2016, 20:55:49
    Author     : AspireM5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Funcionário</title>
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <%@include file="importsCSS.jsp" %>

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
    </head>
    <body class="hide-for-print">
        <<!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--div Conteudo-->
        <div class="show-for-print">
            <div>

                <form method="POST">

                    <!--=========== Area dos botoes Superiores-->
                    <%@include file="pdrBtnSalvarSuperior.jsp" %>

                    <!--=========== Area dos botoes Superiores-->                   


                    <!--=========== Container de Margem--> 
                    <div class="container">  

                        <!--=========== Inicio dos campos-->                                                           

                        <div>
                            <span id="sprytextfield1">
                                <label for="inDescricao">Descrição</label>
                                <input type="text" name="inDescricao" id="inDescricao">
                                <span class="textfieldRequiredMsg">Um valor é necessário.</span></span>
                        </div>

                        <div>
                            <span id="sprytextfield2">
                                <label for="inPrazoDeVida">Prazo de Vida</label>
                                <input type="text" name="inPrazoDeVida" id="inPrazoDeVida">
                                <span class="textfieldRequiredMsg">Um valor é necessário.</span></span> </div>

                        <!--Fim dos Campos =========================-->

                        <!--=========== Area dos botoes Inferiores-->
                        <%@include file="pdrBtnSalvarInferior.jsp" %>
                        <!--Area dos botoes Inferiores =======================-->

                    </div>
                    <!--Container de Margem ================-->                  

                </form>
            </div>
        </div>

        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
        </script>
    </body>
</html>