IF EXISTS (SELECT * FROM sys.objects
WHERE object_id =OBJECT_ID(N'[dbo].[ClienteTipo]')
AND type in (N'U'))
DROP TABLE ClienteTipo
GO
create table ClienteTipo
( chTipo int identity PRIMARY KEY,
descricao varchar(20) not null
)

insert into clientetipo (descricao) values ('COMERCIO')
insert into clientetipo (descricao) values ('SERVIÇO')
insert into clientetipo (descricao) values ('OUTROS')

SELECT * FROM clientetipo


IF EXISTS (SELECT * FROM sys.objects
WHERE object_id =OBJECT_ID(N'[dbo].[Cliente]') AND
type in (N'U'))
DROP TABLE Cliente
GO

CREATE TABLE Cliente (
chCliente int IDENTITY(1,1) PRIMARY KEY,
chTipo int FOREIGN KEY references ClienteTipo(chTipo),
fantasia varchar(100) NULL,
limitecredito decimal (10,2)
)

insert into cliente (fantasia, limitecredito,chTipo)
values
('ABC Pneus', 20000,2),
('Magazine Luiza', 100000, 1),
('Hortifruti da Vila', 30000, 1),
('Esquinao LavaRapido', 5000,3)

SELECT * FROM Cliente

--Erro "restrição do FOREIGN KEY" forçado
insert into cliente (fantasia, limitecredito,chTipo)
values ('Mercado Livre', 20000,6)
--------------------------------------------

SELECT C.chCliente, C.fantasia, C.limitecredito, T.descricao

FROM cliente C INNER JOIN
clientetipo T ON C.chTipo = T.chTipo

--------------------------------------

CREATE VIEW vmCliente
AS

SELECT C.chCliente, C.fantasia, C.limitecredito,T.descricao
FROM cliente C INNER JOIN
clientetipo T ON C.chTipo = T.chTipo

---------------------------
Select * from vmCliente