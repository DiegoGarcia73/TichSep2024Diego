/* TEMA: SQL SERVER
SUBTEMA: CONSULTAS DE UNION */

/* 1. Obtener una consulta que contenga el Nombre y apellidos, mes y día de nacimiento de todos los alumnos
y profesores, ordenado por tipo, mes y día de nacimiento */


SELECT 'Alumno' AS TipoPersona, nombre, primerApellido, segundoApellido, MONTH(fechaNacimiento) AS 'MesNacimiento', 
DAY(fechaNacimiento) AS 'DiaNacimiento'
FROM Alumnos
UNION
SELECT 'Profesores' AS TipoPersona, nombre, primerApellido, segundoApellido, MONTH(fechaNacimiento) AS 'MesNacimiento',
DAY(fechaNacimiento) AS 'DiaNacimiento'
FROM Instructores

ORDER BY TipoPersona, MesNacimiento, DiaNacimiento