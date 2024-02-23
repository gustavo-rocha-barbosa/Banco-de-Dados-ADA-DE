-- View 1.
--1) View para o usuário Idoso poder ver os agendamentos que vão ocorrer no futuro próximo, 
-- que estão com status agendado.

CREATE VIEW agendamentos_idoso_id5 AS (
	SELECT
		data_atendimento_inicio as "Data e Hora Atendimento",
		estado_agendamento as "Estado Agendamento",
		valor_pago as "Valor Pago",
		tipo as "Serviço contratado",
		usuarios.nome as "Nome Prestador",
		contato_emergencia as "Telefone Prestador"
	FROM
		agendamentos
	INNER JOIN
		servicos on agendamentos.id_servicos = servicos.id
	INNER JOIN
		prestadores on servicos.id_prestadores = prestadores.id
	INNER JOIN
		usuarios on prestadores.id_usuarios = usuarios.id
	WHERE
		agendamentos.id_usuarios = 5
)

-- Caso a view tenha poucas linhas de código, é possível adicionar novos registros de agendamentos
-- Para aumentar a quantidade de linhas 
-- SOMENTE PARA TESTES - caso real aguardamos a população dos dados de acordo com os usuários

-- Adicionar mais 2 agendamentos para o idoso de id 5.s
INSERT INTO agendamentos (
	data_atendimento_inicio,
	data_atendimento_fim,
	estado_agendamento,
	valor_pago,
	id_usuarios,
	id_servicos,
)
VALUES
	('2024-01-15 15:30:00',
	'2024-01-15 16:50:00',
	 'Agendado',
	 150.50,
	 5,
	 10313
	),
	('2023-12-25 10:30:00',
	'2023-12-25 12:50:00',
	 'Agendado',
	 100,
	 5,
	 10313
	)

-- Atualiza prestador para cadastro mais antigo.
UPDATE
	usuarios
SET
	data_cadastro = '2024-01-01 12:00:00'
WHERE
	id = 952