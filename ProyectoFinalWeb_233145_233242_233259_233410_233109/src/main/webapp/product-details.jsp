<%-- 
    Document   : menu
    Created on : 
    Author     : 
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.ModeloProducto"%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if (usuario.equals("")) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    ControladorProducto cp = new ControladorProducto();
%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    System.out.println("ID: " + id);
    Producto producto = new ControladorProducto().getProducto(id);
    System.out.println(" PRODUCTO NOMBRE " + producto.getNombre());
%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- Bootstrap JS y dependencias (jQuery y Popper.js) -->
        <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-
              lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link href="css/theme.css" rel="stylesheet" />
        <link href="css/style_detalles_producto.css" rel="stylesheet" /> 
        <title>DetallesProducto</title>

    </head>
    <body>
        <main>
            <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll">
                <div class="container">
                    <a class="navbar-brand d-inline-flex" href="principal.jsp">
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
                        <form class="d-flex mt-4 mt-lg-0 ms-lg-auto ms-xl-0" action="iniciar" method="post">
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'acercade.jsp'"><i class="fa fa-info-circle"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'contacto.jsp'"><i class="fas fa-envelope"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'cart.jsp'"> <i class="fas fa-shopping-cart"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'compras_usuario.jsp'"> <i class="fas fa-clipboard-list"></i></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'modificar_usuario_correo.jsp'"><i class="fas fa-user"></i> <% out.println(usuario);%></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="submit"> <i class="fas fa-sign-out-alt"></i></button>
                        </form>
                    </div>
                </div>
            </nav>
            <div class="divCentral">            
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-8">
                            <!-- Columna izquierda para detalles del producto seleccionado -->
                            <div class="view-product text-center">
                                <img src="img/gallery/<%=producto.getImg()%>" alt="" width="300px" height="300px" class="img-fluid mb-4" />
                                <h2 class="display-4"><%=producto.getNombre()%></h2>
                                <h4 class="lead">Web ID: <%=producto.getId()%></h4>
                                <h4><%=producto.getDescripcion()%></h4>
                                <form action="agregarproducto" method="post">
                                    <span>
                                        <span>Precio $<%=producto.getPrecio()%></span><br>
                                        <label>Cantidad:</label>
                                        <input type="hidden" value="<%=producto.getId()%>" name="idproducto">
                                        <input type="text" value="1" id="txt-cantidad" name="cantidad"/><br>
                                        <button type="submit" class="btn btn-fefault cart">
                                            <i class="fa fa-shopping-cart"></i>
                                            Añadir al carrito
                                        </button>
                                    </span>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Columna derecha para otros detalles del producto o información adicional -->
                            <h2 class="mb-4">Otros productos</h2>
                            <div id="productosCarousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <!-- Itera sobre los primeros 5 productos de la lista y muéstralos en el carousel -->
                                    <%
                                        List<Producto> productos;
                                        if (producto.getCategoria().equalsIgnoreCase("comidas")) {
                                            productos = new ModeloProducto().getProductosDogos();
                                        } else {
                                            productos = new ModeloProducto().getProductosBebidas();
                                        }

                                        int count = 0; // Variable para contar la cantidad de productos mostrados
                                        for (Producto otroProducto : productos) {

                                    %>
                                         <div class="carousel-item <% if (count == 0)
                                            out.print("active");%>">
                                        <div class="bg-white p-3">
                                            <img src="img/gallery/<%=otroProducto.getImg()%>" class="d-block w-100 img-thumbnail" alt="">
                                        </div>
                                        <h4 class="mt-2"><%=otroProducto.getNombre()%></h4>
                                        <!-- Agrega más detalles si es necesario -->
                                        <p><%=otroProducto.getDescripcion()%></p>
                                        <div class="d-grid gap-2">
                                            <a class="btn btn-lg btn-danger" href="product-details.jsp?id=<%=otroProducto.getId()%>" role="button">Ver detalles</a>
                                        </div>
                                    </div>
                                    <%
                                            count++;

                                        }
                                    %>
                                </div>
                                <a class="carousel-control-prev" href="#productosCarousel" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Anterior</span>
                                </a>
                                <a class="carousel-control-next" href="#productosCarousel" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Siguiente</span>
                                </a>
                            </div>
                        </div>         
                    </div>
                </div>
            </div>  
            <section class="py-0 pt-7 bg-1000">

                <div class="container">

                    <div class="row">

                        <div class="col-12 col-md-8 col-lg-6 col-xxl-4">
                            <h5 class="lh-lg fw-bold text-500">Sí­guenos</h5>
                            <div class="text-start my-3">
                                <a href="https://www.facebook.com/people/Hot-Dogs-El-Carballo/100070784457086/">
                                    <svg class="svg-inline--fa fa-facebook fa-w-16 fs-2 mx-2" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="facebook" role="img" viewBox="0 0 512 512">
                                    <path fill="#BDBDBD" d="M504 256C504 119 393 8 256 8S8 119 8 256c0 123.78 90.69 226.38 209.25 245V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.28c-30.8 0-40.41 19.12-40.41 38.73V256h68.78l-11 71.69h-57.78V501C413.31 482.38 504 379.78 504 256z"></path>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <hr class="border border-800" />
                        <div class="row flex-center pb-3">
                            <div class="col-md-6 order-0">
                                <p class="text-200 text-center text-md-start">Todos los derechos reservados &copy; J-Glam, 2023</p>
                            </div>


                        </div>
                    </div>
                </div><!-- end of .container-->

            </section>
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