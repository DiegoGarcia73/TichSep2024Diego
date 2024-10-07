/* TEMA: SQL SERVER
 SUBTEMA: FUNCI�N VALUADA EN TABLA */

 /*1. Hacer una funci�n valuada en tabla que obtenga la tabla de amortizaci�n de los Reembolsos quincenales 
 que un participante tiene que realizar en 6 meses */

CREATE OR ALTER FUNCTION dbo.reembolsosParticipante
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
SELECT * FROM dbo.reembolsosParticipante(22000)
GO

/* 2. Hacer una funci�n valuada en tabla que obtenga la tabla de amortizaci�n de los pr�stamos posibles 
que se le pueden hacer a un instructor.
La funci�n recibir� como par�metro el id del instructor
El importe del pr�stamo ser� 200 veces la cuota por hora
El porcentaje de inter�s ser� el 24% anual cuando la cuota por hora sea superior a 200
Para el resto ser� de 18%
El pago mensual ser� el equivalente a 25 horas */

CREATE OR ALTER FUNCTION dbo.PrestamoInstructor
(
@idInstructor INT --SE DECLARA LOS PARAMETROS DE TIPO ENTERO LLAMADA IDINSTRUCTOR ---
)
RETURNS @amortizacion TABLE
(
    mes INT,
    saldoAnterior DECIMAL(18, 2), -- SE DECLARA UNA VARIABLE TIPO DECIMAL CON 18 CARACTERES M�S 2 DESPU�S DEL PUNTO DECIMAL--
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

    -- CALCULA EL IMPORTE DEL PR�STAMO, ES DECIR, 200 VECES LA CUOTA POR HORA
    SET @importePrestamo = @cuotaPorHora * 200;

    -- SE DETERMINA LA TASA DE INTER�S ANUAL
    SET @porcentajeInteres = CASE 
                                WHEN @cuotaPorHora > 200 THEN 0.24
                                ELSE 0.18
                             END;

    -- CALCULAR EL PAGO MENSUAL (25 HORAS DE TRABAJO)
    SET @pago = @cuotaPorHora * 25;

    -- SE ESTABLECE EL SALDO INICIAL
    SET @saldoAnterior = @importePrestamo;

    -- ESTE BUCLE GENERA LA TABLA DE AMORTIZACI�N DE MES A MES
    WHILE @saldoAnterior > 0 AND @mes <= 12 -- 12 meses
    BEGIN
        -- SE CALCULAN LOS INTERESES
        SET @intereses = ROUND(@saldoAnterior * (@porcentajeInteres / 12), 2);

        -- SE CALCULA EL SALDO NUEVO DESPU�S DE HABER HECHO EL PAGO Y APLICAR LOS INTERESES
        SET @saldoNuevo = @saldoAnterior + @intereses - @pago;

        -- SI EL SALDO NUEVO ES MENOR QUE CERO, SE AJUSTA A CERO PARA EL �LTIMO PAGO
        IF @saldoNuevo < 0 
        BEGIN
            SET @saldoNuevo = 0;
            SET @pago = @saldoAnterior + @intereses; -- �ltimo pago es el saldo + intereses
        END;

        -- SE INSERTAN LOS VALORES A LA TABLA DE AMORTIZACI�N
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
SELECT * FROM dbo.PrestamoInstructor(3)
GO
SELECT * FROM Instructores