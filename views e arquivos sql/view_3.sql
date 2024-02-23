-- View 3:

--  View para o Prestador ver quantos atendimentos ele realizou com sucesso, 
-- e qual retorno isso gerou para ele. 
-- (essa informação do retorno, talvez não tenhamos, mas podemos criar apartir do custo). 
-- Quando criamos a columa custo ela é o preço que o idoso paga? 
-- Se for isso, podemos "abater" um fee de 30% por exemplo, 
-- e fazer o calculo da remuneração do prestado.

CREATE OR REPLACE VIEW receita_prestador_por_nome AS (
	SELECT 
		sum(valor_pago) as custo_total_servico,
		nome,
		sum(valor_pago)*(0.3) as receita_servico

	FROM 
		agendamentos

	INNER JOIN 
		usuarios on agendamentos.id_usuarios = usuarios.id

	WHERE 
		tipo_conta = 'Prestador' AND estado_agendamento = 'Confirmado'

	GROUP BY nome
)

-- Verificar a view 3:

SELECT * FROM receita_prestador_por_nome

	