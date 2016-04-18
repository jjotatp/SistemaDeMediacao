alter table noticias add id_mediador_edicao int references mediadores(id);
go
alter table noticias add data_edicao datetime;
go
alter table noticias add id_local_edicao int references locais (id);
go
alter table noticias add prioridade int not null default(3);
go

create procedure alteraNoticia
(
	@id int,
	@imagem_nome varchar(50),
	@imagem_caminho varchar(max),
	@titulo_postagem varchar(50),
	@corpo_noticia varchar(500),
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



select * from noticias