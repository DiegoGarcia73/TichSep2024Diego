/* TEMA: SQL
SUBTEMA: FUNCIONES ESCALARES */

----- 1. Crear una funci�n Suma que reciba dos n�meros enteros y regrese la suma de ambos n�meros ------

CREATE FUNCTION dbo.Suma
(
 @num1 INT, @num2 INT
)
RETURNS INT
  AS
	BEGIN
		RETURN @num1 + @num2;
	END
GO

SELECT dbo.Suma(10,20) AS RESULTADO;
PRINT dbo.Suma(10,20) 
GO
----- 2. Crear la funci�n GetGenero la cual reciba como par�metros el curp y regrese el g�nero al que pertenece ------

CREATE OR ALTER FUNCTION dbo.GetGenero
(
@curp VARCHAR(50)
)
RETURNS VARCHAR(50)
  AS
	BEGIN
		RETURN IIF ((SUBSTRING((@curp),11,1)='M'),'MUJER','HOMBRE')
	END
GO
SELECT dbo.GetGenero ('LOCL970715HGTPRS04') AS GENERO 
GO

/* 3. Crear la funci�n GetFechaNacimiento la cual reciba como par�metros el curp y regrese la fecha de nacimiento. 
La fecha de nacimiento deber� completarse a 4 d�gitos, debi�ndose determinar si es a�o dos mil o a�o mil novecientos */

CREATE OR ALTER FUNCTION dbo.GetFechaNacimiento
(
@curp VARCHAR(50)
)
RETURNS VARCHAR(50)
  AS
	BEGIN
		RETURN CONVERT (DATE,(SUBSTRING((@curp),5,6)))
	END
GO
SELECT dbo.GetFechaNacimiento('LOCL970715HGTPRS04') AS 'FECHA DE NACIMIENTO' 
GO
--- 4. Crear la funci�n GetidEstado la cual reciba como par�metros el curp y regrese el Id Estado con base en la siguiente tabla---

CREATE OR ALTER FUNCTION dbo.GetIdEstado
(
@curp VARCHAR(50)
)
RETURNS VARCHAR(50)
  AS
	BEGIN
		RETURN IIF ((SUBSTRING((@curp),12,2)='GT'),'2','EL CURP Y EL ESTADO NO COINCIDEN')
	END
GO
SELECT dbo.GetIdEstado('LOCL970715HGTPRS04') AS 'ESTADO'
GO

CREATE OR ALTER FUNCTION dbo.GetIdEstado 
(
@curp VARCHAR(18)
)
RETURNS INT
AS
BEGIN
    DECLARE @IdEstado INT;

    DECLARE @Estado CHAR(5)
    SET @Estado = SUBSTRING(@curp, 12, 2)

    SET @IdEstado = CASE 
        WHEN @Estado = 'AS' THEN 1   -- Aguascalientes
        WHEN @Estado = 'BC' THEN 2   -- Baja California
        WHEN @Estado = 'BS' THEN 3   -- Baja California Sur
        WHEN @Estado = 'CC' THEN 4   -- Campeche
        WHEN @Estado = 'CL' THEN 5   -- Coahuila
        WHEN @Estado = 'CM' THEN 6   -- Colima
        WHEN @Estado = 'CS' THEN 7   -- Chiapas
        WHEN @Estado = 'CH' THEN 8   -- Chihuahua
        WHEN @Estado = 'DF' THEN 9   -- Ciudad de M�xico
        WHEN @Estado = 'DG' THEN 10  -- Durango
        WHEN @Estado = 'GT' THEN 11  -- Guanajuato
        WHEN @Estado = 'GR' THEN 12  -- Guerrero
        WHEN @Estado = 'HG' THEN 13  -- Hidalgo
        WHEN @Estado = 'JC' THEN 14  -- Jalisco
        WHEN @Estado = 'MC' THEN 15  -- Estado de M�xico
        WHEN @Estado = 'MN' THEN 16  -- Michoac�n
        WHEN @Estado = 'MS' THEN 17  -- Morelos
        WHEN @Estado = 'NT' THEN 18  -- Nayarit
        WHEN @Estado = 'NL' THEN 19  -- Nuevo Le�n
        WHEN @Estado = 'OC' THEN 20  -- Oaxaca
        WHEN @Estado = 'PL' THEN 21  -- Puebla
        WHEN @Estado = 'QT' THEN 22  -- Quer�taro
        WHEN @Estado = 'QR' THEN 23  -- Quintana Roo
        WHEN @Estado = 'SP' THEN 24  -- San Luis Potos�
        WHEN @Estado = 'SL' THEN 25  -- Sinaloa
        WHEN @Estado = 'SR' THEN 26  -- Sonora
        WHEN @Estado = 'TC' THEN 27  -- Tabasco
        WHEN @Estado = 'TS' THEN 28  -- Tamaulipas
        WHEN @Estado = 'TL' THEN 29  -- Tlaxcala
        WHEN @Estado = 'VZ' THEN 30  -- Veracruz
        WHEN @Estado = 'YN' THEN 31  -- Yucat�n
        WHEN @Estado = 'ZS' THEN 32  -- Zacatecas
        ELSE 0						 -- Estado no encontrado o extranjero
    END
    RETURN @IdEstado;
END
GO
SELECT dbo.GetIdEstado('LOCL970715HGTPRS04') AS IdEstado;
GO
/*.5.- Realizar una funci�n llamada Calculadora que reciba como par�metros dos 
enteros y un operador (+,-,*,/,%) regresando el resultado de la operaci�n se 
deber� cuidar de no hacer divisi�n entre cero */

CREATE OR ALTER FUNCTION dbo.Calculadora
(
@num1 INT, @num2 INT, @operador VARCHAR(10)
)
RETURNS VARCHAR(50)
	AS
	BEGIN
	  RETURN
		CASE
		  WHEN @operador = '+' THEN @num1 + @num2
		  WHEN @operador = '-' THEN @num1 - @num2
		  WHEN @operador = '*' THEN @num1 * @num2
		  WHEN @operador = '/' THEN IIF (@num2<>0, @num1/@num2, 0)
		  WHEN @operador = '%' THEN @num1 % @num2
		  ELSE 0
	END
END
GO
SELECT dbo.Calculadora(56, 45, '+') AS Resultado 
GO
/* 6. Realizar una funci�n llamada GetHonorarios que calcule el importe a pagar a un 
determinado instructor y curso, por lo que la funci�n recibir� como par�metro el id 
del instructor y el id del curso. */

CREATE OR ALTER FUNCTION dbo.GetHonorarios
(
@idInstructor INT, @idCurso INT
)
RETURNS DECIMAL(9,2)
   AS
	BEGIN
		DECLARE @cuotaPorHora DECIMAL(9,2);
		DECLARE @horasCurso INT;
		DECLARE @importe DECIMAL(9,2);

		SELECT @cuotaPorHora = cuotaHora
		FROM Instructores
		WHERE id = @idInstructor;
 
		IF @cuotaPorHora IS NULL
			BEGIN
				RETURN 0;
			END
    SELECT @horasCurso = horas FROM CatCursos WHERE id = @idCurso;
    SET @importe = @cuotaPorHora * @horasCurso ;

    RETURN @importe;
	END	
GO
SELECT dbo.GetHonorarios(1, 2)  AS 'Honorarios'; 
GO 

SELECT * FROM Instructores
SELECT * FROM CursosInstructores

/* 7. Crear la funci�n GetEdad la cual reciba como par�metros la fecha de nacimiento y 
la fecha a la que se requiere realizar el c�lculo de la edad. Los a�os deber�n ser 
cumplidos, considerando mes y d�a */
GO

CREATE OR ALTER FUNCTION dbo.GetEdad
(
@FechaDeNacimiento DATE, @fechaActual DATE
)

  RETURNS INT 
  AS 
   BEGIN   
   	   RETURN CASE
                WHEN MONTH(@fechaActual) > MONTH(@FechaDeNacimiento)               
                THEN 
				 DATEDIFF(YEAR, @FechaDeNacimiento,@fechaActual) 
               ELSE DATEDIFF(YEAR, @FechaDeNacimiento,@fechaActual) - 1
             END
   END
   GO
SELECT dbo.GetEdad('1994-02-06','2024-09-26') AS 'Edad' 
GO

/* 8. Crear la funci�n Factorial la cual reciba como par�metros un n�mero entero y regrese como resultado el factorial. */

CREATE OR ALTER FUNCTION dbo.Factorial
(
@numero INT
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @resultado BIGINT;
    DECLARE @i INT;

    SET @resultado = 1;
    SET @i = 1;

    WHILE @i <= @numero
    BEGIN
        SET @resultado = @resultado * @i;
        SET @i = @i + 1;
    END;

    RETURN @resultado;
END;
GO
SELECT dbo.Factorial(5) AS 'Factorial'
GO
/* 9. Crear la funci�n ReembolsoQuincenal la cual reciba como par�metros un SueldoMensual y regrese como resultado 
el Importe de Reembolso quincenal, considerando que el importe total a reembolsar es igual a dos meses y medio 
de sueldo, y el periodo de reembolso es de 6 meses. */

CREATE OR ALTER FUNCTION dbo.ReembolsoQuincenal
(
@sueldoMensual INT
)
	RETURNS INT
	  AS
	   BEGIN
		 RETURN (@sueldoMensual*2.5)/12 --- Sueldo mensual POR 2 meses y medio de sueldo ENTRE 12 QUINCENAS ---
	   END
GO
SELECT dbo.ReembolsoQuincenal(60000) AS 'Reembolso Quincenal'
GO

/* 10.Realizar una funci�n que calcule el impuesto que debe pagar un instructor para un determinado curso. 
De tal manera que la funci�n recibir� id de un instructor y el id del curso correspondiente.
El c�lculo del impuesto se realiza de la siguiente forma:
Determinar el porcentaje que aplicar� dependiendo del estado de nacimiento
Chiapas = 5 %
Sonora = 10 %
Veracruz = 7 %
El resto del pa�s 8 %
El impuesto se obtendr� aplicando el porcentaje al total de la cuota por hora por la cantidad de horas del curso
El Estado de Origen se obtendr� de la posici�n 12 y 13 del curp de acuerdo con la siguiente tabla */

CREATE OR ALTER FUNCTION dbo.impuestoInstructor
(
@idInstructor INT, @idCurso INT
)
	RETURNS DECIMAL (8,2)
	 AS
	  BEGIN
		DECLARE @cuotaPorHora DECIMAL (8,2);
		DECLARE @horasPorCurso INT;
		DECLARE @totalPagar DECIMAL (8,2);
		DECLARE @estadoNacimiento VARCHAR (5);
		DECLARE @porcentaje DECIMAL (8,2);
		DECLARE @impuesto DECIMAL (8,2);

		/*AQU� SE EST� SELECCIONANDO EL CAMPO DE LA TABLA INSTRUCTORES Y SE LE ASIGNA LA IGUALDAD A @CUOTAPORHORA DE
		LO QUE CONTENGA EL CAMPO CUOTAPORHORA */
		SELECT @cuotaPorHora = cuotaHora
		FROM Instructores
		WHERE @idInstructor = Instructores.id

		IF @cuotaPorHora IS NULL
		BEGIN

		RETURN 0;

		END
		
		/*AQU� SE EST� SELECCIONANDO EL CAMPO DE LA TABLA CATCURSOS Y SE LE ASIGNA LA IGUALDAD A @HORASPORCURSO DE
		LO QUE CONTENGA EL CAMPO HORAS */
		SELECT @horasPorCurso = horas
		FROM CatCursos
		WHERE CatCursos.id = @idCurso

		IF @horasPorCurso IS NULL
		BEGIN

		RETURN 0;

		END

		/* SE EXTRAE DEL CURP LOS 2 DIGITOS QUE CORRESPONDEN AL ESTADO DE NACIMIENTO */
		SELECT @estadoNacimiento = SUBSTRING(curp, 12, 2)
		FROM Instructores
		WHERE @idInstructor = Instructores.id

		/* AQU� SE MUESTRAN LOS PORCENTAJES DE CADA ESTADO Y CON BASE A ESTE �LTIMO SE HAR� EL COBRO */
		SET @porcentaje = CASE @estadoNacimiento
						  WHEN 'CS' THEN 0.05 --EL ESTADO DE CHIAPAS--
						  WHEN 'SR' THEN .10 ---EL ESTADO DE SONORA--
						  WHEN 'VZ' THEN 0.07 --EL ESTADO DE VERACRUZ --
						  ELSE 0.08			  --RESTO DEL PA�S--
		END

		SET @totalPagar = @cuotaPorHora * @horasPorCurso;
		SET @impuesto = @totalPagar * @porcentaje;
		RETURN @impuesto;
	  END
GO
SELECT dbo.impuestoInstructor(2,1) AS 'Impuesto'
GO


/* 11. Haciendo uso de la funci�n GetEdad, obtener una relaci�n de alumnos con la edad a la fecha de inscripci�n, 
y la edad actual. De aquellos alumnos que actualmente tengan m�s de 25 a�os. */

SELECT Alu.id, Alu.nombre, dbo.GetEdad(Alu.fechanacimiento, CurAlu.fechaInscripcion) AS edadAlInscribirse,
dbo.GetEdad(Alu.fechanacimiento, GETDATE()) AS edadActual
FROM Alumnos Alu
	INNER JOIN CursosAlumnos CurAlu
	ON Alu.id = CurAlu.idAlumno

WHERE dbo.GetEdad(Alu.fechanacimiento, GETDATE()) > 25;

	SELECT * FROM Alumnos
	SELECT * FROM CursosAlumnos

/* 12. Realizar una funci�n que determine el porcentaje a descontar en los reembolsos, con base a la cantidad de meses 
en que se realizar� el reembolso y el sueldo mensual logrado, de acuerdo al siguiente procedimiento:

a. El porcentaje de descuento ser� en funci�n de la cantidad de mensualidades en que se realizar� el reembolso.
b. La cantidad m�ximo de meses para realizar el reembolso es de 6 meses
c. El porcentaje m�ximo de descuento a otorgar ser� el que resulte el sueldo mensual entre 1,000
i. Ejemplo : Si el sueldo mensual es de 20,000 pesos el descuento ser� del 20 % 
d. El porcentaje m�ximo de descuento ser� otorgado si el reembolso total se realiza cuando le corresponde 
efectuar la primera parcialidad de dicho reembolso
e. Los porcentaje de descuento a otorgar disminuir� inversamente proporcional a la cantidad de meses en que se 
cubrir� totalmente el reembolso, de tal forma que si el reembolso se cubre en la mitad del periodo m�ximo 
(3 meses = 6 meses /2), el porcentaje a descontar ser� la mitad del porcentaje m�ximo (en el ejemplo 10% = 20% / 2), 
y si el reembolso se realiza en el m�ximo del plazo, el descuento a otorgar ser� cero. */
GO
CREATE OR ALTER FUNCTION dbo.reembolso
(
@sueldoMensual DECIMAL (10,2),
@cantidadDeMeses DECIMAL (10,2)
)
RETURNS DECIMAL (10, 2)
AS 
BEGIN
	--DECLARE @porcentajeDescuento INT  = @sueldoMensual / 1000;
    DECLARE @descuento DECIMAL (10,2);
    
    /*SET @descuento = CASE 
        WHEN @cantidadDeMeses = 1 THEN @porcentajeDescuento
        WHEN @cantidadDeMeses = 2 THEN @porcentajeDescuento * .75
        WHEN @cantidadDeMeses = 3 THEN @porcentajeDescuento * .50
        WHEN @cantidadDeMeses = 4 THEN @porcentajeDescuento * .25
        ELSE 0 */
		SET @descuento = CASE 
        WHEN @cantidadDeMeses = 1 THEN @sueldoMensual / 1000
        WHEN @cantidadDeMeses = 2 THEN @sueldoMensual / 1333.3333333 
        WHEN @cantidadDeMeses = 3 THEN @sueldoMensual / 2000
        WHEN @cantidadDeMeses = 4 THEN @sueldoMensual / 4000
        ELSE 0
END;

    RETURN @descuento
	END
GO
  SELECT dbo.reembolso(20000,2) AS 'Porcentaje de descuento'
GO

/* 13. Hacer una funci�n que convierta a may�sculas la primera letra de cada palabra de una cadena de caracteres recibida. */
CREATE OR ALTER FUNCTION dbo.letraInicialMayuscula
(
@cadenaCaracteres VARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @inicio VARCHAR(50) = '';
    DECLARE @posicion INT = 1;
    DECLARE @longitud INT = LEN(@cadenaCaracteres);
    DECLARE @caracter VARCHAR(1);
    DECLARE @caracterAnterior VARCHAR(1) = ' ';

    WHILE @posicion <= @longitud
    BEGIN
		---- ASIGNACI�N DE VALOR A @CARACTER DE LA SUBCADENA EXTRA�DA DE @CADENADECARACTERES, DE LA POSICI�N 1 HASTA LA 1 ---
        SET @caracter = SUBSTRING(@cadenaCaracteres, @posicion, 1);

		/* CONDICIONAL QUE PERMITE EVALUAR SI HAY UN ESPACIO EN BLANCO Y VERIFICA SI EL CARACTER SE ENCUENTRA ENTRE LA 'a' y
		la 'z' PARA ASIGNARSE A LA VARIABLE CARACTER QUE DAR� COMO RESULTADO LA CONVERSI�N DE LA PRIMERA LETRA A MAYUSCULA */
        IF @caracterAnterior = ' ' AND @caracter BETWEEN 'a' AND 'z'
            SET @caracter = UPPER(@caracter);
		
		/* ASIGNACI�N DE VALORES A @SALIDA, @CARACTERANTERIOR Y @POSICION: A @INICIO SE LE INCREMENTA UN CARACTER,
		@CARACTER ANTERIOR SER� IGUAL AL @CARACTER ACTUAL Y A @POSICION SE LE INCREMENTA */
        SET @inicio = @inicio + @caracter;
        SET @caracterAnterior = @caracter;
        SET @posicion = @posicion + 1;
    END;
    RETURN @inicio;
END;
GO
SELECT dbo.letraInicialMayuscula('estoy en curso de sql server otro curso C#') AS Resultado
GO







/*CREATE OR ALTER FUNCTION dbo.letraInicialMayuscula
(
@palabras VARCHAR(50)
)
	RETURNS VARCHAR(50)
	  AS
	   BEGIN
	     RETURN UPPER(@palabras)
	   END
GO
SELECT dbo.letraInicialMayuscula('hola, juan') AS Resultado
GO */

-----------------------------------------------------