<%-- 
    Document   : Teste-modelocorpo
    Created on : 14/08/2016, 16:40:44
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações Ração</title>       
        <%@include file="importsCSS.jsp" %>
    </head>
    <body>
        <!--div Menu Superior-->
        <div>
            <%@include file="menuSuperior.jsp" %>
        </div>

        <!--div Menu Lateral-->
        <div>
            <%@include file="menuLateral.jsp" %>
        </div>

        <!--========== Div Conteudo-->
        <div>
            
        <!--========== Area dos botoes Superiores-->
            <%@include file="pdrBtnInfoSuperior.jsp" %>
        <!--========== Area dos botoes Superiores-->         
        
        <!--========== Titulo da Página -->
        <div class="page-header text-center">
            <h1>Informações Ração</h1>
        </div>
        <!--========== Titulo da Página -->
        
        <!--==========Container de Margem =======-->    
            <div class="container"> 
                
                <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">                   
                    <div>
                        Código: <input type="number" name="inCodigo" disabled>
                    </div>
                    
                    <div>
                        Nome: <input class="form-control" type="text" name="inCodigo" disabled>
                    </div>
                    
                    <div>
                        Estoque: <input type="text" name="inCodigo" disabled>
                    </div>
                    
                    <div>
                        Preço: <input type="number" name="inCodigo" disabled>
                    </div>                                                                                     
                </div> 
                
                <!--=========== Area dos botoes Superiores-->
                <%@include file="pdrBtnInfoInferior.jsp"%>
                    
                <!--===========Area dos botoes Superiores -->
                    
            </div>  <!--Container de Margem ================-->
        </div>  <!-- Show print-->
        <%@include file="importsJS.jsp" %>
        <script type="text/javascript">
            
        </script>
    </body>
</html>
