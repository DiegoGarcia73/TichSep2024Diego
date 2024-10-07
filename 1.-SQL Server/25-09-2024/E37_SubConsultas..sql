/* TEMA: SQL SERVER
SUBTEMA: SUBCONSULTAS */


---- 1. OBTENER EL NOMBRE DEL ALUMNO CUYA LONGITUD ES LA MÁS GRANDE -----
SELECT nombre
FROM Alumnos
WHERE LEN(nombre) = (SELECT MAX(LEN(nombre)) FROM alumnos);


----- 2. Mostrar el o los alumnos menos jóvenes ------
SELECT nombre, primerApellido, segundoApellido, fechaNacimiento, 
DATEDIFF(YEAR, fechaNacimiento, GETDATE()) AS 'Edad'
FROM alumnos
WHERE fechaNacimiento = (SELECT MIN(fechaNacimiento) FROM alumnos);

----- 3. Obtener una lista de los alumnos que tuvieron la máxima calificación -----
SELECT Alu.nombre, primerApellido, segundoApellido, CatCur.nombre AS 'Curso', Cur.fechaInicio, 
Cur.fechaTermino, CurAlu.calificacion 
FROM Alumnos Alu
	 INNER JOIN CursosAlumnos CurAlu
	 ON	Alu.id=CurAlu.idAlumno
	 INNER JOIN Cursos Cur
	 ON Cur.id=CurAlu.idCurso
	 INNER JOIN CatCursos CatCur
	 ON CatCur.id=Cur.idCatCurso
WHERE calificacion = (SELECT MAX(calificacion) FROM CursosAlumnos);

----- 4. Obtener la siguiente consulta con los datos de cada uno de los cursos ------
SELECT CatCur.nombre, Cursos.fechaInicio, Cursos.fechaTermino, Total, CalMax, CalMin, CalProm
FROM CatCursos CatCur
    INNER JOIN Cursos 
    ON CatCur.id = Cursos.idCatCurso
    INNER JOIN  (SELECT CurAlu.id,
	COUNT(CurAlu.calificacion) AS 'Total', 
    MAX(CurAlu.calificacion) AS 'CalMax',
    MIN(CurAlu.calificacion) AS 'CalMin', 
	AVG(CurAlu.calificacion) AS 'CalProm'
	FROM CursosAlumnos CurAlu
	GROUP BY CurAlu.id) Subconsulta
	ON Cursos.id=Subconsulta.id 

----- 5. Obtener una consulta de los alumnos que tienen una calificación igual o menor que el promedio de calificaciones -----
SELECT CONCAT(nombre, ' ', primerApellido, ' ', segundoApellido) AS 'Nombre Completo', CurAlu.calificacion
FROM Alumnos Alu
	INNER JOIN CursosAlumnos CurAlu
	ON Alu.id=CurAlu.idAlumno
WHERE calificacion <= (SELECT AVG(calificacion) FROM CursosAlumnos);

------ 6. Obtener una lista de los alumnos que tuvieron la máxima calificación en cada uno de los cursos. -----
SELECT Alu.id, Alu.nombre, primerApellido, segundoApellido, fechaNacimiento, CatCur.nombre AS 'Curso', Cur.fechaInicio, 
Cur.fechaTermino, CurAlu.calificacion 
FROM CursosAlumnos CurAlu
	 INNER JOIN Alumnos Alu
	 ON	Alu.id=CurAlu.idAlumno
	 INNER JOIN Cursos Cur
	 ON Cur.id=CurAlu.idCurso
	 INNER JOIN CatCursos CatCur
	 ON CatCur.id=Cur.idCatCurso
WHERE calificacion = (SELECT MAX(calificacion)
FROM CursosAlumnos CurAlu
WHERE Cur.id = CurAlu.idCurso)

ORDER BY calificacion ASC;

----CALIFICACIÓN MÁXIMA DE CADA UNO DE LOS CURSOS ---
SELECT Alu.id, Alu.nombre, primerApellido, segundoApellido, fechaNacimiento, CatCur.nombre AS 'Curso', Cur.fechaInicio, 
Cur.fechaTermino, CurAlu.calificacion 
FROM CursosAlumnos CurAlu
	 INNER JOIN Alumnos Alu
	 ON	Alu.id=CurAlu.idAlumno
	 INNER JOIN Cursos Cur
	 ON Cur.id=CurAlu.idCurso
	 INNER JOIN CatCursos CatCur
	 ON CatCur.id=Cur.idCatCurso
	 INNER JOIN (SELECT idCurso, MAX(calificacion) AS CalMax FROM CursosAlumnos
GROUP BY idCurso) AS CM ON CurAlu.idCurso = CM.idCurso AND CurAlu.calificacion = CM.CalMax 
	


SELECT * FROM CursosAlumnos;



SELECT * FROM CursosAlumnos
SELECT * FROM Alumnos
SELECT * FROM Cursos
SELECT * FROM CatCursos


