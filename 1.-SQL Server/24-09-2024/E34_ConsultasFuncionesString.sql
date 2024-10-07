/* TEMA: SQL SERVER 
SUBTEMA: FUNCIONES FECHA SEGUNDA PARTE */

---- 1. REALIZAR LA SIGUIENTE CONSULTA CON EL NOMBRE Y APELLIDOS EN MAYÚSCULAS ----

SELECT id, UPPER(nombre) AS 'nombre' , UPPER(primerApellido) as 'primerApellido', UPPER(segundoApellido) AS 'segundoApellido', 
fechaNacimiento, GETDATE() AS 'Hoy', 
DATEDIFF(year, fechaNacimiento, GETDATE()) AS 'Edad',
'Edad5Meses'= CASE
 WHEN MONTH(DATEADD(month, 7, GETDATE())) >= MONTH(Alumnos.fechaNacimiento) AND 
			 DAY(DATEADD(month, 7, GETDATE())) >= DAY(Alumnos.fechaNacimiento)
        THEN DATEDIFF(YEAR, Alumnos.fechaNacimiento, DATEADD(month, 7, GETDATE()))
        ELSE DATEDIFF(YEAR, Alumnos.fechaNacimiento, DATEADD(month, 7, GETDATE())) - 1
    END
FROM Alumnos

---- 2. REALIZAR LA CONSULTA ANTERIOR AGREGANDO COLUMNA CON LA FECHA DE NACIMIENTO EXTRAÍDA DEL CURP----

SELECT id, UPPER(nombre) AS 'nombre' , UPPER(primerApellido) AS 'primerApellido', UPPER(segundoApellido) AS 'segundoApellido',
fechaNacimiento, curp, CONVERT(DATE, SUBSTRING(curp, 5, 6)) AS 'FechaCurp'
FROM Alumnos

/*3. REALIZAR UNA CONSULTA CON LOS DATOS DE LOS ALUMNOS Y UNA COLUMNA ADICIONAL INDICANDO EL GÉNERO CON LA PALABRA 'HOMBRE'
O 'MUJER' SEGÚN CORRESPONDA DE ACUERDO A LO INDICADO EN LA COLUMNA 11 DEL CURP */

SELECT id, UPPER(nombre) AS 'nombre' , UPPER(primerApellido) AS 'primerApellido', UPPER(segundoApellido) AS 'segundoApellido',
fechaNacimiento, curp, IIF(SUBSTRING(Alumnos.curp, 11, 1)='H', 'Hombre',
IIF(SUBSTRING(Alumnos.curp, 11, 1)='M', 'Mujer', 'ERROR')) AS 'Género'
FROM Alumnos

/*4. REALIZAR LA SIGUIENTE CONSULTA DE ALUMNOS, CAMBIANDO EL CORREO DE GMAIL POR HOTMAIL */

SELECT id, nombre, primerApellido, segundoApellido, fechaNacimiento, correo, 
REPLACE(correo, 'gmail.com', 'hotmail.com') AS 'correoHotmail'
FROM Alumnos

