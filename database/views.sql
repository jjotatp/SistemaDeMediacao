create view v_solicitacoes
as
	 select s.id ID,s.solicitante_nome Nome, l.nome Local, s.data Data, c.nome Cidade from solicitacoes s
		left join cidades c on (s.id_cidade_abertura = c.id)
		left join locais l on (s.id_local = l.id)
go

select * from v_solicitacoes

create view v_nucleos
as
	select l.id ID, l.nome Nome, l.descricao 'Descrição', c.nome 'Cidade',	l.bairro Bairro,
			l.logradouro Logradouro, l.telefone Telefone, l.numero 'Número', l.ativo
	from locais l
	left join cidades c on (l.id_cidade = c.id)

go

select * from v_nucleos