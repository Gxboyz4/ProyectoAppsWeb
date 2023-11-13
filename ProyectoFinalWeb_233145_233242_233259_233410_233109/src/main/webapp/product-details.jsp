<%-- 
    Document   : menu
    Created on : 05 nov 2023, 17:09:10
    Author     : Gabriel Mancinas
--%>

<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objSesion=request.getSession(false);
String usuario = (String)objSesion.getAttribute("usuario");
if(usuario.equals("")){
response.sendRedirect("index.jsp");
    }
    %>
<%
  ControladorProducto cp = new ControladorProducto();
%>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  Producto producto = new ControladorProducto().getProducto(id);
%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-
              lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <title>DetallesProducto</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
            <a class="navbar-brand" href="menu.jsp">Logo</a>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Carrito</a>
                </li>
            </ul>
            <ul class="navbar-nav" style="right: 5px; position: absolute;">
                <li class="nav-item text-white"><% out.println(usuario);%></li>
            </ul>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-9 padding-right">
                    <div class="view-product">
                        <img src="img/<%=producto.getImg()%>" alt="" width="230" height="230"/>
                        <h2><%=producto.getNombre()%></h2>
                        <h4>Web ID: <%=producto.getId()%></h4>
                        <img src="img/rating_5.png" alt="" width="151" height="30"/>
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
            </div>
        </div>
            
    </body>
</html>