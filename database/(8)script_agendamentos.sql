alter table agendamentos add status int not null default 0, check (status in (0,1))

-- finaliza o agendamento passando o status = 1 se ele estiver vinculado a uma mediação
create procedure atualizaStatus
(
	@id_agendamento int
)
as
begin
	declare @qntMed int
	-- busca o id do tratamento
	set @qntMed = (select COUNT(*) from mediacoes where id_agendamento = @id_agendamento )

	if ( @qntMed > 0 )
		update agendamentos 
		set
		status = 1
		where id = @id_agendamento;
end
go