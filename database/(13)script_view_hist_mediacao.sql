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