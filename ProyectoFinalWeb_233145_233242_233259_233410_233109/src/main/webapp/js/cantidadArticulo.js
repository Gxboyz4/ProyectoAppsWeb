/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener("DOMContentLoaded", function () {
    const botonesIncremento = document.querySelectorAll(".cart_quantity_up");
    const botonesDecremento = document.querySelectorAll(".cart_quantity_down");

    botonesIncremento.forEach(boton => {
        boton.addEventListener("click", function (event) {
            event.preventDefault();
            const idArticulo = boton.getAttribute("data-articulo-id");
            actualizarCantidad(idArticulo, 1); // Aumentar la cantidad en 1
        });
    });

    botonesDecremento.forEach(boton => {
        boton.addEventListener("click", function (event) {
            event.preventDefault();
            const idArticulo = boton.getAttribute("data-articulo-id");
            actualizarCantidad(idArticulo, -1); // Disminuir la cantidad en 1
        });
    });

    function actualizarCantidad(idArticulo, cambio) {
        const inputCantidad = document.querySelector(`.cart_quantity_input[data-articulo-id="${idArticulo}"]`);

        // Verificar si se encontró el elemento
        if (inputCantidad) {
            let nuevaCantidad = parseInt(inputCantidad.value) + cambio;
            if (nuevaCantidad < 1) {
                nuevaCantidad = 1; // Evitar cantidades negativas
            }
            inputCantidad.value = nuevaCantidad;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "actualizarcantidad", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var params = "id=" + idArticulo + "-" + nuevaCantidad;
            xhr.send(params);
            window.location.href = "cart.jsp";
        } else {
            console.log('Elemento no encontrado para el idArticulo:', idArticulo);
        }
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const botonesEliminacion = document.querySelectorAll(".cart_quantity_delete");

    botonesEliminacion.forEach(boton => {
        boton.addEventListener("click", function (event) {
            event.preventDefault();
            const idProducto = boton.getAttribute("data-producto-id");

            // Llamada a la función para eliminar el producto
            eliminarProducto(idProducto);
        });
    });

    function eliminarProducto(idProducto) {
        // Aquí puedes escribir la lógica para eliminar el producto de la lista
        // Por ejemplo, puedes usar AJAX para enviar una solicitud al servidor 
        // y eliminar el producto de la lista en el backend
        // O bien, eliminarlo directamente del DOM si es solo a nivel visual

        // Por ejemplo, si quieres eliminarlo del DOM (a nivel visual) puedes hacer algo como:
        const productoEliminar = document.querySelector(`.cart_quantity_delete[data-producto-id="${idProducto}"]`);
        if (productoEliminar) {
            productoEliminar.closest('tr').remove(); // Elimina la fila del producto
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "actualizarcantidad", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var cantidad = 0;
            var params = "id=" + idProducto + "-" + cantidad;
            xhr.send(params);
            window.location.href = "cart.jsp";
        }
    }
});

