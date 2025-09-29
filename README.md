# DOCUMENTACIÓN 

## Decisiones de diseño:

- Se separaron entidades principales (Libros, Autores, Editorial, Categorías, Clientes) para evitar duplicidad.

- Relaciones:

- Un autor, editorial y categoría pueden tener muchos libros.

- Cada libro tiene un ISBN, stock, precio y puede estar en muchos pedidos.

- Un cliente puede generar muchos pedidos, y cada pedido tiene su transacción.


## Enumeraciones: 

- Se usaron enum para métodos de pago, estado de pedido y categorías para mayor control.

- Integridad: Se aplican claves foráneas para asegurar la consistencia de datos entre tablas.

- Escalabilidad: Estructura preparada para agregar nuevas funcionalidades (descuentos, reseñas, etc.).

## Autores
- Almacena la información de los autores de los libros.

Campos:

- id: Identificador único.

- Nombre: Nombre del autor.

- Nacimiento: Fecha de nacimiento.

- Nacionalidad: País de origen.

## Editorial

- Contiene los datos de las editoriales que publican los libros.

Campos:

- id: Identificador único.

- Nombre_Editor: Nombre de la editorial.


## Categorias

- Clasifica los libros por género o tema.

Campos:

- id: Identificador único.

- Nombre_categoria: Nombre de la categoría.

## ISBN

- Guarda el número de identificación único de cada libro.

Campos:

- id: Identificador.

- id_isbn: Número ISBN.

## Libros

- Almacena la información principal de cada libro.

Campos:

- id: Identificador único.

- Titulo_Libro: Título del libro.

- Autores_fk: Autor del libro.

- Editorial_fk: Editorial del libro.

- Categoria_fk: Categoría del libro.

- Fecha_publicacion: Fecha de publicación.

- ISBN_fk: ISBN del libro.

- Stok_fk: Cantidad disponible.

- Pedidos_fk: Relación con pedidos.

## Cantidad_stok

- Controla el inventario de libros disponibles.

Campos:

- id: Identificador.

- cantidad_libro: Número de LIBROS.

## Precio

- Almacena el valor de venta de cada libro.

Campos:

- id: Identificador.

- Valor_Libro: Precio del libro.

## Clientes

- Registra los datos de los clientes.

Campos:

- id: Identificador.

- Registrar_nombre: Nombre del cliente.

- Correo_electronico: Email.

- Telefono: Número de contacto.

- Direccion: Dirección del cliente.
Pedidos

## Guarda las órdenes de compra de los clientes (PEDIDOS).
 
Campos:

- id: Identificador.

- Cliente: Cliente que realizó el pedido.

- fecha_pedido: Fecha del pedido.

- Estado: Estado del pedido.

- Precio_fk: Precio total.


## Transacciones

- Almacena la información del pago de los pedidos.

Campos:

- id: Identificador.

- Metodo_pago: Método utilizado.

- Fecha_transaccion: Fecha de la transacción.

- pedidos_fk: Pedido relacionado.

- total: Monto total pagado.

