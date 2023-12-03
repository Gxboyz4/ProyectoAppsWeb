<%-- 
    Document   : cart
    Created on : 6 nov 2023, 17:07:04
    Author     : julio
--%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("correo");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<html lang="es" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Titulo del documento-->
        <title>Carrito</title>

        <!--Favicons-->
        <link rel="apple-touch-icon" sizes="180x180" href="img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicons/favicon.ico">
        <link rel="manifest" href="img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">

        <!--Hojas de estilo-->
        <link href="css/theme.css" rel="stylesheet" />
        <link href="css/Style_carrito.css" rel="stylesheet" />
        <script src="js/cantidadArticulo.js" type="text/javascript"></script>
    </head>
    <body style="margin-top: 150px;">
        <!--Contenido-->

        <main class="main" id="top">
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
                        
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'acercade.jsp'"><i class="fa fa-info-circle"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'contacto.jsp'"><i class="fas fa-envelope"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'cart.jsp'"> <i class="fas fa-shopping-cart"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'compras_usuario.jsp'"> <i class="fas fa-clipboard-list"></i></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'modificar_usuario_correo.jsp'"><i class="fas fa-user"></i> <% out.println(usuario);%></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'index.jsp'"> <i class="fas fa-sign-out-alt"></i></button>
                        
                    </div>
                </div>
            </nav>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="table-responsive cart_info" id="cart-container">
                            <table class="table table-condensed" id="shop-table">
                                <thead>
                                    <tr class="cart_menu">
                                        <td class="image">Productos</td>
                                        <td class="description"></td>
                                        <td class="price">Precio</td>
                                        <td class="quantity">Cantidad</td>
                                        <td class="total">Total</td>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ControladorProducto cp = new ControladorProducto();
                                        double total = 0;
                                        if (articulos != null) {
                                            for (Articulo a : articulos) {
                                                Producto producto = cp.getProducto(a.getIdProducto());
                                                total += a.getCantidad() * producto.getPrecio();
                                    %>
                                    <tr>
                                        <td class="cart_product">
                                            <a href=""><img src="img/gallery/<%=producto.getImg()%>" alt="" width="230" height="230"></a>
                                        </td>
                                        <td class="cart_description">
                                            <h4><a href=""><%=producto.getNombre()%></a></h4>
                                            <p>Stock: <%=producto.getStock()%></p>
                                        </td>
                                        <td class="cart_price">
                                            <p>$<%=producto.getPrecio()%></p>
                                        </td>
                                        <td class="cart_quantity">
                                            <div class="cart_quantity_button">
                                                <a class="cart_quantity_up" href="#" data-articulo-id="<%= producto.getId()%>">+</a> 
                                                <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>" autocomplete="off" size="2" data-articulo-id="<%= producto.getId()%>" readonly>
                                                <a class="cart_quantity_down" href="#" data-articulo-id="<%= producto.getId()%>">-</a> 
                                            </div>
                                        </td>
                                        <td class="cart_total">
                                            <p class="cart_total_price">$<%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                        </td>
                                        <td class="cart_delete">
                                            <span id="idarticulo" style="display:none;"><%= producto.getId()%> </span>
                                            <button type="submit" onclick="" class="cart_quantity_delete" data-producto-id="<%= producto.getId()%>" >
                                                <a class="cart_quantity_delete"  href="" data-producto-id="<%= producto.getId()%>"><i class="fa fa-times"></i></a>
                                            </button>
                                        </td>
                                        <%      }
                                            }
                                        %>
                                </tbody>
                            </table>
                            <% if (articulos == null) {%>
                            <h4>No hay articulos en el carrito de compras</h4>
                            <% }%>
                        </div><a href="principal.jsp">Seguir Comprando</a>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-header" style="color: #000000; font-weight: bold;">Carrito</div>
                            <div class="card-body">
                                <table>
                                    <tr>
                                        <td>Sub-total <span id="txt-subtotal"></td>
                                        <td>$ <%= total%></span></td>
                                    </tr>
                                    <tr>
                                        <td>IVA<span></td>
                                        <td>$ <%= String.format("%.4f", total * 0.16f)%></span></td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td><span id="totalCompra" name="totalCompra">$ <%= String.format("%.4f", total + total * 0.16f)%></span></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="card-footer">
                                <form action="pagarcarrito" method="post">
                                    <button type="submit" class="btn-pagar">
                                        <i class="fa fa-shopping-cart"></i>
                                        Pagar
                                    </button>
                                </form>   
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
