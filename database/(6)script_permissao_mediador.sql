-- ===== ADICIONA CAMPO DE NIVEL DE PERMISSAO NO CADASTRO DO MEDIADOR

alter table mediadores add nivel_permissao int not null default 1,
	check (nivel_permissao in (1,2,3,4))

-- 1 - Básica
-- 2 - Padrão
-- 3 - Avançada
-- 4 - Administrador

ALTER TRIGGER tg_insere_mediador 
ON mediadores 
INSTEAD OF INSERT 
AS 
	INSERT INTO mediadores 
	(nome,patente,id_local,usuario,nivel_permissao,senha)
	SELECT
	 nome,patente,id_local,usuario,nivel_permissao,
	 SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5', senha)), 3, 32)
	 FROM inserted
GO

alter procedure alteraMediador
(
	@id int,
	@nome varchar(100),
	@patente varchar(50),
	@id_local int,
	@usuario varchar(50),
	@senha varchar(50),
	@nivel int
)
as
begin
	update mediadores
	set
	nome = @nome,
	patente = @patente,
	id_local = @id_local,
	usuario = @usuario,
	senha = @senha,
	nivel_permissao = @nivel
	where id = @id;
end
go

alter procedure cadMediador
(
	@nome varchar(100),
	@patente varchar(100),
	@id_local int,
	@usuario varchar(50),
	@senha varchar(50),
	@nivel int
)
as
begin
	insert into mediadores
	(nome, patente, id_local, usuario, senha, nivel_permissao)
	values
	(@nome,@patente,@id_local,@usuario,@senha,@nivel)
end
go