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
  email CHAR(40) NOT NULL,
  

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
  
)