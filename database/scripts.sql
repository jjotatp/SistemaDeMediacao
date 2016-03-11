-- comando para adicionar o campo telefone
alter table locais add telefone varchar(20)
go

alter procedure alteraLocal
(
	@id int,
	@nome varchar(100),
	@descricao varchar(50),
	@id_cidade int,
	@bairro varchar(50),
	@logradouro varchar(100) ,
	@numero varchar(10) ,
	@CEP varchar(15) ,
	@data_inicio_atividade date,
	@telefone varchar(20)
)
as
begin
	update locais 
	set 
	nome = @nome,
	descricao = @descricao,
	id_cidade = @id_cidade,
	bairro = @bairro,
	logradouro = @logradouro,
	numero = @numero,
	cep = @cep,
	data_inicio_atividade = @data_inicio_atividade,
	telefone = @telefone
	where id = @id;	
end
go

--============================ ADICIONAR DATA_FINAL NOS AGENDAMENTOS ==================

alter table agendamentos drop column data;
alter table agendamentos add data_inicial datetime not null default '01/01/2001';
alter table agendamentos add data_final datetime not null default '01/01/2001';

alter procedure alteraAgendamento
(
	@id int,
	@id_solicitacao int,
	@descricao varchar(50),
	@data_inicial date,
	@data_final date
)
as
begin
	update agendamentos
	set
	id_solicitacao = @id_solicitacao,
	descricao = @descricao,
	data_inicial = @data_inicial,
	data_final = @data_final
	where id = @id;
end
go

