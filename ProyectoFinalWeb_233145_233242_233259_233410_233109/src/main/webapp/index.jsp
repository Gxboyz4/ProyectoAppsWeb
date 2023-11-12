<%-- 
Created on : 11 nov 2023, 22:44:02
Author     : Ángel ñ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
        <link rel="stylesheet" type="text/css" href="../css/style_index.css" />

    </head>
    <body class="body">
        <div class="container_botones">
            <div class="form">
                <form action="iniciar" method="post">
                    <img src="../img/Carballo Dogos.png" alt="Logo" class="logo">
                    <button type="button" onclick="window.location.href = '../login.jsp'">INICIAR SESIÓN</button>
                    <p class="message"></p>
                </form>
                <form>
                    <button type="button" onclick="window.location.href = '../registro.jsp'">REGISTRARSE</button>
                </form>
            </div>
        </div>
    </body>


</html>

