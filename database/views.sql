create view v_solicitacoes
as
	 select s.id ID,s.solicitante_nome Nome, l.nome Local, s.data Data, c.nome Cidade from solicitacoes s
		left join cidades c on (s.id_cidade_abertura = c.id)
		left join locais l on (s.id_local = l.id)
go

select * from v_solicitacoes
