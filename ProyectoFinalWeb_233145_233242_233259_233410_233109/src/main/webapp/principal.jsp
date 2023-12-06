<%-- 
    Document   : cart
    Created on : 05 nov 2023, 17:25:10
    Author     : Gabriel Mancinas
--%>
<%@page import="Controlador.ControladorProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("correo");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
    ControladorProducto cp = new ControladorProducto();
%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Titulo del documento-->
        <title>Dogos el Carballo</title>

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

    </head>


    <body>
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
                        
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'acercade.jsp'"><i class="fa fa-info-circle"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'contacto.jsp'"><i class="fas fa-envelope"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'cart.jsp'"> <i class="fas fa-shopping-cart"></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'compras_usuario.jsp'"> <i class="fas fa-clipboard-list"></i></i></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'modificar_usuario_correo.jsp'"><i class="fas fa-user"></i> <% out.println(usuario);%></button>
                            <button class="btn btn-white shadow-warning text-warning"  type="button" onclick="window.location.href = 'index.jsp'"> <i class="fas fa-sign-out-alt"></i></button>
                        
                    </div>
                </div>
            </nav>
            <section class="py-5 overflow-hidden bg-primary" id="home">
                <div class="container">
                    <div class="row flex-center">
                        <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-8 mt-md-0"><a class="img-landing-banner" href="#!"><img class="img-fluid" src="img/gallery/dogueate.png" alt="hero-header" /></a></div>
                        <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
                            <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">¿Tienes hambre?</h1>
                            <h1 class="text-800 mb-5 fs-4">¡DOGUEATE!<br class="d-none d-xxl-block" /></h1>
                        </div>
                    </div>
                </div>
            </section>

            <section class="py-4 overflow-hidden">

                <div class="container">
                    <div class="row h-100">
                        <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
                            <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Hot Dogs</h5>
                        </div>
                        <div class="col-12">
                            <div class="carousel slide" id="carouselPopularItems" data-bs-touch="false" data-bs-interval="false">
                                <div class="carousel-inner">
                                    <div class="carousel-item active" data-bs-interval="10000">
                                        <div class="row gx-3 h-100 align-items-center">
                                            <%=cp.getProductosDogos()%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->




            <!-- <section> begin ============================-->
            <section class="py-4 overflow-hidden">

                <div class="container">
                    <div class="row h-100">
                        <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
                            <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Bebidas</h5>
                        </div>
                        <div class="col-12">
                            <div class="carousel slide" id="carouselPopularItems" data-bs-touch="false" data-bs-interval="false">
                                <div class="carousel-inner">
                                    <div class="carousel-item active" data-bs-interval="10000">
                                        <div class="row gx-3 h-100 align-items-center">
                                            <%=cp.getProductosBebidas()%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->

            <!-- <section> begin ============================-->
            <section class="pb-5 pt-8">

                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-span mb-3 shadow-lg">
                                <div class="card-body py-0">
                                    <div class="row justify-content-center">
                                        <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-0 order-md-1"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0" src="img/gallery/dogo_prueba.png" alt="..." /></div>
                                        <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                                            <h1 class="card-title mt-xl-5 mb-4">Prueba nuestros ricos<span class="text-primary"> Hot Dogs</span></h1>
                                            <p class="fs-1">Disfruta de su preciso tamaño, no podrás acabártelo.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->

            <!-- <section> begin ============================-->
            <section class="py-0">

                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-span mb-3 shadow-lg">
                                <div class="card-body py-0">
                                    <div class="row justify-content-center">
                                        <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0" src="img/gallery/aguas_frescas.png" alt="..." /></div>
                                        <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                                            <h1 class="card-title mt-xl-5 mb-4">Para esos días calurosos, están nuestras <span class="text-primary">Aguas Frescas</span></h1>
                                            <p class="fs-1">Te encantará su rico sabor casero.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->

            <!-- <section> begin ============================-->
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
            <!-- <section> close ============================-->


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