<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastro de Ração</title>
        <%@include file="importsCSS.jsp" %>
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">

        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
    </head>
    <body>
        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu =================-->

        <!--==== div logo-->
        <div class="col-xs-12 col-sm-4 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->

        <!--div Conteudo-->
        <div>
            <form method="POST" action="ControllerRacao">

                <!--============== Painel -->
                <div class="col-xs-16 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <a class="panel-div-back-button pointer efeito-botao"  onclick="history.go(-1)"><i class="fa fa-2x fa-reply"></i></a>
                            <a class="panel-div-close-button efeito-botao" href="principal.jsp"><i class="fa fa-2x fa-remove"></i></a>
                            <h4>Cadastro de Ração</h4>
                        </div>
                        <div class=" fix-panel-body panel-body">

                            <!--======= Area dos Campos-->
                            <div class="row">
                                <div class="col-xs-12">
                                    <span id="sprytextfield1">
                                        <label for="inNome">Nome:</label>
                                        <input type="text" name="inNome" id="inNome" required>
                                        <span class="textfieldRequiredMsg">Um valor é necessário.</span></span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-sm-3 col-md-3">
                                    <span id="sprytextfield2">
                                        <label for="inEstoque">Estoque:<span class="sobreescrito">(KG)</span></label>
                                        <input type="text" name="inEstoque" id="inEstoque" required>
                                        <span class="sobreescrito">Exemplo: 1000,000</span> 
                                        <br><span class="textfieldRequiredMsg">Um valor é necessário.</span> 
                                        <span class="textfieldInvalidFormatMsg">Formato inválido.</span> 
                                        <span class="textfieldMinValueMsg">O valor digitado é menor que 0</span> <span class="textfieldMaxValueMsg">O valor digitado é maior que 9999</span></span>
                                </div>

                                <div class="col-xs-6 col-sm-3 col-md-3">
                                    <span id="sprytextfield3">
                                        <label for="inPreco">Preço:<span class="sobreescrito">(KG)</span></label>
                                        <input type="text" name="inPreco" id="inPreco" required>
                                        <span class="sobreescrito">Exemplo: 32,00</span> 
                                        <br><span class="textfieldRequiredMsg">Um valor é necessário.</span> 
                                        <span class="textfieldInvalidFormatMsg">Formato inválido.</span> 
                                        <span class="textfieldMinValueMsg">O valor digitado é menor que 0</span><span class="textfieldMaxValueMsg">O valor digitado é maior que 9999</span></span>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 ">
                                    <span id="sprytextfield4">
                                    <label>Proteina<span class="sobreescrito">(%)</span></label>
                                    <input type="text" name="inProteina" id="inProteina">
                                    <span class="textfieldRequiredMsg">Um valor é necessário.</span><span class="textfieldInvalidFormatMsg">Formato inválido.</span><span class="textfieldMinValueMsg">O valor digitado é menor 0</span><span class="textfieldMaxValueMsg">O valor digitado é maior 100</span></span
                                    ></div>
                            </div>                            
                            <!--Area dos Campos ===================-->

                            <!--=========== Area dos botoes -->
                            <div>
                                <input type="hidden" name="pagina" value="cadaRacao"/>
                                <%@include file="pdrBtnSalvarInferior.jsp" %>
                            </div>
                            <!--Area dos botoes =======================-->


                        </div><!-- Painel Body -->
                    </div><!--Painel -->
                </div><!--Div do Painel -->                
            </form>   
        </div>
        <!--Container de Margem ================-->                  

        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "currency", {useCharacterMasking:true, minValue:0, maxValue:10000, format:"dot_comma3"});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "currency", {useCharacterMasking: true, format: "dot_comma", minValue: 0, maxValue: 9999});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "currency", {format:"dot_comma", useCharacterMasking:true, minValue:0, maxValue:100});
        </script>
    </body>
</html>