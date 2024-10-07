/* TEMA: SQL SERVER
   SUBTEMA: CONSULTAS BÁSICAS */


/* 1. REALIZAR LA SIGUIENTE CONSULTA EN LA TABLA ALUMNOS */

USE InstitutoTich;

SELECT primerApellido AS "Apellido Paterno", segundoApellido AS "Apellido Materno", nombre, telefono, correo FROM Alumnos;

/* 2. REALIZAR LA SIGUIENTE CONSULTA EN LA TABLA INSTRUCTORES */

SELECT nombre, primerApellido AS "Apellido Paterno", segundoApellido AS "Apellido Materno", rfc, cuotaHora AS "Cuota Por Hora"
FROM Instructores;

/* 3. REALIZAR LA SIGUIENTE CONSULTA EN LA TABLA CATCURSOS */

SELECT clave, nombre, descripcion, horas FROM CatCursos;

/* 4. REALIZAR LA CONSULTA DE LOS 5 ALUMNOS MÁS JÓVENES */

SELECT TOP (5) nombre, primerApellido, segundoApellido, fechaNacimiento FROM ALUMNOS 
ORDER BY fechaNacimiento DESC;

/* 5. CREAR LA BASE DE DATOS EJERCICIOS */

CREATE DATABASE Ejercicios;

/* 6. COPIAR LAS TABLAS DE ALUMNOS E INSTRUCTORES DESDE LA BASE DE DATOS INSTITUTO TICH A LA DE EJERCICIOS */

SELECT * INTO EJERCICIOS.DBO.Alumnos FROM Alumnos;
SELECT * INTO EJERCICIOS.DBO.Instructores FROM Instructores;

--COMPROBACIÓN--
USE Ejercicios;
SELECT * FROM Alumnos;
SELECT * FROM Instructores;