CREATE DATABASE pratica_funcao
GO
USE pratica_funcao
GO

CREATE TABLE Funcionario (
Codigo              INT            NOT NULL,
Nome                VARCHAR(100)   NOT NULL,
Salario             DECIMAL(7, 2)  NOT NULL
PRIMARY KEY(Codigo)
)
GO

CREATE TABLE Dependente (
Codigo_Funcionario    INT           NOT NULL,
Nome_Dependente       VARCHAR(100)  NOT NULL,
Salario_Dependente     DECIMAL(7, 2) NOT NULL
PRIMARY KEY(Codigo_Funcionario)
FOREIGN KEY(Codigo_Funcionario) REFERENCES Funcionario(Codigo)
)
GO

INSERT Funcionario VALUES
(1, 'Lucas', 2000.00),
(2, 'Michael', 1000.00),
(3, 'Doc', 1500.00),
(4, 'Murphy', 4000.00)

INSERT INTO Dependente VALUES
(1, 'Knull', 5000.00),
(2, 'pato', 500.00),
(3, '10K', 2000.00),
(4, 'Lucy', 2000.00)

SELECT * FROM Funcionario
SELECT * FROM DepenDente 

CREATE FUNCTION fn_funcdenp()
RETURNS @tabela TABLE (
Nome_Funcionario       VARCHAR(100),
Nome_Dependente        VARCHAR(100),
Salario_Funcionario    DECIMAL(7, 2),
Salario_Dependente      DECIMAL(7, 2)
)
AS 
BEGIN
     INSERT INTO @tabela (Nome_Funcionario, Salario_Funcionario, Nome_Dependente, Salario_Dependente)
	 SELECT f.Nome, f.Salario, d.Nome_Dependente, d.Salario_Dependente 
	 FROM Funcionario f, Dependente d
	 WHERE f.Codigo = d.Codigo_Funcionario

	 RETURN
END


SELECT Nome_Funcionario, Nome_Dependente, Salario_Funcionario, Salario_Dependente FROM fn_funcdenp()


--retorno da soma de um salario com codigo como parametro
CREATE FUNCTION fn_somasalarios(@cod INT)
RETURNS DECIMAL(7, 2)
AS
BEGIN
DECLARE @valor_total DECIMAL(7, 2)    
 SELECT @valor_total = f.Salario + d.Salario_Dependente 
 FROM Funcionario f, Dependente d
 WHERE f.Codigo = d.Codigo_Funcionario
   AND f.Codigo = @cod
 RETURN @valor_total
END


SELECT dbo.fn_somasalarios(4) AS valor_total


--Retorno da soma de todos os salarios como uma tabela
CREATE FUNCTION fn_somarsalario()
RETURNS @tabela TABLE(
salario_total          DECIMAL(7,2)
)
AS
BEGIN 

INSERT INTO @tabela (salario_total)
 SELECT f.Salario + d.Salario_Dependente 
 FROM Funcionario f, Dependente d
 WHERE f.Codigo = d.Codigo_Funcionario
 
RETURN 
END


SELECT * FROM fn_somarsalario()

   