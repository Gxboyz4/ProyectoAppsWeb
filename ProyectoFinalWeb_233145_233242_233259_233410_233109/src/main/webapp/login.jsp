<%-- 
    Document   : login
    Created on : 11 nov 2023, 22:55:09
    Author     : Ángel ñ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion = request.getSession(false);
    objSesion.setAttribute("correo", null);
    objSesion.setAttribute("carrito", null);
%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carballo Dogos</title>
        <link rel="stylesheet" type="text/css" href="css/style_login.css">

    </head>
    <body class="body">
        <div class="login-page">
            <div class="form">
                <img src="img/favicons/Carballo Dogos.png" alt="Logo" class="logo">
                <form action="iniciar" method="post">
                    <input type="email" name="correo" placeholder="Correo" maxlength="40" required>
                    <input type="password" name="password" placeholder="Contraseña" maxlength="30" required>
                    <button type="submit">Iniciar Sesión</button>
                    <p class="message">¿No tienes una cuenta? <a href="registro.jsp">Regístrate</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
