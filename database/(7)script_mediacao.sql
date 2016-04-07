alter table mediacoes alter column data_mediacao datetime not null

alter table mediacoes drop column id_solicitacao
alter table mediacoes add id_agendamento int references agendamentos(id)

alter procedure alteraMediacao
(
	@id int,
	@id_agendamento int ,
	@numero varchar(20),
	@tema_conflito varchar(50),	
	@data_mediacao date ,
	@id_mediador int ,
	@id_tipo_registro int,
	@objeto varchar(max),
	@id_local int,
	@documento_link varchar(100),
	@status int,
	@resolucao char(1)
)
as
begin
	update mediacoes
	set
	@id_agendamento = @id_agendamento,
	numero = @numero,
	tema_conflito = @tema_conflito,
	data_mediacao = @data_mediacao,
	id_mediador = @id_mediador,
	id_tipo_registro = @id_tipo_registro,
	objeto = @objeto,
	id_local = @id_local,
	documento_link = @documento_link,
	status = @status,
	resolucao = @resolucao
	where id = @id;
end
go

