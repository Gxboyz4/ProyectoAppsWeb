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
                            <p class="mb-0 fw-bold text-lg-center">Ubicaci�n: <i class="fas fa-map-marker-alt text-warning mx-2"></i><span class="fw-normal">NAINARI Y TEBARI 85110 </span><span>Ciudad Obreg�n, Sonora, 
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
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <!-- Carousel -->
                            <div id="demo" class="carousel slide" data-bs-ride="carousel">

                                <!-- Indicators/dots -->
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                                    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                                    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                                </div>

                                <!-- The slideshow/carousel -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="img/favicons/Carballo Dogos.png" width="812" height="600" alt="CarballoDogos" class="d-block w-100">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="img/gallery/dogo_prueba.png" alt="Chicago" class="d-block w-100">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="img/gallery/dogueate.png" alt="New York" class="d-block w-100">
                                    </div>
                                </div>

                                <!-- Left and right controls/icons -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </button>
                            </div>
                            <div class="card-body">
                                <h1 class="card-title">Acerca de nuestra empresa</h1>
                                <p class="card-text">Somos una empresa comprometida en brindar el mejor servicio a nuestros clientes. Con años de experiencia en la industria, hemos demostrado nuestro compromiso con la excelencia y la satisfacción del cliente.</p>
                                <p class="card-text">Nuestra misión es proporcionar productos y servicios de alta calidad que cumplan con las necesidades y expectativas de nuestros clientes. Trabajamos arduamente para mantenernos a la vanguardia de la tecnología y ofrecer nuestros productos de la mejor manera.</p>
                                <p class="card-text">Estamos dedicados a ofrecer el mejor sabor para el paladar del cliente. Siempre estamos dispuestos a escuchar a nuestros clientes y adaptarnos a sus necesidades cambiantes. Su satisfacción es nuestra prioridad.</p>
                                <p class="card-text">Gracias por confiar en nosotros. ¡Esperamos servirle pronto!</p>
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