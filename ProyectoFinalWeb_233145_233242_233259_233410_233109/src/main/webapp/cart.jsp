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
        <link href="css/Style_carrito.css" rel="stylesheet" />
        <link href="css/theme.css" rel="stylesheet" />


    </head>


    <body style="margin-top: 100px;">
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
                        <form class="d-flex mt-4 mt-lg-0 ms-lg-auto ms-xl-0" action="iniciar" method="post">
                            <button class="btn btn-white shadow-warning text-warning" type="submit">Admin</button>
                            <button class="btn btn-white shadow-warning text-warning" type="button" onclick="window.location.href = 'acercade.jsp'">Acerca de</button>
                            <button class="btn btn-white shadow-warning text-warning" type="submit">Contacto</button>
                            <button class="btn btn-white shadow-warning text-warning" type="button" onclick="window.location.href = 'cart.jsp'"> <i class="fas fa-shopping-cart"></i></button>
                            <button class="btn btn-white shadow-warning text-warning" type="submit"><i class="fas fa-user"></i></button>
                            <button class="btn btn-white shadow-warning text-warning" type="submit"> <i class="fas fa-sign-out-alt"></i></button>
                        </form>
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

                                    <tr>
                                        <td class="cart_product">
                                            <a href=""><img src="img/" alt="" width="230" height="230"></a>
                                        </td>
                                        <td class="cart_description">
                                            <h4><a href="" style="color: #000000;"></a></h4>
                                            <p>Web ID:</p>
                                        </td>
                                        <td class="cart_price">
                                            <p></p>
                                        </td>
                                        <td class="cart_quantity">
                                            <div class="cart_quantity_button">
                                                <a class="cart_quantity_up" href=""><i class="fas fa-plus"></i></a>
                                                <input class="cart_quantity_input" type="text" name="quantity" value="" autocomplete="off" size="2">
                                                <a class="cart_quantity_down" href=""><i class="fa fa-times"></i></a>
                                            </div>
                                        </td>
                                        <td class="cart_total">
                                            <p class="cart_total_price"> </p>
                                        </td>
                                        <td class="cart_delete">
                                            <span id="idarticulo" style="" ></span>
                                                <a class="cart_quantity_delete" href="" id="deleteitem"><i class="fas fa-trash"></i></a>
                                        </td>


                                </tbody>
                            </table>

                            <h4>No hay articulos en el carrito de compras</h4>

                        </div><a class="btn btn-default" href="javascript:window.history.go(-2);"><i class="fa fa-shopping-cart"></i>Seguir Comprando</a>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-header" style="color: #000000; font-weight: bold;">Carrito</div>
                            <div class="card-body">
                                <table>
                                    <tr>
                                        <td>Sub-total <span id="txt-subtotal"></td>
                                        <td></span></td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td><span id="txt-total"></span></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="card-footer">
                                <a class="btn btn-default update" class="btn-pagar" href=""><i class="fa fa-shopping-cart"></i>Actualizar</a>
                                <a class="btn btn-default check_out" class="btn-pagar" href=""><i class="fa fa-shopping-cart"></i>Pagar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



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
