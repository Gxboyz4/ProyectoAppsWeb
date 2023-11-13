<%-- 
    Document   : modificar_producto
    Created on : 12 nov 2023, 22:01:46
    Author     : mario
--%>
<%@page import="Controlador.ControladorProducto"%>
<%@page import="Modelo.Producto"%>
<%
    String productId = request.getParameter("idProducto");
    ControladorProducto cp = new ControladorProducto();
    Producto producto = cp.getProducto(Integer.parseInt(productId));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar productos</title>
        <link rel="stylesheet" type="text/css" href="css/style_productos_adm.css">

        <script>
            // Esta función se ejecutará cuando la página se cargue
            window.onload = function () {
                // Obtener referencias a los elementos del formulario
                var idInput = document.getElementById("identificador");
                var nombreInput = document.getElementById('nombre');
                var imgInput = document.getElementById('img');
                var precioInput = document.getElementById('precio');
                var stockInput = document.getElementById('stock');
                var descripcionTextarea = document.getElementById('descripcion');
                var categoriaSelect = document.getElementById('categoria');

                // Asignar valores a los campos del formulario
                idInput.value = '<%= producto.getId()%>';
                nombreInput.value = '<%= producto.getNombre()%>';
                imgInput.value = '<%= producto.getImg()%>';
                precioInput.value = '<%= producto.getPrecio()%>';
                stockInput.value = '<%= producto.getStock()%>';
                descripcionTextarea.value = '<%= producto.getDescripcion()%>';
                categoriaSelect.value = '<%= producto.getCategoria()%>';
            };
        </script>
    </head>
    <body>
        <header>
            <h1>CRUD de Productos</h1>
        </header>

        <form id="productForm" action="modificarproducto" method="post">
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

            <label for="identificador" style="display: none;">Id</label>
            <input type="number" id="identificador" name="identificador" style="display: none;" />
            
            <button type="submit">Actualizar Producto</button>
        </form>
    </body>
</html>