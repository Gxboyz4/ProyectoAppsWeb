<%-- 
    Document   : modificar_producto
    Created on : 12 nov 2023, 22:01:46
    Author     : julio
--%>
<%@page import="Controlador.ControladorUsuario"%>
<%@page import="Modelo.Usuario"%>
<% HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if (usuario.equals("")) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    String idUsuario = request.getParameter("idUsuario");
    ControladorUsuario cu = new ControladorUsuario();
    Usuario usuario2 = cu.getUsuario(Integer.parseInt(idUsuario));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar usuarios</title>
        
      
        <link rel="stylesheet" type="text/css" href="css/style_productos_adm.css">
         <link href="css/theme.css" rel="stylesheet" />
          
        <script>
            // Esta función se ejecutará cuando la página se cargue
            window.onload = function () {
                // Obtener referencias a los elementos del formulario
                var idInput = document.getElementById("identificador");
                var nombreInput = document.getElementById('nombre');
                var usuarioInput = document.getElementById('usuario');
                var correoInput = document.getElementById('correo');
                var passowrdInput = document.getElementById('password');
                

                // Asignar valores a los campos del formulario
                idInput.value = '<%= usuario2.getId()%>';
                nombreInput.value = '<%= usuario2.getNombre()%>';
                usuarioInput.value = '<%= usuario2.getUsuario()%>';
                correoInput.value = '<%= usuario2.getCorreo()%>';
                passowrdInput.value = '<%= usuario2.getPassword()%>';
                
            };
        </script>
    </head>
    <body>
        <main class="main" id="top">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll">
                <div class="container">
                    <a class="navbar-brand d-inline-flex" href="opcionesadmin.jsp">
                        <img class="d-inline-block" src="img/gallery/logo.svg" alt="logo" />
                        <span class="text-1000 fs-3 fw-bold ms-2 text-gradient">Dogos el Carballo</span>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse border-top border-lg-0 my-2 mt-lg-0" id="navbarSupportedContent">
                        <div class="mx-auto pt-5 pt-lg-0 d-block d-lg-none d-xl-block">
                            <p class="mb-0 fw-bold text-lg-center">Ubicación: <i class="fas fa-map-marker-alt text-warning mx-2"></i><span class="fw-normal">NAINARI Y TEBARI 85110 </span><span>Ciudad Obregón, Sonora, 
                                    Mexico</span></p>
                        </div>
                        

                            <button class="btn btn-white shadow-warning text-warning"  type="submit"><i class="fas fa-user"></i> <% out.println(usuario);%></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'index.jsp'"> <i class="fas fa-sign-out-alt"></i></button>
                        
                    </div>
                </div>
            </nav>
        <header>
            <h1>CRUD de Usuarios</h1>
        </header>

        <form class="formAdmProducto" action="ModificarUsuario" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" disabled />

            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" disabled />

            <label for="correo">Correo:</label>
            <input type="text" id="correo" name="correo"  disabled />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Ingrese su password" maxlength="30" required />

            <label for="identificador" style="display: none;">Id</label>
            <input type="number" id="identificador" name="identificador" style="display: none;" />
            <br>
            <br>
            <button class="buttonAdmProducto" type="submit">Actualizar Usuario</button>
        </form>
        </main>
                            <script src="vendors/@popperjs/popper.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.min.js"></script>
        <script src="vendors/is/is.min.js"></script>
        <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
        <script src="vendors/fontawesome/all.min.js"></script>
        <script src="js/theme.js"></script>

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
