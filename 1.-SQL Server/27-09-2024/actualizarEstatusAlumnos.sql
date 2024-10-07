--PROCEDIMIENTO ALMACENADO QUE ACTUALIZA EL ESTATUS DE LOS ALUMNOS ---

CREATE OR ALTER PROCEDURE actualizarEstatusAlumnos(
@id int,
@clave nvarchar(50),
@nombre nvarchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;

	---Actualizar el estatus
	  UPDATE EstatusAlumnos
	  SET clave = @clave, nombre = @nombre
	  WHERE id = @id;
END;

SELECT * FROM EstatusAlumnos;