# Banco-de-Dados-ADA-DE

### Este repositório tem a intenção de apresentar um Banco de Dados fictício de um modelo de negócio de aplicativo de auxílio ao idoso chamado Silver Friend.

### *Mais detalhes acerca do modelo de negócio acesse o .pdf: Modelo de Negócio_ Plataforma de Serviços - SilverFriend*

### O Banco de Dados se encontra no servidor do ElephantSQL:

Server: silly.db.elephantsql.com (silly-01)

User & Default database: waphgntt

Password: KMEpmisBznZtnXM-qVNVI9FW4QQVPJ49

URL: postgres://waphgntt:***@silly.db.elephantsql.com/waphgntt

---------------------------------------------------------------------------------------------------------------------------------------------------------

### Sobre a estrutura do Banco de Dados - Modelo Entidade-Relacionamento (MER) - Normalizado:

![MER - Normalizado - Silver Friend](modelo_banco_dados.png)

---------------------------------------------------------------------------------------------------------------------------------------------------------
### Sobre os arquivos neste repositório:

**Descritivo_Projeto_Banco_Dados.pdf** - Aqui se encontram as informações a respeito da problemática da ADA da turma de Engenharia de Dado da Disciplina Banco de de Dados do ano de 2024.

**pop-bd.ipynb** - É um arquivo em Pyhton que é capaz de fornecer os outputs de arquivos .sql para cada tabela existente no Banco de Dados apresentado, sendo assim, cada linha de código é capaz de popular o banco de dados Silver Friend com dados fictícios - Foi feita uma escolha de ter os outputs .sql para questões de permissões - Existe também uma possibilidade de popular o Banco de Dados via .csv neste código (apenas a tabela de usuários neste caso em .csv).

**criando_tabelas.sql** - É um arquivo que contém um conjunto de queries que criam as tabelas para o Banco de Dados, deve ser executado de antemão aos arquivos gerados por "pop-bd.ipynb". Aqui existem alguns triggers também que adicionam dados às tabelas referente às datas de atualização e inserção de novos dados.

**Dentro da pasta <<>> dados mockados:**

**script_insert.sql** - É o arquivo de output de "pop-bd.ipynb" referente à tabela de usuários.

**script_insert_agendamento.sql** -  o arquivo de output de "pop-bd.ipynb" referente à tabela de agendamentos.

**script_insert_avaliacoes.sql** -  o arquivo de output de "pop-bd.ipynb" referente à tabela de avaliacoes.

**script_insert_enderecos.sql** -  o arquivo de output de "pop-bd.ipynb" referente à tabela de endereços.

**script_insert_prestador.sql** -  o arquivo de output de "pop-bd.ipynb" referente à tabela de prestadores.

**script_insert_servico.sql** -  o arquivo de output de "pop-bd.ipynb" referente à tabela de servicos.

------------------------------------------------------------------------------------------------------------

No projeto também há um enunciado de criação de 3 views principais para responder algumas perguntas sobre o modelo de negócios de Silver Friend:

As perguntas são:

1) View para o usuário Idoso poder ver os agendamentos que vão ocorrer no futuro próximo, que estão com status agendado. - **Se encontra dentro da pasta: views, no arquivo: view_1.sql**

2) View para o usuário Parente de Idoso poder ver os prestadores ranqueados por avaliação. - **Se encontra dentro da pasta: views, no arquivo: view_2.sql**

3) View para o Prestador ver quantos atendimentos ele realizou com sucesso, e qual retorno isso gerou para ele. (essa informação do retorno, talvez não tenhamos, mas podemos criar apartir do custo). Quando criamos a columa custo ela é o preço que o idoso paga? Se for isso, podemos "abater" um fee de 30% por exemplo, e fazer o calculo da remuneração do prestado. - **Se encontra dentro da pasta: views, no arquivo: view_3.sql**

### FIM.
