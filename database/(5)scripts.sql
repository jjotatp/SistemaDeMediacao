insert into configuracoes (nome_conf, caminho_images)
values ('medPortal','C:\\programas\T C C\med_admin\MedPortal\Images\');
go

alter table configuracoes add usuario_ftp varchar(100);
alter table configuracoes add senha_ftp varchar(100);

select * from configuracoes

alter table noticias
alter column titulo_postagem varchar(100) not null

alter table noticias
alter column corpo_noticia   varchar(1500) not null

alter procedure alteraNoticia
(
	@id int,
	@imagem_nome varchar(50),
	@imagem_caminho varchar(max),
	@titulo_postagem varchar(100),
	@corpo_noticia varchar(1500),
	@id_mediador_edicao int,
	@id_local_edicao int,
	@data_edicao datetime,
	@prioridade int
)
as
begin
	update noticias 
	set imagem_nome = @imagem_nome,
	imagem_caminho = @imagem_caminho,
	titulo_postagem = @titulo_postagem,
	corpo_noticia = @corpo_noticia,
	id_mediador_edicao = @id_mediador_edicao,
	id_local_edicao = @id_local_edicao,
	data_edicao = @data_edicao,
	prioridade = @prioridade
	where id = @id
end
go

-- campo CAMINHO_POSTAGEM para salvar o ip para postagem dos arquivos no ftp
alter table configuracoes add caminho_postagem varchar(max)
update configuracoes set caminho_postagem = 'ftp://localhost/'

select * from configuracoes

-- campo para ativar e desativar o mediador 
alter table mediadores alter column ativo bit not null

ALTER TRIGGER tg_insere_mediador 
ON mediadores 
INSTEAD OF INSERT 
AS 
	INSERT INTO mediadores 
	(nome,patente,id_local,usuario,nivel_permissao,ativo,senha)
	SELECT
	 nome,patente,id_local,usuario,nivel_permissao,ativo,
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
	@ativo bit,
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
	ativo = @ativo,
	nivel_permissao = @nivel
	where id = @id;
end
go

alter view v_mediadores
as
	select m.id ID, m.nome Nome, m.patente Patente, l.descricao Nucleo, M.ativo Ativo
	from mediadores m
	left join locais l on (m.id_local = l.id)
go

select * from v_mediadores

alter procedure cadMediador
(
	@nome varchar(100),
	@patente varchar(100),
	@id_local int,
	@usuario varchar(50),
	@senha varchar(50),
	@ativo bit,
	@nivel int
)
as
begin
	insert into mediadores
	(nome, patente, id_local, usuario, senha, ativo, nivel_permissao)
	values
	(@nome,@patente,@id_local,@usuario,@senha,@ativo,@nivel)
end
go