<%-- 
Created on : 11 nov 2023, 22:44:02
Author     : Ángel ñ
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
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
                    <input type="text" name="nombre" placeholder="Nombre" required>
                    <input type="text" name="usuario" placeholder="Usuario" required>
                    <input type="email" name="correo" placeholder="Correo Electrónico" required>
                    <input type="password" name="password" placeholder="Contraseña" required>
                    <input type="password" name="password2" placeholder="Confirmar Contraseña" required>
                    <button type="submit">Registrarse</button>
                    <p class="message">¿Ya tienes una cuenta? <a href="login.jsp">Inicia Sesión</a></p>
                </form>
            </div>
        </div>
    </body>

</htm1>
