/* CREACIÓN DE LA BASE DE DATOS EJERCICIOS TICH */

CREATE DATABASE EjerciciosTich;
GO
USE EjerciciosTich;

/*CREACIÓN DE LA TABLA CURSO INSTRUCTORES */

CREATE TABLE CursoInstructores
(
id int identity primary key,
idCurso smallint, 
idInstructor smallint,
fechaContratacion date null
);

/* CREACIÓN DE LA TABLA ALUMNOS BAJA */

CREATE TABLE AlumnosBaja
(
id int identity primary key,
nombre varchar(60),
primerApellido varchar(50),
segundoApellido varchar(50) null,
fechaBaja datetime
);

