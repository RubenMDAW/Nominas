CREATE DATABASE NOMINAS CHARACTER SET utf8 COLLATE utf8_spanish_ci;;
USE NOMINAS;

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
PRIMARY KEY(id,id_empresa,idtrabajador)
);

INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte,grupo_profesional) VALUES(1,"Javier","Martinez Hernandez","74513478A","Calle de la Panadera 47","123456789","2014-01-25","9999-12-31",1,2,0,"SI","Indefinido","Completa","SI",23,50,"Titulado Superior");
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte,grupo_profesional) VALUES(1,"Miguel","Calleja Gonzalez","78884745T","Calle de la Pastelera 4","123456789","2018-12-12","9999-12-31",7,1,0,"SI","Indefinido","Parcial","SI",26.6,70,"Teleoperadores");
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte,grupo_profesional) VALUES(2,"Alfredo","Soto Ramirez","78451478B","Calle de la Bombera 2","123456789","2017-06-29","9999-12-31",4,2,'c',"SI","Indefinido","Completa","NO",20,15,"Programador maquinas auxiliares");
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte,grupo_profesional) VALUES(2,"Ana","Fernandez Garcia","78253244M","Calle de la Policia 12","123456789","2021-04-03","2022-05-17",2,3,0,"NO","Temporal","Parcial","SI",30,1,"Titulado Medio");
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte,grupo_profesional) VALUES(1,"Laura","Delgado Soborez","74512344V","Calle de la Frutera 81","123456789","2022-05-20","9999-12-31",5,2,'b',"NO","Temporal","Completa","NO",28,100,"Oficial de primera");
INSERT INTO empleado(id_empresa,nombre,apellidos,dni,domicilio,ss,fecha_alta,fecha_baja,categoria,nivel,letra,antiguedad,tipo_de_contrato,jornada,plus_capacitacion_profesional,plus_dieta,plus_transporte,grupo_profesional) VALUES(1,"José Carlos","Catarina Pérez","71247784V","Calle de ET 41","123456789","2022-03-11","9999-12-08",6,2,0,"NO","Temporal","Completa","NO",32,105,"Conserje Mayor");

INSERT INTO empresa(nombre,cif,domicilio,ccc) VALUES("Programas Informaticos S.L","84512345H","Parque Empresarial 54","123456789");
INSERT INTO empresa(nombre,cif,domicilio,ccc) VALUES("Informatelx S.A","87774751A","Paseo de los patos 23","123456789");

INSERT INTO `nominas` (`id`, `id_empresa`, `idtrabajador`, `fecha_inicio`, `fecha_final`, `empresa`, `domicilio`, `cif`, `ccc`, `trabajador`, `nif`, `ss`, `categoria_profesional`, `grupo_cotizacion`, `fecha_antiguedad`, `salario_base`, `vacaciones`, `extraordinarias`, `plus_capacitacion_profesional`, `plus_transporte`, `plus_dieta`, `total_devengado`, `contingencias_comunes`, `desempleo`, `formacion_profesional`, `horas_extras_numero`, `horas_extras`, `total_aportaciones`, `irpf`, `total_a_deducir`, `liquido_total_a_percibir`, `remuneracion_personal`, `prorrata_pagas_extras`, `base_incapacidad_temporal`, `base_cotizacion_ss`, `base_exp_regulacion_empleo`, `at_ep`, `e_desempleo`, `e_formacion_profesional`, `fondo_garantia_social`, `cotizacion_adicion_horas_extras`, `total_aportacion_empresarial`) VALUES
(6, 1, 1, '2022-05-01', '2022-05-31', 'Programas Informaticos S.L', 'Parque Empresarial 54', '84512345H', 123456789, 'Javier Martinez Hernandez', '74513478A', 123456789, 'Titulado Superior', 1, '2014-01-25', '1378.76', '0.00', '114.90', '275.75', '0.00', '0.00', '1493.66', '83.16', '27.56', '1.78', 0, '8.62', '112.50', '35.56', '148.06', '1345.60', '1378.76', '114.90', '0.00', '352.50', '0.00', '26.67', '97.79', '10.67', '3.56', '2.03', '493.22'),
(7, 1, 2, '2022-05-01', '2022-05-31', 'Programas Informaticos S.L', 'Parque Empresarial 54', '84512345H', 123456789, 'Miguel Calleja Gonzalez', '78884745T', 123456789, 'Teleoperadores', 7, '2018-12-12', '918.00', '0.00', '76.50', '183.60', '0.00', '0.00', '994.50', '55.37', '18.35', '1.18', 0, '5.74', '74.90', '23.68', '98.58', '895.92', '918.00', '76.50', '0.00', '234.70', '0.00', '17.76', '65.11', '7.10', '2.37', '1.35', '328.39'),
(8, 2, 3, '2022-05-01', '2022-05-31', 'Informatelx S.A', 'Paseo de los patos 23', '87774751A', 123456789, 'Alfredo Soto Ramirez', '78451478B', 123456789, 'Programador maquinas auxiliares', 4, '2017-06-29', '1142.82', '0.00', '95.23', '0.00', '0.00', '0.00', '1238.05', '58.19', '19.30', '1.25', 0, '7.14', '78.74', '24.90', '103.64', '1134.41', '1142.82', '95.23', '0.00', '292.18', '0.00', '18.68', '68.49', '7.47', '2.49', '1.69', '391.00'),
(9, 2, 4, '2022-05-01', '2022-05-17', 'Informatelx S.A', 'Paseo de los patos 23', '87774751A', 123456789, 'Ana Fernandez Garcia', '78253244M', 123456789, 'Titulado Medio', 2, '2021-04-03', '1078.77', '0.00', '89.90', '215.75', '0.00', '56.61', '1168.67', '67.73', '23.16', '1.45', 0, '6.74', '92.34', '28.96', '121.30', '1047.37', '1078.77', '89.90', '0.00', '275.81', '0.00', '21.72', '97.00', '8.69', '2.90', '1.59', '407.71'),
(10, 1, 5, '2022-05-20', '2022-05-31', 'Programas Informaticos S.L', 'Parque Empresarial 54', '84512345H', 123456789, 'Laura Delgado Soborez', '74512344V', 123456789, 'Oficial de primera', 5, '2022-05-20', '1073.45', '0.00', '89.45', '0.00', '7.60', '15.96', '1162.90', '55.76', '19.09', '1.19', 0, '6.71', '76.04', '23.86', '99.90', '1063.00', '1073.45', '89.45', '0.00', '274.44', '0.00', '17.90', '79.94', '7.16', '2.39', '1.58', '383.41'),
(25, 1, 1, '2022-06-01', '2022-06-30', 'Programas Informaticos S.L', 'Parque Empresarial 54', '84512345H', 123456789, 'Javier Martinez Hernandez', '74513478A', 123456789, 'Titulado Superior', 1, '2014-01-25', '1378.76', '1378.76', '114.90', '275.75', '54.78', '0.00', '3202.95', '150.54', '49.78', '3.21', 0, '8.62', '203.53', '64.23', '267.76', '2935.19', '2757.52', '114.90', '0.00', '755.90', '0.00', '48.17', '176.64', '19.27', '6.42', '2.03', '1008.43'),
(26, 1, 2, '2022-06-01', '2022-06-30', 'Programas Informaticos S.L', 'Parque Empresarial 54', '84512345H', 123456789, 'Miguel Calleja Gonzalez', '78884745T', 123456789, 'Teleoperadores', 7, '2018-12-12', '918.00', '918.00', '76.50', '183.60', '54.78', '0.00', '2150.88', '101.09', '33.43', '2.16', 0, '5.74', '136.68', '43.13', '179.81', '1971.07', '1836.00', '76.50', '0.00', '507.61', '0.00', '32.35', '118.61', '12.94', '4.31', '1.35', '677.17'),
(27, 2, 3, '2022-06-01', '2022-06-30', 'Informatelx S.A', 'Paseo de los patos 23', '87774751A', 123456789, 'Alfredo Soto Ramirez', '78451478B', 123456789, 'Programador maquinas auxiliares', 4, '2017-06-29', '1142.82', '1142.82', '95.23', '0.00', '54.78', '0.00', '2435.65', '114.48', '37.86', '2.44', 0, '7.14', '154.78', '48.86', '203.64', '2232.01', '2285.64', '95.23', '0.00', '574.81', '0.00', '36.64', '134.35', '14.66', '4.89', '1.69', '767.04'),
(28, 1, 5, '2022-06-01', '2022-06-30', 'Programas Informaticos S.L', 'Parque Empresarial 54', '84512345H', 123456789, 'Laura Delgado Soborez', '74512344V', 123456789, 'Oficial de primera', 5, '2022-05-20', '1073.45', '1073.45', '89.45', '0.00', '54.78', '39.90', '2331.03', '109.56', '37.40', '2.34', 0, '6.71', '149.30', '46.75', '196.05', '2134.98', '2146.90', '89.45', '0.00', '550.12', '0.00', '35.07', '156.63', '14.03', '4.68', '1.58', '762.11');

ALTER TABLE nominas ADD CONSTRAINT fk_idempresa FOREIGN KEY (id_empresa) REFERENCES empresa(id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE nominas ADD CONSTRAINT fk_idempleado FOREIGN KEY (idtrabajador) REFERENCES empleado(id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE empleado ADD CONSTRAINT fk_idempleado_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id) ON DELETE NO ACTION ON UPDATE CASCADE;
