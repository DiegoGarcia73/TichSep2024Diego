/* TEMA: SQL SERVER 
SUBTEMA: FUNCIONES FECHA */

---- 1. REALIZAR LA SIGUIENTE CONSULTA DE ALUMNOS CON EDAD ACTUAL Y EDAD EN 5 MESES ----

SELECT id, nombre, primerApellido, segundoApellido, fechaNacimiento, GETDATE() AS 'Hoy',
DATEDIFF(year, fechaNacimiento, GETDATE()) AS 'Edad',
---DATEDIFF(year, fechaNacimiento, DATEADD(month, 5, GETDATE())) AS 'Edad5Meses'---

 'Edad5Meses'= CASE
 WHEN MONTH(DATEADD(month, 5, GETDATE())) >= MONTH(Alumnos.fechaNacimiento) AND 
			 DAY(DATEADD(month, 5, GETDATE())) >= DAY(Alumnos.fechaNacimiento)
        THEN DATEDIFF(YEAR, Alumnos.fechaNacimiento, DATEADD(month, 5, GETDATE()))
        ELSE DATEDIFF(YEAR, Alumnos.fechaNacimiento, DATEADD(month, 5, GETDATE())) - 1
    END
FROM Alumnos

