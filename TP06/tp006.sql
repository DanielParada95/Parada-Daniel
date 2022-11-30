DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL UNIQUE,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado BOOLEAN NOT NULL
);
CREATE TABLE empleados (
idempleado BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit INT NOT NULL UNIQUE,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
fecha_nacimiento DATE NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

CREATE TABLE paises (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    estado BOOLEAN
);

CREATE TABLE provincias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    idpais INT NOT NULL,
    FOREIGN KEY (idpais) REFERENCES paises(id)	
);


CREATE TABLE localidades (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    cp INT NOT NULL,
	id_provincia INT NOT NULL,
    FOREIGN KEY (id_provincia) REFERENCES provincias(id) 
);

ALTER TABLE empleados ADD (
	direccion VARCHAR(30) NOT NULL,
    id_localidad INT,
    email VARCHAR(30),
    telefono VARCHAR(30),
    fecha_ingreso DATE NOT NULL,
    tms TIMESTAMP,
    
    FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);

ALTER TABLE departamentos ADD (
gasto DOUBLE NOT NULL,
tms TIMESTAMP
);

INSERT INTO paises (nombre, estado)
VALUES  ("Peru", true), ("Argentina", true),  ("Costa Rica", true),  ("Uruguay",true), ("Bolivia", true);

INSERT INTO provincias (nombre, idpais)
VALUES	("Buenos Aires", 2), ("Misiones", 2), ("Cordoba", 3), ("Rosario", 2), ("Corrientes", 1);
		
INSERT INTO localidades (nombre, cp, id_provincia)
VALUES ("San Javier", 3357, 2), ("Leandro N. Alem", 3357, 3), ("Posadas", 3357, 4), ("Apostoles", 3357, 5), ("Iguazu", 3357, 1);

INSERT INTO departamentos (nombre, presupuesto, estado, gasto, tms)
VALUES  ("Analista", 75000.00, FALSE, 28000, "2020/10/21 06:00:00"),
		("educacion", 88000.00, FALSE, 25000, "2020/12/19 06:00:00"),
		("diseño grafico", 56000.00, FALSE, 22000, "2020/10/20 06:00:00"),
        ("tester", 88000.00, FALSE, 65000, "2020/12/14 06:00:00"),
        ("ventas", 93000.00, TRUE, 65000, "2020/12/09 06:00:00");

INSERT INTO empleados (cuil_cuit, nombre, apellido, fecha_nacimiento, id_departamento, estado, direccion, id_localidad, email, telefono, fecha_ingreso, tms)
VALUES  (27-46458723-8, "Roberto", "Carlos", "1995/04/28", 1, FALSE, "san martin 1022", 1, "roberto@gmail.com", "453789654", "2020/08/02", "2020/12/03 06:00:00" ),
		(26-31025587-8, "Cristiano", "Ronaldo", "1996/08/23", 2, TRUE, "san martin 1022", 2, "Cristiano@gmail.com", "453123789", "2020/09/02", "2020/12/20 06:00:00" ),
        (25-35488791-8, "Lionel", "Messi", "1998/09/16", 4, TRUE, "san martin 1022", 3, "LionelLionel@gmail.com", "789456452", "2020/05/02", "2020/05/09 06:00:00" ),
        (24-31478889-8, "Jorge", "Ramirez", "2003/08/05", 5, TRUE, "san martin 1022", 4, "Jorge@gmail.com", "648453487", "2020/08/02", "2020/04/06 06:00:00" ),
        (23-56788776-8, "Lius", "Rauld", "1976/0/15", 2, TRUE, "san martin 1022", 5, "Lius@gmail.com", "5644564561", "2020/07/02", "2020/02/05 06:00:00" );

ALTER TABLE pedidos
RENAME TO movimientos;




CREATE TABLE  proveedores (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(30),
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    naturaleza VARCHAR(30),
    cuit VARCHAR(30),
    id_localidad INT,
    estado BOOLEAN,
    tms TIMESTAMP,
    
    FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);



CREATE TABLE marcas (
	id INT  AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30),
	descripcion VARCHAR(100),
	imagen  BLOB ,
    id_proveedor INT,
    estado BOOLEAN, 
    tms TIMESTAMP,
    
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id)
);


CREATE TABLE productos (
	id INT  AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30),
	descripcion VARCHAR(100),
	id_marca INT,
    stock INT,
    precio DOUBLE,
    estado BOOLEAN,
    tms TIMESTAMP,
    
    FOREIGN KEY (id_marca) REFERENCES marcas(id)
);




CREATE TABLE cajas (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    horainicio TIME,
    horacierre TIME,
    estado BOOLEAN,
    tms TIMESTAMP
);
        
INSERT INTO proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado, tms)
VALUES ("Quilmes S.A.","Cristiano","Ronaldo","juridica","26-31025587-8", 1, True,"2020/05/09 06:00:00"), ("Samsung Co","Lionel","Messi","Juridica", "25-35488791-8",1 ,true,"2020/05/09 06:00:00"), ("cofra","Adam","Smith","Juridica", "20-55664466-5",3 ,True,"2020/05/09 06:00:00"), ("Ilolai","Faker","Lookthemoves","juridica" , "20-45454545-5" , False,"2020/05/09 06:00:00"), ("Coca-cola","jorge","Maldini","Fisica", "20-454545454-5",5, False,"2020/05/09 06:00:00");

INSERT INTO marcas (nombre, descripcion, imagen, id_proveedor, estado, tms)
VALUES  ("Quilmes", "bebidas", "", 1, True , "2020/05/09 06:00:00"), ("Lacoste", "ropa", "", 2, true, "2020/05/09 06:00:00"), ("cofra", "envasados", "", 3, true, "2020/05/09 06:00:00"),  ("Ilolai", "lacteo", "", 4, true, "2020/05/09 06:00:00"), ("Coca-cola", "bebidas", "", 5, true, "2020/05/09 06:00:00");

INSERT INTO productos (nombre, descripcion, id_marca, stock, estado, precio)
VALUES ("Quilmes", "bebidas", 1, 450, TRUE, 120 ), ("Lacoste", "ropa", 2, 10000, TRUE, 1500.00), ("cofra", "envasados", 3, 500, TRUE, 200.00), ("Ilolai", "lacteo", 4, 400, TRUE, 150.00), ("Coca-cola", "bebidas", 5, 300, TRUE, 150.00);


INSERT INTO cajas (horainicio, horacierre, estado, tms)
VALUES ("07:00:00", "19:00:00", True, "2020/05/09 06:00:00"), ("07:00:00", "19:00:00", False, "2020/05/09 06:00:00"), ("07:00:00", "19:00:00", True, "2020/05/09 06:00:00"),("07:00:00", "19:00:00", True, "2020/05/09 06:00:00"),("07:00:00", "19:00:00", True, "2020/05/09 06:00:00");




SELECT nombre, presupuesto, gasto, (presupuesto - gasto)  AS diferencia FROM departamentos  WHERE estado = True;

SELECT pa.nombre, l.nombre FROM paises pa, provincias pr LEFT JOIN localidades l ON pr.id = l.id_provincia WHERE  pr.idpais  =  pa.id GROUP BY pa.nombre  ; 

UPDATE empleados SET telefono = "555-335516" WHERE idempleado = 2 ;
UPDATE empleados SET fecha_ingreso = "2022/12/12", id_localidad = 3 WHERE idempleado = 4;

INSERT INTO vendedores(apellido, nombre, cuitcuil, comisión)
VALUES ("Lopez ", "Hernan", "20-556548574-1", "15.00"), ("Gomez", "Fabian", "20-556548574-1", "50.00") , ("Fernandez", "Norman", "20-556548574-1", "70.00") , ("Perez", "German", "20-556548574-1", "30.00") , ("Nuñez", "Newman", "20-556548574-1", "50.00")    ;







ALTER TABLE movimientos ADD (
id_producto INT,
estado BOOLEAN, 
tms TIMESTAMP,
tipo_movimiento VARCHAR(30),

FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO clientes (nombre, apellido, cuitcuil, ciudad, categoría)
VALUES  ("Roberto", "Carlos", "20-4545445-9", "Obera", 2), ("Juan", "Valdez", "20-454545454-9", "San ignacio", 3), ("Donna", "Valwin", "20-454542447-6", "Corrientes", 5), ("Suizi", "Qiu", "20-1345378-9", "Obera", 1), ("Callista", "Lambar", "20-45454547-6", "Obera", 1)  ;

INSERT INTO movimientos (cantidad, fecha, id_cliente, id_vendedor, id_producto, estado,  tipo_movimiento)
VALUES (300, "2022/11/10", 1, 1, 1, True, "ingreso"), (600, "2022/11/10", 2, 2, 2, True, "egreso"), (608, "2022/11/10", 3, 3, 3, true, "pedido"), (880, "2022/11/10", 4, 4, 4, true, "ingreso"), (20000, "2022/11/10", 5, 5, 5,false, "egreso");


SELECT * FROM productos;




UPDATE paises SET estado = 0 where id = 1;

UPDATE productos SET stock = 100 + 150  WHERE id = 1 ;
UPDATE productos SET stock = 10 - 200 WHERE id = 2 ;
UPDATE productos SET stock = 2  WHERE id = 3;
UPDATE productos SET stock = 300 + 250 WHERE id = 4;
UPDATE productos SET stock = 10000 - 4000 WHERE id = 5;

CREATE TABLE parametros (
id INT AUTO_INCREMENT PRIMARY KEY,
tms TIMESTAMP,

id_usuario INT,
cosa json

);



INSERT INTO parametros (cosa, id_usuario)
VALUES 
('{"idDeLaCosa": 101, "permisos": "PUT, GET"}','1'),
('{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}','2'),
('{"zonaHoraria": "America/Argentina/BuenosAires"}','3'),
('{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}','4'),
('{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93", "egreso": "3732538.75"}, "2020":{"ingreso": "27442665.12", "egreso": "8522331.82"},"2021": {"ingreso":"31634912.57", "egreso": "9757142.66"}}}','5');