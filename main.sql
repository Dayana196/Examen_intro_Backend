CREATE TABLE `Libros`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Titulo_Libro` VARCHAR(100) NOT NULL,
    `Categoria_fk` ENUM('') NOT NULL,
    `Fecha_publicacion` DATE NOT NULL,
    `precio` INT NOT NULL,
    `cantidad` INT NOT NULL,
    `Editorial_fk` BIGINT NOT NULL
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
    ) NOT NULL DEFAULT 'Estado_libro'
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
    `Nacimiento` DATETIME NOT NULL,
    `Nacionalidad` VARCHAR(100) NOT NULL
);
CREATE TABLE `Editorial`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nombre_Editor` VARCHAR(100) NOT NULL,
    `direccion` BIGINT NOT NULL
);
CREATE TABLE `Proceso_libro`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pedidos_fk` BIGINT NOT NULL,
    `libros_fk` BIGINT NOT NULL,
    `cantidad` INT NOT NULL,
    `precio` INT NOT NULL,
    `total` INT NOT NULL
);
CREATE TABLE `Autor libro`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `autores_fk` BIGINT NOT NULL,
    `libros_fk` BIGINT NOT NULL
);
ALTER TABLE
    `Autor libro` ADD CONSTRAINT `autor libro_autores_fk_foreign` FOREIGN KEY(`autores_fk`) REFERENCES `Autores`(`id`);
ALTER TABLE
    `Pedidos` ADD CONSTRAINT `pedidos_cliente_foreign` FOREIGN KEY(`Cliente`) REFERENCES `Clientes`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_editorial_fk_foreign` FOREIGN KEY(`Editorial_fk`) REFERENCES `Editorial`(`id`);
ALTER TABLE
    `Autor libro` ADD CONSTRAINT `autor libro_libros_fk_foreign` FOREIGN KEY(`libros_fk`) REFERENCES `Libros`(`id`);
ALTER TABLE
    `Transacciones` ADD CONSTRAINT `transacciones_pedidos_fk_foreign` FOREIGN KEY(`pedidos_fk`) REFERENCES `Pedidos`(`id`);
ALTER TABLE
    `Proceso_libro` ADD CONSTRAINT `proceso_libro_id_pedidos_fk_foreign` FOREIGN KEY(`id_pedidos_fk`) REFERENCES `Pedidos`(`id`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_categoria_fk_foreign` FOREIGN KEY(`Categoria_fk`) REFERENCES `Categorias`(`id`);
ALTER TABLE
    `Proceso_libro` ADD CONSTRAINT `proceso_libro_libros_fk_foreign` FOREIGN KEY(`libros_fk`) REFERENCES `Libros`(`id`);