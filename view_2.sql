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
