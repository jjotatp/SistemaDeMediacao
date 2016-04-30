create table depoimentos
(
-- tabela que registra os depoimentos no sistema
-- recebe id do mediador para saber qual mediador foi o respons�vel a alterar o depoimento
	id int not null primary key identity,
	nome varchar(30),
	idade int,
	descricao varchar(100),
	id_mediador int references mediadores(id),
	data datetime not null,
	status int, -- 1 = aprovado e em exibi��o no site; 2 = recusado e arquivado.
);
go

create procedure alteraDepoimento
(
	@id int,
	@nome varchar(30),
	@idade int,
	@descricao varchar(100),
	@id_mediador int,
	@data datetime,
	@status int
)
as
begin
	update depoimentos
	set 
	nome = @nome,
	idade = @idade,
	descricao = @descricao,
	id_mediador = @id_mediador,
	data = @data,
	status = @status
	where id = @id;	
end
go