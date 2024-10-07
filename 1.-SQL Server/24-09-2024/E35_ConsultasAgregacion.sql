/* TEMA: SQL SERVER 
SUBTEMA: CONSULTAS FUNCIONES AGREGACIÓN */

---- 1. REALIZAR LA SIGUIENTE CONSULTA ALUMNOS POR ESTADO ----

SELECT Est.nombre AS 'Estado', COUNT(Alu.idEstadoOrigen) AS 'Total Alumnos'
FROM Alumnos Alu
	 INNER JOIN Estados Est
	 ON Alu.idEstadoOrigen=Est.id
GROUP BY Est.nombre

---- 2. REALIZAR LA SIGUIENTE CONSULTA ALUMNOS POR ESTATUS ----

SELECT EstAlu.nombre AS 'Estatus', COUNT(Alu.idEstatus) AS 'Total'
FROM Alumnos Alu
	 INNER JOIN EstatusAlumnos EstAlu
	 ON Alu.idEstatus=EstAlu.id
GROUP BY EstAlu.nombre

---- 3. REALIZAR LA SIGUIENTE CONSULTA RESUMEN DE CALIFICACIONES ----

SELECT 'Calificaciones Alumnos' AS 'Resumen Calificaciones', COUNT(calificacion) As 'Total de Alumnos',
MAX(CurAlu.calificacion) AS 'Máximo', MIN(CurAlu.calificacion) AS 'Mínimo', AVG(CurAlu.calificacion) AS 'Promedio'
FROM CursosAlumnos CurAlu

---- 4. REALIZAR LA SIGUIENTE CONSULTA RESUMEN DE CALIFICACIONES POR CURSO ----
SELECT CatCur.nombre, Cursos.fechaInicio, Cursos.fechaTermino,
COUNT(CursosAlumnos.calificacion) AS 'Total', MAX(CursosAlumnos.calificacion) AS 'Máximo',
MIN(CursosAlumnos.calificacion) AS 'Mínimo', AVG(CursosAlumnos.calificacion) AS 'Promedio'

 FROM CatCursos CatCur
 INNER JOIN Cursos ON CatCur.id = Cursos.idCatCurso
 INNER JOIN CursosAlumnos ON Cursos.id = CursosAlumnos.idCurso

 GROUP BY CatCur.nombre,Cursos.fechaInicio,Cursos.fechatermino

/*5. Realizar la siguiente consulta Resumen de Calificaciones por Estado, 
considerando únicamente a los Estados que tienen promedio mayor a 6 */

SELECT Est.nombre, COUNT(CurAlu.calificacion) AS 'Total',
MAX(CurAlu.calificacion) AS 'Máximo', MIN(CurAlu.calificacion) AS 'Mínimo',
AVG(CurAlu.calificacion) AS 'Promedio'

FROM Estados Est
	INNER JOIN Alumnos Alu
	ON Est.id = Alu.idEstadoOrigen
	INNER JOIN CursosAlumnos CurAlu
	ON Alu.id = CurAlu.idAlumno
GROUP BY Est.nombre
HAVING AVG(CurAlu.calificacion) > 6


SELECT * FROM CURSOSALUMNOS