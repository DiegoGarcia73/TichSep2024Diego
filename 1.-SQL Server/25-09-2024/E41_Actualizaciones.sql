/* TEMA: SQL SERVER
SUBTEMA: ACTUALIZACIONES */

---- 1. Actualizar el estatus de los alumnos que están laborando a liberado----
UPDATE Alumnos SET Alumnos.idEstatus=6 FROM Alumnos WHERE Alumnos.idEstatus=5

SELECT CONCAT(Alu.nombre, ' ', primerApellido, ' ', segundoApellido) AS 'Nombre Completo', EstAlu.Nombre AS 'Estatus'
FROM Alumnos Alu
	INNER JOIN EstatusAlumnos EstAlu
	ON Alu.idEstatus=EstAlu.id

----- 2. Actualizar el segundo apellido del Alumno a Mayúsculas -----
UPDATE Alu SET Alu.segundoApellido = UPPER(Alu.segundoApellido)
FROM Alumnos Alu

SELECT * FROM Alumnos
----- 3. Actualizar el segundo Apellido para que la primera letra sea mayúsculas y el resto minúsculas -----
UPDATE Alumnos SET segundoApellido = (STUFF(LOWER(segundoApellido), 1,1, UPPER(LEFT(segundoApellido, 1))))

SELECT * FROM Alumnos
/* 4. Actualizar el número telefónico de los instructores para que los dos primeros dígitos sean 55, 
en caso de que de acuerdo al curp sean del DF */

UPDATE Instructores SET Instructores.telefono = '77' + SUBSTRING(Instructores.telefono, 3, LEN(Instructores.telefono)-2)
WHERE SUBSTRING(Instructores.curp,12,2)='DF';

SELECT * FROM Instructores

/* 5. Subirles un punto en la calificación a los alumnos de Hidalgo y Oaxaca, y del Curso impartido en junio de 2021. 
Se deberá considerar que al incrementar el punto no exceda del máximo de la calificación permitida */

UPDATE CursosAlumnos
SET calificacion = calificacion + 1
 FROM CursosAlumnos CurAlu
	INNER join Cursos Cur 
	ON CurAlu.idcurso = Cur.id
	INNER join Alumnos Alu 
	ON CurAlu.idAlumno = Alu.id
	INNER join Estados Est 
	ON Alu.idEstadoOrigen = Est.id
 
WHERE (calificacion < 10 AND fechaInicio BETWEEN '2024-10-01' AND '2024-10-31')
OR (calificacion < 10 AND Est.nombre IN ('Querétaro'));

SELECT * FROM CursosAlumnos;
SELECT * FROM CursosAlumnos CurAlu
	INNER join Cursos Cur 
	ON CurAlu.idcurso = Cur.id
	INNER join Alumnos Alu 
	ON CurAlu.idAlumno = Alu.id
	INNER join Estados Est 
	ON Alu.idEstadoOrigen = Est.id
SELECT * FROM CatCursos;
SELECT * FROM Cursos;
SELECT * FROM Alumnos;
SELECT * FROM Estados;

/* 6. Subirle el 10% de la cuota por hora a los profesores que han impartido el curso de Desarrollador .Net */

UPDATE Instructores SET cuotaHora = cuotaHora * .10 + cuotaHora
FROM Instructores
	INNER JOIN CursosInstructores 
	ON Instructores.id = CursosInstructores.idInstructor
	INNER JOIN Cursos Cur
	ON CursosInstructores.idCurso  = Cur.id
	inner join CatCursos 
	ON Cur.idCatCurso = CatCursos.id
	WHERE CatCursos.nombre = 'ASP .NET C#'

SELECT * FROM Instructores;

/* 7. En la Base de Datos Ejercicios realice lo siguiente:
a. Copiar la Tabla de Alumnos de la Base de Datos InstitutoTich a la Tabla AlumnosTodos
b. Copiar a los alumnos de Hidalgo de la Tabla de Alumnos de la Base de Datos InstitutoTich a la Tabla AlumnosHgo
c. En la Tabla AlumnosHgo cambiarles el número telefónico inicie con 77, mediante la instrucción update
d. Actualizar el teléfono de la tabla AlumnosTodos obtenidos desde la taba AlumnosHgo */

---- A. -----
SELECT * INTO Ejercicios.dbo.AlumnosTodos
FROM InstitutoTich.dbo.Alumnos;

---- B. -----
USE Ejercicios

/*CREATE TABLE AlumnosHgo(
id int identity primary key,
nombre varchar(60) NOT NULL,
primerApellido varchar(50) NOT NULL,
segundoApellido varchar (50),
correo varchar(80) NOT NULL,
telefono nchar(10) NOT NULL,
fechaNacimiento date NOT NULL,
curp char(18) NOT NULL,
sueldo decimal (9,2) NULL,
idEstadoOrigen int NOT NULL,
idEstatus smallint NOT NULL
);
GO */
SELECT Alumnos.* INTO Ejercicios.dbo.AlumnosHgo1
FROM InstitutoTich.dbo.Alumnos
	INNER JOIN InstitutoTich.dbo.Estados
	ON InstitutoTich.dbo.Alumnos.idEstadoOrigen = InstitutoTich.dbo.Estados.id
WHERE InstitutoTich.dbo.Estados.nombre = 'Hidalgo'
GO
SELECT * FROM AlumnosHgo1
----- C. -----

UPDATE AlumnosHgo1 SET AlumnosHgo1.telefono = '77' + SUBSTRING(AlumnosHgo1.telefono, 3, LEN(AlumnosHgo1.telefono)-2)

SELECT * FROM AlumnosHgo1;

----- D. -----
UPDATE AlumnosTodos SET telefono = AlumnosHgo1.telefono
FROM AlumnosHgo1 WHERE AlumnosTodos.id = AlumnosHgo1.id

SELECT * FROM AlumnosTodos;

----------------------------------- PARA USAR LA BASE DE DATOS INSTITUTO TICH -----------------------------
USE InstitutoTich