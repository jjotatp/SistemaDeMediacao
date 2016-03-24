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

