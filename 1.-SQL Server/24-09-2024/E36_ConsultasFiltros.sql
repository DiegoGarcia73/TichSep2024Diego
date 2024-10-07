/* TEMA: SQL SERVER
SUBTEMA: CONSULTAS-FILTROS */

------ 1. ALUMNOS CUYO APELLIDO SEA "MENDOZA" -----

SELECT id, nombre, primerApellido, segundoApellido 
FROM Alumnos 
WHERE primerApellido='Mendoza' OR segundoApellido='Mendoza';

------ 2. ALUMNOS CUYO ESTATUS SEA "EN CAPACITACIÓN" -----

SELECT Alu.nombre, primerApellido, segundoApellido, EstAlu.Nombre
FROM Alumnos Alu
	INNER JOIN EstatusAlumnos EstAlu
	ON Alu.idEstatus=EstAlu.id
WHERE EstAlu.nombre='En capacitación'

------ 3. INSTRUCTORES QUE SEAN MAYORES DE 30 AÑOS -----

SELECT id, nombre, primerApellido, segundoApellido, fechaNacimiento, DATEDIFF(YEAR, fechaNacimiento, GETDATE()) AS 'Edad'
FROM INSTRUCTORES
WHERE DATEDIFF(YEAR, fechaNacimiento, GETDATE()) > 30


------ 4. ALUMNOS QUE ESTÉN ENTRE LOS 20 Y 25 AÑOS -----

SELECT id, nombre, primerApellido, segundoApellido, fechaNacimiento, DATEDIFF(YEAR, fechaNacimiento, GETDATE()) AS 'Edad'
FROM Alumnos
WHERE fechaNacimiento BETWEEN DATEADD(YEAR, -25, GETDATE()) AND DATEADD(YEAR, -20, GETDATE());


/* 5. Alumnos que sea del Estado de “Oaxaca” y su estatus sea “En Capacitación”, o que sean de “Campeche” 
y que estén en estatus “Prospecto” */

SELECT Alu.nombre AS NombreAlumno, primerApellido, segundoApellido, Est.nombre AS 'Estado', EstAlu.nombre AS 'Estatus'
FROM Alumnos Alu
	INNER JOIN Estados Est
	ON Alu.idEstadoOrigen=Est.id
	INNER JOIN EstatusAlumnos EstAlu
	ON Alu.idEstatus=EstAlu.id
WHERE Est.nombre='Oaxaca' AND EstAlu.nombre='Liberado' OR Est.nombre='Campeche' AND EstAlu.nombre='En incursión';

------ 6. ALUMNOS CUYO CORREO SEA GMAIL -----

SELECT id, nombre, primerApellido, segundoApellido, correo FROM Alumnos
WHERE correo LIKE '%gmail.com';

------ 7. ALUMNOS QUE CUMPLEN EN EL MES DE MARZO -----

SELECT id, nombre, primerApellido, segundoApellido, fechaNacimiento 
FROM Alumnos
WHERE MONTH(fechaNacimiento) = 3;

------ 8. ALUMNOS QUE CUMPLEN 30 AÑOS DENTRO DE 5 AÑOS EN RELACIÓN CON LA FECHA ACTUAL -----

SELECT nombre, primerApellido, segundoApellido, fechaNacimiento, 

   'Edad dentro de 5 años'= CASE
  WHEN MONTH(DATEADD(month, 5, GETDATE())) > MONTH(Alumnos.fechaNacimiento) 
            THEN DATEDIFF(YEAR, Alumnos.fechaNacimiento, DATEADD(year, 5, GETDATE()))
        ELSE DATEDIFF(YEAR, Alumnos.fechaNacimiento, DATEADD(year, 5, GETDATE()) - 1)
             END
			  FROM Alumnos

	WHERE  DATEDIFF(YEAR, Alumnos.fechaNacimiento, DATEADD(year, 5, GETDATE()))=31;

------ 9. ALUMNOS CUYO NOMBRE EXCEDA LOS 10 CARACTERES -----

SELECT id, nombre 
FROM Alumnos
WHERE LEN(nombre) > 10

------ 10. ALUMNOS CUYO ÚLTIMO CARÁCTER DEL CURP SEA NUMÉRICO -----

SELECT id, nombre, curp 
FROM Alumnos
WHERE curp LIKE '%[0-9]'

------ 11. ALUMNOS CUYA CALIFICACIÓN SEA MAYOR QUE 8 -----

SELECT Alu.id, nombre, primerApellido, segundoApellido, CurAlu.calificacion
FROM Alumnos Alu
	INNER JOIN CursosAlumnos CurAlu
	ON Alu.id=CurAlu.idAlumno
WHERE calificacion > 8

------ 12. ALUMNOS QUE SE ENCUENTREN EN ESTATUS LABORANDO O LIBERADO CON UN SUELDO SUPERIOR A 15,000 -----

SELECT Alu.id, Alu.nombre, primerApellido, segundoApellido, sueldo, EstAlu.nombre
FROM Alumnos Alu
	INNER JOIN EstatusAlumnos EstAlu
	ON Alu.idEstatus=EstAlu.id
WHERE ((EstAlu.Nombre='Laborando') OR EstAlu.nombre = 'Liberado') AND sueldo > 15000

------ 13. ALUMNOS CUYO AÑO DE NACIMIENTO ESTÉ ENTRE 1990 Y 1995 Y QUE SU PRIMER APELLIDO EMPIECE CON B, C O Z -----
SELECT Alu.nombre,Alu.fechaNacimiento,Alu.primerApellido 
FROM Alumnos Alu 
WHERE YEAR(Alu.fechaNacimiento) BETWEEN 1990 AND 1995 AND Alu.primerApellido LIKE '[mbcz]%';

/*14. Alumnos cuyo fecha de Nacimiento no coincide con la fecha de nacimiento del curp
• Nombre del alumno
• Curp
• Fecha de Nacimiento */

SELECT Alu.nombre, Alu.curp, Alu.fechaNacimiento
FROM Alumnos Alu
WHERE Alu.fechaNacimiento <> SUBSTRING(Alu.curp, 5, 6);

/* 15. Alumnos cuyo primer apellido inicie con ‘A’ y el mes de nacimiento sea abril y que tengan entre 21 y 30 años */

SELECT Alu.nombre, Alu.fechaNacimiento, Alu.primerApellido,
	  CASE  
			WHEN MONTH(GETDATE()) > MONTH(Alu.fechaNacimiento) 
		THEN DATEDIFF(YEAR, fechaNacimiento,GETDATE()) 
	ELSE DATEDIFF(YEAR, fechaNacimiento,GETDATE()) - 1  
END AS Edad         
FROM Alumnos Alu
WHERE Alu.primerApellido LIKE 'M%' AND MONTH(Alu.fechaNacimiento) = 4 
AND DATEDIFF(YEAR, fechaNacimiento,GETDATE()) BETWEEN 21 AND 30 

---- 16. OBTENER UNA LISTA DE ALUMNOS QUE SE LLAMEN LUIS, AUNQUE SEA COMPUESTO ----
SELECT Alu.id, Alu.nombre
FROM Alumnos Alu
WHERE nombre LIKE '%LUIS%';

/* 17. Obtener una consulta de los cursos que se han impartido en el año de 2021,
o nombre del curso
o fecha de inicio
o fecha final
o cantidad de alumnos
o promedio de calificaciones. */

SELECT CatCur.nombre, Cur.fechaInicio, Cur.fechatermino, COUNT(CurAlu.fechaInscripcion) AS cantidadDealumnos,
AVG(CurAlu.calificacion) as califPromedio
FROM Cursos Cur
	INNER JOIN CatCursos CatCur 
	ON Cur.idCatCurso = CatCur.id
	INNER JOIN  CursosAlumnos CurAlu
	ON Cur.id = CurAlu.idCurso
GROUP BY CatCur.nombre, Cur.fechaInicio, Cur.fechatermino
HAVING YEAR(Cur.fechaInicio)=2024

/* 18. Realizar la siguiente consulta Resumen de Calificaciones por Estado, 
considerando únicamente a los alumnos que tienen calificación mayor a 6 mostrando 
únicamente a los estados cuyo total de alumnos (con promedio mayor a 6) sea mayor a 1 */

SELECT Est.nombre AS ESTADO, COUNT(DISTINCT Alu.id) AS 'Alumnos que tienen calificación mayor a 6',
AVG(CurAlu.calificacion) AS PROMEDIO, AVG(Alu.sueldo) as promSueldo
FROM Alumnos Alu
	INNER JOIN Estados Est
	ON Alu.idEstadoOrigen = Est.id
	INNER JOIN CursosAlumnos CurAlu
	ON Alu.id = CurAlu.idAlumno
WHERE CurAlu.calificacion > 6
GROUP BY Est.nombre
HAVING AVG(CurAlu.calificacion)> 6 AND  COUNT(DISTINCT Alu.ID )>1;




SELECT * FROM EstatusAlumnos 
SELECT * FROM Alumnos 
SELECT * FROM ESTADOS
SELECT * FROM CursosAlumnos
SELECT * FROM CatCursos
