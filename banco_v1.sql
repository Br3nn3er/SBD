DROP SCHEMA IF EXISTS banco CASCADE;

CREATE SCHEMA banco;
SET SEARCH_PATH TO banco;

DROP TABLE IF EXISTS 
   agencia, 
   funcionario,
   dependentes, 
   cliente,
   conta,
   operacao,
   clienteconta CASCADE
   ;



CREATE TABLE agencia(
  codigo CHAR(4), -- número com 4 dígitos, podendo iniciar com zero (0011; 2918)
  nome VARCHAR(60) NOT NULL,
  municipio VARCHAR(50),
  estado CHAR(2),
  
  CONSTRAINT pkagencia PRIMARY KEY (codigo),
  CONSTRAINT uqnome UNIQUE(nome)
  
);

CREATE TABLE funcionario(
  num_funcional INTEGER,
  nome VARCHAR(250) NOT NULL,  
  telefone VARCHAR(12), 
  data_admissao DATE,
  agencia CHAR(4) NOT NULL, 
  supervisor INTEGER,

  CONSTRAINT pkfuncionario PRIMARY KEY(num_funcional),
  CONSTRAINT fkagencia FOREIGN KEY (agencia) 
    REFERENCES agencia(codigo),
  CONSTRAINT fksupervisor FOREIGN KEY (supervisor)
    REFERENCES funcionario(num_funcional)
);

CREATE TABLE dependentes(
  funcionario INTEGER,
  nome_dependete VARCHAR(250),
  CONSTRAINT pkdependentes PRIMARY KEY (funcionario,nome_dependete),
  CONSTRAINT fkfuncionario FOREIGN KEY (funcionario)
    REFERENCES funcionario(num_funcional)
);

CREATE TABLE cliente(
  id INTEGER, 
  nome VARCHAR(250) NOT NULL, 
  cpf CHAR(11) NOT NULL, 
  data_nasc DATE NOT NULL,
  endereco VARCHAR(300) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  estado CHAR(2) NOT NULL, 
  gerente integer NOT NULL,
   

  CONSTRAINT pkcliente PRIMARY KEY (id),
  CONSTRAINT uqcpf UNIQUE(cpf),
  CONSTRAINT fkgerente FOREIGN KEY (gerente) REFERENCES funcionario(num_funcional)
);

CREATE TABLE conta(
  cod_agencia CHAR(4),
  numero INTEGER,
  saldo NUMERIC(12,2), 
  ultimo_acesso DATE,

  CONSTRAINT pkconta PRIMARY KEY(cod_agencia,numero),
  CONSTRAINT fkcod_agencia FOREIGN KEY (cod_agencia) 
     REFERENCES agencia(codigo)
);


CREATE TABLE operacao(
  cod_agencia CHAR(4),
  numero_conta INTEGER,
  seq INTEGER,
  tipo CHAR(1) NOT NULL,
  descricao VARCHAR(40) NOT NULL,
  datahora TIMESTAMP NOT NULL, 
  valor NUMERIC(12,2) NOT NULL,

  CONSTRAINT pkoperacao PRIMARY KEY(cod_agencia,numero_conta,seq),
  CONSTRAINT fkconta FOREIGN KEY (cod_agencia,numero_conta) 
    REFERENCES conta(cod_agencia,numero) 
);

CREATE TABLE clienteconta(
  id_cliente INTEGER,
  cod_agencia CHAR(4),
  numero_conta INTEGER,

  CONSTRAINT pkclienteconta PRIMARY KEY (id_cliente,cod_agencia,numero_conta),
  CONSTRAINT fkcliente FOREIGN KEY (id_cliente)
    REFERENCES cliente(id),
  CONSTRAINT fkconta FOREIGN KEY (cod_agencia,numero_conta) 
    REFERENCES conta(cod_agencia,numero) 
  
);

INSERT INTO agencia
VALUES
(3594, 'BB Aeroporto Internacional de Brasilia', 'Brasilia' , 'DF'),
(1003, 'BB Asa Norte 504', 'Brasilia', 'DF'),
(2945, 'BB Asa Sul 406', 'Brasilia', 'DF'),
(4597, 'BB IBAMA','Brasilia' ,'DF'),
(3595, 'BB Receita Federal', 'Brasilia', 'DF');


INSERT INTO funcionario
VALUES
(2956, 'José Silva Lima', 061995683215, '02/11/2005', '3595', '2901'),
(2901, 'Isadora Martins Oliveira', 061988752694, '07/09/2002', '4597'),
(2988, 'Erick Borges Gonsalves', 061992287416, '26/04/2000', '2945'),
(2966, 'Bianca Souza Silva', 061981956324, '19/05/2009', '1003'),
(2941, 'Otavio Pereira Mendonça', 061987456184, '06/02/2011', '3594');

INSERT INTO dependentes
VALUES
(2956,'Arthur José Medeiros'),
(2941, 'Marilia Machado'),
(2988, 'Vitor Pinheiro'),
(2901, 'Bruno Reis Borges'),
(2966, 'Laiz Carvalho Dias');

INSERT INTO cliente
VALUES
(2920, 'João Grilo', '63798455937', '26/08/1991', 'Avenida das Pedras 326', 'Uberlândia', 'MG', 2941),
(2921, 'José Pequeno', '76123443780', '12/04/1992', 'Rua da Lua 259', 'Uberaba', 'MG', 2966),
(2922, 'Inacio Pinto', '68882780775', '28/02/1989', 'Rua dos Bobos 001', 'Belo Horizonte', 'MG', 2956),
(2923, 'Florisbela Soé', '76032927784', '15/05/1995', 'Rua Augusta 069', 'São Paulo', 'SP', 2988),
(2924, 'Isadora Pinto', '19048569427', '18/09/1997', 'Rua Avenida 666', 'Brasilia', 'DF', 2901);

INSERT INTO conta
VALUES
(3594, 2999, 555555, '15/09/2016'),
(1003, 2998, 165489, '26/11/2000'),
(4597, 2997, 1564898, '05/10/2015'),
(3595, 2996, 84564, '19/02/2014'),
(2945, 2995, 658894, '25/08/2016');

INSERT INTO operacao
VALUES
(3595, 2996, 156, 'S', 'Retirada de Dinheiro', '11:55', 2116),
(3594, 2999, 545, 'S', 'Retirada de Dinheiro', '09:32', 4444),
(1003, 2998, 153, 'D', 'Depositado Dinheiro', '10:48', 48962),
(4597, 2997, 854, 'S', 'Retirada de Dinheiro', '10:12', 35488),
(2945, 2995, 489, 'D', 'Depositado Dinheiro', '11:26', 268743);


INSERT INTO clienteconta
VALUES
(2920, 3594, 2999),
(2921,1003, 2998),
(2922,4597, 2997),
(2923,3595, 2996),
(2924, 2945, 2995);

SELECT * FROM cliente;
SELECT * FROM conta;
SELECT * FROM funcionario;
SELECT * FROM dependentes;
SELECT * FROM agencia;
SELECT * FROM operacao;
SELECT * FROM clienteconta;
