USE [master]
GO
/****** Object:  Database [InstitutoTich]    Script Date: 28/09/2024 04:20:08 p. m. ******/
CREATE DATABASE [InstitutoTich]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InstitutoTich', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InstitutoTich.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InstitutoTich_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InstitutoTich_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InstitutoTich] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InstitutoTich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InstitutoTich] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InstitutoTich] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InstitutoTich] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InstitutoTich] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InstitutoTich] SET ARITHABORT OFF 
GO
ALTER DATABASE [InstitutoTich] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InstitutoTich] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InstitutoTich] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InstitutoTich] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InstitutoTich] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InstitutoTich] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InstitutoTich] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InstitutoTich] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InstitutoTich] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InstitutoTich] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InstitutoTich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InstitutoTich] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InstitutoTich] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InstitutoTich] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InstitutoTich] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InstitutoTich] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InstitutoTich] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InstitutoTich] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InstitutoTich] SET  MULTI_USER 
GO
ALTER DATABASE [InstitutoTich] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InstitutoTich] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InstitutoTich] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InstitutoTich] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InstitutoTich] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InstitutoTich] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InstitutoTich] SET QUERY_STORE = ON
GO
ALTER DATABASE [InstitutoTich] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InstitutoTich]
GO
/****** Object:  UserDefinedFunction [dbo].[Calculadora]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[Calculadora]
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
/****** Object:  UserDefinedFunction [dbo].[Factorial]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[Factorial]
(
@num INT
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @result BIGINT;
    DECLARE @i INT;

    SET @result = 1;
    SET @i = 1;

    WHILE @i <= @num
    BEGIN
        SET @result = @result * @i;
        SET @i = @i + 1;
    END;

    RETURN @result;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[GetEdad]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[GetEdad]
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
/****** Object:  UserDefinedFunction [dbo].[GetFechaNacimiento]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 3. Crear la función GetFechaNacimiento la cual reciba como parámetros el curp y regrese la fecha de nacimiento. 
La fecha de nacimiento deberá completarse a 4 dígitos, debiéndose determinar si es año dos mil o año mil novecientos */

CREATE   FUNCTION [dbo].[GetFechaNacimiento]
(
@curp VARCHAR(50)
)
RETURNS VARCHAR(50)
  AS
	BEGIN
		RETURN CONVERT (DATE,(SUBSTRING((@curp),5,6)))
	END
GO
/****** Object:  UserDefinedFunction [dbo].[GetGenero]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- 2. Crear la función GetGenero la cual reciba como parámetros el curp y regrese el género al que pertenece ------

CREATE   FUNCTION [dbo].[GetGenero]
(
@curp VARCHAR(50)
)
RETURNS VARCHAR(50)
  AS
	BEGIN
		RETURN IIF ((SUBSTRING((@curp),11,1)='M'),'MUJER','HOMBRE')
	END
GO
/****** Object:  UserDefinedFunction [dbo].[GetHonorarios]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[GetHonorarios]
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
/****** Object:  UserDefinedFunction [dbo].[GetIdEstado]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[GetIdEstado] 
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
        WHEN @Estado = 'DF' THEN 9   -- Ciudad de México
        WHEN @Estado = 'DG' THEN 10  -- Durango
        WHEN @Estado = 'GT' THEN 11  -- Guanajuato
        WHEN @Estado = 'GR' THEN 12  -- Guerrero
        WHEN @Estado = 'HG' THEN 13  -- Hidalgo
        WHEN @Estado = 'JC' THEN 14  -- Jalisco
        WHEN @Estado = 'MC' THEN 15  -- Estado de México
        WHEN @Estado = 'MN' THEN 16  -- Michoacán
        WHEN @Estado = 'MS' THEN 17  -- Morelos
        WHEN @Estado = 'NT' THEN 18  -- Nayarit
        WHEN @Estado = 'NL' THEN 19  -- Nuevo León
        WHEN @Estado = 'OC' THEN 20  -- Oaxaca
        WHEN @Estado = 'PL' THEN 21  -- Puebla
        WHEN @Estado = 'QT' THEN 22  -- Querétaro
        WHEN @Estado = 'QR' THEN 23  -- Quintana Roo
        WHEN @Estado = 'SP' THEN 24  -- San Luis Potosí
        WHEN @Estado = 'SL' THEN 25  -- Sinaloa
        WHEN @Estado = 'SR' THEN 26  -- Sonora
        WHEN @Estado = 'TC' THEN 27  -- Tabasco
        WHEN @Estado = 'TS' THEN 28  -- Tamaulipas
        WHEN @Estado = 'TL' THEN 29  -- Tlaxcala
        WHEN @Estado = 'VZ' THEN 30  -- Veracruz
        WHEN @Estado = 'YN' THEN 31  -- Yucatán
        WHEN @Estado = 'ZS' THEN 32  -- Zacatecas
        ELSE 0						 -- Estado no encontrado o extranjero
    END
    RETURN @IdEstado;
END
GO
/****** Object:  UserDefinedFunction [dbo].[impuestoInstructor]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[impuestoInstructor]
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

		/*AQUÍ SE ESTÁ SELECCIONANDO EL CAMPO DE LA TABLA INSTRUCTORES Y SE LE ASIGNA LA IGUALDAD A @CUOTAPORHORA DE
		LO QUE CONTENGA EL CAMPO CUOTAPORHORA */
		SELECT @cuotaPorHora = cuotaHora
		FROM Instructores
		WHERE @idInstructor = Instructores.id

		IF @cuotaPorHora IS NULL
		BEGIN

		RETURN 0;

		END
		
		/*AQUÍ SE ESTÁ SELECCIONANDO EL CAMPO DE LA TABLA CATCURSOS Y SE LE ASIGNA LA IGUALDAD A @HORASPORCURSO DE
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

		/* AQUÍ SE MUESTRAN LOS PORCENTAJES DE CADA ESTADO Y CON BASE A ESTE ÚLTIMO SE HARÁ EL COBRO */
		SET @porcentaje = CASE @estadoNacimiento
						  WHEN 'CS' THEN 0.05 --EL ESTADO DE CHIAPAS--
						  WHEN 'SR' THEN .10 ---EL ESTADO DE SONORA--
						  WHEN 'VZ' THEN 0.07 --EL ESTADO DE VERACRUZ --
						  ELSE 0.08			  --RESTO DEL PAÍS--
		END

		SET @totalPagar = @cuotaPorHora * @horasPorCurso;
		SET @impuesto = @totalPagar * @porcentaje;
		RETURN @impuesto;
	  END
GO
/****** Object:  UserDefinedFunction [dbo].[letraCapital]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[letraCapital]

(
@input VARCHAR(50)
)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @output VARCHAR(50) = '';
    DECLARE @position INT = 1;
    DECLARE @length INT = LEN(@input);
    DECLARE @char VARCHAR(1);
    DECLARE @prevChar VARCHAR(1) = ' ';

    WHILE @position <= @length
    BEGIN
        SET @char = SUBSTRING(@input, @position, 1);

        IF @prevChar = ' ' AND @char BETWEEN 'a' AND 'z'
            SET @char = UPPER(@char);

        SET @output = @output + @char;
        SET @prevChar = @char;
        SET @position = @position + 1;
    END;

    RETURN @output;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[letraInicialMayuscula]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[letraInicialMayuscula]
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
		---- ASIGNACIÓN DE VALOR A @CARACTER DE LA SUBCADENA EXTRAÍDA DE @CADENADECARACTERES, DE LA POSICIÓN 1 HASTA LA 1 ---
        SET @caracter = SUBSTRING(@cadenaCaracteres, @posicion, 1);

		---- CONDICIONAL QUE PERMITE EVALUAR SI HAY UN ESPACIO EN BLANCO
        IF @caracterAnterior = ' ' AND @caracter BETWEEN 'a' AND 'z'
            SET @caracter = UPPER(@caracter);
		
		/* ASIGNACIÓN DE VALORES A @SALIDA, @CARACTERANTERIOR Y @POSICION: A @INICIO SE LE INCREMENTA UN CARACTER,
		@CARACTER ANTERIOR SERÁ IGUAL AL @CARACTER ACTUAL Y A @POSICION SE LE INCREMENTA */
        SET @inicio = @inicio + @caracter;
        SET @caracterAnterior = @caracter;
        SET @posicion = @posicion + 1;
    END;
    RETURN @inicio;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[letrasMayuscula]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[letrasMayuscula]
(
@palabras VARCHAR(50)
)
	RETURNS VARCHAR(50)
	  AS
	   BEGIN
	     RETURN UPPER(@palabras)
	   END

GO
/****** Object:  UserDefinedFunction [dbo].[PrestamoInstructor]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[PrestamoInstructor]
(
@idInstructor INT --SE DECLARA LOS PARAMETROS DE TIPO ENTERO LLAMADA IDINSTRUCTOR ---
)
RETURNS @amortizacion TABLE
(
    mes INT,
    saldoAnterior DECIMAL(18, 2), -- SE DECLARA UNA VARIABLE TIPO DECIMAL CON 18 CARACTERES MÁS 2 DESPUÉS DEL PUNTO DECIMAL--
    intereses DECIMAL(18, 2),
    pago DECIMAL(18, 2),
    saldoNuevo DECIMAL(18, 2)
)
AS
BEGIN
    DECLARE @cuotaPorHora DECIMAL(18, 2);
    DECLARE @importePrestamo DECIMAL(18, 2);
    DECLARE @porcentajeInteres DECIMAL(5, 2);
    DECLARE @pago DECIMAL(18, 2);
    DECLARE @saldoAnterior DECIMAL(18, 2);
    DECLARE @intereses DECIMAL(18, 2);
    DECLARE @saldoNuevo DECIMAL(18, 2);
    DECLARE @mes INT = 1;

    -- SE OBTIENE LA CUOTA POR HORA DEL INSTRUCTOR
    SELECT @cuotaPorHora = Instructores.cuotaHora
    FROM Instructores
    WHERE Instructores.id = @idInstructor;

    -- CALCULA EL IMPORTE DEL PRÉSTAMO, ES DECIR, 200 VECES LA CUOTA POR HORA
    SET @importePrestamo = @cuotaPorHora * 200;

    -- SE DETERMINA LA TASA DE INTERÉS ANUAL
    SET @porcentajeInteres = CASE 
                                WHEN @cuotaPorHora > 200 THEN 0.24
                                ELSE 0.18
                             END;

    -- CALCULAR EL PAGO MENSUAL (25 HORAS DE TRABAJO)
    SET @pago = @cuotaPorHora * 25;

    -- SE ESTABLECE EL SALDO INICIAL
    SET @saldoAnterior = @importePrestamo;

    -- ESTE BUCLE GENERA LA TABLA DE AMORTIZACIÓN DE MES A MES
    WHILE @saldoAnterior > 0 AND @mes <= 12 -- 12 meses
    BEGIN
        -- SE CALCULAN LOS INTERESES
        SET @intereses = ROUND(@saldoAnterior * (@porcentajeInteres / 12), 2);

        -- SE CALCULA EL SALDO NUEVO DESPUÉS DE HABER HECHO EL PAGO Y APLICAR LOS INTERESES
        SET @saldoNuevo = @saldoAnterior + @intereses - @pago;

        -- SI EL SALDO NUEVO ES MENOR QUE CERO, SE AJUSTA A CERO PARA EL ÚLTIMO PAGO
        IF @saldoNuevo < 0 
        BEGIN
            SET @saldoNuevo = 0;
            SET @pago = @saldoAnterior + @intereses; -- Último pago es el saldo + intereses
        END;

        -- SE INSERTAN LOS VALORES A LA TABLA DE AMORTIZACIÓN
        INSERT INTO @amortizacion (mes, saldoAnterior, intereses, pago, saldoNuevo)
        VALUES (@mes, @saldoAnterior, @intereses, @pago, @saldoNuevo);

        -- SE ACTUALIZA EL SALDO ANTERIOR PARA EL SIGUIENTE MES
        SET @saldoAnterior = @saldoNuevo;

        -- SE INCREMENTA EL MES
        SET @mes = @mes + 1;
    END;

    RETURN;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[reembolso]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[reembolso]
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
/****** Object:  UserDefinedFunction [dbo].[ReembolsoQuincenal]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[ReembolsoQuincenal]
(
@sueldoMensual INT
)
	RETURNS INT
	  AS
	   BEGIN
		 RETURN (@sueldoMensual*2.5)/12 --- Sueldo mensual POR 2 meses y medio de sueldo ENTRE 6 meses ---
	   END
GO
/****** Object:  UserDefinedFunction [dbo].[reembolsosParticipante]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[reembolsosParticipante]
(
@sueldoMensual DECIMAL(18, 2) 
)
RETURNS @Amortizacion TABLE
(
    quincena INT,
    saldoAnterior DECIMAL(18, 2),
    pago DECIMAL(18, 2),
    saldoNuevo DECIMAL(18, 2)
)
AS
BEGIN
    DECLARE @quincena INT = 1;
    DECLARE @saldoAnterior DECIMAL(18, 2) = @sueldoMensual * 2.5;
    DECLARE @pago DECIMAL(18, 2);
    DECLARE @saldoNuevo DECIMAL(18, 2);

    SET @pago = ROUND((@sueldoMensual * 2.5) / 12, 2);


    WHILE @quincena <= 12
    BEGIN
		SET @saldoNuevo = @saldoAnterior - @pago;
        INSERT INTO @Amortizacion (quincena, saldoAnterior, pago, saldoNuevo)
        VALUES (@quincena, @saldoAnterior, @pago, @saldoNuevo);
		SET @saldoAnterior = @saldoNuevo; 
		SET @quincena = @quincena + 1;
    END;

    RETURN;

END;

GO
/****** Object:  UserDefinedFunction [dbo].[Suma]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Suma]
(
 @num1 INT, @num2 INT
)
RETURNS INT
  AS
	BEGIN
		RETURN @num1 + @num2;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[TablaAmortizacion]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 1. */


CREATE FUNCTION [dbo].[TablaAmortizacion] (
    @SueldoMensual DECIMAL(10, 2)
)
RETURNS @Amortizacion TABLE (
    Quincena INT,
    PagoQuincenal DECIMAL(10, 2),
    MontoRestante DECIMAL(10, 2)
)
AS
BEGIN
    DECLARE @TotalAPagar DECIMAL(10, 2)
    DECLARE @PagoQuincenal DECIMAL(10, 2)
    DECLARE @MontoRestante DECIMAL(10, 2)
    DECLARE @Quincena INT

    -- Calculamos el total a pagar (sueldo mensual * 2.5)
    SET @TotalAPagar = @SueldoMensual * 2.5

    -- Calculamos el pago quincenal
    SET @PagoQuincenal = @TotalAPagar / 12

    -- Inicializamos el monto restante con el total a pagar
    SET @MontoRestante = @TotalAPagar

    -- Bucle para generar los pagos quincenales
    SET @Quincena = 1
    WHILE @Quincena <= 12
    BEGIN
        -- Insertamos el registro de la quincena actual
        INSERT INTO @Amortizacion (Quincena, PagoQuincenal, MontoRestante)
        VALUES (@Quincena, @PagoQuincenal, @MontoRestante)

        -- Actualizamos el monto restante después del pago quincenal
        SET @MontoRestante = @MontoRestante - @PagoQuincenal

        -- Incrementamos la quincena
        SET @Quincena = @Quincena + 1
    END

    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[TablaAmortizacionPrestamo]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[TablaAmortizacionPrestamo]
(
    @InstructorId INT  
)
RETURNS @TablaAmortizacion TABLE
(
    Mes INT,
    SaldoAnterior DECIMAL(18, 2),
    Intereses DECIMAL(18, 2),
    Pago DECIMAL(18, 2),
    SaldoNuevo DECIMAL(18, 2)
)
AS
BEGIN
    DECLARE @Mes INT = 1; 
    DECLARE @SaldoAnterior DECIMAL(18, 2);
    DECLARE @Intereses DECIMAL(18, 2);
    DECLARE @Pago DECIMAL(18, 2);
    DECLARE @SaldoNuevo DECIMAL(18, 2);
    DECLARE @MontoPrestamo DECIMAL(18, 2) = 0;
    DECLARE @TasaInteresAnual DECIMAL(18, 2) = 0;
    DECLARE @PagoMensual DECIMAL(18, 2) = 0;

  
    SELECT 
        @MontoPrestamo = 200 * CuotaHora,
        @TasaInteresAnual = CASE WHEN CuotaHora > 200 THEN 0.24 ELSE 0.18 END,
        @PagoMensual = 25 * CuotaHora,
        @SaldoAnterior = 200 * CuotaHora,
        @Intereses = ROUND(@SaldoAnterior * @TasaInteresAnual / 12, 2),
        @Pago =  25 * CuotaHora 
    FROM Instructores
    WHERE Id = @InstructorId;

    
    INSERT INTO @TablaAmortizacion (Mes, SaldoAnterior, Intereses, Pago, SaldoNuevo)
    VALUES (@Mes, @SaldoAnterior, @Intereses, @Pago, @MontoPrestamo);

    
    WHILE @Mes <9
    BEGIN

	 SET @Mes = @Mes + 1;
        
        SET @Intereses = ROUND(@SaldoAnterior * @TasaInteresAnual / 12, 2);

       
        SET @SaldoNuevo = ROUND(@SaldoAnterior + @Intereses - @PagoMensual, 2);

        INSERT INTO @TablaAmortizacion (Mes, SaldoAnterior, Intereses, Pago, SaldoNuevo)
        VALUES (@Mes, @SaldoAnterior, @Intereses, @PagoMensual, @SaldoNuevo);
	
        SET @SaldoAnterior = @SaldoNuevo;


       
    END;

	SET @Intereses = ROUND(@SaldoAnterior * @TasaInteresAnual / 12, 2);
SET @Pago = @SaldoAnterior + @Intereses;


INSERT INTO @TablaAmortizacion (Mes, SaldoAnterior, Intereses, Pago, SaldoNuevo)
VALUES (10, @SaldoAnterior, @Intereses, @Pago, 0); 

    
    RETURN;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[TablaAmortizacionPrestamoInstructor]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[TablaAmortizacionPrestamoInstructor] (
    @IdInstructor INT
)
RETURNS @Amortizacion TABLE (
    mes INT,
	saldoAnterior DECIMAL(10, 2),
	intereses DECIMAL(10, 2),
	pago DECIMAL(10, 2),
    saldoNuevo DECIMAL(10, 2)
)
AS
BEGIN
    DECLARE @CuotaPorHora DECIMAL(10, 2)
    DECLARE @ImportePrestamo DECIMAL(10, 2)
    DECLARE @TasaInteresAnual DECIMAL(5, 2)
    DECLARE @TasaInteresMensual DECIMAL(5, 4)
    DECLARE @pago DECIMAL(10, 2)
    DECLARE @saldoNuevo DECIMAL(10, 2)
    DECLARE @intereses DECIMAL(10, 2)
    DECLARE @saldoAnterior DECIMAL(10, 2)
    DECLARE @mes INT

    -- Obtener la cuota por hora del instructor
    SELECT @CuotaPorHora = Instructores.cuotaHora FROM Instructores WHERE Instructores.id = @IdInstructor

    -- Calcular el importe del préstamo (200 veces la cuota por hora)
    SET @ImportePrestamo = @CuotaPorHora * 200

    -- Determinar la tasa de interés anual
    IF @CuotaPorHora > 200
        SET @TasaInteresAnual = 0.24  -- 24% anual
    ELSE
        SET @TasaInteresAnual = 0.18  -- 18% anual

    -- Calcular la tasa de interés mensual
    SET @TasaInteresMensual = @TasaInteresAnual / 12

    -- El pago mensual es equivalente a 25 horas de trabajo
    SET @pago = @CuotaPorHora * 25

    -- Inicializar el saldo restante con el importe del préstamo
    SET @saldoNuevo = @ImportePrestamo

    -- Generar el plan de amortización para cada mes
    SET @Mes = 1
    WHILE @saldoNuevo > 0
    BEGIN
        -- Calcular el interés mensual sobre el saldo restante
        SET @intereses= @saldoNuevo * @TasaInteresMensual

        -- El capital mensual es el pago mensual menos el interés mensual
        SET @saldoAnterior = @pago - @intereses

        -- Si el capital mensual es mayor que el saldo restante, ajustarlo para que no sobrepase el saldo
        IF @saldoAnterior > @saldoNuevo
        BEGIN
            SET @saldoAnterior = @saldoNuevo
            SET @pago = @saldoAnterior + @intereses
        END

        -- Insertar el registro en la tabla de amortización
        INSERT INTO @Amortizacion (mes, saldoAnterior, intereses, pago, saldoNuevo)
        VALUES (@Mes, @pago, @intereses, @pago, @saldoNuevo)

        -- Actualizar el saldo restante
        SET @saldoNuevo = @saldoNuevo - @saldoAnterior

        -- Incrementar el mes
        SET @Mes = @Mes + 1
    END

    RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[TablaAmortizacionQuincenal]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[TablaAmortizacionQuincenal]
(
@sueldoMensual DECIMAL(18, 2) 
)
RETURNS @Amortizacion TABLE
(
    quincena INT,
    saldoAnterior DECIMAL(18, 2),
    pago DECIMAL(18, 2),
    saldoNuevo DECIMAL(18, 2)
)
AS
BEGIN
    DECLARE @quincena INT = 1;
    DECLARE @saldoAnterior DECIMAL(18, 2) = @sueldoMensual * 2.5;
    DECLARE @pago DECIMAL(18, 2);
    DECLARE @saldoNuevo DECIMAL(18, 2);

    SET @pago = ROUND((@sueldoMensual * 2.5) / 12, 2);


    WHILE @quincena <= 12
    BEGIN
		SET @saldoNuevo = @saldoAnterior - @pago;
        INSERT INTO @Amortizacion (quincena, saldoAnterior, pago, saldoNuevo)
        VALUES (@quincena, @saldoAnterior, @pago, @saldoNuevo);
		SET @saldoAnterior = @saldoNuevo; 
		SET @quincena = @quincena + 1;
    END;

    RETURN;

END;

GO
/****** Object:  UserDefinedFunction [dbo].[tablaPrestamoAmortizacion]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[tablaPrestamoAmortizacion]
(
@idInstructor INT
)
RETURNS @tablaPrestamoAmortizacion TABLE
(
mes INT,
saldoAnterior DECIMAL (8, 2),
intereses DECIMAL (8, 2),
pago DECIMAL (8, 2),
saldoNuevo DECIMAL (8, 2)
)
AS
BEGIN
	DECLARE @mes INT = 0;
	DECLARE @saldoAnterior DECIMAL (10, 2) = 0;
	DECLARE @intereses DECIMAL (10, 2) = 0;
	DECLARE @pago DECIMAL (10, 2) = 0;
	DECLARE @saldoNuevo DECIMAL (10, 2) = 0;
	DECLARE @montoPrestamo DECIMAL (10, 2) = 0;
	DECLARE @tasaInteresAnual DECIMAL (10, 2) = 0;
	DECLARE @pagoMensual DECIMAL (10, 2) = 0;
	DECLARE @sumaPago DECIMAL (10, 2) = 0;
	DECLARE @sumaSaldoIntereses DECIMAL (10, 2) = 0;

--- SE ADQUIERE LA INFORMACIÓN DEL PRÉSTAMO ---
SELECT @montoPrestamo = 200 * cuotaHora, 
@tasaInteresAnual = CASE WHEN cuotaHora > 200 THEN .24 ELSE .18 END,
@pagoMensual = 25 * cuotaHora
FROM Instructores
WHERE @idInstructor = Instructores.id;

--- CREAR LA TABLA DE AMORTIZACIÓN ---
INSERT INTO @tablaPrestamoAmortizacion (mes, saldoAnterior, intereses, pago, saldoNuevo)
VALUES (@mes, @saldoAnterior, @intereses, @pago, @montoPrestamo)

--- BUCLE WHILE QUE GENERA LOS MESES DE AMORTIZACIÓN ---
WHILE @mes < 12
	BEGIN
	  SET @mes = @mes + 1

	  --- CÁLCULO DE INTERESES ---
	  SET @intereses = ROUND(@saldoAnterior * @tasaInteresAnual / 12, 2);

	  --- SUMA DEL PAGO MENSUAL Y SUMA DEL SALDO CON INTERESES ---
	     SET @sumaPago = @pago + @pagoMensual;
        SET @sumaSaldoIntereses = @saldoAnterior + @intereses;

       --- EVALUAR EL PAGO MENSUAL ---
        IF @sumaPago < @sumaSaldoIntereses
            SET @pago = @pago * 25 ; --- PAGO DEL MONTO MENSUAL FIJO
        ELSE
            SET @pago = @sumaSaldoIntereses; -- PAGO DE LA SUMA DEL SALDO MÁS INTERESES

        -- CALCULA EL SALDO NUEVO
        SET @saldoNuevo = ROUND(@saldoAnterior + @intereses - @pago, 2);

        -- INSERTA EL RESULTADO EN LA TABLA DE AMORTIZACIÓN
        INSERT INTO @tablaPrestamoAmortizacion (mes, saldoAnterior, intereses, pago, saldoNuevo)
        VALUES (@mes, @saldoAnterior, @intereses, @pago, @saldoNuevo);

        -- ACTUALIZA EL SALDO ANTERIOR PARA LA SIGUIENTE ITERACIÓN
        SET @saldoAnterior = @saldoNuevo;
    END;
    -- RETORNA LA TABLA DE AMORTIZACIÓN
    RETURN;
END;
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstatusAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstatusAlumnos](
	[id] [smallint] NOT NULL,
	[Clave] [char](10) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EstatusAlumnos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NULL,
	[correo] [varchar](80) NOT NULL,
	[telefono] [nchar](10) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[curp] [char](18) NOT NULL,
	[sueldo] [decimal](9, 2) NULL,
	[idEstadoOrigen] [int] NOT NULL,
	[idEstatus] [smallint] NOT NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vAlumnos]
AS SELECT Alu.id AS id, Alu.nombre AS nombre, Alu.primerApellido AS 'primerApellido',
Alu.correo AS 'correo', Alu.telefono AS 'telefono', Alu.curp AS 'curp',
Est.nombre AS 'Estado', EstAlu.nombre AS 'Estatus'
FROM Alumnos Alu
	INNER JOIN Estados Est
	ON Alu.idEstadoOrigen = Est.id
	INNER JOIN EstatusAlumnos EstAlu
	ON Alu.idEstatus = EstAlu.id;
GO
/****** Object:  Table [dbo].[AlumnosBaja]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnosBaja](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NULL,
	[fechaBaja] [datetime] NOT NULL,
 CONSTRAINT [PK_AlumnosBaja] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatCursos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatCursos](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[clave] [varchar](15) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[horas] [tinyint] NOT NULL,
	[idPreRequisito] [smallint] NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_CatCursos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[idCatCurso] [smallint] NULL,
	[fechaInicio] [date] NULL,
	[fechaTermino] [date] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursosAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursosAlumnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCurso] [smallint] NOT NULL,
	[idAlumno] [int] NOT NULL,
	[fechaInscripcion] [date] NOT NULL,
	[fechaBaja] [date] NULL,
	[calificacion] [tinyint] NULL,
 CONSTRAINT [PK_CursosAlumnos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursosInstructores]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursosInstructores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCurso] [smallint] NULL,
	[idInstructor] [smallint] NULL,
	[fechaContratacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructores]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructores](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NULL,
	[correo] [varchar](80) NOT NULL,
	[telefono] [nchar](10) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[rfc] [char](13) NOT NULL,
	[curp] [char](18) NOT NULL,
	[cuotaHora] [decimal](9, 2) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Instructores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saldos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saldos](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[saldo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idOrigen] [int] NULL,
	[idDestino] [int] NULL,
	[Monto] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Alumnos_Estados] FOREIGN KEY([idEstadoOrigen])
REFERENCES [dbo].[Estados] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Alumnos_Estados]
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Alumnos_EstatusAlumnos] FOREIGN KEY([idEstatus])
REFERENCES [dbo].[EstatusAlumnos] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Alumnos_EstatusAlumnos]
GO
ALTER TABLE [dbo].[CatCursos]  WITH CHECK ADD  CONSTRAINT [FK_CatCursos_CatCursos] FOREIGN KEY([idPreRequisito])
REFERENCES [dbo].[CatCursos] ([id])
GO
ALTER TABLE [dbo].[CatCursos] CHECK CONSTRAINT [FK_CatCursos_CatCursos]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_CatCursos] FOREIGN KEY([idCatCurso])
REFERENCES [dbo].[CatCursos] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK_Cursos_CatCursos]
GO
ALTER TABLE [dbo].[CursosAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_CursosAlumnos_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CursosAlumnos] CHECK CONSTRAINT [FK_CursosAlumnos_Alumnos]
GO
ALTER TABLE [dbo].[CursosAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_CursosAlumnos_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CursosAlumnos] CHECK CONSTRAINT [FK_CursosAlumnos_Cursos]
GO
ALTER TABLE [dbo].[CursosInstructores]  WITH CHECK ADD  CONSTRAINT [FK_CursoInstructores_Cursos] FOREIGN KEY([idCurso])
REFERENCES [dbo].[Cursos] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CursosInstructores] CHECK CONSTRAINT [FK_CursoInstructores_Cursos]
GO
ALTER TABLE [dbo].[CursosInstructores]  WITH CHECK ADD  CONSTRAINT [FK_CursoInstructores_Instructores] FOREIGN KEY([idInstructor])
REFERENCES [dbo].[Instructores] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CursosInstructores] CHECK CONSTRAINT [FK_CursoInstructores_Instructores]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [fk_destino] FOREIGN KEY([idDestino])
REFERENCES [dbo].[Saldos] ([id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [fk_destino]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [fk_origen] FOREIGN KEY([idOrigen])
REFERENCES [dbo].[Saldos] ([id])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [fk_origen]
GO
/****** Object:  StoredProcedure [dbo].[actualizarAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[actualizarAlumnos]
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
  @idEstatus SMALLINT
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
END;

GO
/****** Object:  StoredProcedure [dbo].[CodigoAscii]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CodigoAscii]
AS
BEGIN
    -- SE DECLARAN VARIABLES PARA EL CÓDIGO ASCII Y EL CARACTER --
    DECLARE @codigoASCII INT = 33; -- SE COMIENZA DESDE 33, PORQUE ES EL PRIMER NÚMERO MAYOR A 32
    DECLARE @caracter CHAR(1); --AQUÍ SOLO SE ACEPTA UN VALOR

    -- CON EL BUCLE WHILE SE IMPRIME TODOS LOS CARACTERES CUYO CÓDIGO ASCII SEA MAYOR A 32 Y HASTA EL ÚLTIMO (255)
    WHILE @codigoASCII > 32 AND @codigoASCII <=255
    BEGIN
        -- CONVERSIÓN DE CÓDIGO ASCII A CARACTER
        SET @caracter = CHAR(@codigoASCII);
        
        -- IMPRESIÓN DEL CARACTER Y SU CÓDIGO ASCII CORRESPONDIENTE
        PRINT 'Carácter: ' + @caracter + '  Código ASCII: ' + CAST(@codigoASCII AS VARCHAR(5));

        -- AQUÍ SE INCREMENTA EL CÓDIGO ASCII PARA LA SIGUIENTE ITERACIÓN --
        SET @codigoASCII = @codigoASCII + 1;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[consultarAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[consultarAlumnos]
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
/****** Object:  StoredProcedure [dbo].[consultarEAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[consultarEAlumnos]
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
/****** Object:  StoredProcedure [dbo].[consultarEstados]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[consultarEstados]
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
/****** Object:  StoredProcedure [dbo].[consultarEstatusAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[consultarEstatusAlumnos]
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
/****** Object:  StoredProcedure [dbo].[FaltorialP]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[FaltorialP] 
    @num INT, --- ESTE ES EL PARÁMETRO DE ENTRADA DE TIPO ENTERO ---
    @resultado BIGINT OUTPUT --- ESTE ES EL PARAMETRO DE SALIDA DE TIPO BIGINT ---
AS
BEGIN
	/*SE DECLARA LA VARIABLE i QUE FUNGIRÁ COMO INCREMENTO EN EL CICLO WHILE Y SE INICIA EN 1, A SU VEZ SE
	LE ASIGNA EL VALOR 1 A RESULTADO */
    DECLARE @i INT = 1;
    SET @resultado = 1;

    WHILE @i <= @num
    BEGIN
        SET @resultado = @resultado * @i;
        SET @i = @i + 1;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarEnSaldos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[InsertarEnSaldos]
    @id INT,
    @nombre VARCHAR(100),
    @saldo INT
AS
BEGIN
    -- Insertar un nuevo registro en la tabla Saldos
    INSERT INTO Saldos (id, nombre, saldo)
    VALUES (1, 'David' , 30000);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_actualizarAlumnos]
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
/****** Object:  StoredProcedure [dbo].[sp_actualizarEstatusAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_actualizarEstatusAlumnos]
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
/****** Object:  StoredProcedure [dbo].[sp_agregarAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_agregarAlumnos]
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
/****** Object:  StoredProcedure [dbo].[sp_eliminarAlumnos]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_eliminarAlumnos]
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
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        -- Lanzar el error original
        THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_Transacciones]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Transacciones] 
    @idCuentaOrigen INT,
    @idCuentaDestino INT,
    @Cantidad DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        
        DECLARE @SaldoOrigen DECIMAL(18, 2);
        SELECT @SaldoOrigen = saldo FROM saldos WHERE id = @idCuentaOrigen;

        IF @SaldoOrigen >= @Cantidad
        BEGIN
          
            UPDATE saldos SET saldo = saldo - @Cantidad WHERE id = @idCuentaOrigen;
            UPDATE saldos SET saldo = saldo + @Cantidad WHERE id = @idCuentaDestino;

			 INSERT INTO Transacciones (idOrigen , idDestino, Monto)
			 VALUES (@idCuentaOrigen , @idCuentaDestino, @Cantidad );
	
            COMMIT;
            PRINT 'Transacción completada exitosamente.';
        END
        ELSE
        BEGIN
            ROLLBACK;
            PRINT 'Saldo insuficiente en la cuenta origen.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error en la transacción. Se ha realizado un rollback.';
		THROW 51000,'Error al realizar la transferencia', 1;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[Tablas]    Script Date: 28/09/2024 04:20:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Tablas]
AS
BEGIN
    -- Creación de la tabla Saldos
    EXEC('
        CREATE TABLE Saldos
        (
            id INT PRIMARY KEY,
            nombre VARCHAR(100) NULL,
            saldo INT
        )
    ');

    -- Creación de la tabla Transacciones
    EXEC('
        CREATE TABLE Transacciones
        (
            id INT IDENTITY PRIMARY KEY,
            idOrigen INT,
            idDestino INT,
            Monto MONEY
        )
    ');

    -- Agregar las restricciones de claves foráneas
    EXEC('
        ALTER TABLE Transacciones
        ADD CONSTRAINT fk_origen FOREIGN KEY(idOrigen) REFERENCES Saldos(id)
    ');

    EXEC('
        ALTER TABLE Transacciones
        ADD CONSTRAINT fk_destino FOREIGN KEY(idDestino) REFERENCES Saldos(id)
    ');
END;

GO
USE [master]
GO
ALTER DATABASE [InstitutoTich] SET  READ_WRITE 
GO
