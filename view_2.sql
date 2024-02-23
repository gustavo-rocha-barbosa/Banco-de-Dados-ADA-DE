-- View 2.
-- 2) Familiar visualizar os prestadores por tempo de cadastro no banco.
-- Organizados pelos mais antigos no banco aos mais novos.
CREATE OR REPLACE VIEW prestadores_tempo_cadastro AS
SELECT
	nome AS "Nome Prestador",
	documento_aprovado AS "Aprovado",
	contato_emergencia AS "Contato Prestador",
	ROUND((CURRENT_DATE - data_nascimento) / 365, 0) AS "Idade",
	ROUND((CURRENT_DATE - data_cadastro::date) / 30, 0) AS "Tempo de Cadastro (Meses)"
FROM
	prestadores
INNER JOIN
	usuarios ON prestadores.id_usuarios = usuarios.id
WHERE
	documento_aprovado = True
ORDER BY
	"Tempo de Cadastro (Meses)" DESC;
	
SELECT * FROM prestadores_tempo_cadastro

-- Caso a execução de todos os programas for feita no mesmo dia da criação da view,
-- teremos a coluna Tempo de Cadastro toda zerada, para corrigir isto, segue a query de update abaixo
-- Com dados mais "antigos" para exitir uma diferença nas datas.

-- Coloca uma data de cadastro mais antiga.
UPDATE 
	usuarios
SET
	data_cadastro = '2024-01-01 10:12:19.113167'
WHERE
	id = 0

UPDATE 
	usuarios
SET
	data_cadastro = '2023-10-01 10:12:19.113167'
WHERE
	id = 1
	
	
UPDATE 
	usuarios
SET
	data_cadastro = '2023-05-01 10:12:19.113167'
WHERE
	id = 2
	

UPDATE 
	usuarios
SET
	data_cadastro = '2024-02-01 10:12:19.113167'
WHERE
	id = 3
	
	
UPDATE 
	usuarios
SET
	data_cadastro = '2023-12-01 10:12:19.113167'
WHERE
	id = 4


