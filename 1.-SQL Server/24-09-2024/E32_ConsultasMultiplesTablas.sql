/* TEMA: SQL SERVER
SUBTEMA: CONSULTAS MULTIPLES TABLAS */

------1. REALIZAR LA SIGUIENTE CONSULTA DE LA TABLA INSTRUCTORES-------

SELECT nombre, primerApellido AS 'Apellido Paterno', segundoApellido AS 'Apellido Materno', rfc, cuotaHora AS
'Cuota Por Hora', REPLACE (activo, '1', 'Activo') AS 'Estatus' 
FROM Instructores;

------2. REALIZAR LA SIGUIENTE CONSULTA DE LA TABLA CURSOS-------

SELECT CatCur.nombre AS Curso, horas, Cur.fechaInicio, fechaTermino 
FROM Cursos Cur
	INNER JOIN CatCursos CatCur
	ON Cur.idCatCurso = CatCur.id;

------3. REALIZAR LA SIGUIENTE CONSULTA DE LA TABLA ALUMNOS-------

SELECT Alu.nombre, primerApellido, segundoApellido, curp, Est.nombre AS Estado, EstAlu.Nombre AS Estatus 
FROM Alumnos Alu
	INNER JOIN Estados Est 
	ON Alu.idEstadoOrigen=Est.id 
	INNER JOIN EstatusAlumnos EstAlu
	ON Alu.idEstatus=EstAlu.id;

------4. REALIZAR LA SIGUIENTE CONSULTA DE LA TABLA INSTRUCTORES, EN QUE CURSOS HA PARTICIPADO-------

SELECT CONCAT(Ins.nombre, ' ', primerApellido, ' ', segundoApellido) AS Instructor, Ins.cuotaHora,
CatCur.nombre,Cur.fechaInicio, fechaTermino
FROM Instructores Ins
	INNER JOIN CursosInstructores CurIns 
	ON Ins.id = CurIns.idInstructor
	INNER JOIN Cursos Cur
	ON Cur.id = CurIns.idCurso
	INNER JOIN CatCursos CatCur
	ON CatCur.id = Cur.idCatCurso;

------5. REALIZAR LA SIGUIENTE CONSULTA DE ALUMNOS, MOSTRANDO LOS CURSOS QUE HA TOMADO ---------

SELECT Alu.nombre, primerApellido, segundoApellido, Est.nombre AS 'Estado', CatCur.nombre AS 'Curso', CurAlu.fechaInscripcion, 
Cur.fechaInicio, Cur.fechaTermino, CurAlu.calificacion
FROM Alumnos Alu
	INNER JOIN Estados Est
	ON Alu.idEstadoOrigen=Est.id
	INNER JOIN CursosAlumnos CurAlu
	ON Alu.id = CurAlu.idAlumno
	INNER JOIN Cursos Cur
	ON Cur.id = CurAlu.id
	INNER JOIN CatCursos CatCur
	ON CatCur.id = Cur.idCatCurso;

/*6. CONSULTA DE ALUMNOS: NOMBRE Y APELLIDOS, CURSO, FECHA INICIAL, FECHA FINAL, ORDENANDO 
CALIFICACIÓN DE LA MÁS ALTA A LA MÁS BAJA */

SELECT Alu.nombre, primerApellido, segundoApellido, CatCur.nombre AS 'Curso',
Cur.fechaInicio, Cur.fechaTermino, CurAlu.calificacion 
FROM Alumnos Alu
	INNER JOIN CursosAlumnos CurAlu
	ON Alu.id = CurAlu.idAlumno
	INNER JOIN Cursos Cur
	ON Cur.id = CurAlu.id
	INNER JOIN CatCursos CatCur
	ON CatCur.id = Cur.idCatCurso
	ORDER BY calificacion DESC;

/*7. REALIZAR LA SIGUIENTE CONSULTA DE LOS CURSOS CON SU CORRESPONDIENTE CURSO DE PREREQUISITO */

SELECT CatCursos.clave, CatCursos.nombre AS 'Curso', CatCursos.horas, 
ISNULL(CatCur.nombre, 'Sin Prerrequisito') AS 'Prerrequisito'
FROM CatCursos Catcur
	RIGHT JOIN CatCursos
	ON CatCursos.idPreRequisito = CatCur.id

/*8. REALIZAR UNA CONSULTA CON LOS DATOS DEL ALUMNO Y CURSO, DENTRO DE ELLOS LA CALIFICACIÓN, 
OBTENIENDO EL NIVEL ALCANZADO DE ACUERDO CON LO SIGUIENTE:
9-10 Excelente
7-8 Bien
6 Suficiente
<6 N/A */	

SELECT Alu.id, Alu.nombre, primerApellido, segundoApellido, CatCur.nombre AS 'Curso', Cur.fechaInicio, 
fechaTermino, CurAlu.calificacion,

 CASE 
	WHEN calificacion = 9 or calificacion = 10 THEN 'Excelente'
	WHEN calificacion = 7 or calificacion = 8 THEN 'Bien'
	WHEN calificacion = 6 THEN 'Suficiente'
	ELSE 'N/A'
	END AS Nivel

FROM Alumnos Alu
	INNER JOIN CursosAlumnos CurAlu 
	ON Alu.id = CurAlu.idAlumno
	INNER JOIN Cursos Cur
	ON Cur.id = CurAlu.id
	INNER JOIN CatCursos CatCur
	ON CatCur.id = Cur.idCatCurso;
	
	

