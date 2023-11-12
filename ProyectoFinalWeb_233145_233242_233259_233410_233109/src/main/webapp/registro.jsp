<%-- 
Created on : 11 nov 2023, 22:44:02
Author     : Ángel ñ
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<htm1>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
        <link rel="stylesheet" type="text/css" href="css/style_register.css">
    </head>
    <body class="body">
        <div class="register-page">
            <div class="form">
                <img src="img/favicons/Carballo Dogos.png" alt="Logo" class="logo">
                <form action="nuevousuario" method="post">
                    <input type="text" placeholder="Nombre" required>
                    <input type="text" placeholder="Usuario" required>
                    <input type="email" placeholder="Correo Electrónico" required>
                    <input type="password" placeholder="Contraseña" required>
                    <input type="password" placeholder="Confirmar Contraseña" required>
                    <button type="submit" onclick="window.location.href = 'index.jsp'">Registrarse</button>
                    <p class="message">¿Ya tienes una cuenta? <a href="login.jsp">Inicia Sesión</a></p>
                </form>
            </div>
        </div>
    </body>

</htm1>
