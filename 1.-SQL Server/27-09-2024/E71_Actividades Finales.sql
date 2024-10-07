/* 1. Realizar una vista vAlumnos que obtenga el siguiente resultado */

CREATE OR ALTER VIEW vAlumnos
AS SELECT Alu.id AS id, Alu.nombre AS nombre, Alu.primerApellido AS 'primerApellido',
Alu.correo AS 'correo', Alu.telefono AS 'telefono', Alu.curp AS 'curp',
Est.nombre AS 'Estado', EstAlu.nombre AS 'Estatus'
FROM Alumnos Alu
	INNER JOIN Estados Est
	ON Alu.idEstadoOrigen = Est.id
	INNER JOIN EstatusAlumnos EstAlu
	ON Alu.idEstatus = EstAlu.id;
GO

----COMPROBAR LA CREACIÓN DE LA VISTA -----
SELECT * FROM vAlumnos;
GO

/* 2. Realizar el procedimiento almacenado consultarEstados el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Estados. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla. */

CREATE OR ALTER PROCEDURE consultarEstados
(
@idEstado INT
)
AS
  BEGIN

	SELECT id, nombre
	FROM Estados
	WHERE @idEstado = id OR @idEstado <= 0

  END;
GO
EXEC consultarEstados @idEstado = -20;
GO

/* 3. Realizar el procedimiento almacenado consultarEstatusAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla estatusAlumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla. */

CREATE OR ALTER PROCEDURE sp_consultarEstatusAlumnos
(
@idEstatus INT
)
AS
  BEGIN

	SELECT id, nombre
	FROM EstatusAlumnos
	WHERE @idEstatus = id OR @idEstatus <= 0

  END;
GO
EXEC sp_consultarEstatusAlumnos @idEstatus = -1; 
GO

/* 4. Realizar el procedimiento almacenado consultarAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Alumnos. 
En caso de que el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla. */

CREATE OR ALTER PROCEDURE sp_consultarAlumnos
(
@idAlumno INT
)
AS
  BEGIN

	SELECT Alu.id, Alu.nombre, primerApellido, segundoApellido, correo, fechaNacimiento, 
	telefono, curp, Est.nombre AS 'Estado' , EstAlu.nombre AS 'Estatus'
	FROM Alumnos Alu
		 INNER JOIN Estados Est
		 ON Alu.idEstadoOrigen=Est.id
		 INNER JOIN EstatusAlumnos EstAlu
		 ON Alu.idEstatus = EstAlu.id
	WHERE Alu.id = @idAlumno OR @idAlumno <= 0
  END;
GO
EXEC sp_consultarAlumnos @idAlumno = -1;
GO

/* 5. Realizar el procedimiento almacenado consultarEAlumnos el cual obtendrá la siguiente consulta, 
recibiendo como parámetro el id del registro que se requiere consultar de la tabla Alumnos. En caso de que 
el valor sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.. */

CREATE OR ALTER PROCEDURE sp_consultarEAlumnos
(
@idAlumno INT
)
AS
  BEGIN

	SELECT Alu.id, Alu.nombre, primerApellido, segundoApellido, fechaNacimiento, correo, 
	telefono, curp, idEstadoOrigen, idEstatus
	FROM Alumnos Alu
	WHERE Alu.id = @idAlumno OR @idAlumno <= 0
  END;
GO
EXEC sp_consultarEAlumnos @idAlumno = -1;
GO

/* 6. Realizar el procedimiento almacenado actualizarEstatusAlumnos el cual recibirá como parámetros el id 
del Alumno al cual se le requiere cambiar el estatus y el valor del nuevo estatus */

CREATE OR ALTER PROCEDURE sp_actualizarEstatusAlumnos
(
@idAlumno INT,
@nuevoEstatus INT
)
AS
  BEGIN
	 
     UPDATE Alumnos SET idEstatus=@nuevoEstatus
	 WHERE id=@idAlumno

	 SELECT Alu.id, CONCAT (Alu.nombre, ' ', primerApellido, ' ', segundoApellido) AS 'Nombre completo', Alu.idEstatus,
	 EstAlu.nombre
	 FROM Alumnos Alu
		INNER JOIN EstatusAlumnos EstAlu 
		ON Alu.idEstatus = EstAlu.id
  END
GO
EXEC sp_actualizarEstatusAlumnos @idAlumno=7, @nuevoEstatus=2; ---SE RECIBE EL ID DEL ALUMNO Y EL ID DEL NUEVO ESTATUS ---
GO
SELECT  id, nombre, primerApellido, idEstatus FROM Alumnos
SELECT * FROM EstatusAlumnos
GO

/* 7. Realizar el procedimiento almacenado agregarAlumnos el cual recibirá como parámetros los valores de cada 
una de las columnas de la tabla de Alumnos con los cuales se insertará el registro a la tabla Alumnos. El procedimiento
deberá regresar el id con el que se creo el registro en formato de entero. */
GO
CREATE OR ALTER PROCEDURE sp_agregarAlumnos
(
@nombre VARCHAR(100),    
@primerApellido VARCHAR (100),
@segundoApellido VARCHAR (100),
@correo VARCHAR(50),
@telefono NCHAR (50),
@fechaNacimiento DATE,
@curp CHAR (18),
@sueldo DECIMAL (10, 5), 
@idEstadoOrigen INT,
@idEstatus SMALLINT
)
AS
BEGIN

		SET NOCOUNT ON; --NO MUESTRA LOS MENSAJES DE LA FILA AFECTADA ---
	    DECLARE @idAlumno INT;

	 -- INSERTAR NUEVO REGISTRO A LA TABLA ALUMNOS ---
        INSERT INTO Alumnos (nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento,
		curp, sueldo, idEstadoOrigen, idEstatus)
        VALUES (@nombre, @primerApellido, @segundoApellido, @correo, @telefono, @fechaNacimiento,
		@curp, @sueldo, @idEstadoOrigen, @idEstatus);
		
	
	 --OBTIENE EL ID GENERADO COMO NUEVO REGISTRO--
		 SET @idAlumno = SCOPE_IDENTITY();

		SELECT @idAlumno AS idNuevoAlumno;
	
END;
GO
EXEC sp_agregarAlumnos 'Irma ','Levya','Espinoza','irmaleyva@gmail.com',7774523971,'1995-07-23','LEEI950723MCSESV05',
23000,6,5;
GO

SELECT * FROM Estados
SELECT * FROM ALUMNOS

DELETE FROM Alumnos WHERE nombre='Jonathan' 

DBCC CHECKIDENT (Alumnos, RESEED, 10) ---- REINICIA EL AUTOINCREMENTO, EN ESTE CASO, EMPEZARÁ A PARTIR DE 11---
GO
/* 8. Realizar el procedimiento almacenado actualizarAlumnos el cual recibirá como parámetros los valores de cada 
una de las columnas de la tabla de Alumnos con los cuales se actualizarán los valores que existen en la tabla 
Alumnos del registro que corresponda al id enviado como parámetro. El procedimiento deberá regresar la cantidad 
de registros actualizados. */

CREATE OR ALTER PROCEDURE sp_actualizarAlumnos
  @idAlumno INT,
  @nombre VARCHAR(60),
  @primerApellido VARCHAR(60),
  @segundoApellido VARCHAR(60),
  @correo VARCHAR(60),
  @telefono NCHAR(10),
  @fechaNacimiento DATE,
  @curp CHAR(18),
  @sueldo DECIMAL(9,2),
  @idEstadoOrigen INT,
  @idEstatus SMALLINT,
  @filasAfectadas INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON; --NO MUESTRA LOS MENSAJES DE LA FILA AFECTADA ---

    UPDATE Alumnos

    SET nombre = @nombre,
      primerApellido= @primerApellido,
	  segundoApellido= @segundoApellido,
	  correo= @correo ,
	  telefono= @telefono ,
	  fechaNacimiento= @fechaNacimiento ,
	  curp= @curp,
	  sueldo= @sueldo ,
	  idEstadoOrigen= @idEstadoOrigen ,
	  idEstatus = @idEstatus 
    WHERE id = @idAlumno;

	SET @filasAfectadas = @@ROWCOUNT; ---CAPTURA EL NÚMERO DE FILAS AFECTADAS
END;
GO
DECLARE @filasAfectadas INT;
EXEC sp_actualizarAlumnos  
  @idAlumno= 11 ,
  @nombre='Jonathan' ,
  @primerApellido='Lopez' ,
  @segundoApellido ='Cardona',
  @correo = 'jonathan@gmail.com',
  @telefono= 7775869485 ,
  @fechaNacimiento = '1993-10-11' ,
  @curp ='LOCJ940407HNLOAP98' ,
  @sueldo =30000 ,
  @idEstadoOrigen = 18,
  @idEstatus = 3,
  @filasAfectadas = @filasAfectadas OUTPUT; --CAPTURA LAS FILAS AFECTADAS -- 
PRINT 'Filas Afectadas: ' + CAST(@filasAfectadas AS VARCHAR)
GO
  SELECT * FROM ALUMNOS; ---PARA VERIFICAR LA ACTUALIZACIÓN DEL REGISTRO ---
  GO

/* 9. Realizar el procedimiento almacenado eliminarAlumnos el cual recibirá como parámetros el valor del id del registro
del alumno del que se requiere eliminar. Primeramente se deberán eliminar todos los registros de la Tabla de CursosAlumnos 
los cuales tengan el id del alumno a eliminar y posteriormente eliminar al alumno de la Tabla de Alumnos. Esto deberá 
considerarse como una transacción ya que se trate de actualizar dos tablas relacionadas. En caso de que no se haya eliminado 
el registro de la tabla de Alumnos deberá levantar una excepción. */

CREATE OR ALTER PROCEDURE sp_eliminarAlumnos
(
    @idAlumno INT
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @error INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Eliminar registros de la tabla CursosAlumnos relacionados con el alumno
        DELETE FROM CursosAlumnos
        WHERE idAlumno = @idAlumno;

        -- Verificar si se eliminaron registros en CursosAlumnos
        IF @@ROWCOUNT > 0
        BEGIN
            -- Eliminar el registro de la tabla Alumnos
            DELETE FROM Alumnos
            WHERE id = @idAlumno;

            -- Verificar si se eliminó el registro en Alumnos
            IF @@ROWCOUNT = 0
            BEGIN
                SET @error = 1; -- No se encontró el alumno en la tabla Alumnos
                THROW 51000, 'No se pudo eliminar el alumno de la tabla Alumnos.', @error;
            END
        END
        ELSE
        BEGIN
            SET @error = 2; -- No se encontraron registros relacionados en CursosAlumnos
            THROW 51001, 'No se encontraron registros relacionados en la tabla CursosAlumnos.', @error;
        END
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ---TRANSACCIONES ACTIVAS EN LA SESIÓN ACTUAL--
            ROLLBACK TRANSACTION;
        -- Lanzar el error original
        THROW;
    END CATCH;
END;
GO
BEGIN TRY
    EXEC sp_eliminarAlumnos @idAlumno = 10; -- ID del alumno a eliminar
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE(); -- Enviar mensaje de error en caso de errores
END CATCH;
GO

---- TABLAS PARA COMPROBAR LA ELIMINACIÓN DEL ALUMNO ---
select *from Alumnos 
select *from CursosAlumnos
GO

/* 10. Crear el trigger Trigger_EliminarAlumnos el cual se debe ejecutar cuando se elimina un registro de 
la tabla de Alumnos. Este trigger deberá insertar un registro en la Tabla AlumnosBaja del alumno eliminado. */

CREATE OR ALTER TRIGGER Trigger_EliminarAlumnos 
ON Alumnos 
AFTER DELETE 
AS 
BEGIN
    SET NOCOUNT ON; -- Evitar mensajes de filas afectadas
    -- Insertar los registros eliminados en la tabla AlumnosBaja
    INSERT INTO AlumnosBaja (nombre, primerApellido, segundoApellido, FechaBaja)
    SELECT nombre, primerApellido, segundoApellido, GETDATE()
    FROM DELETED;
END;
GO

DELETE FROM ALUMNOS WHERE nombre='Jonathan' ---HACIENDO LA PRUEBA PARA ELIMINAR UN REGISTRO Y SE EJECUTE EL TRIGGER---
SELECT * FROM alumnos 
SELECT * FROM AlumnosBaja

/* 11. Obtener un respaldo de su base de datos InstitutoTich */

USE InstitutoTich;
GO
BACKUP DATABASE InstitutoTich
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\InstitutoTich.bak' 
WITH NOFORMAT, MEDIANAME = 'SQLServerBackups', Name = 'RespaldoInstitutoTich';
GO

/* 12. Crear una base de datos PruebasTich con el respaldo de la base de datos InstitutoTich. */

RESTORE DATABASE PruebasTich ---NUEVO NOMBRE DE LA BASE DE DATOS A CREAR PARTIENDO DEL RESPALDO "INSTITUTO TICH" ---
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\InstitutoTich.bak'
---AQUÍ VA EL ARCHIVO TIPO D (DATA O DATOS) EXTENSIÓN .MDF---
WITH MOVE 'InstitutoTich' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PruebasTich.mdf',
---AQUÍ VA EL ARCHIVO TIPO L (LOG O LÓGICO) EXTENSIÓN .LDF---
MOVE 'InstitutoTich_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PruebasTich.ldf';

/*OBTIENE LOS NOMBRES DE LOS ARCHIVOS FÍSICOS (LOG Y DATOS) QUE ESTÁN EN EL ARCHIVO DE RESPALDO .BAK
EN ESTE CASO, DE LA BASE DE DATOS "INSTITUTOTICH" */

RESTORE FILELISTONLY 
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\InstitutoTich.bak';

/*13. Sobre la base de datos PruebasTich crear el store Procedure spEliminaAlumnosCurso el cual deberá eliminar los alumnos 
que se encuentren en un determinado curso por lo que recibirá como parámetro el nombre del curso. */

USE PruebasTich;
GO

CREATE OR ALTER PROCEDURE sp_EliminaAlumnosCurso
    @nombreCurso NVARCHAR(100)
AS
BEGIN
    -- Activamos manejo de errores
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- 1. Obtener el ID del curso que coincide con el nombre proporcionado
        DECLARE @idCurso INT;
        SELECT @idCurso = CatCursos.id
        FROM CatCursos
        WHERE CatCursos.nombre = @nombreCurso;
        
        -- Verificar si el curso existe
        IF @idCurso IS NULL
        BEGIN
            RAISERROR('El curso no existe', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- 2. Eliminar los alumnos relacionados a ese curso en la tabla AlumnosCursos
        DELETE FROM CursosAlumnos 
        WHERE CursosAlumnos.idCurso = @idCurso;
    
        -- Confirmamos la transacción
        COMMIT TRANSACTION;
        
        PRINT 'Alumnos eliminados correctamente del curso.';
    END TRY

    -- Manejamos posibles errores
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();
        
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
EXECUTE sp_EliminaAlumnosCurso 'ASP .NET C#';
GO

----TABLAS PARA CORROBORAR ---
SELECT * FROM Alumnos
SELECT * FROM CursosAlumnos
SELECT * FROM CATCURSOS

SELECT * FROM CURSOS


/* 14. Obtener los scripts de la base de datos InstitutoTich */


/* 15.Obtener el script de la spEliminaAlumnosCurso */

sp_helptext 'dbo.sp_EliminaAlumnosCurso';
