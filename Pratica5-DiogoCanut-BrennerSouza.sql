--1) Consultas simples usando SELECT 
    SELECT 2+2
    --R:  4
	SELECT 'A'
	--R:  "A"
	SELECT 50 > 3
	--R:   t
	SELECT '11/10/2020'
	--R:   "11/10/2020"
	SELECT '11/10/2020' - '11/10/2030' -- é possível esse comando?
	/*R:   ERROR: operator is not unique: unknown - unknown
               SQL state: 42725
               Hint: Could not choose a best candidate operator. You might need to add explicit type casts.
               Character: 21*/
	
--2) Consultas simples usando SELECT e renomeando colunas
    SELECT 2+2 AS soma
    --R:   4 (tipo 'integer')
	SELECT 'A' as letra
	--R:   "A" (tipo 'unknown')
	SELECT 50 > 3 as resultado
	--R:   t (tipo 'boolean')
	SELECT '11/10/2020' as dia -- qual o tipo retornado?
	--R:   "11/10/2020" (tipo 'unknown')

--3) Consultas usando SELECT * FROM usando uma tabela do banco
     --- (a) Listar todos os clientes do banco
/*
2920;"João Grilo";"63798455937";"1991-08-26";"Avenida das Pedras 326";"Uberlândia";"MG";2941
2921;"José Pequeno";"76123443780";"1992-04-12";"Rua da Lua 259";"Uberaba";"MG";2966
2922;"Inacio Pinto";"68882780775";"1989-02-28";"Rua dos Bobos 001";"Belo Horizonte";"MG";2956
2923;"Florisbela Soé";"76032927784";"1995-05-15";"Rua Augusta 069";"São Paulo";"SP";2988
2924;"Isadora Pinto";"19048569427";"1997-09-18";"Rua Avenida 666";"Brasilia";"DF";2901
*/
     --- (b) Listar todos os funcionários
/*
2956;"José Silva Lima";"61995683215";"2005-11-02";"3595";2988
2901;"Isadora Martins Oliveira";"61988752694";"2002-09-07";"4597";2988
2988;"Erick Borges Gonsalves";"61992287416";"2000-04-26";"2945";2941
2966;"Bianca Souza Silva";"61981956324";"2009-05-19";"1003";2941
2941;"Otavio Pereira Mendonça";"61987456184";"2011-02-06";"3594";
*/
     --- (c) Listar todas as agências
/*
"3594";"BB Aeroporto Internacional de Brasilia";"Brasilia";"DF"
"1003";"BB Asa Norte 504";"Brasilia";"DF"
"2945";"BB Asa Sul 406";"Brasilia";"DF"
"4597";"BB IBAMA";"Brasilia";"DF"
"3595";"BB Receita Federal";"Brasilia";"DF"
*/


--4) Consultas usando SELECT <coluna> FROM
     --- (a) Listar o código e o nome de todas as agências
/*
"3594";"BB Aeroporto Internacional de Brasilia"
"1003";"BB Asa Norte 504"
"2945";"BB Asa Sul 406"
"4597";"BB IBAMA"
"3595";"BB Receita Federal"
*/

     --- (b) Listar todos os estados em que existem agências. Verificar se há repetições e, se houver, explicar o porquê.
/*
	"DF"
	"DF"
	"DF"
	"DF"
	"DF"
	Ocorreu repetições pois não foi especificado ao SQL para evitar saídas iguais.
*/

     --- (c) Listar todos os estados em que existem agências. Na resposta não deve haver repetição
/*
SELECT estado FROM agencia GROUP BY estado;
"DF"
*/

--5) Consultas com SELECT <coluna> AS <novo_nome> FROM
     --- (a) Listar todos os estados, trocando, no resultado, o nome do atributo para "UF" (Unidade da Federação)
/*
SELECT estado AS UF FROM agencia;
"DF"
"DF"
"DF"
"DF"
"DF"
*/
     --- (b) Listar todas as agências, renomeando as colunas de saída como agencia(cod,nome,cidade,uf)

--6) Consultas com SELECT FROM WHERE - com uma condição de seleção
     --- (a) Listar todos os clientes de 'Uberlândia'
/*
SELECT * FROM cliente WHERE cidade = 'Uberlandia';
tabela vazia
*/
     --- (b) Listar todas as operações bancárias com valores superiores à R$5000,00 
/*
SELECT * FROM operacao WHERE valor >5000;
"1003";2998;153;"D";"Depositado Dinheiro";"2016-08-18 10:48:08";48962.00
"4597";2997;854;"S";"Retirada de Dinheiro";"2016-05-26 10:12:29";35488.00
"2945";2995;489;"D";"Depositado Dinheiro";"2016-06-26 11:26:41";268743.00
*/
     --- (c) Listar todas as contas que não são acessadas há mais de um ano  
/*
SELECT * FROM conta WHERE ultimo_acesso < '2015-09-22';
"1003";2998;165489.00;"2000-11-26"
"3595";2996;84564.00;"2014-02-19"
*/ 
     --- (d) Mostre as datas (somente o dia e o mês) das operações bancárias que ocorreram neste ano 
     --- (e) Listar todas as operações bancárias que ocorreram hoje (a consulta deve ser genérica - ver current_date)
	/*
	SELECT* FROM operacao WHERE datahora = CURRENT_TIMESTAMP;
	tabela vazia
	*/
   --- (f) Listas os funcionários que foram contratados nos últimos 3 anos 
         --    (essa consulta deve ser genérica – você não deve explicitar nenhuma data)
     --- (g) Listar todos os funcionários que não possuem supervisores
/*
SELECT* FROM funcionario WHERE supervisor = NULL;
*/
	 --- (h) Listar todos os funcionários que possuem supervisores
/*
SELECT* FROM funcionario WHERE supervisor != NULL;
*/
 
--7) Consultas com SELECT FROM WHERE - com duas ou mais condições de seleção
     --- (a) Listar todos os clientes de 'Uberlândia' e cujo nome inicia com a letra 'B'
/*
SELECT* FROM cliente WHERE cidade = 'Uberlandia' AND nome 'B%';
*/  
   --- (b) Listar todas as operações bancárias com valores superiores à R$5000,00 do tipo crédito
/*
SELECT* FROM operacao WHERE valor >5000 AND tipo = 'S';
"4597";2997;854;"S";"Retirada de Dinheiro";"2016-05-26 10:12:29";35488.00
*/
     --- (c) Listar todas as contas com saldo menor que 300 e que não são acessadas há mais de um ano  
/*
SELECT * FROM conta WHERE ultimo_acesso < '2015-09-22' AND saldo < 300;
*/ 
     --- (e) Listar todas as operações bancárias que ocorreram hoje (a consulta deve ser genérica - ver current_date)
/*
SELECT * FROM operacao WHERE datahora = CURRENT_TIMESTAMP;
  */
   --- (f) Listas os funcionários que foram contratados nos últimos 3 anos 
         --    (essa consulta deve ser genérica – você não deve explicitar nenhuma data)


-- 8) CONSULTAS COM JUNÇÕES ENVOLVENDO DUAS TABELAS 
    -- (a) Listar o número funcional e o nome de todos os funcionarios juntamente com todos os seus dependentes
/*
SELECT funcionario.num_funcional, funcionario.nome,dependentes.nome_dependente FROM funcionario,dependentes WHERE funcionario.num_funcional = dependente.funcionario;
*/
	
-- (b) Listar os nomes dos funcionários e os municípios em que eles trabalham
	-- (c) Listar os nomes do clientes juntamente com as informações de suas contas (código da agência e número da conta)
	
-- 9) CONSULTAS COM JUNÇÕES ENVOLVENDO DUAS OU MAIS TABELAS
    -- (a) Liste o nome do cliente e o saldo em sua conta corrente
    -- (b) Liste o nome do cliente juntamente com o nome do seu gerente e o nome da agência que o supervisor trabalha
	-- (c) Liste os nomes dos clientes que fizeram operações acima de R$ 20.000,00
	


