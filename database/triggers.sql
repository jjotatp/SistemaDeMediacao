--====================================
--  Create database trigger template 
--====================================

CREATE TRIGGER tg_insere_mediador 
ON mediadores 
INSTEAD OF INSERT 
AS 
	INSERT INTO mediadores 
	(nome,patente,id_local,usuario,senha)
	SELECT
	 nome,patente,id_local,usuario,HASHBYTES('MD5',senha) FROM inserted
GO

drop trigger tg_insere_mediador

select * from mediadores

insert into mediadores 
(nome,patente,id_local,usuario,senha)
values
('teste1','cb pm',1,'teste9',HASHBYTES('MD5',cast( '123' as nvarchar(32))));


SELECT HASHBYTES('MD5', senha) FROM mediadores