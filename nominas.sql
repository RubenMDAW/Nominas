CREATE DATABASE NOMINAS CHARACTER SET utf8 COLLATE utf8_spanish_ci;;
USE NOMINAS;


/* Tabla de Categorías */
-- CREATE TABLE CATEGORIAS(
-- ID INT,
-- NOMBRE_PUESTO VARCHAR(150) NOT NULL,
-- SALRIO_BASE DOUBLE NOT NULL,
-- CONSTRAINT pk_CAT PRIMARY key (ID)
-- );

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
dni VARCHAR(9),
domicilio VARCHAR(70),
ss INT(12),
fecha_alta DATE,
fecha_baja DATE,
grupo_profesional VARCHAR(150),
categoria INT(2),
nivel INT(1),
letra CHAR DEFAULT 0,
-- PLUSES
plus_capacitacion_profesional enum("SI","NO"),
plus_transporte int(2),
plus_dieta DECIMAL(5,2),
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
idtrabajador INT(11),
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
plus_capacitacion_profesional DECIMAL(10,2),
plus_transporte DECIMAL(10,2),
plus_dieta DECIMAL(10,2),
total_devengado DECIMAL(10,2),
contingencias_comunes DECIMAL(6,2),
desempleo DECIMAL(6,2),
formacion_profesional DECIMAL(10,2),
horas_extras_numero INT(2),
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
cotizacion_adicion_horas_extras DECIMAL(10,2),
total_aportacion_empresarial DECIMAL(10,2),
PRIMARY KEY(id,id_empresa,id_trabajador)
-- FALTAN FOREIGNS KEYS --
);


-- CREATE TABLE DEDUCCIONES(
-- CONTINGENCIAS_COMUNES DOUBLE (1,1),
-- DESEMPLEO DOUBLE (1,1),
-- FORMACION_PROFESIONAL DOUBLE(1,1),
-- HORAS_EXTRAS_NORMALES DOUBLE (1,1),
-- HORAS_EXTRAS_FUERZA_MAYOR INT DEFAULT 2
-- );

-- CREATE TABLE Horas_Extra(
--     Id INT(11) PRIMARY KEY AUTO_INCREMENT ,
--     DNI VARCHAR(10) NOT NULL,
--     CIF varchar(20),
--     Horas DOUBLE (2,2),
--     Fecha_inicio DATE,
--     Fecha_final DATE
--     );

INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte) VALUES(1,"Javier","Martinez Hernandez","74513478A","Calle de la Panadera 47","123456789","2014-01-25","9999-12-31",1,2,0,"SI","Indefinido","Completa","SI",23,50);
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte) VALUES(1,"Miguel","Calleja Gonzalez","78884745T","Calle de la Pastelera 4","123456789","2018-12-12","9999-12-31",7,1,0,"SI","Indefinido","Parcial","SI",26.6,70);
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte) VALUES(2,"Alfredo","Soto Ramirez","78451478B","Calle de la Bombera 2","123456789","2017-06-29","9999-12-31",4,2,'c',"SI","Indefinido","Completa","NO",20,15);
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte) VALUES(2,"Ana","Fernandez Garcia","78253244M","Calle de la Policia 12","123456789","2021-04-03","2022-05-17",2,3,0,"NO","Temporal","Parcial","SI",30,1);
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte) VALUES(1,"Laura","Delgado Soborez","74512344V","Calle de la Frutera 81","123456789","2022-05-20","9999-12-31",5,2,'b',"NO","Temporal","Completa","NO",28,100);

INSERT INTO empresa(nombre,cif,domicilio,ccc) VALUES("Programas Informaticos S.L","84512345H","Parque Empresarial 54","123456789");
INSERT INTO empresa(nombre,cif,domicilio,ccc) VALUES("Informatelx S.A","87774751A","Paseo de los patos 23","123456789");
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
