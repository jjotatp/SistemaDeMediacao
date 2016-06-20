create procedure alteraCidade
(
	@id int,
	@nome varchar(100),
	@estado varchar(100)
)
as
begin
	update cidades set nome = @nome, estado = @estado
	where id = @id
end
go

--------------------------------------------------------------

create procedure alteraLocal
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
	@ativo bit
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
	ativo = @ativo
	where id = @id;	
end
go


create procedure alteraMediador
(
	@id int,
	@nome varchar(100),
	@patente varchar(50),
	@id_local int,
	@usuario varchar(50),
	@senha varchar(50),
	@nivel int
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
	nivel_permissao = @nivel
	where id = @id;
end
go

create procedure alteraSolicitacoes
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


create procedure alteraTipoRegistro
(
	@id int,
	@descricao varchar(50)
)
as
begin
	update tipos_registro
	set
	descricao = @descricao
	where id = @id;
end
go

create procedure alteraMediacao
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
	@resolucao char(1)
)
as
begin
	update mediacoes
	set
	@id_agendamento = @id_agendamento,
	numero = @numero,
	tema_conflito = @tema_conflito,
	data_mediacao = @data_mediacao,
	id_mediador = @id_mediador,
	id_tipo_registro = @id_tipo_registro,
	objeto = @objeto,
	id_local = @id_local,
	documento_link = @documento_link,
	status = @status,
	resolucao = @resolucao
	where id = @id;
end
go

create procedure alteraAgendamento
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


create procedure alteraPessoa
(
	@cpf varchar(14),
	@rg varchar(12),
	@nome varchar(100),
	@status_civil varchar(20),
	@profissao varchar(50),
	@nascimento_data date,
	@nascimento_cidade int,
	@sexo char(1),
	@nome_pai varchar(100),
	@nome_mae varchar(100),
	@endereco_logradouro varchar(100),
	@endereco_numero varchar(10),
	@endereco_bairro varchar(50),
	@endereco_cidade int,
	@telefone varchar(20)
)
as
begin
	update pessoas
	set
	rg = @rg,
	nome = @nome,
	status_civil = @status_civil,
	profissao = @profissao,
	nascimento_data = @nascimento_data,
	nascimento_cidade = @nascimento_cidade,
	sexo = @sexo,
	nome_pai = @nome_pai,
	nome_mae = @nome_mae,
	endereco_logradouro = @endereco_logradouro,
	endereco_numero = @endereco_numero,
	endereco_bairro = @endereco_bairro,
	endereco_cidade = @endereco_cidade,
	telefone = @telefone
	where cpf = @cpf;
end
go

create procedure alteraNoticia
(
	@id int,
	@imagem_nome varchar(50),
	@imagem_caminho varchar(max),
	@titulo_postagem varchar(50),
	@corpo_noticia varchar(500),
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

create procedure alteraCasosMediacao
(
	@id_tipo_registro int ,
	@titulo varchar(50) ,
	@descricao varchar(100) ,
	@imagem_nome varchar(50),
	@imagem_caminho varchar(max),
	@id_mediador int,
	@prioridade int,
	@data datetime
)
as
begin
	update casos_mediacao
	set
	titulo = @titulo,
	descricao = @descricao,
	imagem_nome = @imagem_nome,
	imagem_caminho = @imagem_caminho,
	id_mediador = @id_mediador,
	prioridade = @prioridade,
	data = @data
	where
	id_tipo_registro = @id_tipo_registro
end
go

create procedure alteraDepoimento
(
	@id int,
	@nome varchar(30),
	@idade int,
	@descricao varchar(200),
	@id_mediador int,
	@data datetime,
	@status int
)
as
begin
	update depoimentos
	set 
	nome = @nome,
	idade = @idade,
	descricao = @descricao,
	id_mediador = @id_mediador,
	data = @data,
	status = @status
	where id = @id;	
end
go

--================================================

select * from mediadores

create procedure cadMediador
(
	@nome varchar(100),
	@patente varchar(100),
	@id_local int,
	@usuario varchar(50),
	@senha varchar(50),
	@nivel int
)
as
begin
	insert into mediadores
	(nome, patente, id_local, usuario, senha, nivel_permissao)
	values
	(@nome,@patente,@id_local,@usuario,@senha,@nivel)
end
go

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