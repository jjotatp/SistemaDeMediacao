create view v_mediadores
as
	select m.id ID, m.nome Nome, m.patente Patente, l.nome Nucleo
	from mediadores m
	left join locais l on (m.id_local = l.id)
go

select * from v_mediadores