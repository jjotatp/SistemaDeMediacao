create table casos_mediacao
(
	id_tipo_registro int not null references tipos_registro(id),
	titulo varchar(50) not null,
	descricao varchar(100) not null,
	imagem_nome varchar(50) not null,
	imagem_caminho varchar(max) not null,
	id_mediador int not null references mediadores(id),
	prioridade int,
	data datetime not null
)
go

create procedure alteraCasosMediacao
(
	@id_tipo_registro int ,
	@titulo varchar(50) ,
	@descricao varchar(100) ,
	@imagem_nome varchar(50),
	@imagem_caminho varchar(max),
	@id_mediador int,
	@prioridade int,
	@data datetime
)
as
begin
	update casos_mediacao
	set
	titulo = @titulo,
	descricao = @descricao,
	imagem_nome = @imagem_nome,
	imagem_caminho = @imagem_caminho,
	id_mediador = @id_mediador,
	prioridade = @prioridade,
	data = @data
	where
	id_tipo_registro = @id_tipo_registro
end
go

