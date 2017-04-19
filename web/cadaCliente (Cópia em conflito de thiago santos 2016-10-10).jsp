<%-- 
    Document   : cadaCliente
    Created on : 18/09/2016, 00:15:43
    Author     : Thiago
--%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
        <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <title>Cadastro Cliente</title>
        <%@include file="importsCSS.jsp" %>
    </head>
    <body>
        <!--=========== Menus-->
        <div>
            <%@include file="menus.jsp" %>
        </div>
        <!--Menu ============-->

        <!--======== div logo-->
        <div class="col-xs-12 col-md-4 logo-fix hide-for-small-only hide-for-medium-only">
            <img id="LogoPeixePontoCom" src="images/Logo.png" alt="Logo Peixe Ponto Com" class="img-fix"/>
        </div>
        <!--div logo =================-->

        <!--div Container-->
        <div>
            <form action="ControllerCliente" method="POST">

                <!--============== Painel -->
                <div class="col-xs-12 col-sm-12 col-md-7 min-640px-margin-top-2em max-640px-margin-top-1em">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center"><h4>Cadastro de Cliente</h4></div>
                        <div class="fix-panel-body panel-body">
                            <!--========================== Area dos Campos-->
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-11 col-md-11">
                                        <span id="sprytextfield2">
                                            <label>Nome:</label>
                                            <input type="text" name="inNome" id="InNome" required>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>                                    
                                        </span> 
                                    </div>                                                                                                 
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-3 col-md-3">
                                        <span id="sprytextfield1">
                                            <label for="inCNPJ">CNPJ:</label>
                                            <input type="text" name="inCNPJ" id="inCNPJ" required>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                        </span>
                                    </div>                                                                

                                    <div class="col-xs-12 col-sm-5">    
                                        <span id="sprytextfield3">
                                            <label for="inEmail">@ E-mail:</label>
                                            <input type="email" name="inEmail" id="inEmail" required>
                                            <span class="textfieldRequiredMsg">Um valor é necessário.</span>
                                            <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <fieldset>
                                        <legend>Telefones:</legend>
                                        <div class="col-xs-4 col-sm-1 col-md-1">
                                            <span id="sprytextfield6">
                                                <label class="fix-fielset-label">DDD:</label>
                                                <input type="text" name="inPrefixoFixo" id="inPrefixoFixo" required>
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>
                                            </span> 
                                        </div>

                                        <div class="col-xs-8 col-sm-2 col-md-2">
                                            <span id="sprytextfield4">
                                                <label for="inTelefoneFixo" class="fix-fielset-label"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Fixo:</label>
                                                <input type="text" name="inTelefoneFixo" id="inTelefoneFixo" required>
                                                <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                            </span>
                                        </div>
                                        <div>
                                            <div class="col-xs-4 col-sm-1 col-md-1">
                                                <span id="sprytextfield7">
                                                    <label class="fix-fielset-label">DDD:</label>
                                                    <input type="text" name="inPrefixoCelular" id="inPrefixoCelular" required>
                                                    <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                                    
                                                </span> 
                                            </div>
                                            <div class="col-xs-8 col-sm-2 col-md-2">
                                                <span id="sprytextfield5">
                                                    <label for="inTelefoneCelular" class="fix-fielset-label"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Celular:</label>
                                                    <input type="text" name="inTelefoneCelular" id="inTelefoneCelular" required>
                                                    <span class="textfieldInvalidFormatMsg">Formato inválido.</span>                                    
                                                </span>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!--Area dos Campos ===================-->

                                <input type="hidden" name="pagina" value="cadaCliente"/>
                                <!--=========== Area dos botoes Inferiores-->
                                <%@include file="pdrBtnSalvarInferior.jsp"%>
                                <!--Area dos botoes Inferiores =======================-->

                            </div> <!-- Container Fluid-->


                        </div><!--  Painel Body===========-->
                    </div><!--  Painel ==================-->
                </div>  
            </form>                                     
        </div>
        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "custom", {useCharacterMasking: true, pattern: "00.000.000/0000-00"});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
            var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "email", {useCharacterMasking: true});
            var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "phone_number", {format: "phone_custom", pattern: "0000-0000", useCharacterMasking: true, isRequired: false});
            var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "phone_number", {format: "phone_custom", pattern: "00000-0000", useCharacterMasking: true, isRequired: false});
            var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "custom", {useCharacterMasking: true, pattern: "(00)", isRequired: false});
            var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "custom", {pattern: "(00)", useCharacterMasking: true, isRequired: false});
        </script>
    </body>
</html>