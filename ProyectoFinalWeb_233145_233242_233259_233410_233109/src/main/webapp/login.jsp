<%-- 
    Document   : login
    Created on : 11 nov 2023, 22:55:09
    Author     : Ángel ñ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/style_login.css">

    </head>
    <body class="body">
        <div class="login-page">
            <div class="form">
                <img src="img/favicons/Carballo Dogos.png" alt="Logo" class="logo">
                <form action="iniciar" method="post">
                    <input type="text" placeholder="Usuario" required>
                    <input type="password" placeholder="Contraseña" required>
                    <button type="submit" onclick="window.location.href = 'principal.html'">Iniciar Sesión</button>
                    <p class="message">¿No tienes una cuenta? <a href="registro.jsp">Regístrate</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
