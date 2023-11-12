<%-- 
    Document   : index
    Created on : 31 oct 2023, 10:23:10
    Author     : Gabriel Mancinas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
    </head>
    <body>
    <hl>Iniciar sesión</h1>
    <form action="iniciar" method="post">
        <input type="text" name="usuario" placeholder="nombre de usuario"><br>
        <input type="password" name="pass"><br>
        <input type="submit" value="Iniciar sesión">
    </form>
    <br>
    No tienes una cuenta...<a href="registro.jsp">Registrar</a>
</body>
</html>

