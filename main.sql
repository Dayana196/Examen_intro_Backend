CREATE TABLE `Libros`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Titulo_Libro` VARCHAR(100) NOT NULL,
    `Autores_fk` BIGINT NOT NULL,
    `Editorial_fk` ENUM('') NOT NULL COMMENT 'Expositivo y argumentativo',
    `Categoria_fk` BIGINT NOT NULL,
    `Fecha_publicacion` DATETIME NOT NULL,
    `ISBN_fk` INT NOT NULL,
    `Stok_fk` BIGINT NOT NULL,
    `Pedidos_fk` BIGINT NOT NULL
);
CREATE TABLE `Clientes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Registrar_nombre` VARCHAR(100) NOT NULL,
    `Correo_electronico` VARCHAR(100) NOT NULL,
    `Telefono` VARCHAR(100) NOT NULL,
    `Direccion` VARCHAR(100) NOT NULL
);
CREATE TABLE `Pedidos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Cliente` BIGINT NOT NULL,
    `fecha_pedido` BIGINT NOT NULL,
    `Estado` ENUM(
        'Pendiente',
        'procesado',
        'completado'
    ) NOT NULL DEFAULT 'Estado_libro',
    `Precio_fk` BIGINT NOT NULL
);
CREATE TABLE `Transacciones`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Metodo_pago` ENUM(
        'Tarjeta_cedito',
        'Tarjeta_debito_nequi_daviplata_PayPal'
    ) NOT NULL,
    `Fecha_transaccion` DATETIME NOT NULL,
    `pedidos_fk` BIGINT NOT NULL,
    `total` BIGINT NOT NULL
);
CREATE TABLE `Categorias`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nombre_categoria` ENUM('') NOT NULL COMMENT 'Romance,Terror,Comedia,Accion,Fantasia etc...'
);
CREATE TABLE `Autores`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nombre` VARCHAR(100) NOT NULL,
    `Nacimiento` VARCHAR(100) NOT NULL,
    `Nacionalidad` VARCHAR(100) NOT NULL
);
CREATE TABLE `Editorial`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nombre_Editor` VARCHAR(100) NOT NULL
);
CREATE TABLE `Cantidad_stok`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad_libro` INT NOT NULL
);
CREATE TABLE `ISBN`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_isbn` BIGINT(15) NOT NULL
);
CREATE TABLE `Precio`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Valor_Libro` BIGINT NOT NULL
);
ALTER TABLE
    `Pedidos` ADD CONSTRAINT `pedidos_cliente_foreign` FOREIGN KEY(`Cliente`) REFERENCES `Clientes`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_editorial_fk_foreign` FOREIGN KEY(`Editorial_fk`) REFERENCES `Editorial`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_pedidos_fk_foreign` FOREIGN KEY(`Pedidos_fk`) REFERENCES `Pedidos`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_stok_fk_foreign` FOREIGN KEY(`Stok_fk`) REFERENCES `Cantidad_stok`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_autores_fk_foreign` FOREIGN KEY(`Autores_fk`) REFERENCES `Autores`(`id`);
ALTER TABLE
    `Transacciones` ADD CONSTRAINT `transacciones_pedidos_fk_foreign` FOREIGN KEY(`pedidos_fk`) REFERENCES `Pedidos`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_categoria_fk_foreign` FOREIGN KEY(`Categoria_fk`) REFERENCES `Categorias`(`id`);
ALTER TABLE
    `Pedidos` ADD CONSTRAINT `pedidos_precio_fk_foreign` FOREIGN KEY(`Precio_fk`) REFERENCES `Precio`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_isbn_fk_foreign` FOREIGN KEY(`ISBN_fk`) REFERENCES `ISBN`(`id`);