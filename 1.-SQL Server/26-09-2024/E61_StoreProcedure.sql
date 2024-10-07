/* TEMA: SQL SERVER
SUBTEMA: STORE PROCEDURES */

/* 1. Crear un store procedureCodigoAscii que imprima los caracteres con su respectivo c�digo ascii en decimal. 
Solo para los caracteres cuyo c�digo sea mayor a 32 */

CREATE OR ALTER PROCEDURE CodigoAscii
AS
BEGIN
    -- SE DECLARAN VARIABLES PARA EL C�DIGO ASCII Y EL CARACTER --
    DECLARE @codigoASCII INT = 33; -- SE COMIENZA DESDE 33, PORQUE ES EL PRIMER N�MERO MAYOR A 32
    DECLARE @caracter CHAR(1); --AQU� SOLO SE ACEPTA UN VALOR

    -- CON EL BUCLE WHILE SE IMPRIME TODOS LOS CARACTERES CUYO C�DIGO ASCII SEA MAYOR A 32 Y HASTA EL �LTIMO (255)
    WHILE @codigoASCII > 32 AND @codigoASCII <=255
    BEGIN
        -- CONVERSI�N DE C�DIGO ASCII A CARACTER
        SET @caracter = CHAR(@codigoASCII);
        
        -- IMPRESI�N DEL CARACTER Y SU C�DIGO ASCII CORRESPONDIENTE
        PRINT 'Car�cter: ' + @caracter + '  C�digo ASCII: ' + CAST(@codigoASCII AS VARCHAR(5));

        -- AQU� SE INCREMENTA EL C�DIGO ASCII PARA LA SIGUIENTE ITERACI�N --
        SET @codigoASCII = @codigoASCII + 1;
    END
END
EXEC CodigoAscii;
GO

/* 2. Crear el store procedure Factorial que reciba como par�metro un n�mero entero y que
devuelve el factorial calculado en un par�metro de salida */

CREATE OR ALTER PROCEDURE FaltorialP 
    @num INT, --- ESTE ES EL PAR�METRO DE ENTRADA DE TIPO ENTERO ---
    @resultado BIGINT OUTPUT --- ESTE ES EL PARAMETRO DE SALIDA DE TIPO BIGINT ---
AS
BEGIN
	/*SE DECLARA LA VARIABLE i QUE FUNGIR� COMO INCREMENTO EN EL CICLO WHILE Y SE INICIA EN 1, A SU VEZ SE
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

 --- EJECUCI�N CON EXEC 
DECLARE @inputNum INT = 5; --AQU� ES DONDE SE RECIBE EL PAR�METRO DE ENTRADA
DECLARE @salidaResultado BIGINT; 

EXEC FaltorialP @num = @inputNum, @resultado = @salidaResultado OUTPUT;

SELECT @salidaResultado AS resultadoFactorial;
GO

---3. CREAR LAS SIGUIENTES TABLAS ---
CREATE OR ALTER PROCEDURE Tablas
AS
BEGIN
    -- Creaci�n de la tabla Saldos
    EXEC('
        CREATE TABLE Saldos
        (
            id INT PRIMARY KEY,
            nombre VARCHAR(100),
            saldo INT
        )
    ');

    -- Creaci�n de la tabla Transacciones
    EXEC('
        CREATE TABLE Transacciones
        (
            id INT IDENTITY PRIMARY KEY,
            idOrigen INT,
            idDestino INT,
            Monto MONEY
        )
    ');

    -- Agregar las restricciones de claves for�neas
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

--- EJECUCI�N DEL PROCEDIMIENTO ALMACENADO ---
EXEC Tablas;
GO
--- COMPROBAR LA EXISTENCIA DE ESAS TABLAS ----
SELECT * FROM Saldos
SELECT * FROM Transacciones
GO
---- INSERTANDO REGISTROS EN LA TABLA SALDOS ----
INSERT INTO Saldos (id, nombre, saldo)
VALUES (1, 'David', 30000),
	   (2, 'Miguel', 5000),
	   (3, 'Pedro', 2300),
	   (4, 'Irma', 10000);
GO
/* 4. Crear un store procedure �Transacciones� que recibir� como par�metros el id de la 
cuenta de origen, el id de la cuenta destino y el monto de la transacci�n. Se 
deber� crear dentro de una transacci�n a fin de que los saldos de las cuentas 
involucradas y la tabla de transacciones quede perfectamente consistente. */

CREATE OR ALTER PROCEDURE sp_Transacciones 
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
            PRINT 'Transacci�n completada exitosamente.';
        END
        ELSE
        BEGIN
            ROLLBACK;
            PRINT 'Saldo insuficiente en la cuenta origen.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error en la transacci�n. Se ha realizado un rollback.';
		THROW 51000,'Error al realizar la transferencia', 1;
    END CATCH;
END;
GO
 
EXEC sp_transacciones 2,3,500

select * from saldos
select *from transacciones