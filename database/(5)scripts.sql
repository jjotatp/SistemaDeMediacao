insert into configuracoes (nome_conf, caminho_images)
values ('medPortal','C:\\programas\T C C\med_admin\MedPortal\Images\');
go

select * from solicitacoes
go

ALTER TABLE solicitacoes   
DROP CONSTRAINT CK__solicitac__solic__182C9B23;  
GO  

alter table solicitacoes
alter column solicitante_periodo_atendimento varchar(20)
go

alter table solicitacoes
add solicitante_dia_atendimento varchar(50)
go

alter table solicitacoes
drop column descricao_problema


alter procedure alteraSolicitacoes
(
	@id int,	
	@descricao_caso varchar(250),
	@solicitante_nome varchar(100) ,
	@solicitante_telefone varchar(20),
	@solicitante_endereco varchar(100),
	@solicitante_email varchar(50),
	@solicitante_periodo_atendimento varchar(20),
	@solicitante_dia_atendimento varchar(50),
	@detalhes_partes varchar(200) ,
	@id_local int
)
as
begin
	update solicitacoes
	set	
	descricao_caso = @descricao_caso,
	solicitante_nome = @solicitante_nome,
	solicitante_telefone = @solicitante_telefone,
	solicitante_endereco = @solicitante_endereco,
	solicitante_email = @solicitante_email,
	solicitante_periodo_atendimento = @solicitante_periodo_atendimento,
	solicitante_dia_atendimento = @solicitante_dia_atendimento,
	detalhes_partes = @detalhes_partes,
	id_local = @id_local
	where id = @id;
end
go

-- VIEW PARA LISTAR OS LOCAIS COM NOME DO BAIRRO E DA CIDADE
create view v_locais_endereco
as
	select L.id 'ID' , ( L.descricao + ', ' + L.bairro + ', ' + C.nome ) 'DESCRICAO'
	from locais L
	join cidades C on ( C.id = L.id_cidade )
	where L.ativo = 1
go

select * from v_locais_endereco

drop view v_nucleos

create view v_nucleos
as
	select l.id ID, l.nome Nome, l.descricao 'Descricao', c.nome 'Cidade',	l.bairro Bairro,
			l.logradouro Logradouro, l.telefone Telefone, l.numero 'Numero', l.ativo
	from locais l
	left join cidades c on (l.id_cidade = c.id)
go

drop view v_solicitacoes

create view v_solicitacoes
as
	 select s.id ID,s.solicitante_nome Nome, l.descricao Local, s.data Data, c.nome Cidade from solicitacoes s
		left join cidades c on (s.id_cidade_abertura = c.id)
		left join locais l on (s.id_local = l.id)
go

drop view v_mediadores

create view v_mediadores
as
	select m.id ID, m.nome Nome, m.patente Patente, l.descricao Nucleo
	from mediadores m
	left join locais l on (m.id_local = l.id)
go

select * from v_mediadores

drop view v_total_tipos_registro

create view v_total_tipos_registro
as
	 select t.ID, t.descricao as DESCRICAO, COUNT(m.id) TOTAL
	 from tipos_registro t
	 left join mediacoes m on (m.id_tipo_registro = t.id)
	 group by t.id, t.descricao
go