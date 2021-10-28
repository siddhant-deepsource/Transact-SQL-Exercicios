-- Exemplo 1 -- Calculando o Percentual de Juros com base na quantidade de dias em atraso --
-- Criando a Tabela INPCDiasDeAtraso --
Create Table INPCDiasDeAtraso
 (CodigoINPC Int Identity(1,1) Primary Key,
  DataINPC As (DateAdd(Day,CodigoINPC,GetDate())),
  Ano As (Year(GetDate()+CodigoINPC)),
  Mes As (Month(GetDate()+CodigoINPC)),
  ValorINPC As (0.01*CodigoINPC))
Go

-- Inserindo uma massa de dados --
Insert Into INPCDiasDeAtraso (DataINPC) Default Values
Go 1000

-- Consultando --
Select Top 100 CodigoINPC, 
                         Convert(Date,DataINPC) As DataINPC,
						 Ano, 
		                 Mes, 
		                 ValorINPC
From INPCDiasDeAtraso
Order By ValorINPC Asc
Go

-- Criando a Tabela de Pagamentos --
Create Table Pagamentos
 (CodigoPagamento Int Identity(1,1) Primary Key,
  DataVencimento As (DateAdd(Day,CodigoPagamento,GetDate())),
  DataPagamento As (DateAdd(Day,CodigoPagamento,GetDate()+CodigoPagamento)),
  ValorParcela As (Rand()*CodigoPagamento+100))
Go

-- Inserindo uma massa de dados --
Insert Into Pagamentos Default Values
Go 1000

-- Consultando --
Select Top 200 P.CodigoPagamento, 
                        Cast(P.DataVencimento As Date) As DataVencimento,
                        Cast(P.DataPagamento As Date) As DataPagamento, 
                        Cast(P.ValorParcela As Decimal(10,2)) As ValorParcela
From Pagamentos P 
Order By DataVencimento Desc
Go

-- Simulando o cálculo de Juros com base na diferença entre a Data de Pagamento e Data de Vencimento --
Select P.CodigoPagamento, 
          Cast(P.DataVencimento As Date) As DataVencimento,
          Cast(P.DataPagamento As Date) As DataPagamento, 
          Cast(P.ValorParcela As Decimal(10,2)) As ValorParcela,
		  DATEDIFF(Day, P.DataVencimento, P.DataPagamento) As 'Dias de Atraso',
		  Concat(IsNull(I.ValorINPC,0),'%') As ValorINPC,
		  Cast(P.ValorParcela+(P.ValorParcela*I.ValorINPC) As Decimal(10,2)) As NovaParcela
From Pagamentos P Outer Apply (Select ValorINPC From INPCDiasDeAtraso
                                                       Where CodigoINPC = DATEDIFF(Day, P.DataVencimento, P.DataPagamento)) As I
Where DATEDIFF(Day, P.DataVencimento, P.DataPagamento) <= 50
Go
-- Exemplo 2 -- Função para Cálculo de Juros --
Create Or Alter Function F_CalcularPorcentagem (@ValorVenda Float, @QTDEParcelas Int, @Juros Int)
Returns Int
As
Begin
 Declare @ValorAtualizadoVenda Float

 Set @ValorAtualizadoVenda=(IsNull(@ValorVenda,1)/IsNull(@QTDEParcelas,1))

 Set @ValorAtualizadoVenda=@ValorAtualizadoVenda+(@ValorAtualizadoVenda*IsNull(@Juros,1))/100

 Return(@ValorAtualizadoVenda)
End
Go


-- Executando --
Select dbo.F_CalcularPorcentagem(5000, 5, 10)
Go
-- Exemplo 3 -- Utilizando Triggers e Stored Procedures para cálculo de Juros --
USE AULA6
GO

Create TABLE PARCELAMENTO
(CODIGO INT IDENTITY(1,1) PRIMARY KEY,
 CODVENDA INT NOT NULL,
 NUMEROPARCELA TINYINT NOT NULL,
 VALORPARCELA FLOAT NOT NULL,
 PorcentagemJuros Float Not Null,
 DataVencimento Date Not Null,
 ValorTotal Float Null)
GO

Create Or Alter TRIGGER T_INSERIR_PARCELAMENTO
ON VENDAS
AFTER INSERT
AS
Begin

Set NoCount On

 IF (SELECT QTDEPARCELAS FROM INSERTED) > 1
  Begin

   Declare @Contador TinyInt,
           @CodVenda Int,
           @PorcentagemJuros Float

   Set @Contador = 1
   Set @CodVenda = (Select Codigo from inserted)
   Set @PorcentagemJuros=10
 
   
   While @Contador <= (Select QTDEPARCELAS FROM inserted)
    Begin
	 
	 Insert Into PARCELAMENTO(CODVENDA, NUMEROPARCELA, VALORPARCELA, PorcentagemJuros, DataVencimento)
	 Select Codigo, @Contador, dbo.F_CalcularPorcentagem(VALORVENDA,QTDEPARCELAS,@PorcentagemJuros), @PorcentagemJuros, DATEADD(MONTH,@Contador,GETDATE()) From Inserted 

	 Set @Contador += 1
	End                        

	Exec P_AtualizarValorTotalParcelamento @CodVenda
  End
End


Create Procedure P_AtualizarValorTotalParcelamento(@CodVenda Int = 1)
As
Begin

Set NoCount On

   Update Parcelamento
   Set ValorTotal = (Select SUM(ValorParcela) From PARCELAMENTO
                     Where CODVENDA = @CodVenda)
   Output inserted.CODVENDA, inserted.NUMEROPARCELA, inserted.VALORPARCELA, inserted.PorcentagemJuros, inserted.ValorTotal
   Where CODVENDA = @CodVenda 					  

End
Go


Insert Into Vendas(CodEmpresa, CodCliente, CODPRODUTO, VALORVENDA, QTDEPARCELAS)
Values(3,2,1,5000,10)
Go
