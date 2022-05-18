CREATE DATABASE NOMINAS CHARACTER SET utf8 COLLATE utf8_spanish_ci;;
USE NOMINAS;


/* Tabla de Categorías */
CREATE TABLE CATEGORIAS(
ID INT,
NOMBRE_PUESTO VARCHAR(150) NOT NULL,
SALRIO_BASE DOUBLE NOT NULL,
CONSTRAINT pk_CAT PRIMARY key (ID)
);

CREATE TABLE empresa(
id INT(11) AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
cif VARCHAR(9),
domicilio VARCHAR(200),
ccc INT(12)
);

/* Tabla de Empleados */
CREATE TABLE empleado(
id INT(11) AUTO_INCREMENT,
id_empresa INT(11),
nombre VARCHAR(50),
apellidos VARCHAR(50),
dni VARCHAR(10),
domicilio VARCHAR(70),
ss INT(12),
fecha_alta DATE,
fecha_baja DATE,
categoria INT(2),
nivel INT(1),
letra CHAR DEFAULT 0,
-- OPCIONALES
antiguedad ENUM("SI","NO"),
tipo_de_contrato ENUM("Indefinido","Temporal"),
jornada ENUM("Completa","Parcial"),
PRIMARY KEY(id,id_empresa)
-- FALTAN FOREIGNS KEYS --
);

CREATE TABLE nominas(
id INT(11) AUTO_INCREMENT,
id_empresa INT(11),
id_trabajador INT(11),
fecha_inicio DATE,
fecha_final DATE,
empresa VARCHAR(50),
domicilio VARCHAR(200),
cif VARCHAR(9),
ccc INT(12),
trabajador VARCHAR(50),
nif VARCHAR(9),
ss INT(12),
categoria_profesional VARCHAR(150),
grupo_cotizacion INT(2),
fecha_antiguedad DATE,
salario_base DECIMAL(10,2),
vacaciones DECIMAL(10,2),
extraordinarias DECIMAL(6,2),
total_devengado DECIMAL(10,2),
contingencias_comunes DECIMAL(6,2),
desempleo DECIMAL(6,2),
formacion_profesional DECIMAL(10,2),
horas_extras DECIMAL(10,2),
total_aportaciones DECIMAL(10,2),
irpf DECIMAL(10,2),
total_a_deducir DECIMAL(10,2),
liquido_total_a_percibir DECIMAL(10,2),
remuneracion_personal DECIMAL(10,2),
prorrata_pagas_extras DECIMAL(10,2),
base_incapacidad_temporal DECIMAL(10,2),
base_cotizacion_ss DECIMAL(10,2),
base_exp_regulacion_empleo DECIMAL(10,2),
at_ep DECIMAL(10,2),
e_desempleo DECIMAL(10,2),
e_formacion_profesional DECIMAL(10,2),
fondo_garantia_social DECIMAL(10,2),
total_aportacion_empresarial DECIMAL(10,2),
PRIMARY KEY(id,id_empresa,id_trabajador)
-- FALTAN FOREIGNS KEYS --
);


CREATE TABLE DEDUCCIONES(
CONTINGENCIAS_COMUNES DOUBLE (1,1),
DESEMPLEO DOUBLE (1,1),
FORMACION_PROFESIONAL DOUBLE(1,1),
HORAS_EXTRAS_NORMALES DOUBLE (1,1),
HORAS_EXTRAS_FUERZA_MAYOR INT DEFAULT 2
);

CREATE TABLE Horas_Extra(
    Id INT(11) PRIMARY KEY AUTO_INCREMENT ,
    DNI VARCHAR(10) NOT NULL,
    CIF varchar(20),
    Horas DOUBLE (2,2),
    Fecha_inicio DATE,
    Fecha_final DATE
    );

INSERT INTO CATEGORIAS VALUES(1,'Jefe Administración Superior',23117.39),
(2,'Programador o técnico de sistemas y comunicaciones',20283.11),
(3,'Programador maquinas auxiliares',18394.34);

INSERT INTO EMPRESA VALUES('A1111111','El Gato','El Campello Nº14',11111111111),
('B2222222','El Perro','Los Arenales Nº1',22222222222),
('C3333333','El Camello','El Altet Nº1',33333333333);

INSERT INTO EMPLEADO VALUES('11223344A','Alfredo',' Castillo Casas','C/Avenida Libertad Nº4','111111111111','2014-01-25',NULL,2,NULL,1),
('77445569B','Lourdes',' Garcia Garcia','C/Poeta Machado Nº7','222222222222','2018-11-01',NULL,1,NULL,2),
('44223368Y','Teresa',' Macia Flores','C/Almagros Nº44','333333333333','2020-10-27',NULL,3,NULL,3);
/*
"LOGICA"
Categoría: cada uno de los perfiles profesionales fijados en el convenio colectivo de la
empresa. A cada categoría le corresponde un salario base. Todos los empleados de la empresa
pertenecen a alguna categoría, aunque esa adscripción puede cambiar a lo largo del tiempo. 


Complemento personal: cantidad acordada individualmente entre cada empleado y la empresa
que se incluye como parte de la nómina. Puede variar a lo largo del tiempo. 

Convenio colectivo: acuerdo periódico entre la empresa y los trabajadores por el que se
establecen, entre otras cuestiones, las cantidades de los salarios base correspondientes a las
categorías. 

Empleado: persona contratada alguna vez por la empresa.

Grupo de trabajo: unidad organizativa de la empresa compuesta por un grupo de empleados,
uno de los cuales es el jefe del grupo de trabajo y el resto, los subordinados.

Nómina: retribución devengada mensualmente por la empresa a cada empleado en función de
su categoría y de su complemento personal.

Salario base: cantidad correspondiente a una categoría que se abona en las nóminas de los
empleados. Su importe varía en función de los acuerdos alcanzados en los convenios
colectivos. 

*/