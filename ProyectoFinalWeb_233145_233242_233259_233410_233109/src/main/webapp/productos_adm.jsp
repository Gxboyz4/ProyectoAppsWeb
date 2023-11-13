<%-- 
    Document   : productos
    Created on : 12 nov 2023, 17:58:51
    Author     : Ángel ñ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar productos</title>
        <link rel="stylesheet" type="text/css" href="css/style_productos_adm.css">
    </head>
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

       
    </body>
</html>
