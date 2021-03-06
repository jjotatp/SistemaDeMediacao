create view v_solicitacoes
as
	 select s.id ID,s.solicitante_nome Nome, l.descricao Local, s.data Data, c.nome Cidade from solicitacoes s
		left join cidades c on (s.id_cidade_abertura = c.id)
		left join locais l on (s.id_local = l.id)
go

select * from v_solicitacoes
go

--======================================================
create view v_nucleos
as
	select l.id ID, l.nome Nome, l.descricao 'Descricao', c.nome 'Cidade',	l.bairro Bairro,
			l.logradouro Logradouro, l.telefone Telefone, l.numero 'Numero', l.ativo
	from locais l
	left join cidades c on (l.id_cidade = c.id)
go


select * from v_nucleos
go

--======================================================
create view v_mediadores
as
	select m.id ID, m.nome Nome, m.patente Patente, l.descricao Nucleo
	from mediadores m
	left join locais l on (m.id_local = l.id)
go

select * from v_mediadores
go

--======================================================
create view v_historico_mediacoes as
select
	m.id,
	m.numero Numero, 
	m.tema_conflito TemaConflito, 
	m.data_mediacao DataMediacao, 
	t.descricao DescricaoTipoRegistro
from mediacoes m
join tipos_registro t on (m.id_tipo_registro = t.id)
go

select * from v_historico_mediacoes
go

--======================================================
create view v_total_tipos_registro
as
	 select t.ID, t.descricao as DESCRICAO, COUNT(m.id) TOTAL
	 from tipos_registro t
	 left join mediacoes m on (m.id_tipo_registro = t.id)
	 group by t.id, t.descricao
go

select * from v_total_tipos_registro
go

--======================================================
create view v_locais_endereco
as
	select L.id 'ID' , ( L.descricao + ', ' + L.bairro + ', ' + C.nome ) 'DESCRICAO'
	from locais L
	join cidades C on ( C.id = L.id_cidade )
	where L.ativo = 1
go

select * from v_locais_endereco

--======================================================
