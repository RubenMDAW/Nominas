CREATE DATABASE NOMINAS;
USE NOMINAS;


/* Tabla de Categorías */
CREATE TABLE CATEGORIAS(
    ID INT,
    NOMBRE_PUESTO VARCHAR(50) NOT NULL,
    SALARIO_BASE DOUBLE NOT NULL,
    CONSTRAINT pk_CAT PRIMARY key (ID)
);

CREATE TABLE EMPRESA(
    CIF varchar(20),
    NOMBRE_FISCAL VARCHAR(200),
    DOMICILIO varchar(200),
    CCC int,
    CONSTRAINT fk_EMP PRIMARY KEY (CIF)
);


/* Tabla de Empleados */
CREATE TABLE EMPLEADO(
    DNI VARCHAR(10) NOT NULL,
    NOMBRE varchar(50) NOT NULL,
    APELLIDOS VARCHAR(70) NOT NULL,
    -- DOMICILIO VARCHAR(200) NOT NULL,
    NUM_SS INT  NOT NULL,/* OPCIONAL.............. */
    FECHA_ALTA DATE  NOT NULL,
    FECHA_BAJA DATE,
    CATEGORIA INT ,/* FK DE CATORIAS...*/
    -- ANTIGUEDAD DATE ,/* OPCIONAL.............. */
    TIPO_CONTRATO ENUM("Fijo discontinuo","Indefinido"),
    JORNADA ENUM("Completa","Media"),
    HORAS INT,
    CONSTRAINT Pk_EMPLE PRIMARY KEY (DNI)
);

ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_CAT_EMPLE foreign key(CATEGORIA) references CATEGORIAS(ID);

CREATE TABLE NOMINA(
    ID INT(11) PRIMARY KEY AUTO_INCREMENT,
    DNI VARCHAR(10) NOT NULL,
    ID_EMPRESA varchar(20),
    MES INT,
    ANYO YEAR,
    DIA INT,
    SALARIO_BASE DECIMAL(7,2),
    COMPLEMENTOS DECIMAL(7,2)
);

ALTER TABLE NOMINA
ADD CONSTRAINT FK_EMPLE_NOM FOREIGN KEY (DNI) REFERENCES  EMPLEADO(DNI);
ALTER TABLE NOMINA
ADD CONSTRAINT FK_EMPR_NOM FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(CIF);




/*CREATE TABLE DEDUCCIONES(
CONTINGENCIAS_COMUNES DOUBLE (1,1),
DESEMPLEO DOUBLE (1,1),
FORMACION_PROFESIONAL DOUBLE(1,1),
HORAS_EXTRAS_NORMALES DOUBLE (1,1),
HORAS_EXTRAS_FUERZA_MAYOR INT DEFAULT 2, 
TIPO_CONTRATO ....

);*/

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
