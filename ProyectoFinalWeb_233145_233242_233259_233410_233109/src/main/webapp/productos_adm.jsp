<%-- 
    Document   : productos
    Created on : 12 nov 2023, 17:58:51
    Author     : Ángel ñ
--%>
<%@page import="Controlador.ControladorProducto"%>
<%
    ControladorProducto cp = new ControladorProducto();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar productos</title>
        <link rel="stylesheet" type="text/css" href="css/style_productos_adm.css">
    </head>
    
    <script>
        function enviarEliminarProducto(idProducto) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "eliminarproducto", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    window.location.href = 'productos_adm.jsp';
                }
            };
            var params = "id=" + idProducto;
            xhr.send(params);
        }
        function enviarModificarProducto(idProducto) {
            window.location.href = "modificar_producto.jsp?idProducto=" + idProducto;
        }
    </script>
    
    <body>
        <header>
            <h1>CRUD de Productos</h1>
        </header>

        <form id="productForm" action="agregaralimento" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required />

            <label for="img">URL de la Imagen:</label>
            <input type="text" id="img" name="img" required />

            <label for="precio">Precio:</label>
            <input type="number" id="precio" name="precio" step="0.01" required />

            <label for="stock">Stock:</label>
            <input type="number" id="stock" name="stock" required />

            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" rows="4" required ></textarea>

            <label for="categoria">Categoría:</label>
            <select id="categoria" name="categoria" required>
                <option value="comidas">Comidas</option>
                <option value="bebidas">Bebidas</option>
            </select>

            <button type="submit">Agregar Producto</button>
        </form>

        <table id="productTable" border="1">
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

    </body>
</html>
