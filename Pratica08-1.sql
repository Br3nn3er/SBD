/* 
Prática 05: exercícios 16 ao 19

Orientações:
(1) Consulte o esquema 'banco' disponível no Moodle para resolver a prática. Para manipulação de datas é necessário consultar o manual do PostgreSQL:
a. http://www.postgresql.org/docs/8.4/static/functions-datetime.html
b. http://pgdocptbr.sourceforge.net/pg80/functions-datetime.html

(2) Operador para concatenar strings: ||

(3) As consultas devem estar indentadas

(4) Deve ser entregue a consulta SQL juntamente com o resultado da consulta. Tudo em um arquivo texto com extensão .sql. 
Exemplo:

*
-- 9) Mostrar todos os alunos
*/
SELECT * FROM aluno;
/*
"Celso";2345;22;"Sao Carlos"
"Pedro";2344;27;"Sao Carlos"
"Cicero";3456;22;"Araraquara"
"Carlitos";4567;21;"Ibitinga"
"Catarina";5678;23;"Sao Carlos"
"Cibele";6789;21;"Araraquara"
"Corina";7890;25;"Rio Claro"
"Celina";8901;23;"Sao Carlos"
"Celia";9012;20;"Rio Claro"
"Cesar";123;21;"Araraquara"
"Carlos";1234;21;"Sao Carlos"
*/
/*
10) Mostrar todos os professores
*/
SELECT *
FROM PROFESSOR;
/*
"Ari";"1111 ";"MS-1 ";25
"Adao";"2222 ";"MS-2 ";30
"Anselmo";"3333 ";"MS-2 ";31
"Amalia";"8888 ";"MS-3 ";39
"Ana";"4444 ";"MS-3 ";31
"Alice";"5555 ";"MS-3 ";35
"Amauri";"6666 ";"MS-3 ";34
"Artur";"7777 ";"MS-4 ";41
"Adriana";"9999 ";"MS-5 ";45
*/


--1) Consultas simples usando SELECT 
    SELECT 2+2
	/* 4 */
	SELECT 'A'
	/* A */
	SELECT 50 > 3
	/* t */
	SELECT '11/10/2020'
	/* 11/10/2020 */
	SELECT '11/10/2020' - '11/10/2030' -- é possível esse comando?
	/* não é possível */

	
	
--2) Consultas simples usando SELECT e renomeando colunas
    SELECT 2+2 AS soma
	SELECT 'A' as letra
	SELECT 50 > 3 as resultado
	SELECT '11/10/2020' as dia -- qual o tipo retornado?

--3) Consultas usando SELECT * FROM usando uma tabela do banco
     --- (a) Listar todos os clientes do banco
     --- (b) Listar todos os funcionários
     --- (c) Listar todas as agências

--4) Consultas usando SELECT <coluna> FROM
     --- (a) Listar o código e o nome de todas as agências
     --- (b) Listar todos os estados em que existem agências. Verificar se há repetições e, se houver, explicar o porquê.
     --- (c) Listar todos os estados em que existem agências. Na resposta não deve haver repetição

--5) Consultas com SELECT <coluna> AS <novo_nome> FROM
     --- (a) Listar todos os estados, trocando, no resultado, o nome do atributo para "UF" (Unidade da Federação)
     --- (b) Listar todas as agências, renomeando as colunas de saída como agencia(cod,nome,cidade,uf)

--6) Consultas com SELECT FROM WHERE - com uma condição de seleção
     --- (a) Listar todos os clientes de 'Uberlândia'
     --- (b) Listar todas as operações bancárias com valores superiores à R$5000,00 
     --- (c) Listar todas as contas que não são acessadas há mais de um ano     
     --- (d) Mostre as datas (somente o dia e o mês) das operações bancárias que ocorreram neste ano 
     --- (e) Listar todas as operações bancárias que ocorreram hoje (a consulta deve ser genérica - ver current_date)
     --- (f) Listas os funcionários que foram contratados nos últimos 3 anos 
         --    (essa consulta deve ser genérica – você não deve explicitar nenhuma data)
     --- (g) Listar todos os funcionários que não possuem supervisores
	 --- (h) Listar todos os funcionários que possuem supervisores
 
--7) Consultas com SELECT FROM WHERE - com duas ou mais condições de junção e com condição de seleção
     --- (a) Listar todos os clientes de 'Uberlândia' e cujo nome inicia com a letra 'B'
     --- (b) Listar todas as operações bancárias com valores superiores à R$5000,00 do tipo crédito
     --- (c) Listar todas as contas com saldo menor que 300 e que não são acessadas há mais de um ano   
     --- (e) Listar todas as operações bancárias que ocorreram hoje (a consulta deve ser genérica - ver current_date)
     --- (f) Listar os funcionários que foram contratados nos últimos 3 anos 
         --    (essa consulta deve ser genérica – você não deve explicitar nenhuma data)

-- 8) CONSULTAS COM JUNÇÕES ENVOLVENDO DUAS TABELAS 
    -- >> Atenção: Colocar a condição de junção no WHERE
	-- (a) Listar o número funcional e o nome de todos os funcionarios juntamente com todos os seus dependentes
	-- (b) Listar os nomes dos funcionários e os municípios em que eles trabalham
	-- (c) Listar os nomes do clientes juntamente com as informações de suas contas (código da agência e número da conta)
	
-- 9) CONSULTAS COM JUNÇÕES ENVOLVENDO DUAS OU MAIS TABELAS 
    -- >> Atenção: Colocar a condição de junção no WHERE
    -- (a) Liste o nome do cliente e o saldo em sua conta corrente
    -- (b) Liste o nome do cliente juntamente com o nome do seu gerente e o nome da agência que o supervisor trabalha
	-- (c) Liste os nomes dos clientes que fizeram operações acima de R$ 20.000,00
	
-- 10) CONSULTAS COM JUNÇÕES ENVOLVENDO DUAS TABELAS  
    -- >> Atenção: colocar a condição de junção no FROM e demais condição no WHERE
    -- (a) Listar o número funcional e o nome de todos os funcionarios juntamente com todos os seus dependentes
	-- (b) Listar os nomes dos funcionários e os municípios em que eles trabalham
	-- (c) Listar os nomes do clientes juntamente com as informações de suas contas (código da agência e número da conta)
	
-- 11) CONSULTAS COM JUNÇÕES ENVOLVENDO DUAS OU MAIS TABELAS  
    -- >> Atenção: colocar a condição de junção no FROM e demais condição no WHERE
    -- (a) Liste o nome do cliente e o saldo em sua conta corrente
    -- (b) Liste o nome do cliente juntamente com o nome do seu gerente e o nome da agência que o supervisor trabalha
	-- (c) Liste os nomes dos clientes que fizeram operações acima de R$ 20.000,00

	
-- 12) CONSULTAS ENVOLVENDO JUNÇÕES COM UM RELAÇÃO SENDO USADA MAIS DE UMA VEZ
    -- (a) Listar o nome do funcionário juntamente com o *nome* de seu supervisor. 
	--     Renomei o nome dos atributos da relação resultante para nome_funcionario e nome_supervisor, respectivamente.
	-- (b) Listar os nomes dos funcionários que foram admitidos antes que seus supervisores
	-- (c) Listar os nomes dos funcionários que trabalham em agências distintas das agências de seus supervisores
	-- (d) Listar os nomes dos funcionários que trabalham em agências localizadas em estados distintos das agências de seus supervisores

	
-- 13) CONSULTAS COM OPERADOR 'IN' / 'NOT IN' / <> ou !=
    -- (a) Listar o nome dos funcionários que não são gerentes
	-- (b) Listar o nome dos clientes que não possuem conta
	-- (c) Listar as agências que não possuem conta
	-- (d) Listar as contas bancárias sem operações bancárias (dica: use parênteses nos atributos envolvidos no WHERE)
	-- (e) Verificar se existem contas bancárias sem clientes (dica: use parênteses nos atributos envolvidos no WHERE)
	-- (f) Listar o nome dos funcionários que trabalham em agências de 'SP' e 'MS' que não são gerentes
	-- (g) Verificar se existe clientes que possuem contas em agências distintas da agência de trabalho de seus gerentes
	-- (h) Listar os clientes que possuem contas vinculadas a agências situadas cidades distintas das cidades dos clientes.
	
-- 14) CONSULTAS COM FUNÇÕES DE AGREGAÇÃO
    -- > Dica: construa a consulta sem a função de agregação e observe os dados para verificar se atendem ao enunciado.
	--         em seguida aplica a função de agregação
    -- (a) Mostrar a data e hora da operação mais recente do banco
	-- (b) Mostrar o saldo médio de todas as contas
	-- (c) Mostrar a média e o desvio padrão do saldo considerando todas as contas
	-- (d) Mostrar a quantidade de clientes do banco
	-- (e) Mostrar a quantidade de agências do estado de 'SP'
	-- (f) Mostrar a quantidade de funcionários que são supervisionados por alguém
	-- (g) Mostrar a quantidade de funcionários que são supervisores
	-- (h) Mostrar a quantidade de funcionários que não são supervisores
	-- (i) Mostrar os nomes e telefones do(s) funcionário(s) mais antigo
	-- (j) Mostrar os nomes e telefones do(s) funcionário(s) mais antigo que trabalha(m) no estado de 'SP'
	-- (k) Mostrar a quantidade total de dependentes dos funcionarios que trabalham em agências de 'SE'
	-- (l) Mostrar a quantidade de supervisores que trabalham em agências do 'RJ'

-- 15) CONSULTAS COM OUTER JOINS
    -- (a) Listar o nome do funcionário juntamente com o nome de seus dependentes. Caso o funcionário tenha mais de um dependente
    --       ele constará na resposta mais de uma vez (uma vez para cada dependente). Caso o funcionário não tenha dependentes, ele
	--       também deve aparecer na resposta
	-- (b) Listar todos os nomes dos clientes juntamente com as contas correntes (agência e número) -- se o cliente não possuir conta
	--      ele também deve aparecer na resposta. No lugar da agência deve aparecer a mensagem ('<cliente sem conta>') -- dica: COALESCE()
	-- (c) Listar o nome do funcionário juntamente com o *nome* de seu supervisor. 
	--     Renomei o nome dos atributos da relação resultante para nome_funcionario e nome_supervisor, respectivamente.
	--     Se um funcionário não possuir supervisor, ele deve aparecer na resposta também
	-- (d) Para todos os gerentes, mostrar o nome do funcionário, a cidade de sua agência e seus dependentes (quando houver).
	-- (e) Utilizando OUTER JOIN, listar as contas bancárias sem operações bancárias. 
	-- (f) Utilizando OUTER JOIN, verificar se existem contas bancárias sem clientes. 
	-- (g) Utilizando OUTER JOIN, listar o nome dos funcionários que trabalham em agências de 'SP' e 'MS' que não são gerentes.
	
-- 16) CONSULTAS USANDO AGRUPAMENTOS SIMPLES
    --> Em todas as questões as respostas devem ser sem repetições. Em muitos casos o DISTINCT resolveria
        -- a questão, mas para as questões abaixo não use o DISTINCT.
	-- (a) Listar todos os estados que possuem agências.
	-- (b) Listar todos os tipos de operações que existem.
	-- (c) Listar todos os CPFs de clientes. Comparar o tamanho da resposta com o número de clientes e justificar.
	-- (d) Listar todos os estados e municípios que possuem agências.
	-- (e) Listar todas as datas de nascimento, cidade e estado dos clientes
	-- (f) Listar todos os municípios que possuem agências dos estados de 'SP' e 'MG'
    -- (g) Listar todos as agências (código da agência) que não possuem funcionários que são gerentes de clientes.
	
-- 17) CONSULTAS COM AGRUPAMENTOS E FUNÇÕES AGREGADAS
    -- (a) Listar a quantidade de funcionários por agência (mostrar o código da agência e o número de funcionários)
	SELECT agencia.nome, COUNT(funcionario) AS "Qntd_func" FROM funcionario, agencia 
	WHERE funcionario.agencia = agencia.codigo 
	GROUP BY agencia.nome;
	/*	"Brasileia";2
"AVENIDA JOAO NAVES";4
"Banco do Brasil Bairro Arapoanga";2
"Castelo";2
"Agência Franca";5
"Aracaju";2
"Pinheiros";2
"Agência Presidente Vargas";7
"Guarapari";2
"BB Asa Sul 406";1
"Jardins-se";2
"BB Aeroporto Internacional de Brasilia";1
"Santa Efigencia";5
"Acrelandia";2
"Tacuru";12
"Agencia Batalha";1
"Agência Gomes";5
"Agencia Piripiri";1
"Bujari";2
"BB - 6838";1
"Caixa Econômica Federal Bairro Arapoanga";2
"BB - 2809";2
"Cruzeiro do Sul";2
"BB - 0637";3
"Agencia Joaquimres";1
"Agência Porto Grande";5
"General Valadao";1
"Agência Santana";5
"BB Receita Federal";1
"Banco do Brasil Bairro Asa Norte";2
"P. TENENTE VIRMONDES";2
"CENTER SHOPPING";1
"Selviria";12
"BB - 1812";2
"Sacramento";5
"Agência Pracuuba";4
"BB IBAMA";1
"Agência Salto Grande";6
"Agência Macapá";5
"Juti";12
"Agência Americana";10
"Agência Empres.Alto Oeste";10
"Vale";2
"Sabinopolis";4
"Santa Barbara";4
"Assis Brasil";2
"Brasilandia";12
"Santa Juliana";5
"Ouro Preto";5
"Coxim";12
"Agencia Altos";1
"BB Asa Norte 504";1
"FLORIANO PEIXOTO";3
"Muquicaba";2
"MEIER";5
"Agencia do Triangulo";3
"Agencia Barras";1
*/

	-- (b) Para os funcionários que possuem dependentes, listar o número funcional de cada funcionário 
	       --juntamente com o número de dependentes que eles possuem
	SELECT funcionario.nome, dependentes.nome_dependente, funcionario.num_funcional 
	FROM funcionario, dependentes WHERE funcionario.num_funcional = dependentes.funcionario;
/* "José Silva Lima";"Arthur José Medeiros";2956
"Isadora Martins Oliveira";"Bruno Reis Borges";2901
"Erick Borges Gonsalves";"Vitor Pinheiro";2988
"Bianca Souza Silva";"Laiz Carvalho Dias";2966
"Otavio Pereira Mendonça";"Marilia Machado";2941
"Joao";"Carla";1
"Joao";"Tifanny";1
"Ariane";"Bruna";2
"Ariane";"Bruno";2
"Breno";"Jonas";4
"Luan";"Mauricio";5
"Nicolas";"Barbie";7
"Etienne";"Valesca";8
"Etienne";"Polly";8
"Pedro";"Yuri";9
"Pedro";"Marcelo";9
"Marcos";"Gabriela";10
"Lucas";"Debora";11
"Karen";"Agatha";12
"Karen";"Valentina";12
"Rodrigo";"Livia";13
"Marcelo";"Marianna";14
"Marcelo";"Samuel";14
"Mauricio";"Lara";15
"Gustavo";"Gina";17
"Gustavo";"Raul";17
"Ana";"Marisa";18
"Jefferson";"Isabela";19
"Reis";"Vitor";21
"Juca";"Sara";22
"Maria";"Laura";23
"Marcela";"Tamires";24
"Jonas";"Rafael";25
"Vitoria";"Edna";26
"Heliane";"Enzo";27
"Heliane";"Guilherme";27
"Josefa";"Beatrice";28
"Yuri";"Gilberto";33
"Yuri";"Eduarda";33
"João Jacó";"Marilia Ex";1700
"João Jacó";"Isabela Ex";1700
"João Jacó";"Isabella Ex";1700
"João Jacó";"Maria Ex";1700
"João Jacó";"Isadora Ex";1700
"Tassiana Hunberto";"Karlla com2Ls";1725
"Raphael Arrow";"Jacó João";1731
"Lidiane Prandini";"Arrozildo Feijão";1733
"Lukas Kamilo";"kamilinha kaka";100
"Ruth R. Sprouse";"Renato P.";101
"Kenneth H. Kuhn";"Patricia S.";102
"Ryan V. Zarate";"Laure L.";103
"Ryan V. Zarate";"Bruno Sergio";103
"Igor";"Monica";34
"Felipe";"Kaue";35
"Felipe";"Maria";35
"Felipe";"Iago";35
"Vinicius";"Luisa";36
"Vinicius";"Linda";36
"Chicao";"Samia";37
"Chicao";"Victor";37
"Zuleide";"Lais";38
"Zuleide";"Marina";38
"Caue";"Louis";40
"Emanuel";"Talitha";41
"Joana";"Sheila";42
"Joana";"Tamara";42
"Francis";"Jamila";43
"Thalia";"Lorenzo";45
"Thalia";"Susi";45
"Ricardo";"Daniel";46
"Daniela";"Lucas";47
"Marina";"Kauan";48
"Carlos";"Adriana";49
"Carlos";"Rubens";49
"Carolina";"Beatrice";50
"Carolina";"Ana Laura";50
"Tereza";"Roberto";52
"Romario";"Max";53
"Doni";"Tassio";55
"Doni";"Tulio";55
"Serginho Groysman";"Fabiola Groysman";1000
"Serginho Groysman";"Christiano Groysman";1000
"Almeida Campos";"Vitor Campos";1002
"Almeida Campos";"Maria Campos";1002
"Kamila";"Rodrigo";56
"Kamila";"Teodoro";56
"Willian";"Yasmin";58
"Jorge";"Mariany";60
"Lucas Bernardes ";"Mario Bernardes";2869
"Sasha Malkova";"Fabio Santos";1003
"Remy Akira";"Augusto Akira";1004
"Remy Akira";"Kylie Akira";1004
"Juan Raul Carvalho";"Laís Mariane Carvalho";1200
"Juan Raul Carvalho";"Mariana Sophie Carvalho";1200
"Sophia Débora De Paula";"Nathan Vinicius De Paula";1202
"Danilo Thiago Dos Santos";"Caroline Gabriela Dos Santos";1203
"Brenda Marcela Fernandes";"Pedro Paulo Fernandes";1204
"Jorisclei Adson";"Inarete feliciana";2439
"Jorisclei Adson";"Ionice Podrena";2439
"Samiriana Filha";"Pedro Afonso";2442
"Fermina Samorado";"Samira Realeza";2444
"Fermina Samorado";"Pedro Afonso";2444
"Kevin Enzo Barros";"Augusto Cauê Kaique Rocha";1900
"Kevin Enzo Barros";"Gustavo Henrique Rocha";1900
"Vitor Giovanni Raul Fernandes";"Caroline Beatriz Giovanna Monteiro";1901
"Vitor Giovanni Raul Fernandes";"Rodrigo Elias Dias";1901
"Igor Rodrigo Gomes";"Murilo Hugo Costa";1903
"Lorenzo Gianni";"Gabriel Giannini Gonçalves";705
"Lorenzo Gianni";"Gabriela Gianni Gonçalves";705
"Leonardo Donadeli";"Luna Donadeli Silva";712
"Durotan Frostwolf";"Thrall Frostwolf";718
"Thrall Frostwolf";"Taretha Foxton";720
"Varian Wrynn";"Anduin Wrynn";722
"Celestia Ludenberg";"Carla Akabane";726
"Rock Barbosa Silva Ferreira";"Belzer de Bub da Luz";727
"Rafael Silva Poisson";"Joana Dark Davila";728
"Amanda Bernouli";"Gin Fricks Montebranco";729
"Sinistro Lupus Taylor";"Karma Taro Dias";730
"Heloisa Luna Araújo";"Nicole Stefany Alice Freitas";1902
"Mirella Nina Alícia Pereira";"Elisa Caroline Melissa Carvalho";1905
"Ester Betina Dias";"Marcos Vinicius Theo Castro";1904
"Ester Betina Dias";"Rafaela Melissa Olivia Rodrigues";1904
"Felipe Smith";"Lavínia Giovanna Nascimento";1909
"Felipe Smith";"Camila Bárbara Nicole Cardoso";1909
"Enzo Miguel Lucca Rodrigues";"Lorenzo Hugo Theo Barros";2500
"Enzo Miguel Lucca Rodrigues";"Rodrigo Heitor Felipe Oliveira";2500
"Joaquim Marcelo Nascimento";"Ryan Kevin Cauê Carvalho";2501
"Diego Caue Kevin Barbosa";"Bruna Juan Fernandes";2503
"Diego Caue Kevin Barbosa";"Cauê Enzo Juan Nascimento";2503
"Nathan Nicolas Monteira";"Thales Davi Hugo Castro";2502
"André Luan Marcelo Lima";"Fernanda Oliveira Pimenta";2504
"Cauê Pietro Carvalho";"Rodrigo de Castro";2506
"Cauê Pietro Carvalho";"Joao de Castro";2506
"Cauê Pietro Carvalho";"Maria de Castro";2506
"Luiz Thiago Diogo Martins";"Leonardo Ruan Fernandes";2507
"Cauê Pietro Carvalho";"Mayra Samuel da Silva Freitas";2508
"Cauê Pietro Carvalho";"Iago Diogo Rodrigo Moura";2508
"Ian Enrico Gomes";"Cauê Augusto Moura";2509
"Ian Enrico Gomes";"Josefa Lorenzo Campos";2509
"Bianca Lorena Cavalcanti";"Maria Cavalcanti Oliveira";1600
"Bianca Lorena Cavalcanti";"Joao Ricardo Cavalcanti";1600
"Olivia Caroline Mendes";"Manuel Mendes e Costa";1604
"Davi Enrico Freitas";"Heloisa Medeiros";1620
"Gustavo Silva";"Maria Aparecidade da Silva";2805
"Guilherme Silva";"Jorgina Silva";2806
"Tobias Souza";"Cleide Souza";2807
"Bartolomeu Silva Dario";"Carla Dario";2808
"Marcos Antonio Dantas";"Maria Dantas";2809
"Marc Silva";"Mariana Silva";2825
"Lara Sousa";"Jorge Sousa";2826
"Maria Moura";"Claudia Moura";2827
"Marcio Silva Dodo";"Carlos Dodo";2828
"Marcos Antonio Lima";"Maria Lima";2829
"Mario Guilherme";"Mariana Goncalves";2845
"Laura Matos";"Maria Matos";2846
"Maria Joana";"Claudiano Joana";2847
"Bruna Lima";"Bruno Lima";2848
"Denner Pereira";"Maria Pereira";2849
"Mario Leonardo";"Marcos Leonardo";2865
"Lara Marques";"Joao Marques";2866
"Maria Kitt";"Larissa Kitt";2867
"Maria Pinto";"Carlos Pinto";2868
"Marcio Junior";"Marina Lares";2885
"Laura Maria";"Marcos Maria";2886
"Josefa Joana";"Claudinei Joana";2887
"Bianca Lara";"Brunno Lourdes";2888
*/
 
	-- (c) Listar para cada data cadastrada a quantidade de clientes que nasceram na respectiva data

	-- (d) Listar a quantidade de agências por município e estado
	-- (e) Listar o código de cada agência em que trabalham funcionários juntamente com a data de admissão mais recente
	-- (f) Listar todas as contas que efeturam operações. Mostrar jutamente o maior valor de operação da conta
	-- (g) Listar todas as contas que efeturam operações. Mostrar jutamente o maior, o menor, a média e desvio 
         -- padrão dos valores de operação da conta
	-- (h) Listar para cada conta a quantidade de clientes que a possui.
	-- (i) Listar o número funcional dos gerentes jutamente com o número de clientes que eles gerenciam
	-- (j) Listar o número funcional dos supervisores juntamente com o número de empregados que eles supervisionam
    -- (k) Listar para cada estado o número de municípios que possuem agências. Lembre que em um município pode 
	       -- haver mais de uma agência

-- 18) CONSULTAS COM AGRUPAMENTOS, JUNÇÕES E FUNÇÕES AGREGADAS
	-- (a) Listar parar funcionários admitidos no último ano a quantidade de dependentes que possuem
	-- (b) Listar o número funcional de cada funcionário juntamente com o número de dependentes que eles possuem
	       --- caso o funcionário não possua dependetes ele deve aparecer na resposta com 0 dependentes
    -- (c) Listar para cada conta a quantidade de operações que foram realizadas na mesma. Caso a conta
	       --- não possua operação associada, escrever '<sem operação>'
    -- (d) Listar o número funcional de cada funcionário lotados em agências do 'RJ' juntamente com o número 
	       -- de dependentes que eles possuem caso o funcionário não possua dependetes ele deve 
		   -- aparecer na resposta com 0 dependentes
	-- (e) Listar a quantidade de supervisores de cada agência do estado de 'MG'
		-- Listar para cada agência a quantidade de gerentes (somente para as agência que possuem gerentes)
    -- (f)
		-- Listar para cada agência a quantidade de gerentes, incluir as agências sem gerentes na resposta, 
		   -- mostrando zero na quantidade
		

-- 19) CONSULTAS COM AGRUPAMENTOS E QUE LISTAM ATRIBUTOS NÃO AGRUPADOS.
    -->> Se o agrupamento for feito utilizando um atributo que é PK, pode-se mostrar no resultado da consulta
	  -- os atributos da mesma tabela e que não foram agrupados.
    -- (a) Listar a quantidade de funcionários por agência (mostrar o nome da agência e o número de funcionários)
	-- (b) Para os funcionários que possuem dependentes, listar o nome de cada funcionário 
	       --juntamente com o número de dependentes que eles possuem	   
	-- (c) Listar o nome de cada agência em que trabalham funcionários juntamente com a data de admissão mais recente
	-- (d) Listar todas as contas que efeturam operações. Mostrar jutamente o maior valor de operação da conta
	-- (e) Listar para cada conta o saldo e a quantidade de clientes que a possui.
	-- (f) Listar o nome dos supervisores juntamente com o número de empregados que eles supervisionam
		
		   
	