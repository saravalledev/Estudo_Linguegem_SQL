/*Esse código SQL utiliza um cursor para percorrer os resultados de uma consulta em uma tabela chamada vmsILVER. 
O objetivo é imprimir os valores da coluna fantasia para cada registro da tabela.*/

declare @fantasia  varchar(40)
-- -----------------------------------
declare X CURSOR FOR
   SELECT fantasia FROM vmsILVER 
OPEN X  -- ABRE
-- ------------------------------------
FETCH NEXT FROM X INTO @fantasia
print 'CLIENTE SILVER'
WHILE @@FETCH_STATUS=0 begin
    PRINT '>>' +  @fantasia
    FETCH NEXT FROM X INTO @fantasia
end
-- ------------------------------------
CLOSE x -- FECHA
deallocate x -- SOME COM ELE

------------------------------------------


