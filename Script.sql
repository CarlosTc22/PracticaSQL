-- Crear nuevo esquema llamado KeepCoding

CREATE SCHEMA IF NOT EXISTS KeepCoding;

SET search_path TO KeepCoding;

-- Tabla Grupo_Empresarial

CREATE TABLE Grupo_Empresarial (
    ID_Grupo SERIAL PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL
);

-- Tabla Marca

CREATE TABLE Marca (
    ID_Marca SERIAL PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    ID_Grupo INT NOT NULL,
    FOREIGN KEY (ID_Grupo) REFERENCES Grupo_Empresarial(ID_Grupo)
);

-- Tabla Modelo 

CREATE TABLE Modelo (
    ID_Modelo SERIAL PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    ID_Marca INT NOT NULL,
    FOREIGN KEY (ID_Marca) REFERENCES Marca(ID_Marca)
);

-- Tabla Color

CREATE TABLE Color (
    ID_Color SERIAL PRIMARY KEY,
    Nombre VARCHAR(15) NOT NULL
);

-- Tabla Aseguradora

CREATE TABLE Aseguradora (
    ID_Aseguradora SERIAL PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL
);

-- Tabla Coche

CREATE TABLE Coche (
    ID_Coche SERIAL PRIMARY KEY,
    ID_Modelo INT NOT NULL,
    ID_Color INT NOT NULL,
    ID_Aseguradora INT NOT NULL,
    Matricula VARCHAR(15) NOT NULL,
    Fecha_Compra DATE NOT NULL,
    Km_Totales INT NOT NULL,
    Num_Poliza VARCHAR(30) NOT NULL,
    FOREIGN KEY (ID_Modelo) REFERENCES Modelo(ID_Modelo),
    FOREIGN KEY (ID_Color) REFERENCES Color(ID_Color),
    FOREIGN KEY (ID_Aseguradora) REFERENCES Aseguradora(ID_Aseguradora)
);

-- Tabla Revision

CREATE TABLE Revision (
    ID_Revision SERIAL PRIMARY KEY,
    ID_Coche INT NOT NULL,
    Fecha DATE NOT NULL,
    Km INT NOT NULL,
    Importe DECIMAL(10,2) NOT NULL,
    Moneda VARCHAR(10) NOT NULL,
    FOREIGN KEY (ID_Coche) REFERENCES Coche(ID_Coche)
);

-- Insertar 5 registros en Grupo_Empresarial

INSERT INTO KeepCoding.grupo_empresarial  (Nombre) VALUES
	('Grupo Aguacate'), 
    ('Grupo Platano'), 
    ('Grupo Naranja'), 
    ('Grupo Sandia'), 
    ('Grupo Limon');

-- Insertar 10 registros en Marca
   
INSERT INTO KeepCoding.marca  (Nombre, ID_Grupo) VALUES
	('BMW', 1), 
    ('Mercedes-Benz', 2), 
    ('Audi', 3), 
    ('Tesla', 4), 
    ('Nissan', 5),
	('Volkswagen', 1), 
    ('Hyundai', 2), 
    ('Ford', 3), 
    ('Kia', 4), 
    ('Jeep', 5);

-- Insertar 10 registros en CompaniaAseguradora
   
INSERT INTO KeepCoding.aseguradora  (Nombre) VALUES
	('Mapfre'), 
    ('Allianz'), 
    ('AXA'), 
    ('Liberty Seguros'),
	('Generali'), 
    ('Santalucía'), 
    ('Mutua Madrileña'), 
    ('Pelayo'), 
    ('Reale Seguros'), 
    ('Zurich');

-- Insertar registros en la tabla Modelo
   
INSERT INTO KeepCoding.modelo  (Nombre, ID_Marca) VALUES
	('Serie 3', 1), 
    ('Clase C', 2), 
    ('A3', 3), 
    ('Model S', 4), 
    ('Qashqai', 5),
	('Golf', 6), 
    ('Tucson', 7), 
    ('F-150', 8), 
    ('Sportage', 9), 
    ('Grand Cherokee', 10);

-- Insertar registros en la tabla Color
   
INSERT INTO KeepCoding.color  (Nombre) VALUES
	('Blanco'), 
    ('Verde'), 
    ('Azul'), 
    ('Rojo'), 
    ('Negro'),
	('Gris'), 
    ('Marrón'), 
    ('Amarillo'), 
    ('Plateado'), 
    ('Violeta');
   
-- Insertar 20 registros en Coche
   
INSERT INTO KeepCoding.coche  (id_modelo, id_color , id_aseguradora , Matricula, Fecha_Compra, Km_Totales, Num_Poliza) VALUES  
	(1, 10, 1, '1234 JKL', '2015-08-03', 98473, 'P12345'),
	(2, 9, 2, '5678 MNO', '2017-01-20', 50213, 'P67890'),
	(3, 8, 3, '9101 PQR', '2018-05-12', 89762, 'P11223'),
	(4, 7, 4, '1213 STU', '2019-06-25', 21345, 'P44556'),
	(5, 6, 5, '1415 VWX', '2020-01-15', 78965, 'P77889'),
	(6, 5, 6, '1617 YZA', '2020-08-23', 65432, 'P99001'),
	(7, 4, 7, '1819 BCD', '2021-04-05', 41236, 'P22334'),
	(8, 3, 8, '2021 EFG', '2021-09-11', 25678, 'P55667'),
	(9, 2, 9, '2223 HIJ', '2022-03-21', 100123, 'P88990'),
	(10, 1, 10, '2425 KLM', '2022-07-02', 50543, 'P33445'),
	(1, 2, 1, '2627 NOP', '2016-02-14', 60321, 'P66778'),
	(2, 3, 2, '2829 QRS', '2018-11-08', 120543, 'P11223'),
	(3, 4, 3, '3031 TUV', '2019-12-01', 70345, 'P44556'),
	(4, 5, 4, '3233 WXY', '2020-05-09', 25123, 'P77889'),
	(5, 6, 5, '3435 ZAB', '2021-01-20', 99987, 'P99001'),
	(6, 7, 6, '3637 CDE', '2021-08-30', 66677, 'P22334'),
	(7, 8, 7, '3839 FGH', '2022-04-11', 42012, 'P55667'),
	(8, 9, 8, '4041 IJK', '2022-09-19', 26345, 'P88990'),
	(9, 10, 9, '4243 LMN', '2023-03-25', 100678, 'P33445'),
	(10, 1, 10, '4445 OPQ', '2023-07-07', 51432, 'P66778');

-- Consulta SQL para obtener el listado de coches activos

SELECT 
    mo.Nombre AS "Nombre Modelo",
    ma.Nombre AS "Marca",
    ge.Nombre AS "Grupo",
    co.fecha_compra  AS "Fecha de Compra",
    co.Matricula AS "Matrícula",
    col.Nombre AS "Color",
    co.km_totales  AS "Total de Kilómetros",
    ca.nombre AS "Compañía Aseguradora",
    co.num_poliza  AS "Número de Póliza"
FROM 
    Coche co
JOIN Modelo mo ON co.ID_Modelo = mo.ID_Modelo
JOIN Marca ma ON mo.ID_Marca = ma.ID_Marca
JOIN Grupo_Empresarial ge ON ma.ID_Grupo = ge.ID_Grupo
JOIN Color col ON co.ID_Color = col.ID_Color
JOIN Aseguradora ca ON co.id_aseguradora  = ca.id_aseguradora;

