CREATE DATABASE TiendaDeRopa
GO

USE TiendaDeRopa
GO

CREATE TABLE Categorias (
  categoria_id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion TEXT
);

INSERT INTO Categorias (nombre, descripcion)
VALUES
  ('Pantalones', 'Prendas de vestir inferiores que cubren desde la cintura hasta los tobillos.'),
  ('Blusas', 'Prendas de vestir superiores que cubren el torso y pueden ser de manga corta o larga.'),
  ('Playeras', 'Prendas de vestir superiores de manga corta, generalmente de tela ligera.'),
  ('Sacos', 'Prendas de vestir superiores m�s formales, generalmente de tela gruesa y con botones.'),
  ('Vestidos', 'Prendas de vestir que cubren todo el cuerpo desde los hombros hasta los pies, generalmente de una sola pieza.'),
  ('Jeans', 'Pantalones de mezclilla, un tipo de tela resistente y duradera.'),
  ('Camisas', 'Prendas de vestir superiores generalmente de tela ligera y de botones.'),
  ('Faldas', 'Prendas de vestir inferiores que cubren desde la cintura hasta la rodilla o el tobillo.'),
  ('Camisetas', 'Prendas de vestir superiores informales, generalmente de manga corta y de algod�n.'),
  ('Chaquetas', 'Prendas de vestir superiores m�s formales, similares a los sacos pero m�s cortas y menos estructuradas.');



CREATE TABLE Marcas (
  marca_id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  pais_origen VARCHAR(50) NOT NULL,
  descripcion TEXT,
  categoria_id INT NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

INSERT INTO Marcas (nombre, pais_origen, descripcion, categoria_id)
VALUES
  ('Dominican Jeans', 'Rep�blica Dominicana', 'Marca dominicana especializada en la fabricaci�n de jeans de alta calidad.', 1),
  ('Tropical Wear', 'Rep�blica Dominicana', 'Marca dominicana conocida por sus dise�os tropicales en blusas y vestidos.', 2),
  ('Caribbean Style', 'Rep�blica Dominicana', 'Marca dominicana que ofrece una amplia gama de playeras con estilos caribe�os.', 3),
  ('Santo Domingo Suits', 'Rep�blica Dominicana', 'Marca dominicana que se especializa en la confecci�n de sacos formales para hombres y mujeres.', 4),
  ('Island Dresses', 'Rep�blica Dominicana', 'Marca dominicana que crea vestidos inspirados en la belleza y la cultura de las islas del Caribe.', 5),
  ('Cibao Jeans', 'Rep�blica Dominicana', 'Marca dominicana que produce una variedad de pantalones de mezclilla de alta calidad.', 1),
  ('Maracas Shirts', 'Rep�blica Dominicana', 'Marca dominicana que ofrece una colecci�n de camisas de colores brillantes y estampados alegres.', 2),
  ('Paradise Skirts', 'Rep�blica Dominicana', 'Marca dominicana que se especializa en faldas ligeras y elegantes con motivos tropicales.', 8),
  ('Tropicana Tees', 'Rep�blica Dominicana', 'Marca dominicana que fabrica camisetas c�modas y coloridas con dise�os inspirados en la naturaleza tropical.', 3),
  ('Sunny Jackets', 'Rep�blica Dominicana', 'Marca dominicana que crea chaquetas ligeras y modernas ideales para climas c�lidos.', 4);

CREATE TABLE Clientes (
  cliente_id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion TEXT,
  telefono VARCHAR(20),
  correo_electronico VARCHAR(50)
);

INSERT INTO Clientes (nombre, direccion, telefono, correo_electronico)
VALUES
  ('Ana Castillo', 'Calle Principal #123, Santo Domingo', '809-555-1234', 'anacastillo@gmail.com'),
  ('Roberto D�az', 'Avenida Independencia #456, Santiago', '829-123-4567', 'robertodiaz@hotmail.com'),
  ('Luis Rodr�guez', 'Calle Duarte #789, Puerto Plata', '809-987-6543', 'luisrodriguez@gmail.com'),
  ('Elena Soto', 'Calle Las Palmas #101, La Romana', '829-567-8901', 'elenasoto@hotmail.com'),
  ('Francisco Pe�a', 'Avenida Winston Churchill #202, Punta Cana', '809-234-5678', 'franciscope�a@gmail.com'),
  ('Mar�a M�ndez', 'Avenida M�ximo G�mez #303, San Pedro de Macor�s', '829-678-9012', 'mariamendez@hotmail.com'),
  ('Carlos Santos', 'Calle El Sol #404, La Vega', '809-345-6789', 'carlossantos@gmail.com'),
  ('Laura Medina', 'Calle Las Flores #505, Hig�ey', '829-890-1234', 'lauramedina@hotmail.com'),
  ('Sof�a Guerrero', 'Calle Los Pinos #606, Jarabacoa', '849-012-3456', 'sofiaguerrero@gmail.com'),
  ('Jos� Ram�rez', 'Avenida Espa�a #707, Barahona', '829-456-7890', 'jos�ramirez@hotmail.com');


CREATE TABLE Productos (
  producto_id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL,
  marca_id INT NOT NULL,
  FOREIGN KEY (marca_id) REFERENCES Marcas(marca_id)
);
INSERT INTO Productos (nombre, descripcion, precio, marca_id)
VALUES
  ('Pantal�n Vaquero', 'Pantal�n de mezclilla de corte cl�sico y resistente.', 3999.00, 1),
  ('Blusa Floral', 'Blusa ligera con estampado floral y cuello en V.', 4599.00, 2),
  ('Playera B�sica', 'Playera de algod�n de manga corta en colores variados.', 5499.00, 3),
  ('Saco Elegante', 'Saco formal de tela suave con botones y bolsillos.', 5899.00, 4),
  ('Vestido Veraniego', 'Vestido ligero y fresco con estampado tropical.', 4799.00, 5),
  ('Jeans Cl�sicos', 'Pantalones vaqueros de dise�o cl�sico y duradero.', 5299.00, 6),
  ('Camisa de Rayas', 'Camisa de botones con rayas verticales y tejido suave.', 3999.00, 7),
  ('Falda Plisada', 'Falda elegante con pliegues y largo hasta la rodilla.', 5699.00, 8),
  ('Camiseta Estampada', 'Camiseta de algod�n con estampado colorido y llamativo.', 3499.00, 9),
  ('Chaqueta Ligera', 'Chaqueta informal de tela ligera perfecta para d�as frescos.', 4399.00, 10);


CREATE TABLE Ventas (
  venta_id INT IDENTITY(1,1) PRIMARY KEY,
  fecha_venta DATE NOT NULL,
  cliente_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
  FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
INSERT INTO Ventas (fecha_venta, cliente_id, producto_id, cantidad)
VALUES
  ('2024-04-01', 1, 1, 2),
  ('2024-04-02', 3, 4, 1),
  ('2024-04-03', 5, 6, 3), 
  ('2024-04-04', 2, 3, 2),
  ('2024-04-05', 4, 2, 1),
  ('2024-04-06', 6, 5, 2),
  ('2024-04-07', 8, 8, 1),
  ('2024-04-08', 7, 9, 3),
  ('2024-04-09', 9, 10, 1),
  ('2024-04-10', 10, 7, 2);