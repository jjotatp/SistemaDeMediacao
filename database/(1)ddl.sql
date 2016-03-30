create database med_admin
go

use med_admin
go

create table cidades
(
	id int not null primary key identity,
	nome varchar(100) not null,
	estado char(2) not null
);

create table locais
(
	id int not null primary key identity,
	nome varchar(100) not null,
	descricao varchar(50) not null,
	id_cidade int not null references cidades(id),
	bairro varchar(50) not null,
	logradouro varchar(100) not null,	
	numero varchar(10) not null,
	CEP varchar(15) not null,
	data_inicio_atividade date,
	telefone varchar(20),
	ativo bit not null 
);

create table mediadores
(
	id int not null primary key identity,
	nome varchar(100) not null,
	patente varchar(50),
	id_local int not null references locais(id),
	usuario varchar(50) unique not null,
	senha varchar(50) not null
);

create table solicitacoes
(
	id int not null primary key identity,
	data date not null,
	descricao_problema varchar(50) not null,
	descricao_caso varchar(250) not null,
	solicitante_nome varchar(100) not null,
	solicitante_telefone varchar(20),
	solicitante_endereco varchar(100),
	solicitante_email varchar(50),
	solicitante_periodo_atendimento char(1),
	check (solicitante_periodo_atendimento in ('M','T','N')),
	detalhes_partes varchar(200) not null,
	id_local int references locais(id),
	id_cidade_abertura int not null references cidades(id)
);

create table tipos_registro
(
	id int not null primary key identity,
	descricao varchar(50) not null
);

create table mediacoes
(
	id int not null primary key identity,
	id_solicitacao int references solicitacoes(id),
	numero varchar(20),
	tema_conflito varchar(50),	
	data_mediacao date not null,
	id_mediador int not null references mediadores(id),
	id_tipo_registro int not null references tipos_registro(id),
	objeto varchar(max),
	id_local int not null references locais(id),
	documento_link varchar(100),
	status int not null,
	resolucao char(1),
	check (status in (1,2)),
	check (resolucao in ('A','D')) -- Acordo e Disacordo
);

create table agendamentos
(
	id int not null primary key identity,
	id_solicitacao int references solicitacoes(id),
	descricao varchar(50),
	data_inicial datetime not null,
	data_final datetime not null
);

create table pessoas
(
	cpf varchar(14) not null primary key,
	rg varchar(12) not null,
	nome varchar(100) not null,
	status_civil varchar(20),
	profissao varchar(50),
	nascimento_data date,
	nascimento_cidade int references cidades(id),
	sexo char(1),
	nome_pai varchar(100),
	nome_mae varchar(100),
	endereco_logradouro varchar(100),
	endereco_numero varchar(10),
	endereco_bairro varchar(50),
	endereco_cidade int references cidades(id),
	telefone varchar(20)
);

create table mediacao_partes
(
    mediacao_id int not null references mediacoes(id),
    pessoa_id varchar(14) not null references pessoas(cpf),
	primary key(mediacao_id,pessoa_id),
	descricao_caso varchar(250)
);

create table noticias
(
	id int not null primary key identity,
	imagem_nome varchar(50) not null,
	imagem_caminho varchar(max) not null,
	data_postagem datetime not null,
	titulo_postagem varchar(50) not null,
	corpo_noticia varchar(500) not null,
	id_mediador int not null references mediadores(id),
	id_local int not null references locais(id)
);

