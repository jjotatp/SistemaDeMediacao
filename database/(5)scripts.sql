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