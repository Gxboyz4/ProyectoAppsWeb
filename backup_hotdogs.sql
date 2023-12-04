drop database hotdogs;

CREATE DATABASE IF NOT EXISTS hotdogs;
USE hotdogs;
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    usuario VARCHAR(30) NOT NULL,
    correo VARCHAR(40) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    administrador BOOLEAN DEFAULT false
);
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria enum('bebidas', 'comidas') NOT NULL,
    img_producto VARCHAR(30) NOT NULL,
    stock INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    precio FLOAT NOT NULL,
    descripcion VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    descripcion VARCHAR(150) NOT NULL,
    precio_venta FLOAT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO USUARIOS (NOMBRE,USUARIO,CORREO,PASSWORD,administrador) VALUES('Administrador', 'KekoAdmin', 'keko@gmail.com','kekana741', true);

DELIMITER @@
CREATE PROCEDURE hotdogs.selectHotdog
(
    IN idProducto int
)
BEGIN
     SELECT * FROM productos WHERE id = idProducto AND categoria = 'comidas';
END @@ 
DELIMITER ; 

DELIMITER @@
CREATE PROCEDURE hotdogs.selectHotdogs
()
BEGIN
     SELECT * FROM productos WHERE categoria = 'comidas';
END @@ 
DELIMITER ; 

DELIMITER @@
CREATE PROCEDURE hotdogs.selectBebida
(
    IN idProducto int
)
BEGIN
     SELECT * FROM productos WHERE id = idProducto AND categoria = 'bebidas';
END @@ 
DELIMITER ; 

DELIMITER @@
CREATE PROCEDURE hotdogs.selectBebidas
()
BEGIN
     SELECT * FROM productos WHERE categoria = 'bebidas';
END @@ 
DELIMITER ; 

DELIMITER @@
CREATE PROCEDURE hotdogs.selectProducto
(
    IN idProducto int
)
BEGIN
     SELECT * FROM productos WHERE id = idProducto;
END @@ 
DELIMITER ; 

DELIMITER @@
CREATE PROCEDURE hotdogs.actualizarUsuarioPorCorreo(
    IN nombre_param VARCHAR(30),
    IN usuario_param VARCHAR(30),
    IN correo_param VARCHAR(40),
    IN password_param VARCHAR(30)
)
BEGIN
    UPDATE usuarios
    SET nombre = nombre_param,
        usuario = usuario_param,
        password = password_param
    WHERE correo = correo_param;
END @@ 
DELIMITER ;

DELIMITER @@
CREATE PROCEDURE hotdogs.selectProductos
()
BEGIN
     SELECT * FROM productos;
END @@ 
DELIMITER ; 

DELIMITER @@
CREATE PROCEDURE hotdogs.agregarAlimento(
    IN p_categoria ENUM('bebidas', 'comidas'),
    IN p_img_producto VARCHAR(30),
    IN p_stock INT,
    IN p_nombre VARCHAR(30),
    IN p_precio FLOAT,
    IN p_descripcion VARCHAR(80)
)
BEGIN
    INSERT INTO productos (categoria, img_producto, stock, nombre, precio, descripcion)
    VALUES (p_categoria, p_img_producto, p_stock, p_nombre, p_precio, p_descripcion);
END@@ 
DELIMITER ; 

DELIMITER @@
CREATE PROCEDURE hotdogs.eliminarAlimento(
 IN idProducto int
)
BEGIN 
     Delete From productos WHERE id = idProducto;
END@@
DELIMITER ;


DELIMITER @@
CREATE PROCEDURE hotdogs.actualizarAlimento(
    IN producto_id INT,
    IN nuevo_nombre VARCHAR(30),
    IN nuevo_precio FLOAT,
    IN nueva_descripcion VARCHAR(80),
    IN nueva_categoria VARCHAR(30),
    IN nueva_imagen VARCHAR(30),
    IN nuevo_stock INT
)
BEGIN 
     UPDATE productos
    SET nombre = nuevo_nombre, precio = nuevo_precio, descripcion =nueva_descripcion, categoria = nueva_categoria, img_producto = nueva_imagen, stock = nuevo_stock
    WHERE id = producto_id;
END@@
DELIMITER ;

DELIMITER @@
CREATE PROCEDURE hotdogs.eliminarUsuario(
 IN idUsuario int
)
BEGIN 
     Delete From usuarios WHERE id = idUsuario;
END@@
DELIMITER ;

DELIMITER @@
CREATE PROCEDURE hotdogs.actualizarUsuario(
IN idUsuario int,
IN nueva_password  VARCHAR(30)
)
BEGIN 
     UPDATE usuarios
     SET password = nueva_password where id = idUsuario;
END@@
DELIMITER ;








DELIMITER @@
CREATE PROCEDURE hotdogs.agregarPedido(
    IN p_descripcion VARCHAR(150),
    IN p_usuario_id INT,
    IN p_precio_venta FLOAT
)
BEGIN
    INSERT INTO pedidos(usuario_id, descripcion, precio_venta, fecha)
    VALUES (p_usuario_id, p_descripcion,p_precio_venta, current_date());
END@@ 
DELIMITER ; 


DELIMITER @@
CREATE PROCEDURE hotdogs.selectUsuario
(
    IN u_correo VARCHAR(40)
)
BEGIN
     SELECT * FROM usuarios WHERE correo = u_correo;
END @@ 
DELIMITER ; 

-- Insertar el primer producto
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('dogo_chiledogo.png', 10, 'Dogo ChileDogo', 35.00, 'Delicioso dogo con chile.', 'comidas');

-- Insertar el segundo producto
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('dogo_embarazado.png', 15, 'Dogo Embarazado', 45.00, 'El dogo favorito de mamá.', 'comidas');

-- Insertar el tercer producto
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('dogo_jumbo.png', 8, 'Dogo Jumbo', 50.00, 'El dogo más grande que jamás hayas visto.', 'comidas');

-- Insertar el cuarto producto
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('dogo_quesidogo.png', 12, 'Dogo QuesiDogo', 60.00, 'Con mucho queso derretido.', 'comidas');

-- Insertar el quinto producto
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('dogo_sencillo.png', 20, 'Dogo Sencillo', 25.00, 'Simple pero delicioso.', 'comidas');

-- Insertar el producto "Horchata Bebida" en la tabla productos
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('horchata_bebida.png', 50, 'Horchata', 12.50, 'Refrescante bebida de horchata.', 'bebidas');

-- Insertar el producto "Coca-Cola Bebida" en la tabla productos
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('cocacola_bebida.png', 60, 'Coca-Cola', 19.00, 'Clasica bebida de cola.', 'bebidas');

-- Insertar el producto "Jamaica Bebida" en la tabla productos
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('jamaica_bebida.png', 40, 'Jamaica', 12.50, 'Bebida refrescante de jamaica.', 'bebidas');

-- Insertar el producto "Té Bebida" en la tabla productos
INSERT INTO productos (img_producto, stock, nombre, precio, descripcion, categoria)
VALUES ('te_bebida.png', 30, 'Te', 12.00, 'Bebida de te caliente o frío.', 'bebidas');

