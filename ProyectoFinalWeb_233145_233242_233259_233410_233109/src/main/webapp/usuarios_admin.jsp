<%@page import="Modelo.Usuario"%>
<%@page import="Controlador.ControladorProducto"%>
<% HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if (usuario.equals("")) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="Controlador.ControladorUsuario"%>
<%
    ControladorUsuario cu = new ControladorUsuario();
%>
<!DOCTYPE html>
<html lang="es" dir="ltr">

    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Titulo del documento-->
        <title>Administrar Usuarios</title>

        <!--Favicons-->
        <link rel="apple-touch-icon" sizes="180x180" href="img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicons/favicon.ico">
        <link rel="manifest" href="img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">

        <!--Hojas de estilo-->
        <link href="css/style_productos_adm.css" rel="stylesheet" type="text/css"/>
        <link href="css/theme.css" rel="stylesheet" />
        
        <script>
        function enviarEliminarUsuario(idUsuario) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "EliminarUsuario", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    window.location.href = 'usuarios_admin.jsp';
                }
            };
            var params = "id=" + idUsuario;
            xhr.send(params);
        }
        function enviarModificarUsuario(idUsuario) {
            window.location.href = "modificar_usuario.jsp?idUsuario=" + idUsuario;
        }
    </script>
    </head>


    <body style="margin-top: 100px; background-color: #ffe093;">
        <!--Contenido-->

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
                            
            

        <table class="tableformAdmProductos" border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Usuario</th>
                    <th>Correo</th>
                    <th>Password</th>
                    <th>Administrador</th>
                </tr>
            </thead>
            <tbody>
                <%=cu.getUsuarios()%>
            </tbody>
        </table>

        </main>
        <!--Final del contenido-->

        <!--JavaScripts-->
        <script src="vendors/@popperjs/popper.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.min.js"></script>
        <script src="vendors/is/is.min.js"></script>
        <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
        <script src="vendors/fontawesome/all.min.js"></script>
        <script src="js/theme.js"></script>

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>

</html>
