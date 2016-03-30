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
	 nome,patente,id_local,usuario,
	 SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5', senha)), 3, 32)
	 FROM inserted
GO

CREATE TRIGGER tg_altera_mediador 
ON mediadores 
AFTER UPDATE
AS 
DECLARE @ID int, @SENHA_NOVA varchar(32), @SENHA_ANTIGA varchar(32)
BEGIN
	SET @ID = (SELECT id FROM inserted);
	SET @SENHA_NOVA = (SELECT senha FROM inserted);
	SET @SENHA_ANTIGA = (SELECT senha FROM deleted);

	IF NOT @SENHA_NOVA = @SENHA_ANTIGA
	BEGIN	
		UPDATE mediadores SET
		senha = SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5', @SENHA_NOVA)), 3, 32)
		WHERE id = @ID;
	END
END
GO






-- TESTES
drop trigger tg_insere_mediador

insert into mediadores 
(nome,patente,id_local,usuario,senha)
values
('teste1','cb pm',1,'teste9','123');

select * from mediadores

update mediadores
set senha = 1234
where id = 19