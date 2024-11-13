CREATE DATABASE BasedeDatos_PersonalSPC;
GO
USE BasedeDatos_PersonalSPC;
GO
-- Tabla País
CREATE TABLE PAIS (
    Id_Pais INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL
);
-- Inserciones de pais
INSERT INTO PAIS (Nombre) VALUES ('Argentina');
INSERT INTO PAIS (Nombre) VALUES ('Paraguay');
INSERT INTO PAIS (Nombre) VALUES ('Brazil');
SELECT * FROM PAIS

-- Tabla Provincia
CREATE TABLE PROVINCIA (
    Id_Provincia INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Id_Pais INT NOT NULL,
    FOREIGN KEY (Id_Pais) REFERENCES PAIS(Id_Pais)
);
-- Inserciones de tabla PROVINCIA
INSERT INTO PROVINCIA (Nombre, Id_Pais) VALUES ('Buenos Aires', 1);
INSERT INTO PROVINCIA (Nombre, Id_Pais) VALUES ('Córdoba', 1);
INSERT INTO PROVINCIA (Nombre, Id_Pais) VALUES ('Santa Fe', 1);
INSERT INTO PROVINCIA (Nombre, Id_Pais) VALUES ('Corrientes', 1);

SELECT * FROM PROVINCIA
-- Tabla Localidad
CREATE TABLE LOCALIDAD (
    Id_Localidad INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Cod_Postal INT NOT NULL UNIQUE,
    Id_Provincia INT NOT NULL,
    FOREIGN KEY (Id_Provincia) REFERENCES PROVINCIA(Id_Provincia)
);
-- Inserciones de tabla Localidad
INSERT INTO LOCALIDAD (Nombre, Cod_Postal, Id_Provincia) VALUES ('La Plata', 1900, 1);
INSERT INTO LOCALIDAD (Nombre, Cod_Postal, Id_Provincia) VALUES ('Rosario', 2000, 3);
INSERT INTO LOCALIDAD (Nombre, Cod_Postal, Id_Provincia) VALUES ('Villa Carlos Paz', 5152, 2);
INSERT INTO LOCALIDAD (Nombre, Cod_Postal, Id_Provincia) VALUES ('Corrientes Capital', 3400, 4);
 SELECT * FROM LOCALIDAD

-- Tabla de Domicilio
CREATE TABLE DOMICILIO (
    Id_Domicilio INT PRIMARY KEY IDENTITY,
    Barrio VARCHAR(50) NOT NULL,
    Calle VARCHAR(50) NOT NULL,
    Altura INT NOT NULL,
    Id_Localidad INT NOT NULL,
    FOREIGN KEY (Id_Localidad) REFERENCES LOCALIDAD(Id_Localidad)
);
-- Inserciones de tabla Domicilio
INSERT INTO DOMICILIO (Barrio, Calle, Altura, Id_Localidad) VALUES ('San Jeronimo', 'olivos', 4600, 4);
INSERT INTO DOMICILIO (Barrio, Calle, Altura, Id_Localidad) VALUES ('Populas', 'caracas', 742, 4);
INSERT INTO DOMICILIO (Barrio, Calle, Altura, Id_Localidad) VALUES ('Antartida Argentina', 'Independencia', 456, 4);
SELECT * FROM DOMICILIO

-- Tabla de Cobertura de Sepelio
CREATE TABLE COBERTURA_SEPELIO (
    Id_Cobertura INT PRIMARY KEY IDENTITY,
    Cremacion BIT NOT NULL,
    Nicho BIT NOT NULL
);
--Inserciones de tabla Cobertura Sepelio
INSERT INTO COBERTURA_SEPELIO (Cremacion, Nicho) VALUES (1, 0);
INSERT INTO COBERTURA_SEPELIO (Cremacion, Nicho) VALUES (0, 1);
SELECT * FROM COBERTURA_SEPELIO

-- Tabla de Contactos Extras
CREATE TABLE CONTACTOS_EXTRAS (
    Id_Contacto INT PRIMARY KEY IDENTITY,
    Telefono VARCHAR(15),
    Celular VARCHAR(15),
    Email VARCHAR(100) NOT NULL UNIQUE
);
-- Inserciones tabla Contactos Extras
INSERT INTO CONTACTOS_EXTRAS (Telefono, Celular, Email) VALUES ('3794-459410', '3795788945', 'contacto1@ejemplo1.com');
INSERT INTO CONTACTOS_EXTRAS (Telefono, Celular, Email) VALUES ('NO POSEE', '3794213245', 'contacto2@ejemplo2.com');
SELECT * FROM CONTACTOS_EXTRAS

-- Tabla de Estado
CREATE TABLE ESTADO (
    Id_Estado INT PRIMARY KEY IDENTITY,
    Descripcion VARCHAR(50) NOT NULL,
    Observacion VARCHAR(250)
);
-- Inserciones de tabla Estado
INSERT INTO ESTADO (Descripcion, Observacion) VALUES ('Activo', 'Empleado en servicio');
INSERT INTO ESTADO (Descripcion, Observacion) VALUES ('Suspendido', 'Bajo investigación');
SELECT * FROM ESTADO

-- Tabla de Tipos de Feria (referencia para distintos tipos de feria)
CREATE TABLE TIPOS_FERIA (
    Id_Tipo_Feria INT PRIMARY KEY IDENTITY,
    Tipo_Feria VARCHAR(50) NOT NULL
);
-- Inserciones Tabla de Tipos de Feria
INSERT INTO TIPOS_FERIA (Tipo_Feria) VALUES ('Verano');
INSERT INTO TIPOS_FERIA (Tipo_Feria) VALUES ('Invierno');
SELECT * FROM TIPOS_FERIA


-- Tabla de Tipos de Licencia (referencia para distintos tipos de licencia)
CREATE TABLE TIPOS_LICENCIA (
    Id_Tipo_Licencia INT PRIMARY KEY IDENTITY,
    Tipo_Licencia VARCHAR(100) NOT NULL
);
-- Inserciones Tabla de Tipos de Licencia
INSERT INTO TIPOS_LICENCIA (Tipo_Licencia) VALUES ('Licencia Anual Ordinaria');
INSERT INTO TIPOS_LICENCIA (Tipo_Licencia) VALUES ('Enfermedad');
SELECT * FROM TIPOS_LICENCIA



-- Tabla de Legajo
CREATE TABLE LEGAJO (
    Id_Legajo INT PRIMARY KEY IDENTITY,
    Puesto_Laboral VARCHAR(100) NOT NULL,
    Escalafon VARCHAR(100) NOT NULL,
    Fecha_Ingreso DATE NOT NULL,
    Jerarquia VARCHAR(50),
    Destino VARCHAR(100),
    Funcion VARCHAR(100),
    Credencial VARCHAR(50),
    Id_Estado INT,
    FOREIGN KEY (Id_Estado) REFERENCES ESTADO(Id_Estado)
);
-- Inserciones Tabla de Legajo
INSERT INTO LEGAJO (Puesto_Laboral, Escalafon, Fecha_Ingreso, Jerarquia, Destino, Funcion, Credencial, Id_Estado) 
VALUES ('124578', 'Suboficial', '06-09-2006', 'Sargento Ayudante', 'Jefatura', 'Guardia', '1281', 1);
INSERT INTO LEGAJO (Puesto_Laboral, Escalafon, Fecha_Ingreso, Jerarquia, Destino, Funcion, Credencial, Id_Estado) 
VALUES ('454578', 'Suboficial', '06-09-2015', 'Sargento ', 'Jefatura', 'Administrativa', '1815', 1);
SELECT * FROM LEGAJO


-- Tabla de Datos Personales Primarios
CREATE TABLE DATOS_PERSONALES_PRIMARIOS (
    DNI INT PRIMARY KEY,
    Apellido_Nombre VARCHAR(100) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    CUIL BIGINT NOT NULL UNIQUE,
    Sexo CHAR(1) NOT NULL,
    Estado_Civil VARCHAR(50),
    Lugar_Nacimiento VARCHAR(100),
    Grupo_Sanguineo VARCHAR(5),
    Id_Legajo INT NOT NULL UNIQUE,
    Id_Domicilio INT,
    Id_Cobertura INT,
    Id_Contacto INT,
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo),
    FOREIGN KEY (Id_Domicilio) REFERENCES DOMICILIO(Id_Domicilio),
    FOREIGN KEY (Id_Cobertura) REFERENCES COBERTURA_SEPELIO(Id_Cobertura),
    FOREIGN KEY (Id_Contacto) REFERENCES CONTACTOS_EXTRAS(Id_Contacto)
);
-- Inserciones de tabla Datos Personales Primarios

INSERT INTO DATOS_PERSONALES_PRIMARIOS (DNI, Apellido_Nombre, Fecha_Nacimiento, CUIL, Sexo, Estado_Civil, Lugar_Nacimiento, Grupo_Sanguineo, Id_Legajo, Id_Domicilio, Id_Cobertura, Id_Contacto) 
VALUES (12345678, 'Juan Perez', '01-01-1990', 20123456789, 'M', 'Soltero', 'Corrientes', 'O+', 1, 1, 1, 1);
INSERT INTO DATOS_PERSONALES_PRIMARIOS (DNI, Apellido_Nombre, Fecha_Nacimiento, CUIL, Sexo, Estado_Civil, Lugar_Nacimiento, Grupo_Sanguineo, Id_Legajo, Id_Domicilio, Id_Cobertura, Id_Contacto) 
VALUES (23456789, 'Ana Garcia', '1985-03-15', 27234567891, 'F', 'Casada', 'Córdoba', 'A+', 2, 2, 2, 2);


SELECT * FROM DATOS_PERSONALES_PRIMARIOS

-- Tabla de Hijos
CREATE TABLE HIJOS (
    Id_Hijo INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Nombre_Apellido VARCHAR(250) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo)
);
--Inserciones tabla Hijos
INSERT INTO HIJOS (Id_Legajo, Nombre_Apellido, Fecha_Nacimiento) VALUES (1, 'Pedro Perez', '2015-07-10');
INSERT INTO HIJOS (Id_Legajo, Nombre_Apellido, Fecha_Nacimiento) VALUES (1, 'Lucia Garcia', '2018-05-20');
SELECT * FROM HIJOS

-- Tabla de Ferias
CREATE TABLE FERIAS (
    Id_Feria INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Id_Tipo_Feria INT NOT NULL,
    Dias_Cantidad INT NOT NULL,
    Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE NOT NULL,
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo),
    FOREIGN KEY (Id_Tipo_Feria) REFERENCES TIPOS_FERIA(Id_Tipo_Feria)
);
--Inserciones tabla de Feria
INSERT INTO FERIAS (Id_Legajo, Id_Tipo_Feria, Dias_Cantidad, Fecha_Inicio, Fecha_Fin) VALUES (1, 1, 5, '2023-01-10', '2023-01-14');
INSERT INTO FERIAS (Id_Legajo, Id_Tipo_Feria, Dias_Cantidad, Fecha_Inicio, Fecha_Fin) VALUES (2, 2, 6, '2023-02-01', '2023-02-06');
SELECT * FROM FERIAS

-- Tabla de Licencias
CREATE TABLE LICENCIAS (
    Id_Licencia INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Id_Tipo_Licencia INT NOT NULL,
    Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE NOT NULL,
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo),
    FOREIGN KEY (Id_Tipo_Licencia) REFERENCES TIPOS_LICENCIA(Id_Tipo_Licencia)
);
-- Insercion de tabla de Licencia
INSERT INTO LICENCIAS (Id_Legajo, Id_Tipo_Licencia, Fecha_Inicio, Fecha_Fin) VALUES (1, 1, '2022-06-01', '2022-06-10');
INSERT INTO LICENCIAS (Id_Legajo, Id_Tipo_Licencia, Fecha_Inicio, Fecha_Fin) VALUES (2, 2, '2023-07-01', '2023-07-05');
SELECT * FROM LICENCIAS

ALTER TABLE LICENCIAS
ADD CONSTRAINT CHK_FechaFin CHECK (Fecha_Fin >= Fecha_Inicio);

-- Tabla de Historial Académico
CREATE TABLE HISTORIAL_ACADEMICO (
    Id_Historial INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Titulo VARCHAR(200) NOT NULL,
    Fecha_Otorgado DATE NOT NULL,
    Instituto VARCHAR(200) NOT NULL,
    Observaciones VARCHAR(300),
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo)
);
-- Insercion Tabla de HistoriaL AcademicO
INSERT INTO HISTORIAL_ACADEMICO (Id_Legajo, Titulo, Fecha_Otorgado, Instituto, Observaciones) 
VALUES (1, 'Ingeniería en Sistemas', '2015-12-10', 'Universidad Nacional', 'Graduado con honores');
INSERT INTO HISTORIAL_ACADEMICO (Id_Legajo, Titulo, Fecha_Otorgado, Instituto, Observaciones) 
VALUES (1, 'Programador Universitario', '2024-12-10', 'Universidad Nacional del Nordeste', 'Graduado con honores');
SELECT * FROM HISTORIAL_ACADEMICO

-- Tabla de Destino
CREATE TABLE DESTINO (
    Id_Destino INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Lugar_Trabajo_Actual VARCHAR(250) NOT NULL,
    Lugar_Trabajo_Anterior VARCHAR(250),
    Memo_Pases VARCHAR(50),
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo)
);
INSERT INTO DESTINO (Id_Legajo, Lugar_Trabajo_Actual, Lugar_Trabajo_Anterior, Memo_Pases) 
VALUES (1, 'Jefatura', 'Uniadd Penal Nª1', 'Memo 123/20');
SELECT * FROM DESTINO


-- Tabla de Horario Reducido
CREATE TABLE HORARIO_REDUCIDO (
    Id_Horario INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Resolucion VARCHAR(100) NOT NULL,
    Horas_Trabajo INT NOT NULL,
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo)
);
-- Insercion de table Horario Reducido 
INSERT INTO HORARIO_REDUCIDO (Id_Legajo, Resolucion, Horas_Trabajo) VALUES (1, 'Resolución 2020-05', 6);
SELECT * FROM HORARIO_REDUCIDO

-- Tabla de Observación Psicológica
CREATE TABLE OBSERVACION_PSICOLOGICA (
    Id_Observacion INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Observacion_Detalle VARCHAR(300) NOT NULL,
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo)
);
-- Insercion en tabla Observacion Psicologica
INSERT INTO OBSERVACION_PSICOLOGICA (Id_Legajo, Observacion_Detalle) VALUES (1, 'Observación psicológica inicial');
SELECT * FROM OBSERVACION_PSICOLOGICA

-- Tabla de Ascensos
CREATE TABLE ASCENSOS (
    Id_Ascenso INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Fecha_Posesion DATE NOT NULL,
    Fecha_Ascenso DATE NOT NULL,
    Decreto_Ascenso VARCHAR(100) NOT NULL,
    Proximo_Ascenso DATE,
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo)
);
ALTER TABLE ASCENSOS
ADD CONSTRAINT CHK_FechaAsc CHECK (Fecha_Ascenso >= Fecha_Posesion);

--Inserciones tabla de Ascenso
INSERT INTO ASCENSOS (Id_Legajo, Fecha_Posesion, Fecha_Ascenso, Decreto_Ascenso, Proximo_Ascenso) 
VALUES (1, '2015-03-01', '2018-03-01', 'Decreto 12/2018', '2023-03-01');
INSERT INTO ASCENSOS (Id_Legajo, Fecha_Posesion, Fecha_Ascenso, Decreto_Ascenso, Proximo_Ascenso) 
VALUES (2, '2024-06-01', '2024-07-01', 'Decreto Nª963 04/2024', '2026');
SELECT * FROM ASCENSOS

-- Tabla de Sanciones
CREATE TABLE SANCIONES (
    Id_Sancion INT PRIMARY KEY IDENTITY,
    Id_Legajo INT NOT NULL,
    Fecha DATE NOT NULL,
    Articulo INT NOT NULL,
    Motivo VARCHAR(255) NOT NULL,
    Recurso VARCHAR(50) NOT NULL CHECK (Recurso IN ('Presentado', 'No presentado')),
    Dias_Arresto INT CHECK (Dias_Arresto >= 0),
    Observacion VARCHAR(255),
    FOREIGN KEY (Id_Legajo) REFERENCES LEGAJO(Id_Legajo));

-- INSERCION TABLA SANCIONES
INSERT INTO SANCIONES (Id_Legajo, Fecha, Articulo, Motivo, Recurso, Dias_Arresto, Observacion) 
VALUES (1, '2022-04-15', 4, 'Falta disciplinaria', 'No Presentado', 3, '3 días de arresto');
INSERT INTO SANCIONES (Id_Legajo, Fecha, Articulo, Motivo, Recurso, Dias_Arresto, Observacion) 
VALUES (2, '2014-04-15', 32, 'Falta disciplinaria', 'Presentado', 3, '20 días de arresto');
SELECT * FROM SANCIONES

SELECT * FROM DATOS_PERSONALES_PRIMARIOS


---------------------------------------------------------------------------------------------------------------------------------------

--1. Ingreso de Datos en Formato JSON

--Podemos insertar registros utilizando JSON con la función OPENJSON para convertirlo a filas y columnas:

DECLARE @jsonData NVARCHAR(MAX) = '
[
    {
        "DNI": 34567890,
        "Apellido_Nombre": "Lucas Fernandez",
        "Fecha_Nacimiento": "1992-05-12",
        "CUIL": 20345678901,
        "Sexo": "M",
        "Estado_Civil": "Soltero",
        "Lugar_Nacimiento": "Mendoza",
        "Grupo_Sanguineo": "B+",
        "Id_Legajo": 2,
        "Id_Domicilio": 2,
        "Id_Cobertura": 1,
        "Id_Contacto": 2
    },
    {
        "DNI": 45678901,
        "Apellido_Nombre": "Mariana Lopez",
        "Fecha_Nacimiento": "1995-09-23",
        "CUIL": 27456789012,
        "Sexo": "F",
        "Estado_Civil": "Casada",
        "Lugar_Nacimiento": "Buenos Aires",
        "Grupo_Sanguineo": "A-",
        "Id_Legajo": 1,
        "Id_Domicilio": 3,
        "Id_Cobertura": 2,
        "Id_Contacto": 1
    }
]'

-- Insertar datos en la tabla DATOS_PERSONALES_PRIMARIOS desde JSON
INSERT INTO DATOS_PERSONALES_PRIMARIOS (DNI, Apellido_Nombre, Fecha_Nacimiento, CUIL, Sexo, Estado_Civil, Lugar_Nacimiento, Grupo_Sanguineo, Id_Legajo, Id_Domicilio, Id_Cobertura, Id_Contacto)
SELECT *
FROM OPENJSON(@jsonData)
WITH (
    DNI INT,
    Apellido_Nombre VARCHAR(100),
    Fecha_Nacimiento DATE,
    CUIL BIGINT,
    Sexo CHAR(1),
    Estado_Civil VARCHAR(50),
    Lugar_Nacimiento VARCHAR(100),
    Grupo_Sanguineo VARCHAR(5),
    Id_Legajo INT,
    Id_Domicilio INT,
    Id_Cobertura INT,
    Id_Contacto INT
);

-----------------------------------------------------------------------------------------------------------------------------------------

--2. Consultar Datos en Formato JSON

--Para exportar datos a formato JSON, podemos usar la cláusula FOR JSON PATH:


SELECT DNI, Apellido_Nombre, Fecha_Nacimiento, CUIL, Sexo, Estado_Civil, Lugar_Nacimiento, Grupo_Sanguineo
FROM DATOS_PERSONALES_PRIMARIOS
FOR JSON PATH, ROOT('Personas');


--Esto devuelve los registros en formato JSON con la raíz Personas.

-----------------------------------------------------------------------------------------------------------------------------------------

--3. Filtrado de Datos desde JSON

--Podemos filtrar datos JSON usando OPENJSON:

DECLARE @jsonData NVARCHAR(MAX) = '
[
    { "DNI": 12345678, "Apellido_Nombre": "Juan Perez" },
    { "DNI": 23456789, "Apellido_Nombre": "Ana Garcia" }
]';

SELECT *
FROM OPENJSON(@jsonData)
WITH (
    DNI INT,
    Apellido_Nombre VARCHAR(100)
)
WHERE DNI = 12345678;

-----------------------------------------------------------------------------------------------------------------------------------------

--4. Actualización de Datos Utilizando JSON

--Podemos actualizar filas usando valores JSON:


DECLARE @jsonUpdate NVARCHAR(MAX) = '{
    "DNI": 12345678,
    "Estado_Civil": "Casado"
}';

UPDATE DATOS_PERSONALES_PRIMARIOS
SET Estado_Civil = JSON_VALUE(@jsonUpdate, '$.Estado_Civil')
WHERE DNI = JSON_VALUE(@jsonUpdate, '$.DNI');

-----------------------------------------------------------------------------------------------------------------------------------------

--5. Consultar Datos Específicos y Anidados

--Para acceder a propiedades anidadas, usamos JSON_QUERY y JSON_VALUE:

DECLARE @nestedJson NVARCHAR(MAX) = '
{
    "Personal": {
        "DNI": 34567890,
        "Nombre": "Lucas Fernandez",
        "Contacto": {
            "Telefono": "123-4567",
            "Email": "lucas.fernandez@ejemplo.com"
        }
    }
}';

SELECT 
    JSON_VALUE(@nestedJson, '$.Personal.DNI') AS DNI,
    JSON_VALUE(@nestedJson, '$.Personal.Nombre') AS Nombre,
    JSON_VALUE(@nestedJson, '$.Personal.Contacto.Email') AS Email;

-----------------------------------------------------------------------------------------------------------------------------------------

--6. Insertar Datos desde JSON Complejo

--Insertar datos desde JSON con estructuras más complejas:

DECLARE @complexJson NVARCHAR(MAX) = '
[
    {
        "Legajo": {
            "Id_Legajo": 1,
            "Puesto_Laboral": "Suboficial"
        },
        "DatosPersonales": {
            "DNI": 12345678,
            "Apellido_Nombre": "Juan Perez"
        }
    }
]';

INSERT INTO LEGAJO (Id_Legajo, Puesto_Laboral)
SELECT Id_Legajo, Puesto_Laboral
FROM OPENJSON(@complexJson, '$')
WITH (
    Id_Legajo INT '$.Legajo.Id_Legajo',
    Puesto_Laboral VARCHAR(100) '$.Legajo.Puesto_Laboral'
);

INSERT INTO DATOS_PERSONALES_PRIMARIOS (DNI, Apellido_Nombre, Id_Legajo)
SELECT DNI, Apellido_Nombre, Id_Legajo
FROM OPENJSON(@complexJson, '$')
WITH (
    DNI INT '$.DatosPersonales.DNI',
    Apellido_Nombre VARCHAR(100) '$.DatosPersonales.Apellido_Nombre',
    Id_Legajo INT '$.Legajo.Id_Legajo'
);

-----------------------------------------------------------------------------------------------------------------------------------------
-- Probando más funciones  
---------------------------------------------

-- FOR JSON

---------------------------------------------

SELECT * FROM MASTER.SYS.DATABASES
ORDER BY 1
FOR JSON PATH,ROOT('Bases')     --EL RESULTADO ES UN JSON CON EL NOMBRE DE TODAS LAS BASES DE DATOS 

--FOR JSON INCLUYENDO NULOS
DROP TABLE IF EXISTS JSONNULOS
CREATE TABLE JSONNULOS (ID INT IDENTITY,
						NOMBRE VARCHAR(255) NULL)
INSERT INTO JSONNULOS (NOMBRE)
VALUES ('Maxi'),(null),('Triggerdb.com')

SELECT * FROM JSONNULOS
FOR JSON AUTO

SELECT * FROM JSONNULOS
FOR JSON AUTO,INCLUDE_NULL_VALUES

--JSON SIN LOS BRACKET

SELECT TOP 1 SalesOrderNumber, OrderData, Status
FROM AdventureWorks2016CTP3.Sales.SalesOrdeHeader
ORDER BY ModifiedDate
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER


SELECT TOP 1 SalesOrderNumber, OrderData, Status
FROM AdventureWorks2016CTP3.Sales.SalesOrdeHeader
ORDER BY ModifiedDate
FOR JSON PATH

------------------------------------------------
---FUNCIONES JSON
------------------------------------------------

---ISJSON

DECLARE @JSON VARCHAR(MAX) = 'HOLA TRIGGERDB.COM'

SELECT CASE WHEN ISJSON(@JSON) >0
	THEN 'JSON Valido' ELSE 'JSON No Valido' END

DECLARE @JSON VARCHAR(MAX) = '{"nombre": "TriggerDB.com",
							 "Especialidad": "SQL Server"}'

SELECT CASE WHEN ISJSON(@JSON) >0
	THEN 'JSON Valido' ELSE 'JSON No Valido' END


-- extraer valores 

DROP TABLE IF EXISTS DBO.JSONDEMO
CREATE TABLE DBO.JSONDEMO (JSONDATA VARCHAR(MAX))

INSERT INTO DBO.JSONDEMO
VALUES (
'{
	"info":{
	 "type":1,

	 "address":{
	 "town":"Bristol",
	 "county":"Avon",
	 "country":"England"
	 },
	 "tags":["Sport", "Water polo"]
	 },
	 "type":"Basic"
}'
)

--EXTRAER VALORES

SELECT 
	JSON_VALUE (JSONDATA, '$.type') as type,
	JSON_VALUE (JSONDATA, '$.info.address.town') as town,
	JSON_QUERY (JSONDATA, '$.info.tags') as tags
FROM JSONDEMO


----------------------------------------
-- OPENJSON
----------------------------------------

DECLARE @JSON VARCHAR(MAX)
SELECT @JSON = JSONDATA FROM JSONDEMO

SELECT value
FROM OPENJSON(@json, '$.info.tags')


-- CARGAR UN JSON A UNA TABLA
DROP TABLE IF EXISTS PERSON

CREATE TABLE DBO.PERSON (Id INT,
						 firstName nvarchar(50),
						 lastName nvarchar(50),
						 isAlive bit,
						 age int,
						 dateOfBirth datetime2,
						 spunse nvarchar(50)
)

declare @person nvarchar(max) = '{
	"id": 2,
	"firstName": "John",
	"lastName": "Smith",
	"isAlive": true,
	"age": 25,
	"dateOfBirth": "2015-03-25T12:00:00",
	"spouse": null
}';

INSERT INTO Person
SELECT *
FROM OPENJSON(@person)
WITH (id int,
	  firstName nvarchar(50),
	  lastName nvarchar(50),
	  isAlive bit,
	  age int,
	  dateOfBirth datetime2,
	  spouce nvarchar(50))

SELECT * FROM DBO.PERSON

-----------------------------------------------------
---GUARDAR JSON EN TABLAS 
-----------------------------------------------------

DROP TABLE IF EXISTS PERSON

CREATE TABLE Person(
	Id int IDENTITY PRIMARY KEY
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	InfoJson nvarchar(max)
)

-- CREAMOS EL CONSTRAINT PARA SOPORTAR SOLO VALORES JSON

ALTER TABLE Person
ADD CONSTRAINT [Content should be formatted as JSON]
CHECK (ISJSON (InfoJSON)>0)

-- insertamos registros
INSERT INTO DBO.Person (FirstName,LastName,InfoJson)
SELECT P1.FirstName,
	(
	SELECT P.City,
		   P.EmailAddress,
		   P.JobTitle
	FROM AdventureWorks2016CTP3.SALES.vSalesPerson AS P
	WHERE P1.BusinessEntityID = P.BusinessEntityID
	FOR JSON PATH,WITHOUT_ARRAY_WRAPPER
	)
FROM
AdventureWorks2016CTP3.SALES.vSalesPerson AS P1 


SELECT * FROM DBO.Person

-- INDICES 

ALTER TABLE Person 
ADD vCITY AS JSON_VALUE(InfoJSON, '$.City')

CREATE INDEX idx_Person_1X
ON Person(vCITY)
INCLUDE(FIRSTNAME,LASTNAME)

SELECT FirstName,LastName,VCITY
FROM DBO.Person
WHERE VCITY = 'Bellvue'