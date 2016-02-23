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
	@id_local int,
	@status_agendamento int
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
	id_local = @id_local,
	status_agendamento = @status_agendamento
	where id = @id;
end
go