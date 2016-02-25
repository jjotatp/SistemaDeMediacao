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
	@cidade int,
	@bairro varchar(50),
	@tipo_logradouro varchar(20),
	@logradouro varchar(100) ,
	@numero varchar(10) ,
	@CEP varchar(15) ,
	@data_inicio_atividade date
)
as
begin
	update locais 
	set 
	nome = @nome,
	descricao = @descricao,
	cidade = @cidade,
	bairro = @bairro,
	tipo_logradouro = @tipo_logradouro,
	logradouro = @logradouro,
	numero = @numero,
	cep = @cep,
	data_inicio_atividade = @data_inicio_atividade
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
	@senha varchar(50)
)
as
begin
	update mediadores
	set
	nome = @nome,
	patente = @patente,
	id_local = @id_local,
	usuario = @usuario,
	senha = @senha
	where id = @id;
end
go

create procedure alteraSolicitacoes
(
	@id int,	
	@descricao_problema varchar(50),
	@descricao_caso varchar(250),
	@solicitante_nome varchar(100) ,
	@solicitante_telefone varchar(20),
	@solicitante_endereco varchar(100),
	@solicitante_email varchar(50),
	@solicitante_periodo_atendimento char(1),
	@detalhes_partes varchar(200) ,
	@id_local int
)
as
begin
	update solicitacoes
	set	
	descricao_problema = @descricao_problema,
	descricao_caso = @descricao_caso,
	solicitante_nome = @solicitante_nome,
	solicitante_telefone = @solicitante_telefone,
	solicitante_endereco = @solicitante_endereco,
	solicitante_email = @solicitante_email,
	solicitante_periodo_atendimento = @solicitante_periodo_atendimento,
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
	@id_solicitacao int ,
	@numero varchar(20),
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
	id_solicitacao = @id_solicitacao,
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
	@data date
)
as
begin
	update agendamentos
	set
	id_solicitacao = @id_solicitacao,
	descricao = @descricao,
	data = @data
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

