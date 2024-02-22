							-- ** Criando tabelas ** --

-- Tabela Usuários
CREATE TYPE enum_conta AS ENUM ('Idoso', 'Familiar', 'Prestador');

CREATE TABLE usuarios (
	id serial PRIMARY KEY, 
	cpf char(11) UNIQUE,
	nome varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	senha varchar(100) NOT NULL,
	data_nascimento date NOT NULL,
	tipo_conta enum_conta,
	id_responsavel serial,
	contato_emergencia varchar(20),
	data_cadastro timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	ultima_atualizacao timestamp WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
)
	

-- Triggers atualização de alteração na tabela usuarios.
CREATE OR REPLACE FUNCTION update_ultima_atualizacao()
RETURNS TRIGGER AS $$
BEGIN
    NEW.Ultima_Atualizacao = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_ultima_atualizacao_before_update
BEFORE UPDATE ON Usuarios
FOR EACH ROW
EXECUTE FUNCTION update_ultima_atualizacao();



-- Tabela Prestadores
CREATE TABLE prestadores (
	id serial PRIMARY KEY,
	descricao varchar(200),
	documento_aprovado boolean,
	apto_servico_especifico boolean,
	avaliacao_media decimal(3, 2),
	total_avaliacoes integer,
	id_usuarios serial references usuarios(id) -- FK
)


-- Triggers atualização de alteração na tabela prestadores.
CREATE TRIGGER update_ultima_atualizacao_before_update
BEFORE UPDATE ON prestadores
FOR EACH ROW
EXECUTE FUNCTION update_ultima_atualizacao();


-- Tabela Endereços
CREATE TYPE enum_origem AS ENUM ('usuarios', 'servicos');

CREATE TABLE enderecos (
	id serial PRIMARY KEY,
	tabela_origem enum_origem,
	id_origem serial,          
	cep varchar(9),
	logradouro varchar(100),
	bairro varchar(50),
	numero varchar(10),
	complemento varchar(100)
)

-- Triggers atualização de alteração na tabela enderecos.
CREATE TRIGGER update_ultima_atualizacao_before_update
BEFORE UPDATE ON enderecos
FOR EACH ROW
EXECUTE FUNCTION update_ultima_atualizacao();
	
	
	
-- Tabela Serviços
CREATE TABLE servicos (
	id serial PRIMARY KEY,
	nome varchar(100),
	descricao varchar(200),
	preco money,
	duracao_estimada time,
	tipo varchar(50),
	
	id_prestadores serial references prestadores(id) -- FK
)	

-- Triggers atualização de alteração na tabela servicos.
CREATE TRIGGER update_ultima_atualizacao_before_update
BEFORE UPDATE ON servicos
FOR EACH ROW
EXECUTE FUNCTION update_ultima_atualizacao();



-- Tabela Agendamentos
CREATE TABLE agendamentos (
	id serial PRIMARY KEY,
	data_atendimento_inicio timestamp,
	data_atendimento_fim timestamp,
	estado_agendamento varchar(50),
	valor_pago money,
	
	id_usuarios serial references usuarios(id), -- FK
	id_servicos serial references servicos(id) -- FK
)

-- Triggers atualização de alteração na tabela agendamentos.
CREATE TRIGGER update_ultima_atualizacao_before_update
BEFORE UPDATE ON agendamentos
FOR EACH ROW
EXECUTE FUNCTION update_ultima_atualizacao();



-- Tabela Avalicações
CREATE TABLE avaliacoes (
	id serial PRIMARY KEY,
	avaliacao integer,
	tipo_avaliacao varchar(50),
	
	id_agendamentos serial references agendamentos(id) -- FK
)
		
		

-- Triggers atualização de alteração na tabela agendamentos.
CREATE OR REPLACE FUNCTION update_average_rating()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Prestadores
    SET avaliacao_media = (SELECT AVG(Avaliacao) FROM Avaliacoes WHERE ID_Prestadores = NEW.ID_Prestadores),
        total_avaliacoes = (SELECT COUNT(*) FROM Avaliacoes WHERE ID_Prestadores = NEW.ID_Prestadores)
    WHERE ID = NEW.ID_Prestador;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_average_rating
AFTER INSERT OR UPDATE ON avaliacoes
FOR EACH ROW EXECUTE FUNCTION update_average_rating();	

							