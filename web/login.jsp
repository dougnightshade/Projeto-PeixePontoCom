<%-- 
    Document   : login
    Created on : 21/08/2016, 20:09:38
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PeixePontoCom</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <script src="jQuery/jquery-1.12.3.js" type="text/javascript"></script>
    </head>

    <body>       
        <div class="header">
            <div class="teste">Peixe<span>PontoCom</span></div>
        </div>
        <div class="login">
            <form action="" method="post">
                <label for="user">Usuário</label>
                <input autofocus="" type="text" id="user" name="user">

                <label for="password">Senha</label>
                <input type="password" id="password" name="password">
                <input type="button" value="Login">
            </form>
        </div>

    </body>
    <script>
        $('.teste').animate({"margin-left": "-=50"}, 1000);
    </script>
</html>
