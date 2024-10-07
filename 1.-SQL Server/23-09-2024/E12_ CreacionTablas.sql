/* CREACIÓN DE LA TABLA ESTADOS */

CREATE TABLE Estados
(
id int primary key,
nombre varchar(100) null
);
GO

/* CREACIÓN DE LA TABLA ESTATUS ALUMNOS */

CREATE TABLE EstatusAlumnos
(
id smallint primary key,
clave char(10),
nombre varchar(100)
);
GO

/* CREACIÓN DE LA TABLA CAT CURSOS */

CREATE TABLE CatCursos
(
id smallint identity primary key,
clave varchar(15),
nombre varchar(50),
descripcion varchar(1000) null,
horas tinyint,
idPreRequisito smallint null,
activo bit
);
GO

/* CREACIÓN DE LA TABLA CURSOS */

CREATE TABLE Cursos
(
id smallint identity primary key,
idCatCurso smallint null,
fechaInicio date null,
fechaTermino date null,
activo bit null
);
GO

/* CREACIÓN DE LA TABLA ESTADOS */

CREATE TABLE Alumnos
(
id int identity primary key,
nombre varchar(60),
primerApellido varchar(50),
segundoApellido varchar(50) null,
correo varchar(80),
telefono nchar(10),
fechaNacimiento date,
curp char(18),
sueldo decimal (9,2) null,
idEstadoOrigen int,
idEstatus smallint
);
GO

/* CREACIÓN DE LA TABLA INSTRUCTORES */

CREATE TABLE Instructores
(
id smallint identity primary key,
nombre varchar(60),
primerApellido varchar(50),
segundoApellido varchar(50) null,
correo varchar(80),
telefono nchar(10),
fechaNacimiento date,
rfc char(13),
curp char(18),
cuotaHora decimal (9,2),
activo bit
);
GO

/* CREACIÓN DE LA TABLA CURSOS ALUMNOS */

CREATE TABLE CursosAlumnos
(
id int identity primary key,
idCurso smallint,
idAlumno int,
fechaInscripcion date,
fechaBaja date null,
calificacion tinyint null
);


