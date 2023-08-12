/*Esse script SQL cria três visualizações (views) a partir de uma tabela chamada cliente com base em diferentes critérios de valor de limitecredito.*/

create view vmPlatinum as
Select *
From cliente
where limitecredito > 50000
go
create view vmsILVER as
Select *
From cliente
where limitecredito < 10000
go

create view vmGOLD as
Select *
From cliente
where limitecredito >= 10000 AND limitecredito < 50000

go


