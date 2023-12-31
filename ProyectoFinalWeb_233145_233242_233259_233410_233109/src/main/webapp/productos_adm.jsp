<%@page import="Modelo.Producto"%>
<%@page import="Controlador.ControladorProducto"%>
<% HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("correo");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@page import="Controlador.ControladorProducto"%>
<%
    ControladorProducto cp = new ControladorProducto();
%>
<!DOCTYPE html>
<html lang="es" dir="ltr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Titulo del documento-->
        <title>Administrar productos</title>

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
            function enviarEliminarProducto(idProducto) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "eliminarproducto", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        alert("Producto eliminado correctamente");
                    }
                    if(xhr.status !== 200){
                        alert("Error al eliminar el producto");
                    }
                    window.location.href = 'productos_adm.jsp';
                };
                var params = "id=" + idProducto;
                xhr.send(params);
            }
            function enviarModificarProducto(idProducto) {
                window.location.href = "modificar_producto.jsp?idProducto=" + idProducto;
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
                       
                            <button class="btn btn-white shadow-warning text-warning"  type="submit"><i class="fas fa-user"></i> <% out.println(usuario);%></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'index.jsp'"> <i class="fas fa-sign-out-alt"></i></button>
                        
                    </div>
                </div>
            </nav>

            <form class="formAdmProducto" action="agregaralimento" method="post" enctype="multipart/form-data">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Ingrese su nombre" maxlength="30" required />

                <label for="img">Imagen del producto:</label>
                <input type="file" id="img" name="img" accept=".png, .jpg" required />

                <label for="precio">Precio:</label>
                <input type="number" id="precio" name="precio" placeholder="0.01" step="0.01" min="0.01" required />

                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" placeholder="1" min="1" required />

                <label for="descripcion">Descripción:</label>
                <br>
                <textarea id="descripcion" name="descripcion" rows="4" placeholder="Ingrese la descripción del producto" maxlength="80" required ></textarea>
                <br>
                <label for="categoria">Categoría:</label>
                <select id="categoria" name="categoria" required>
                    <option value="comidas">Comidas</option>
                    <option value="bebidas">Bebidas</option>
                </select>
                <br>
                <br>
                <button class="buttonAdmProducto" type="submit">Agregar Producto</button>
            </form>

            <table class="tableformAdmProductos" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre del Producto</th>
                        <th>Precio(MXN)</th>
                        <th>Stock</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%=cp.getProductos()%>
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
