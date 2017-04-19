<%-- 
    Document   : RelCodRegistro
    Created on : 23/10/2016, 23:42:16
    Author     : Leonardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet">
        <title>Relatorio Por Codigo do Registro - PeixePontoCom</title>
    </head>
    <body>
        <form action="ControllerRelatorio" method="POST">
        <h1 align="center">Relatorio Por Codigo do Registro</h1>
        <div class="acomodar">
            <table>
                <tr>
                    <td>
                        Codigo da Venda:
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="txtcod" class="txt bradius">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input type="hidden" name="pagina" value="GeraPorCod">
                        <input type="submit" value="Gerar Relatorio" name="ger" class="sb bradius">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input type="button" value="Cancelar" name="can" onclick="location='principal.jsp'" class="sb bradius">
                    </td>
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>
