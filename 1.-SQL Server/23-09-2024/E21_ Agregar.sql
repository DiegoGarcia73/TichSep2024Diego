/* TEMA: SQL SERVER
SUBTEMA: AGREGAR REGISTROS */

/* ACTIVANDO LA BASE DE DATOS INSTITUTO TICH PARA USARSE  */

USE InstitutoTich;

/* 1. AGREGANDO REGISTROS A LA TABLA ESTADOS */

SET IDENTITY_INSERT ESTADOS ON;
GO

INSERT INTO Estados VALUES (1, N'Aguascalientes');
INSERT INTO Estados VALUES (2, N'Baja California');
INSERT INTO Estados VALUES (3, N'Baja California Sur');
INSERT INTO Estados VALUES (4, N'Campeche');
INSERT INTO Estados VALUES (5, N'Chihuahua');
INSERT INTO Estados VALUES (6, N'Chiapas');
INSERT INTO Estados VALUES (7, N'Coahuila');
INSERT INTO Estados VALUES (8, N'Colima');
INSERT INTO Estados VALUES (9, N'Durango');
INSERT INTO Estados VALUES (10, N'Guanajuato');
INSERT INTO Estados VALUES (11, N'Guerrero');
INSERT INTO Estados VALUES (12, N'Hidalgo');
INSERT INTO Estados VALUES (13, N'Jalisco');
INSERT INTO Estados VALUES (14, N'México');
INSERT INTO Estados VALUES (15, N'Michoacán');
INSERT INTO Estados VALUES (16, N'Morelos');
INSERT INTO Estados VALUES (17, N'Nayarit');
INSERT INTO Estados VALUES (18, N'Nuevo León');
INSERT INTO Estados VALUES (19, N'Oaxaca');
INSERT INTO Estados VALUES (20, N'Puebla');
INSERT INTO Estados VALUES (21, N'Querétaro');
INSERT INTO Estados VALUES (22, N'Quintana Roo');
INSERT INTO Estados VALUES (23, N'San Luis Potosí');
INSERT INTO Estados VALUES (24, N'Sinaloa');
INSERT INTO Estados VALUES (25, N'Sonora');
INSERT INTO Estados VALUES (26, N'Tabasco');
INSERT INTO Estados VALUES (27, N'Tamaulipas');
INSERT INTO Estados VALUES (28, N'Tlaxcala');
INSERT INTO Estados VALUES (29, N'Veracruz');
INSERT INTO Estados VALUES (30, N'Yucatán');
INSERT INTO Estados VALUES (31, N'Zacatecas');

SET IDENTITY_INSERT ESTADOS OFF;
GO

/* ------------------------------------------------------------------------------- */

/* 2. INSERTANDO REGISTROS A LA TABLA ESTATUS ALUMNOS */

SET IDENTITY_INSERT ESTATUSALUMNOS ON;

INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (1, N'PTO		', N'Prospecto');
INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (2, N'PRO		', N'En curso propedéutico');
INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (3, N'CAP		', N'En capacitación');
INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (4, N'INC		', N'En incursión');
INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (5, N'LAB		', N'Laborando');
INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (6, N'LIB		', N'Liberado');
INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (7, N'NI		', N'No le interesó');
INSERT INTO EstatusAlumnos(id, Clave, Nombre) VALUES (8, N'BA		', N'Baja');

SET IDENTITY_INSERT ESTATUSALUMNOS OFF;

/* -------------------------------------------------------------------------------- */

/*3. INSERTANDO 4 REGISTROS EN LA TABLA CAT CURSOS */

SET IDENTITY_INSERT CatCursos ON

INSERT INTO CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito, activo) VALUES 
(1, N'BD', N'Bases De Datos SQL Server', 'Introducción a las bases de datos', '30', 1, 1);

INSERT INTO CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito, activo) VALUES 
(2, N'C#', N'Introducción a ASP .NET y C#', 'Conocer ASP .NET y C#', '30', 2, 1);

INSERT INTO CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito, activo) VALUES 
(3, N'ASP .NET', N'ASP .NET C#', 'Profundización del tema ASP .NET y C#', '30', 3, 1);

INSERT INTO CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito, activo) VALUES 
(4, N'MVC', N'ASP .NET - MVC', 'Tener nociones sobre el Modelo Vista Controlador', '30', 4, 1);


SET IDENTITY_INSERT CatCursos OFF;

/* -------------------------------------------------------------------------------- */

/* 4. INSERTANDO 6 REGISTROS EN LA TABLA CURSOS */

SET IDENTITY_INSERT Cursos ON

INSERT INTO Cursos (id, idCatCurso, fechaInicio, fechaTermino, activo) VALUES 
(1, 1, CAST(N'2024-09-23' AS DATE), CAST(N'2024-09-27' AS DATE), 1);

INSERT INTO Cursos (id, idCatCurso, fechaInicio, fechaTermino, activo) VALUES 
(2, 2, CAST(N'2024-09-30' AS DATE), CAST(N'2024-10-04' AS DATE), 1);

INSERT INTO Cursos (id, idCatCurso, fechaInicio, fechaTermino, activo) VALUES 
(3, 3, CAST(N'2024-10-07' AS DATE), CAST(N'2024-10-11' AS DATE), 1);

INSERT INTO Cursos (id, idCatCurso, fechaInicio, fechaTermino, activo) VALUES 
(4, 4, CAST(N'2024-10-14' AS DATE), CAST(N'2024-10-18' AS DATE), 1);

INSERT INTO Cursos (id, idCatCurso, fechaInicio, fechaTermino, activo) VALUES
(5, 4, CAST(N'2024-10-19' AS DATE), CAST(N'2024-10-19' AS DATE), 1);

INSERT INTO Cursos (id, idCatCurso, fechaInicio, fechaTermino, activo) VALUES
(6, 2, CAST(N'2024-10-11' AS DATE), CAST(N'2024-10-11' AS DATE), 1);

SET IDENTITY_INSERT Cursos OFF;

/* -------------------------------------------------------------------------------- */

/* 5. INSERTANDO REGISTROS EN LA TABLA ALUMNOS */

SET IDENTITY_INSERT Alumnos ON;

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(1, N'Marcelo Isai a', N'García', N'Mirón', N'marcelo@outlook.com', N'9911362600', CAST(N'1997-12-12' AS Date), N'MADA971212HVZRMN04', CAST(22000.00 AS Decimal(9, 2)), 29, 6);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(2, N'Oliver Alexis', N'Martínez', N'Estudillo', N'alexis@gmail.com', N'8897877417', CAST(N'1996-04-18' AS Date), N'DIAE960418HOCSVL07', CAST(20000.00 AS Decimal(9, 2)), 19, 6);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(3, N'Oscar', N'Mendoza', N'García', N'omscar@outlook.es', N'7711589568', CAST(N'1994-04-07' AS Date), N'RUVJ940407HOCSSN03', NULL, 29, 4);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(4, N'Edgar', N'Martínez', N'Espinoza', N'edgargmail.com', N'5528356144', CAST(N'1996-05-23' AS Date), N'DOML960323HMNMTS00', CAST(25000.00 AS Decimal(9, 2)), 12, 5);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(5, N'Rodrigo', N'Tolentino', N'Martínez', N'rodrigo@gmail.com', N'4421436224', CAST(N'1998-03-13' AS Date), N'TOMR980313HHGLRD06', NULL, 13, 5);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(6, N'Jesiel', N'García', N'Pérez', N'jesiel@gmail.com', N'3317901341', CAST(N'1990-11-08' AS Date), N'GAPJ901108HHGRRS00', NULL, 13, 5);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(7, N'Christian Josue', N'Gonzalez', N'Lozano', N'christian@gmail.com', N'4922153353', CAST(N'1996-06-19' AS Date), N'GOLC960619HZSNZH08', NULL, 22, 4);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(8, N'Luis Enrique', N'Lopez', N'Cruz', N'luis@gmail.com', N'2235700644', CAST(N'1997-07-15' AS Date), N'LOCL970715HGTPRS04', NULL, 16, 5);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(9, N'Rolando', N'Marquez', N'Hernandez', N'rolando@gmail.com', N'1168329969', CAST(N'1997-03-08' AS Date), N'MAHR97030815HRL600', NULL, 15, 4);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(10, N'Jesús Yotecatl', N'Miranda', N'Espinosa', N'jesus@gmail.com', N'2213335247', CAST(N'1997-06-14' AS Date), N'MIEJ970614HMCRSS05', NULL, 15, 4);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(11, N'Cecilia', N'Cruz', N'Luna', N'cecilia@outlook.com', N'3317052376', CAST(N'1997-08-08' AS Date), N'CULC970808MPLRNC02', CAST(22000.00 AS Decimal(9, 2)), 21, 4);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(12, N'Baldomero', N'Gómez', N'García', N'baldomero@gmail.com', N'4419055010', CAST(N'2000-11-08' AS Date), N'GOGB001108HPLMRLA2', CAST(23000.00 AS Decimal(9, 2)), 21, 4);
/*
INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(13, N'Rubén', N'Rojas', N'Mantilla', N'ruben@outlook.com', N'5594228277', CAST(N'1997-01-17' AS Date), N'ROMR910117HVZJNB00', CAST(21000.00 AS Decimal(9, 2)), 30, 4);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(14, N'Ana Patricia', N'Apatiga ', N'Olguín', N'patricia@gmail.com', N'6614913002', CAST(N'1998-06-23' AS Date), N'AAOA980623MHGPLN03', CAST(22000.00 AS Decimal(9, 2)), 13, 3);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(15, N'Bryan Adiel ', N'Arroyo ', N'Tavera', N'brayan@gmail.com', N'7719034047', CAST(N'1998-04-02' AS Date), N'AOTB980402HHGRVR05', CAST(20000.00 AS Decimal(9, 2)), 13, 3);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(16, N'Carlos Arath', N'Serrano', N'Berna', N'carlos@gmail.com', N'8878893014', CAST(N'2000-03-05' AS Date), N'SEBC000305HQTRRRA5', CAST(250000.00 AS Decimal(9, 2)), 22, 3);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(17, N'Edith', N'Rasgado', N'Sarabia', N'edith@gmail.com', N'9911777500', CAST(N'1994-04-29' AS Date), N'RASE940429MOCSRD00', CAST(20000.00 AS Decimal(9, 2)), 20, 3);

INSERT INTO Alumnos (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus) VALUES
(18, N'Víctor', N'Marín', N'Pérez', N'victor@gmail.com', N'2215066253', CAST(N'1998-06-04' AS Date), N'MAPV980604HDFRRC01', CAST(21000.00 AS Decimal(9, 2)), 15, 3);

*/

SET IDENTITY_INSERT Alumnos OFF;


/* -------------------------------------------------------------------------------- */

/* 6. INSERTANDO 4 REGISTROS A LA TABLA INSTRUCTORES */

SET IDENTITY_INSERT INSTRUCTORES ON;

INSERT INTO INSTRUCTORES (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, rfc, curp, cuotaHora, activo) VALUES
(1, N'Oscar', N'López', N'Osorio', N'olopez@ti-capitalhumano.com', N'7226181450', CAST(N'1984-08-03' AS Date), N'LOOO840803S08', N'LOOO840803HMCPSS08', CAST(110.00 AS Decimal(9, 2)), 1);

INSERT INTO INSTRUCTORES (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, rfc, curp, cuotaHora, activo) VALUES
(2, N'Jorge', N'Valdivia', N'Rosas', N'jvaldivia@ti-capitalhumano.com', N'5561040510', CAST(N'1964-01-26' AS Date), N'VARJ640126R00', N'VARJ640126HDFLSR00', CAST(100.00 AS Decimal(9, 2)), 1);

INSERT INTO INSTRUCTORES (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, rfc, curp, cuotaHora, activo) VALUES
(3, N'Luis', N'Vázquez', N'Cuj', N'luisvazquez@ti-capitalhumano.com', N'5540612941', CAST(N'1974-10-11' AS Date), N'VACL741011JS5', N'VACL741011HTCZJS05', CAST(80.00 AS Decimal(9, 2)), 1);

INSERT INTO INSTRUCTORES (id, nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, rfc, curp, cuotaHora, activo) VALUES
(4, N'José', N'Morales', N'Narváez', N'jose.morales@ti-capitalhumano.com', N'5511506288', CAST(N'1984-12-31' AS Date), N'MONM941231N07', N'MONM941231HCCRRN07', CAST(70.00 AS Decimal(9, 2)), 1);

SET IDENTITY_INSERT INSTRUCTORES OFF


/* -------------------------------------------------------------------------------- */

/* 7. INSERTANDO REGISTROS NECESARIOS EN LA TABLA CURSOS ALUMNOS */

SET IDENTITY_INSERT CursosAlumnos ON;

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(1, 1, 1, CAST(N'2024-05-21' AS DATE), CAST(N'2024-06-24' AS DATE), 9);

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(2, 1, 2, CAST(N'2024-05-21' AS DATE), CAST(N'2024-06-26' AS DATE), 10);

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(3, 2, 3, CAST(N'2024-06-25' AS DATE), NULL, NULL);

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(4, 2, 4, CAST(N'2024-06-25' AS DATE), NULL, 8);  

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(5, 3, 5, CAST(N'2024-06-25' AS DATE), NULL, 10);  

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(6, 3, 6, CAST(N'2024-06-25' AS DATE), NULL, 9);  

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(7, 4, 7, CAST(N'2024-06-25' AS DATE), NULL, NULL);  

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(8, 4, 8, CAST(N'2024-06-25' AS DATE), NULL, 10);

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(9, 5, 9, CAST(N'2024-06-25' AS DATE), NULL, NULL);

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(10, 5, 10, CAST(N'2024-06-25' AS DATE), NULL, NULL);

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(11, 5, 11, CAST(N'2024-06-25' AS DATE), NULL, NULL);

INSERT INTO CursosAlumnos(id, idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion) VALUES
(12, 5, 12, CAST(N'2024-06-25' AS DATE), NULL, NULL);

SET IDENTITY_INSERT CatCursos OFF;

/* -------------------------------------------------------------------------------- */


/* 8. INSERTANDO REGISTROS NECESARIOS EN LA TABLA CURSOS INSTRUCTORES */

SET IDENTITY_INSERT CursosInstructores ON

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(1, 1, 1, CAST(N'2018-04-23' AS DATE));

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(2, 1, 2, CAST(N'2017-09-30' AS DATE));

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(3, 2, 3, CAST(N'2019-01-14' AS DATE));

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(4, 2, 4, CAST(N'2021-03-05' AS DATE));

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(5, 3, 1, CAST(N'2018-04-23' AS DATE));

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(6, 3, 2, CAST(N'2017-09-30' AS DATE));

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(7, 4, 3, CAST(N'2019-01-14' AS DATE));

INSERT INTO CursosInstructores (id, idCurso, idInstructor, fechaContratacion) VALUES
(8, 4, 4, CAST(N'2021-03-05' AS DATE));

SET IDENTITY_INSERT CursosInstructores OFF;