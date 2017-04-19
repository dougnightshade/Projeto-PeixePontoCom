<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Teste Modelo de Corpo</title>     
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
                        <h4>Informações da Gaiola</h4></div>
                    <div class="panel-body">
                        <!--========================== Area dos Campos-->

                        
                        


                        <!--Area dos Campos ===================-->

                        
                    </div>
                </div>
            </div>
            <!--Painel ==================-->

        </div>


    </body>
</html>
