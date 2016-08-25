insert into configuracoes (nome_conf, caminho_images)
values ('medPortal','C:\\programas\T C C\med_admin\MedPortal\Images\');
go

alter table configuracoes add usuario_ftp varchar(100);
alter table configuracoes add senha_ftp varchar(100);

select * from configuracoes

alter table noticias
alter column titulo_postagem varchar(100) not null

alter table noticias
alter column corpo_noticia   varchar(1500) not null

alter procedure alteraNoticia
(
	@id int,
	@imagem_nome varchar(50),
	@imagem_caminho varchar(max),
	@titulo_postagem varchar(100),
	@corpo_noticia varchar(1500),
	@id_mediador_edicao int,
	@id_local_edicao int,
	@data_edicao datetime,
	@prioridade int
)
as
begin
	update noticias 
	set imagem_nome = @imagem_nome,
	imagem_caminho = @imagem_caminho,
	titulo_postagem = @titulo_postagem,
	corpo_noticia = @corpo_noticia,
	id_mediador_edicao = @id_mediador_edicao,
	id_local_edicao = @id_local_edicao,
	data_edicao = @data_edicao,
	prioridade = @prioridade
	where id = @id
end
go

-- campo CAMINHO_POSTAGEM para salvar o ip para postagem dos arquivos no ftp
alter table configuracoes add caminho_postagem varchar(max)
update configuracoes set caminho_postagem = 'ftp://localhost/'

select * from configuracoes
-- ============ ADIÇÃO CAMPO ATIVO NAS SOLICITACOES
-- 1 = ATIVO
-- 0 = ARQUIVADO

select * from solicitacoes

alter table solicitacoes add ativo bit not null default 1

alter view v_solicitacoes
as
	 select s.id ID,s.solicitante_nome Nome, l.descricao Local, s.data Data, c.nome Cidade, s.ativo Ativo 
	 from solicitacoes s
		left join cidades c on (s.id_cidade_abertura = c.id)
		left join locais l on (s.id_local = l.id)
go

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
	@id_local int,
	@ativo bit
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
	id_local = @id_local,
	ativo = @ativo
	where id = @id;
end
go

-- REFERENCIAR A CIDADE NA MEDIAÇÃO

select * from mediacoes

alter table mediacoes add id_cidade int not null references cidades(id)

alter procedure alteraMediacao
(
	@id int,
	@id_agendamento int ,
	@numero int,
	@tema_conflito varchar(50),	
	@data_mediacao date ,
	@id_mediador int ,
	@id_tipo_registro int,
	@objeto varchar(max),
	@id_local int,
	@documento_link varchar(100),
	@status int,
	@resolucao char(1),
	@id_cidade int
)
as
begin
	update mediacoes
	set
	id_agendamento = @id_agendamento,
	numero = @numero,
	tema_conflito = @tema_conflito,
	data_mediacao = @data_mediacao,
	id_mediador = @id_mediador,
	id_tipo_registro = @id_tipo_registro,
	objeto = @objeto,
	id_local = @id_local,
	documento_link = @documento_link,
	status = @status,
	resolucao = @resolucao,
	id_cidade = @id_cidade
	where id = @id;
end
go

alter view v_historico_mediacoes as
select
	m.id,
	m.numero Numero, 
	m.tema_conflito TemaConflito, 
	m.data_mediacao DataMediacao, 
	t.descricao DescricaoTipoRegistro,
	m.id_local, m.id_cidade, m.id_mediador
from mediacoes m
join tipos_registro t on (m.id_tipo_registro = t.id)
go

select * from v_historico_mediacoes

-- REGISTRAR NO AGENDAMENTO O MEDIADOR QUE INSERIU
select * from agendamentos
select * from mediadores

alter table agendamentos add id_mediador int not null references mediadores(id);
alter table agendamentos add id_local int not null references locais(id);
alter table agendamentos add ativo bit not null default 1;

alter procedure alteraAgendamento
(
	@id int,
	@id_solicitacao int,
	@descricao varchar(50),
	@data_inicial date,
	@data_final date,
	@id_mediador int,
	@id_local int,
	@ativo bit
)
as
begin
	update agendamentos
	set
	id_solicitacao = @id_solicitacao,
	descricao = @descricao,
	data_inicial = @data_inicial,
	data_final = @data_final,
	id_mediador = @id_mediador,
	id_local = @id_local,
	ativo = @ativo
	where id = @id;
end
go

-- ============= REGISTRAR MEDIADOR ATIVO E INATIVO
-- ============= REGISTRAR O ALCANCE DA PERMISSÃO DE CADA MEDIADOR
alter table mediadores add ativo bit not null default 1
alter table mediadores add alcance varchar(9)
alter table mediadores add RE varchar(8)

alter table mediadores alter column RE varchar(8) not null
alter table mediadores add unique (RE)

ALTER TRIGGER tg_insere_mediador 
ON mediadores 
INSTEAD OF INSERT 
AS 
	INSERT INTO mediadores 
	(nome,patente,id_local,usuario,nivel_permissao,ativo,alcance,RE,senha)
	SELECT
	 nome,patente,id_local,usuario,nivel_permissao,ativo,alcance,RE,
	 SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5', senha)), 3, 32)
	 FROM inserted
GO

alter procedure alteraMediador
(
	@id int,
	@nome varchar(100),
	@patente varchar(50),
	@id_local int,
	@usuario varchar(50),
	@senha varchar(50),
	@ativo bit,
	@nivel int,
	@alcance varchar(9),
	@RE varchar(8)
)
as
begin
	update mediadores
	set
	nome = @nome,
	patente = @patente,
	id_local = @id_local,
	usuario = @usuario,
	senha = @senha,
	ativo = @ativo,
	nivel_permissao = @nivel,
	alcance = @alcance,
	RE = @RE
	where id = @id;
end
go

alter view v_mediadores
as
	select m.id ID, m.nome Nome, m.patente Patente, l.descricao Nucleo, M.ativo Ativo, M.alcance Alcance, m.RE
	from mediadores m
	left join locais l on (m.id_local = l.id)
go

select * from v_mediadores

alter procedure cadMediador
(
	@nome varchar(100),
	@patente varchar(100),
	@id_local int,
	@usuario varchar(50),
	@senha varchar(50),
	@ativo bit,
	@nivel int,
	@alcance varchar(9),
	@RE varchar(8)
)
as
begin
	insert into mediadores
	(nome, patente, id_local, usuario, senha, ativo, nivel_permissao, alcance, RE)
	values
	(@nome,@patente,@id_local,@usuario,@senha,@ativo,@nivel,@alcance,@RE)
end
go

------------ AJUSTE NA TABELA LOCAIS
alter table locais add numero_opm varchar(9)
-- após inserir, é necessário atualizar a tabela com os números de todos os locais, pois
-- o campo deve ser alterado para único e não nulo (unique not null)
alter table locais alter column numero_opm varchar(9) not null
alter table locais add unique(numero_opm)

select * from locais

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
	@telefone varchar(20),
	@ativo bit,
	@numero_opm varchar(9)
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
	telefone = @telefone,
	ativo = @ativo,
	numero_opm = @numero_opm
	where id = @id;	
end
go

alter view v_nucleos
as
	select l.id ID, l.numero_opm, l.nome Nome, l.descricao 'Descricao', c.nome 'Cidade',	l.bairro Bairro,
			l.logradouro Logradouro, l.telefone Telefone, l.numero 'Numero', l.ativo
	from locais l
	left join cidades c on (l.id_cidade = c.id)
go

alter view v_locais_endereco
as
	select L.id 'ID' , L.numero_opm , ( L.descricao + ', ' + L.bairro + ', ' + C.nome ) 'DESCRICAO'
	from locais L
	join cidades C on ( C.id = L.id_cidade )
	where L.ativo = 1
go

select * from v_locais_endereco

--=================================================================================================
--= Modificar a constraint CHECK do STATUS para ([status]=(0) OR [status]=(1)) tabela MEDIACOES ===
--=================================================================================================


------------- ACOMPANHAMENTOS -------------

create table acompanhamentos
(
	id int not null primary key identity,
	id_mediacao int not null references mediacoes(id),
	data datetime not null,
	verificacao varchar(1000),
	id_mediador int not null references mediadores(id),
	ativo bit not null default 1
);

