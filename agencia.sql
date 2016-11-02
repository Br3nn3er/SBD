--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2016-09-22 18:53:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: banco; Type: SCHEMA; Schema: -; Owner: postgres
--
DROP SCHEMA banco CASCADE;
CREATE SCHEMA banco;


ALTER SCHEMA banco OWNER TO postgres;

--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA banco; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA banco IS 'standard public schema';


--
-- TOC entry 179 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 179
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = banco, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 261223)
-- Name: agencia; Type: TABLE; Schema: banco; Owner: postgres; Tablespace: 
--

CREATE TABLE agencia (
    codigo character(4) NOT NULL,
    nome character varying(60),
    municipio character varying(50),
    estado character(2)
);


ALTER TABLE agencia OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 261255)
-- Name: cliente; Type: TABLE; Schema: banco; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    id integer NOT NULL,
    nome character varying(250),
    cpf character(11),
    data_nasc date,
    endereco character varying(300),
    cidade character varying(50),
    estado character(2),
    gerente integer
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 261290)
-- Name: clienteconta; Type: TABLE; Schema: banco; Owner: postgres; Tablespace: 
--

CREATE TABLE clienteconta (
    id_cliente integer,
    cod_agencia character(4),
    numero_conta integer
);


ALTER TABLE clienteconta OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 261270)
-- Name: conta; Type: TABLE; Schema: banco; Owner: postgres; Tablespace: 
--

CREATE TABLE conta (
    cod_agencia character(4) NOT NULL,
    numero integer NOT NULL,
    saldo real,
    ultimo_acesso date
);


ALTER TABLE conta OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 261245)
-- Name: dependentes; Type: TABLE; Schema: banco; Owner: postgres; Tablespace: 
--

CREATE TABLE dependentes (
    funcionario integer NOT NULL,
    nome_dependente character varying(250) NOT NULL
);


ALTER TABLE dependentes OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 261230)
-- Name: funcionario; Type: TABLE; Schema: banco; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario (
    num_funcional integer NOT NULL,
    nome character varying(250),
    telefone character varying(12),
    data_admissao date,
    agencia character(4),
    supervisor integer
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 261280)
-- Name: operacao; Type: TABLE; Schema: banco; Owner: postgres; Tablespace: 
--

CREATE TABLE operacao (
    cod_agencia character(4) NOT NULL,
    numero_conta integer NOT NULL,
    seq integer NOT NULL,
    tipo character(1),
    descricao character varying(40),
    datahora timestamp without time zone,
    valor real
);


ALTER TABLE operacao OWNER TO postgres;

--
-- TOC entry 2037 (class 0 OID 261223)
-- Dependencies: 172
-- Data for Name: agencia; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('17  ', 'Aracaju', 'Aracaju', 'SE');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1224', 'Siqueira Campos', 'Aracaju', 'SE');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1402', 'General Valadao', 'Aracaju', 'SE');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1603', 'Jardins-se', 'Aracaju', 'SE');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2961', 'Santo Antonio', 'Aracaju', 'SE');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2434', 'Banco do Brasil Bairro Arapoanga', 'Brasília', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2435', 'Caixa Econômica Federal Bairro Arapoanga', 'Brasília', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2436', 'Banco do Brasil Bairro Asa Norte', 'Brasília', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2437', 'Bradesco Bairro Asa Sul', 'Brasília', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2438', 'Santander Bairro Bela Vista', 'Brasília', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0319', 'Agência Americana', 'Americana', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4248', 'Agência Empres.Alto Oeste', 'Araçatuba', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3312', 'Agência Presidente Vargas', 'Ribeirão Preto', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0053', 'Agência Franca', 'Franca', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('6641', 'Agência Salto Grande', 'Franca', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1   ', 'RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('87  ', 'CATETE', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('91  ', 'MADUREIRA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('93  ', 'BANDEIRA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('101 ', 'MEIER', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('127 ', 'CAMPO GRANDE-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('183 ', 'SAARA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('249 ', 'RAMOS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('258 ', 'SAUDE-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('265 ', 'SAO CRISTOVAO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('287 ', 'BOTAFOGO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('288 ', 'TIJUCA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('289 ', 'COPACABANA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('296 ', 'BANGU', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('392 ', 'CINELANDIA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('435 ', 'PRACA MAUA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('472 ', 'ABOLICAO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('493 ', 'JACAREPAGUA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('497 ', 'VICENTE DE CARVALHO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('525 ', 'IPANEMA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('549 ', 'ILHA DO GOVERNADOR', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('576 ', 'PENHA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('592 ', 'VILA MILITAR', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('597 ', 'ZONA SUL-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('598 ', 'LEBLON', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('658 ', 'JACARE', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1211', 'MARECHAL FLORIANO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1250', 'VILA ISABEL', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1251', 'RUA DA ASSEMBLEIA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1252', 'CANDELARIA-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1253', 'BARRA DA TIJUCA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1254', 'BONSUCESSO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1255', 'CAJU', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1257', 'SANTA CRUZ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1499', 'PREVI ALTERACAO ERP', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1508', 'BAIRRO MALLET', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1517', 'QUITANDA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1524', 'CASCADURA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1564', 'ATAULFO DE PAIVA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1565', 'BENFICA-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1566', 'JARDIM LUZ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1567', 'P.JUDIC.RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1568', 'GRAJAU', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1569', 'VOLUNTARIOS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1570', 'IRAJA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1572', 'JARDIM BOTANICO-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1573', 'JARDIM DO MEIER', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1574', 'CONDE DE BONFIM', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1575', 'REALENGO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1577', 'TELEPORTO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1579', 'TAQUARA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1580', 'TRF-RJ-2.REGIAO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1755', 'CORPORATE RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1769', 'EMPRES.SEN.DANTAS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1778', 'GECEX RIO DE JANEIRO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1822', 'JARDIM MEIER-RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1825', 'MERCADO MADUREIR-RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1826', 'MUDA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1827', 'POSTO 5-RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1842', 'LIDO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1853', 'SENADOR DANTAS-RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1855', 'PRES.ANTONIO CARLOS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1901', 'GERIE/ADCOM RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1996', 'ESTILO SAENS PENA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2002', 'URCA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2116', 'NOVA AMERICA SHOP-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2132', 'GRACA ARANHA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2234', 'S.PUBLICO R.JANEIRO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2339', 'P.JUDIC.R.DE JANEIRO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2351', 'AV.RODRIGUES ALVES', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2448', 'ARSENAL DA MARINHA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2476', 'JUSTICA FEDERAL-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2488', 'PALACIO DO TRABALHO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2496', 'PALACIO DUQUE CAXIAS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2784', 'CASA DA MOEDA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2795', 'RECREIO BANDEIRANTES', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2808', 'S.CLEMENTE-RIO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2810', 'LARANJEIRAS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2860', 'PALACIO DA FAZENDA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2861', 'MARECHAL CAMARA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2862', 'AEROP.INTERNACIONAL', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2865', 'PRIMEIRO DE MARCO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2909', 'BARRASHOPPING', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2914', 'MERCADO S.SEBASTIAO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2924', 'ALFANDEGA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2933', 'ANDARAI-RJ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2975', 'AVENIDA RIO BRANCO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3010', 'BARAO DE MESQUITA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3071', 'SAO CLEMENTE', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3073', 'DOWNTOWN', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3075', 'CENTRO DA BARRA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3079', 'SHOPPING NEW YORK', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3082', 'AVENIDA CESARIO MELO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3086', 'GONCALVES DIAS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3089', 'PRACA SECA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3090', 'DIAS DA CRUZ', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3094', 'ESTILO TIJUCA', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3096', 'HADDOCK LOBO', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4603', 'Vale', 'Vitoria', 'ES');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0924', 'Guarapari', 'Guarapari', 'ES');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3097', 'AVENIDA DAS AMERICAS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3099', 'PRESIDENTE VARGAS', 'RIO DE JANEIRO', 'RJ');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4629', 'Muquicaba', 'Guarapari', 'ES');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0785', 'Castelo', 'Castelo', 'ES');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2451', 'Pinheiros', 'Montanha', 'ES');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1661', 'Brasilandia', 'Brasilandia', 'MS');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0552', 'Coxim', 'Coxim', 'MS');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3935', 'Juti', 'Juti', 'MS');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0455', 'Sacramento', 'Sacramento', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2557', 'Sabinopolis', 'Sabinopolis', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2570', 'Santa Barbara', 'Santa Barbara', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3342', 'Santa Juliana', 'Santa Juliana', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0473', 'Ouro Preto', 'Ouro Preto', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3847', 'Agencia do Triangulo', 'Uberlandia', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3495', 'Santa Efigencia', 'Belo Horizonte', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('5874', 'AVENIDA JOAO NAVES', 'Uberlandia', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4165', 'CENTER SHOPPING', 'Uberlandia', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2918', 'FLORIANO PEIXOTO', 'Uberlandia', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('6989', 'P. TENENTE VIRMONDES', 'Uberlandia', 'MG');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3594', 'BB Aeroporto Internacional de Brasilia', 'Brasilia', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1003', 'BB Asa Norte 504', 'Brasilia', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2945', 'BB Asa Sul 406', 'Brasilia', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4597', 'BB IBAMA', 'Brasilia', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3595', 'BB Receita Federal', 'Brasilia', 'DF');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3938', 'Tacuru', 'Tacuru', 'MS');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4089', 'Selviria', 'Selviria', 'MS');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4158', 'Acrelandia', 'Acrelandia', 'AC');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('4652', 'Assis Brasil', 'Assis Brasil', 'AC');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1662', 'Brasileia', 'Brasileia', 'AC');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('8132', 'Bujari', 'Bujari', 'AC');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0234', 'Cruzeiro do Sul', 'Cruzeiro do Sul', 'AC');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0637', 'BB - 0637', 'Osasco', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('6838', 'BB - 6838', 'Osasco', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2809', 'BB - 2809', 'Sao Paulo', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1812', 'BB - 1812', 'Sao Paulo', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('6986', 'BB - 6986', 'Sao Paulo', 'SP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2800', 'Agência Macapá', 'Macapá', 'AP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2801', 'Agência Porto Grande', 'Porto Grande', 'AP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2802', 'Agência Gomes', 'Ferreira Gomes', 'AP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2803', 'Agência Santana', 'Santana', 'AP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2804', 'Agência Pracuuba', 'Pracuuba', 'AP');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('3893', 'Agencia Batalha', 'Batalha', 'PI');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1944', 'Agencia Joaquimres', 'Joaquim Pires', 'PI');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('2844', 'Agencia Barras', 'Barras', 'PI');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('1428', 'Agencia Altos', 'Altos', 'PI');
INSERT INTO agencia (codigo, nome, municipio, estado) VALUES ('0129', 'Agencia Piripiri', 'Piripiri', 'PI');


--
-- TOC entry 2040 (class 0 OID 261255)
-- Dependencies: 175
-- Data for Name: cliente; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1005, 'João Melo', '06029122703', '1983-08-09', 'Rua José Melo,300,Centro', 'Batalha', 'PI', 1000);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1006, 'Carlos Miranda', '76228371991', '1977-11-18', 'Avenida Americana,1200,Centro', 'Joaquim Pires', 'PI', 1001);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1007, 'Juliana Carvalho', '14532450659', '1995-02-12', 'Rua Vitor Lopes,820,Boa Vista', 'Barras', 'PI', 1002);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1008, 'Bianca Borges', '89605342693', '1993-06-01', 'Rua da Biblia,100,Galdinal', 'Barras', 'PI', 1002);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1009, 'José Vieira', '32398811441', '1989-12-23', 'Rua Brasil,600,Matadouro', 'Altos', 'PI', 1003);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1210, 'Leonardo Henry dos Santos', '46310505513', '1994-10-18', 'Travessa Nove 983', 'Aracaju', 'SE', 1200);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1211, 'Ryan Yuri Monteiro', '78682083507', '1994-04-23', 'Rua A11 947', 'Aracaju', 'SE', 1200);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1212, 'Camila Catarina Betina Costa', '24394193540', '1989-06-18', 'Avenida São Paulo 282', 'Aracaju', 'SE', 1202);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1213, 'Filipe Erick Freitas', '16168652531', '1986-03-21', 'Rua Coronel Ernani Carvalho Menezes 118', 'Aracaju', 'SE', 1204);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1214, 'Helena Brenda Emily Dias', '43020652570', '1963-07-02', 'São Conrado 768', 'Aracaju', 'SE', 1204);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2445, 'Afonso Pedro', '43739513225', '1993-12-06', 'Rua dos bototos 5643 Bairro Asa Norte', 'Brasília', 'DF', 2439);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2446, 'Forisbero Nardo', '89919598062', '1991-09-22', 'Rua dos molinetes 847 Bairro Asa Sul', 'Brasília', 'DF', 2440);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1738, 'Arianne Mathias', '43403839109', '1993-05-10', 'rua dos Bobos, numero zero', 'Americana', 'SP', 1700);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1739, 'Claudio Cliente', '75658335680', '1995-01-01', 'rua Comum, numero 1', 'Americana', 'SP', 1700);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1740, 'Arnaldo Pessoa', '81499705760', '1993-05-10', 'rua do Arroz, numero 2', 'Americana', 'SP', 1700);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1741, 'João Pedroso', '61963696441', '1995-05-11', 'rua Freguês, numero 3', 'Americana', 'SP', 1700);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1742, 'Breno Marcelo', '72935163710', '1994-12-10', 'rua do Teatro, numero 4', 'Araçatuba', 'SP', 1711);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1743, 'Vanessa Vilela', '62244903419', '1996-12-03', 'rua do Bingo, numero 5', 'Araçatuba', 'SP', 1711);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1744, 'Jefesson James', '07095156425', '1998-02-10', 'rua Maltes, numero 6', 'Araçatuba', 'SP', 1711);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1745, 'Zuleide Zangara', '35412681905', '1999-10-10', 'rua Patinete, numero 7', 'Ribeirão Preto', 'SP', 1720);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1746, 'J.J.Jonas Jameson', '72061061290', '1994-12-11', 'rua Biscoito, numero 8', 'Ribeirão Preto', 'SP', 1720);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1747, 'Mary Jane', '26423380708', '1994-04-12', 'Franca', 'rua Promove, numero 9', 'SP', 1727);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1748, 'Gwen Stacy', '71897501935', '1992-03-11', 'Franca', 'rua dos Pastéis, numero 10', 'SP', 1732);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (100, 'Robert I. Sutton', '10585637128', '1980-05-07', 'Barrio Terezinha, Rua. pindamonha, N°100', 'Rio de Janeiro', 'RJ', 100);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (101, 'Laura R. Creech', '10585357128', '1992-03-11', 'Bairro Centro,Rua Caetano Velozo, N°004', 'Rio de Janeiro', 'RJ', 100);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (102, 'Linda R. Anderson', '20533637128', '1994-09-01', 'Bairo Brasil, Rua. Aquelino pedroso, N°850', 'Rio de Janeiro', 'RJ', 101);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (103, 'Harry A. Temme', '20577637128', '2000-04-26', 'Bairro Azul, Rua. Marinho N°200, Complemento Ap 101', 'Rio de Janeiro', 'RJ', 103);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (104, 'Danny J. Norton', '10520037100', '2001-01-22', 'Bairro Cruzeiro, Rua. dos Campeões , N°001', 'Rio de Janeiro', 'RJ', 104);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2447, 'Romiudo Fostuos', '36985211801', '1995-07-11', 'Alameda das totocas 90 Bairro Asa Norte', 'Brasília', 'DF', 2440);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2448, 'Anabelle Soberba', '70369084837', '1996-02-29', 'Avenida dos bocos 2874 Bairro Asa Sul', 'Brasília', 'DF', 2442);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2449, 'Anna Ferobele Lima', '72718435909', '1992-01-10', 'Avenida leopolda 2982 Bairro Bela Vista', 'Brasília', 'DF', 2443);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2870, 'Mariano Jose', '12343224512', '1996-01-12', 'Rua Mario Jose 58', 'Santana', 'AP', 2865);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2871, 'Antônio Cardoso', '52543312312', '1981-04-12', 'Rua Carlitos Martins 1620', 'Santana', 'AP', 2865);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2872, 'Jeniffer Otaso', '56350262712', '1991-10-10', 'Rua Coutinho Olavo 2955', 'Santana', 'AP', 2865);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2873, 'Thiago Santos', '32449812312', '1993-09-02', 'Rua Antonio Mario 955', 'Santana', 'AP', 2865);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2874, 'Olavo Lares', '12343345451', '1984-08-08', 'Rua Claudia Silva 120', 'Santana', 'AP', 2865);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2889, 'Carlos Joao', '34385222312', '1989-05-16', 'Rua Joao Pereira 2058', 'Pracuuba', 'AP', 2845);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2890, 'Matheus Eduardo', '14543312312', '1987-01-30', 'Rua Pereira Santos 6625', 'Pracuuba', 'AP', 2845);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2891, 'Daniel Panda', '89378962712', '1990-11-26', 'Rua Brunna Ciranda 3995', 'Pracuuba', 'AP', 2845);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (700, 'Lorthemar Theron', '06320217804', '1980-02-15', 'Rua Santa Rita, 300', 'Sacramento', 'MG', 701);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (701, 'Lili Stormstout', '72342404115', '1985-05-17', 'Rua Doutor Edmundo Pena, 933', 'Santa Barbara', 'MG', 720);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (702, 'Valeera Sanguinar', '30055634800', '1990-06-18', 'Avenida Benedito Valadares, 587', 'Santa Barbara', 'MG', 721);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (703, 'Uther Lightbringer', '76980579339', '1975-07-28', 'Avenida Stormwind, 147', 'Sacramento', 'MG', 700);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (704, 'Argus Black', '10975825151', '1982-08-31', 'Rua Ouro Azul, 1555', 'Ouro Preto', 'MG', 724);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (705, 'Velen Argus', '26813762974', '1960-02-24', 'Avenida Afonso Pena, 258', 'Ouro Preto', 'MG', 714);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (706, 'Sargeras Argus', '65121358490', '1966-06-06', 'Avenida Cesar Finotti, 4000', 'Uberlandia', 'MG', 718);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (707, 'Yrel Karabor', '74723183450', '1992-10-08', 'Rua Adelmo Bonfim, 47', 'Santa Juliana', 'MG', 722);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (708, 'Taran Zhu', '19090844848', '1985-06-25', 'Rua Willow Creek', 'Ouro Preto', 'MG', 724);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (709, 'Moira Thaurissan', '17248077224', '1990-04-27', 'Avenida Santos Dummont, 992', 'Sacramento', 'MG', 702);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (710, 'Sunwalker Dezco', '27285174955', '1960-03-18', 'Rua Alta Cruz, 85', 'Sabinopolis', 'MG', 707);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (711, 'Lei Shen', '16343157239', '1984-10-30', 'Rua Nancy Jonathan, 448', 'Santa Barbara', 'MG', 710);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (712, 'Kilrogg Deadeye', '83739551518', '1975-11-05', 'Rua Mick Eleven, 11', 'Ouro Preto', 'MG', 715);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (713, 'Willson Silva Dourado', '76131744254', '1988-10-09', 'Rua Uberlandia, 33', 'Contagem', 'MG', 726);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (714, 'Aomine Sirqueira Costa Davila', '13367884880', '1990-06-12', 'Rua Araxa, 418', 'Contagem', 'MG', 727);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (715, 'Munakata Dreadloc', '37526318488', '1992-12-12', 'Rua Itaquaquicetuba, 500', 'Belo Horizonte', 'MG', 728);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (716, 'Zaraki Almerindo da Costa Guerra', '51652728422', '1969-06-06', 'Rua Serra da Manteiga, 789', 'Belo Horizonte', 'MG', 729);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (721, 'Silvana da Silva Silveira', '15155971802', '1990-01-04', 'Rua Tokyo, 777', 'Belo Horizonte', 'MG', 730);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (717, 'Pedro Silveira', '65766288549', '1995-10-06', 'Rua X', 'Uberlandia', 'MG', 731);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (718, 'Patricia Cardoso', '6578854949 ', '1990-12-12', 'Rua Couto', 'Uberlandia', 'MG', 731);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (719, 'Caroline dos Santos', '65766288561', '1980-04-15', 'Rua America', 'Uberlandia', 'MG', 736);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (720, 'Carla Souza', '65766288430', '2000-11-14', 'Rua Vieira', 'Uberlandia', 'MG', 736);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2920, 'João Grilo', '63798455937', '1991-08-26', 'Avenida das Pedras 326', 'Uberlândia', 'MG', 2941);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2921, 'José Pequeno', '76123443780', '1992-04-12', 'Rua da Lua 259', 'Uberaba', 'MG', 2966);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2922, 'Inacio Carlos', '68882780775', '1989-02-28', 'Rua dos Bobos 001', 'Belo Horizonte', 'MG', 2956);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2923, 'Florisbela Liz', '76032927784', '1995-05-15', 'Rua Augusta 069', 'São Paulo', 'SP', 2988);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2924, 'Isadora Maria', '19048569427', '1997-09-18', 'Rua Avenida 666', 'Brasilia', 'DF', 2901);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1901, 'Heitor Murilo da Silva', '73071792700', '1992-06-17', 'Rua Rio Negro, Numero 544, Bairro Nova Palestina', 'Vitoria', 'ES', 1905);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1902, 'Julia Emily Campos', '36803925757', '1994-04-18', 'Rua Travessa Santuário, Numero 450, Bairro Santo Antonio', 'Vitoria', 'ES', 1904);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1903, 'Raul Vinicius Daniel Mendes', '80953152731', '1996-08-26', 'Rua Ataufo Alves, Numero 485, Bairro Kubitschek', 'Guarapari', 'ES', 1900);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1904, 'Fernanda Emanuelly Martins', '76832643772', '1994-09-20', 'Rua Estrada Principal, Numero 921, Bairro Patrimonio do Ouro', 'Castelo', 'ES', 1902);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1905, 'Sarah Beatriz Nina Freitas', '61986728757', '2000-08-12', 'Rua Principal, Numero 369, Bairro Sao Sebastiao do Norte', 'Montanha', 'ES', 1907);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1906, 'Stella Clara Martins', '24087932702', '1999-10-13', 'Rua Principal, Numero 589, Bairro Sao Sebastiao do Norte', 'Montanha', 'ES', 1906);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1907, 'Arthur André Miguel Castro', '18218191798', '1996-08-16', 'Rua São José do Calçado, Numero 780, Bairro São Gabriel', 'Guarapari', 'ES', 1909);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1, 'Monica', '09987545122', '1993-11-02', 'Rua dos Bobos, numero zero', 'Brasilandia', 'MS', 7);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2, 'Marcella', '12045678922', '1993-04-04', 'Rua do Arroz, numero dois', 'Brasilandia', 'MS', 7);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (3, 'Debora', '13541278944', '1993-03-12', 'Rua Comum, numero um', 'Coxim', 'MS', 14);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (4, 'Lana', '01234578966', '1993-12-22', 'Rua Freguês, numero três', 'Coxim', 'MS', 14);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (5, 'Juarez', '12475436211', '1993-08-14', 'Rua Sapato, numero quatro', 'Juti', 'MS', 21);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (6, 'Fabricio', '09874565423', '1993-09-24', 'Rua do Bingo, numero cinco', 'Juti', 'MS', 21);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (7, 'Frederico', '12457848611', '1993-07-15', 'Rua do Reis, numero seis', 'Tacuru', 'MS', 37);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (8, 'Valdez', '03124578499', '1993-02-13', 'Rua Patinete, numero sete', 'Tacuru', 'MS', 37);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (9, 'Paulo', '14275413688', '1996-03-15', 'Rua Biscoito, numero oito', 'Selviria', 'MS', 53);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (10, 'Aurelio', '14275413689', '2012-10-02', 'Rua Tuberculose, numero nove', 'Selviria', 'MS', 53);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2510, 'Murilo Bryan Monteiro', '91998585417', '1994-02-22', 'Rua Joaquim Ribeiro Peres-241', 'Acrelandia', 'AC', 2500);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2511, 'Marcos Vinicius Guilherme Erick Alves', '30307987710', '1994-03-18', 'Vila Jerusalém-543', 'Acrelandia', 'AC', 2500);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2512, 'Pedro Enzo Yuri Souza', '18597228814', '1983-08-19', 'Rua Doutor Souza Brasil-399', 'Assis Brasil', 'AC', 2503);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2513, 'Eduardo Heitor Alves', '97469252371', '1983-11-26', 'Rua Mirabel-264', 'Assis Brasil', 'AC', 2503);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2514, 'Francisco Eduardo Ribeiro', '01294656821', '1983-07-07', 'Rua La Joux-641', 'Brasileia', 'AC', 2505);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2515, 'Breno Enzo Freitas', '72969803208', '1980-06-15', 'Rua Vila Conceição', 'Brasileia', 'AC', 2505);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2516, 'Henrique Theo Kaique Costa', '82478443970', '1983-02-17', 'Rua Doutor Achiles Moreira Alves', 'Bujari', 'AC', 2506);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2517, 'Matheus Emanuel Kevin Souza', '96944113350', '1975-10-05', 'Avenida Antonio Freire 1407-670', 'Bujari', 'AC', 2506);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2518, 'Levi Thales João Cardoso', '43339436800', '1965-08-23', 'Rua Travessa Ferros-675', 'Cruzeiro do Sul', 'AC', 2509);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2519, 'Bernardo Vitor Calebe Monteiro', '44127550880', '1985-07-13', 'Rua Mamoreiro-241', 'Cruzeiro do Sul', 'AC', 2509);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1600, 'Flávia Nicole Moura', '96683339856', '1994-11-27', 'Rua Vereador Eugênio F. dos Santos Filho,569', 'Tatuí', 'SP', 1654);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1601, 'Carlos Eduardo Cauã Henrique Rocha', '64956192860', '1983-05-19', 'Viela Adão Rodrigues, 388', 'Sao Paulo', 'SP', 1666);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1602, 'Lucas Theo Marcelo Nascimento', '15006118830', '1971-11-11', 'Rua Pedro Amaral, 846', 'Osasco', 'SP', 1604);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1603, 'Renato Juan Araújo', '21019511850', '1990-10-05', 'Rua Paulistânia, 653', 'Sao Paulo', 'SP', 1627);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1604, 'Otávio Joaquim Monteiro', '326005535  ', '1997-04-03', 'Rua Doutor Eugênio Fortes Coelho, 972', 'Sao Paulo', 'SP', 1627);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1605, 'Sophia Lavínia da Silva', '326879857  ', '1980-11-19', 'Travessa Capitão Sebastião Bernardino dos Santos, 623', 'Sao Paulo', 'SP', 1627);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1606, 'Camila Bruna Nicole Moura', '98534754802', '1998-08-05', 'Rua Toledo Malta, 884', 'Osasco', 'SP', 1654);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1607, 'Pedro Henrique Renato de Paula', '96301817893', '1998-08-25', 'Rua Azevedo Soares, 243', 'Sao Paulo', 'SP', 1627);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1608, 'Nicolas Theo Benício Oliveira', '86280864804', '1986-02-06', 'Rua Barreto de Menezes, 391', 'Osasco', 'SP', 1620);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1609, 'Kamilly Valentina Campos', '94040002806', '1989-01-08', 'Rua José Álvares Maciel 273, 386', 'Sao Paulo', 'SP', 1627);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1610, 'Matheus Calebe Araújo', '65974777824', '1994-05-22', 'Rua José Marciano Filho, 548', 'Osasco', 'SP', 1604);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1611, 'Yasmin Mirella Giovanna Rocha', '63959124880', '1996-01-09', 'Rua Plácido Schuring, 680', 'Osasco', 'SP', 1666);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (1612, 'Isaac Filipe Souza', '08911604852', '1959-07-26', 'Praça Filinto Muller, 287', 'Sao Paulo', 'SP', 1671);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2810, 'Antônio Carvalho dos Santos', '12343212312', '1995-01-31', 'Rua Antonio da Costa 558', 'Macapá', 'AP', 2805);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2811, 'Antônia Santos Carvalho', '52443312312', '1980-02-24', 'Rua Barão 1000', 'Macapá', 'AP', 2805);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2812, 'Jheferson Ontario', '32343262712', '1990-02-20', 'Rua Cardoso Pereira 2345', 'Macapá', 'AP', 2805);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2813, 'Wanderson Cardoso', '32447912312', '1986-03-31', 'Rua Antonio da Costa 550', 'Macapá', 'AP', 2805);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2814, 'Claudemir Leonidas', '12343312111', '1965-07-01', 'Rua Cláudio Arcanjo 12', 'Macapá', 'AP', 2805);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2830, 'Jose dos Santos', '12343222312', '1995-01-05', 'Rua Antonio Joao 1558', 'Porto Grande', 'AP', 2825);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2831, 'Antônia Carvalho Santos', '52343312312', '1980-03-20', 'Rua Carlos Junior 1600', 'Porto Grande', 'AP', 2825);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2832, 'Jheferson Otarion', '56343262712', '1990-12-15', 'Rua Cardoso Pereira 2945', 'Porto Grande', 'AP', 2825);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2833, 'Wander Cardoso Santos', '32947912312', '1996-03-01', 'Rua Antonio Carlos 950', 'Porto Grande', 'AP', 2825);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2834, 'Claudio Leon', '12343312451', '1985-07-09', 'Rua Claudio Jose Silva 12', 'Porto Grande', 'AP', 2825);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2850, 'Marcos Aparecido', '34343222312', '1976-04-06', 'Rua Miguel Rocha 1558', 'Ferreira Gomes', 'AP', 2845);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2851, 'Maria Moura', '56343312312', '1987-04-20', 'Rua Carlos Neto 1625', 'Ferreira Gomes', 'AP', 2845);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2852, 'Daniel Padrao', '89343262712', '1991-10-16', 'Rua Bruno Veado 345', 'Ferreira Gomes', 'AP', 2845);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2853, 'Wendel Saltao', '82447912312', '1990-01-21', 'Rua Antonio Calos 8950', 'Ferreira Gomes', 'AP', 2845);
INSERT INTO cliente (id, nome, cpf, data_nasc, endereco, cidade, estado, gerente) VALUES (2854, 'Diogo Guimaraes', '66343312451', '1975-04-19', 'Rua Claudia Sentada 66', 'Ferreira Gomes', 'AP', 2845);


--
-- TOC entry 2043 (class 0 OID 261290)
-- Dependencies: 178
-- Data for Name: clienteconta; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1210, '17  ', 1220);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1211, '17  ', 1221);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1212, '17  ', 1222);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1213, '1603', 1223);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1214, '2961', 1224);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2445, '2434', 1);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2445, '2434', 2);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2446, '2435', 3);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2447, '2436', 4);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2448, '2436', 5);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1901, '4603', 1900);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1902, '4603', 1901);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1903, '0924', 1900);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1903, '0924', 1901);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1907, '4629', 1900);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1904, '0785', 1900);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1905, '2451', 1900);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1906, '2451', 1901);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1, '1661', 50);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2, '1661', 60);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (3, '0552', 70);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (4, '0552', 80);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1738, '0319', 1748);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1739, '0319', 1749);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1740, '0319', 1750);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1741, '0319', 1751);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1742, '4248', 1752);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1743, '4248', 1753);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1744, '4248', 1754);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1745, '3312', 1755);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1746, '3312', 1756);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1747, '0053', 1757);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1748, '6641', 1758);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (100, '101 ', 100);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (101, '183 ', 101);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (102, '183 ', 102);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (103, '183 ', 103);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (104, '127 ', 104);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (5, '3935', 65);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (6, '3935', 55);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (7, '3938', 71);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (8, '3938', 80);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (9, '4089', 88);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (10, '4089', 99);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2510, '4158', 2020);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2511, '4158', 2021);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2512, '4652', 2022);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2513, '4652', 2023);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2514, '1662', 2024);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2515, '1662', 2025);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2516, '8132', 2026);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2517, '8132', 2027);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2518, '0234', 2028);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2519, '0234', 2029);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1600, '6986', 1600);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1601, '1812', 1601);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1602, '0637', 1602);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1603, '6838', 1603);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1604, '2809', 1604);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (700, '0455', 700);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (703, '0455', 701);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (710, '2557', 700);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (702, '2570', 700);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (707, '3342', 700);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (708, '0473', 700);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (708, '0473', 701);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (704, '0473', 701);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (702, '2570', 701);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (701, '2570', 701);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (709, '0455', 700);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (706, '3847', 700);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (713, '3495', 702);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (714, '3495', 703);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (715, '3495', 704);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (716, '3495', 705);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (717, '3495', 706);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (717, '5874', 100933);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (718, '5874', 100934);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (719, '2918', 100935);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (720, '6989', 100936);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2920, '3594', 2999);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2921, '1003', 2998);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2922, '4597', 2997);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2923, '3595', 2996);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2924, '2945', 2995);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1605, '0637', 1605);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1605, '1812', 1606);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1606, '6838', 1607);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1607, '2809', 1608);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1607, '0637', 1609);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1608, '1812', 1610);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1609, '6838', 1611);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1610, '2809', 1612);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1611, '0637', 1613);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1612, '1812', 1614);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2810, '2800', 2815);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2811, '2800', 2816);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1005, '3893', 1030);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1006, '1944', 1031);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1007, '2844', 1032);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1008, '2844', 1033);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (1009, '1428', 1034);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2812, '2800', 2817);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2813, '2800', 2818);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2814, '2800', 2819);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2830, '2801', 2835);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2831, '2801', 2836);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2832, '2801', 2837);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2833, '2801', 2838);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2834, '2801', 2839);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2850, '2802', 2855);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2851, '2802', 2856);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2852, '2802', 2857);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2852, '2802', 2858);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2854, '2802', 2859);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2870, '2803', 2875);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2871, '2803', 2876);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2872, '2803', 2877);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2873, '2803', 2878);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2874, '2803', 2879);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2889, '2804', 2892);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2890, '2804', 2893);
INSERT INTO clienteconta (id_cliente, cod_agencia, numero_conta) VALUES (2891, '2804', 2894);


--
-- TOC entry 2041 (class 0 OID 261270)
-- Dependencies: 176
-- Data for Name: conta; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('17  ', 1220, 223.589996, '2010-05-15');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('17  ', 1221, 500, NULL);
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('17  ', 1222, 735.119995, '2011-07-04');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1603', 1223, 145.020004, '2012-09-04');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2961', 1224, 100, NULL);
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2434', 1, 100, '2016-09-08');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2434', 2, 300, '2016-08-08');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2435', 3, 500, '2016-08-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2436', 4, 110, '2016-09-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2436', 5, 100, '2016-08-03');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4603', 1900, 1000.34003, '2016-09-15');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4603', 1901, 850.049988, '2016-09-14');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0924', 1900, 900.099976, '2016-07-16');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0924', 1901, 500.5, '2015-07-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4629', 1900, 650, '2016-07-30');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0785', 1900, 400, '2016-07-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2451', 1900, 8800, '2015-06-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2451', 1901, 750, '2016-04-28');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1661', 50, 200, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1661', 60, 600, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0552', 70, 100.5, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0552', 80, 200, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0319', 1748, 2356700, '1993-05-10');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0319', 1749, 12343222, '1994-12-04');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0319', 1750, 65433500, '1995-09-11');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0319', 1751, 234509, '1996-03-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4248', 1752, 3123400, '1997-05-11');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4248', 1753, 123421, '1998-03-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4248', 1754, 231243, '1999-06-12');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3312', 1755, 543523456, '1991-02-02');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3312', 1756, 2345123, '1992-01-11');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0053', 1757, 543623, '1993-05-12');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('6641', 1758, 99, '1994-05-09');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('101 ', 100, 9000, '2014-07-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('183 ', 101, 10000, '2015-02-10');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('183 ', 102, 40, '2016-03-14');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('183 ', 103, 3700, '2015-07-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('127 ', 104, 500000, '2014-07-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3935', 65, 1000, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3935', 55, 2000, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3938', 71, 650, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3938', 80, 2800, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4089', 88, 762.200012, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4089', 99, 452.700012, '2016-08-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4158', 2020, 544, '2016-09-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4158', 2021, 100, '2015-05-08');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4652', 2022, 1000, '2016-09-16');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4652', 2023, 2500.5, '2016-08-15');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1662', 2024, 68000, '2016-03-05');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1662', 2025, 421, '2016-01-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('8132', 2026, 1045, '2014-10-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('8132', 2027, 366, '2016-02-10');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0234', 2028, 4545, '2016-04-10');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0234', 2029, 8979, '2016-03-10');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('6986', 1600, 12.5, '2016-02-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1812', 1601, 782.570007, '2016-09-09');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0455', 700, 500.5, '2016-08-25');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2557', 700, 5000, '2016-09-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2570', 700, 15, '2016-09-09');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3342', 700, 100, '2016-08-22');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0473', 700, 100000, '2016-08-24');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0455', 701, 25.5, '2016-09-08');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2570', 701, 1500, '2016-09-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0473', 701, 900.5, '2016-08-29');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3847', 700, 9855.13965, '2016-07-22');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3495', 702, 7777.77002, '2016-09-02');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3495', 703, 6060, '2016-09-03');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3495', 704, 40000, '2016-09-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3495', 705, 3050.5, '2016-09-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3495', 706, 200, '2005-01-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('5874', 100933, 500, '2015-01-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('5874', 100934, 1000, '2015-02-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2918', 100935, 20, '2015-03-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('6989', 100936, 6000, '2015-04-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3594', 2999, 555555, '2016-09-15');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1003', 2998, 165489, '2000-11-26');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('4597', 2997, 1564898, '2015-10-05');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3595', 2996, 84564, '2014-02-19');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2945', 2995, 658894, '2016-08-25');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0637', 1602, 78.6500015, '2016-09-09');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('6838', 1603, 178.139999, '2016-09-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2809', 1604, 278.309998, '2016-03-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0637', 1605, 378.839996, '2016-07-04');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1812', 1606, 478.5, '2016-01-05');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('6838', 1607, 12.3299999, '2016-09-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2809', 1608, 28.1000004, '2016-05-03');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0637', 1609, 658.539978, '2016-02-15');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1812', 1610, 424.320007, '2016-08-25');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('6838', 1611, 112.470001, '2016-09-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2809', 1612, 28.2299995, '2016-05-03');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0637', 1613, 658.599976, '2016-02-15');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1812', 1614, 8.14999962, '2016-08-25');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2800', 2815, 2550.5, '2016-09-05');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2800', 2816, 20.5, '2016-09-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2800', 2817, -1.5, '2016-09-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2800', 2818, 555.5, '2016-09-09');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2800', 2819, 50.7000008, '2016-09-12');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2801', 2835, 2540.5, '2016-09-08');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2801', 2836, 203.5, '2016-09-02');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2801', 2837, -12.5, '2016-09-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('3893', 1030, 5350.5, '2016-09-10');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1944', 1031, 3490.04004, '2016-09-02');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2844', 1032, 1200, '2016-08-30');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2844', 1033, 15650.3398, '2016-09-13');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1428', 1034, 8900.86035, '2016-07-20');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('0129', 1035, 40.3199997, '2015-07-21');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('1428', 1036, 1900.32996, '2014-03-11');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2801', 2838, 551.5, '2016-09-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2801', 2839, 506.700012, '2016-09-10');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2802', 2855, 50.5, '2016-08-08');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2802', 2856, 293.5, '2016-02-12');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2802', 2857, 102.5, '2016-09-03');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2802', 2858, 581.5, '2016-01-08');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2802', 2859, 666.700012, '2016-06-06');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2803', 2875, 10.5, '2016-09-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2803', 2876, 503.5, '2016-09-03');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2803', 2877, 52.5, '2016-09-01');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2803', 2878, 151.5, '2016-09-07');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2803', 2879, 906.700012, '2016-09-11');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2804', 2892, 59.5, '2016-09-09');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2804', 2893, 303.5, '2016-03-11');
INSERT INTO conta (cod_agencia, numero, saldo, ultimo_acesso) VALUES ('2804', 2894, 162.5, '2016-10-04');


--
-- TOC entry 2039 (class 0 OID 261245)
-- Dependencies: 174
-- Data for Name: dependentes; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1700, 'Isadora Ex');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1700, 'Maria Ex');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1700, 'Isabella Ex');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1700, 'Isabela Ex');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1700, 'Marilia Ex');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1725, 'Karlla com2Ls');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1733, 'Arrozildo Feijão');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1731, 'Jacó João');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (100, 'kamilinha kaka');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (101, 'Renato P.');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (102, 'Patricia S.');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (103, 'Bruno Sergio');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (103, 'Laure L.');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (722, 'Anduin Wrynn');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (718, 'Thrall Frostwolf');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (720, 'Taretha Foxton');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (705, 'Gabriela Gianni Gonçalves');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (705, 'Gabriel Giannini Gonçalves');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (712, 'Luna Donadeli Silva');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (726, 'Carla Akabane');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (728, 'Joana Dark Davila');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (729, 'Gin Fricks Montebranco');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (727, 'Belzer de Bub da Luz');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (730, 'Karma Taro Dias');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2956, 'Arthur José Medeiros');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2941, 'Marilia Machado');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2988, 'Vitor Pinheiro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2901, 'Bruno Reis Borges');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2966, 'Laiz Carvalho Dias');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1000, 'Christiano Groysman');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1000, 'Fabiola Groysman');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1002, 'Maria Campos');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1002, 'Vitor Campos');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1003, 'Fabio Santos');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1004, 'Kylie Akira');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1004, 'Augusto Akira');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1200, 'Mariana Sophie Carvalho');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1200, 'Laís Mariane Carvalho');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1202, 'Nathan Vinicius De Paula');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1203, 'Caroline Gabriela Dos Santos');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1204, 'Pedro Paulo Fernandes');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2439, 'Ionice Podrena');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2439, 'Inarete feliciana');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2444, 'Pedro Afonso');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2444, 'Samira Realeza');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2442, 'Pedro Afonso');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1900, 'Gustavo Henrique Rocha');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1900, 'Augusto Cauê Kaique Rocha');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1901, 'Rodrigo Elias Dias');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1901, 'Caroline Beatriz Giovanna Monteiro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1902, 'Nicole Stefany Alice Freitas');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1903, 'Murilo Hugo Costa');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1904, 'Rafaela Melissa Olivia Rodrigues');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1904, 'Marcos Vinicius Theo Castro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1905, 'Elisa Caroline Melissa Carvalho');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1909, 'Camila Bárbara Nicole Cardoso');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1909, 'Lavínia Giovanna Nascimento');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1, 'Tifanny');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1, 'Carla');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2, 'Bruno');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2, 'Bruna');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (4, 'Jonas');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (5, 'Mauricio');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (7, 'Barbie');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (8, 'Polly');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (8, 'Valesca');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (9, 'Marcelo');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (9, 'Yuri');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (10, 'Gabriela');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (11, 'Debora');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (12, 'Valentina');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (12, 'Agatha');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (13, 'Livia');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (14, 'Samuel');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (14, 'Marianna');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (15, 'Lara');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (17, 'Raul');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (17, 'Gina');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (18, 'Marisa');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (19, 'Isabela');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (21, 'Vitor');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (22, 'Sara');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (23, 'Laura');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (24, 'Tamires');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (25, 'Rafael');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (26, 'Edna');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (27, 'Guilherme');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (27, 'Enzo');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (28, 'Beatrice');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (33, 'Eduarda');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (33, 'Gilberto');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (34, 'Monica');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (35, 'Iago');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (35, 'Maria');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (35, 'Kaue');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (36, 'Linda');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (36, 'Luisa');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (37, 'Victor');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (37, 'Samia');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (38, 'Marina');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (38, 'Lais');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (40, 'Louis');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (41, 'Talitha');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (42, 'Tamara');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (42, 'Sheila');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (43, 'Jamila');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (45, 'Susi');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (45, 'Lorenzo');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (46, 'Daniel');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (47, 'Lucas');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (48, 'Kauan');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (49, 'Rubens');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (49, 'Adriana');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (50, 'Ana Laura');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (50, 'Beatrice');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (52, 'Roberto');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (53, 'Max');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (55, 'Tulio');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (55, 'Tassio');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (56, 'Teodoro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (56, 'Rodrigo');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (58, 'Yasmin');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (60, 'Mariany');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2500, 'Rodrigo Heitor Felipe Oliveira');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2500, 'Lorenzo Hugo Theo Barros');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2501, 'Ryan Kevin Cauê Carvalho');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2502, 'Thales Davi Hugo Castro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2503, 'Cauê Enzo Juan Nascimento');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2503, 'Bruna Juan Fernandes');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2504, 'Fernanda Oliveira Pimenta');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2506, 'Maria de Castro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2506, 'Joao de Castro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2506, 'Rodrigo de Castro');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2507, 'Leonardo Ruan Fernandes');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2508, 'Iago Diogo Rodrigo Moura');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2508, 'Mayra Samuel da Silva Freitas');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2509, 'Josefa Lorenzo Campos');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2509, 'Cauê Augusto Moura');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1600, 'Joao Ricardo Cavalcanti');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1600, 'Maria Cavalcanti Oliveira');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1604, 'Manuel Mendes e Costa');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (1620, 'Heloisa Medeiros');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2805, 'Maria Aparecidade da Silva');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2806, 'Jorgina Silva');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2807, 'Cleide Souza');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2808, 'Carla Dario');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2809, 'Maria Dantas');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2825, 'Mariana Silva');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2826, 'Jorge Sousa');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2827, 'Claudia Moura');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2828, 'Carlos Dodo');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2829, 'Maria Lima');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2845, 'Mariana Goncalves');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2846, 'Maria Matos');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2847, 'Claudiano Joana');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2848, 'Bruno Lima');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2849, 'Maria Pereira');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2865, 'Marcos Leonardo');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2866, 'Joao Marques');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2867, 'Larissa Kitt');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2868, 'Carlos Pinto');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2869, 'Mario Bernardes');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2885, 'Marina Lares');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2886, 'Marcos Maria');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2887, 'Claudinei Joana');
INSERT INTO dependentes (funcionario, nome_dependente) VALUES (2888, 'Brunno Lourdes');


--
-- TOC entry 2038 (class 0 OID 261230)
-- Dependencies: 173
-- Data for Name: funcionario; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2956, 'José Silva Lima', '61995683215', '2005-11-02', '3595', 2988);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2901, 'Isadora Martins Oliveira', '61988752694', '2002-09-07', '4597', 2988);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2988, 'Erick Borges Gonsalves', '61992287416', '2000-04-26', '2945', 2941);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2966, 'Bianca Souza Silva', '61981956324', '2009-05-19', '1003', 2941);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2941, 'Otavio Pereira Mendonça', '61987456184', '2011-02-06', '3594', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1, 'Joao', '32457189', '2012-02-05', '1661', 1);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2, 'Ariane', '95415784', '2011-09-09', '1661', 2);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (3, 'Raphael', '32457895', '2015-03-25', '1661', 3);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (4, 'Breno', '83436819', '2013-02-20', '1661', 1);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (5, 'Luan', '99740707', '2015-03-25', '1661', 1);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (6, 'Matheus', '95415784', '2014-09-09', '1661', 1);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (7, 'Nicolas', '95415784', '2014-09-09', '1661', 2);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (8, 'Etienne', '32457189', '2012-02-05', '1661', 2);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (9, 'Pedro', '88741524', '2014-03-25', '1661', 2);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (10, 'Marcos', '32457189', '2012-02-05', '1661', 3);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (11, 'Lucas', '88741524', '2014-03-25', '1661', 3);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (12, 'Karen', '88751524', '2014-04-25', '1661', 3);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (13, 'Rodrigo', '32336451', '2014-11-07', '0552', 13);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (14, 'Marcelo', '32386722', '2012-03-06', '0552', 14);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (15, 'Mauricio', '33495887', '2014-04-23', '0552', 15);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (16, 'Jose', '91921076', '2014-02-28', '0552', 13);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (17, 'Gustavo', '88481065', '2014-05-25', '0552', 13);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (18, 'Ana', '95425784', '2014-09-09', '0552', 13);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (19, 'Jefferson', '91921076', '2014-11-23', '0552', 14);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (20, 'Jordan', '88481065', '2014-04-25', '0552', 14);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (21, 'Reis', '95425784', '2014-10-09', '0552', 14);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (22, 'Juca', '31239229', '2015-01-28', '0552', 15);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (23, 'Maria', '32358188', '2013-06-21', '0552', 15);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (24, 'Marcela', '32139222', '2012-12-09', '0552', 15);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (25, 'Jonas', '34353637', '2012-05-05', '3935', 25);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (26, 'Vitoria', '32383367', '2013-04-07', '3935', 26);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (27, 'Heliane', '32459912', '2014-02-19', '3935', 27);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (28, 'Josefa', '31234456', '2012-06-17', '3935', 25);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (29, 'Vanessa', '32367721', '2015-04-11', '3935', 25);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (30, 'Paulo', '38397766', '2015-08-21', '3935', 25);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (31, 'Henrique', '99291734', '2011-06-18', '3935', 26);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (32, 'Catarina', '96742746', '2015-09-15', '3935', 26);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (33, 'Yuri', '91291865', '2014-09-27', '3935', 26);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1700, 'João Jacó', '95870223', '1996-05-03', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1701, 'Marcelo Teixeira', '92312706', '1996-03-05', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1702, 'Ricardo Asteli', '87263745', '1995-05-07', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1703, 'Isabella Peixoto', '87917953', '2001-11-12', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1704, 'Mario Broder', '97615348', '1999-12-04', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1705, 'Luigi Broder', '97615349', '1999-11-04', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1706, 'Amanda Fernandes', '98641265', '1998-11-10', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1707, 'Felipe Gonzales', '95781256', '1997-12-01', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1708, 'Nicolas Luca', '94587654', '1993-01-10', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1709, 'Matheus Mitera', '96855687', '1992-10-01', '0319', 1700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1710, 'Felix Felices', '94589684', '1995-11-06', '4248', 1710);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1711, 'Nicolas Heitor', '95871257', '1994-10-08', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1712, 'Heitor Selembra', '96384567', '1987-11-04', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1713, 'Samuel Samambaia', '97548555', '1994-04-12', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1714, 'Amanda Ribeiro', '95819682', '1995-01-12', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1715, 'Julio Ribeiro', '97651548', '1998-12-01', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1716, 'Elias Bras', '95841258', '2004-11-04', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1717, 'Hugo Pereira', '86451265', '2004-02-02', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1718, 'Pedro Hugueira', '98641657', '1998-05-07', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1719, 'Pedrao Mito', '97651255', '1991-01-01', '4248', 1711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1720, 'Pedrao Lenda', '99995678', '1999-10-12', '3312', 1720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1721, 'Arthur Japa', '94586254', '1995-12-04', '3312', 1720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1722, 'Maximiliano Ferraz', '94651124', '1996-11-12', '3312', 1720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1723, 'Patrick Petrick', '96548765', '1997-10-05', '3312', 1720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1724, 'Thayline Gaston', '95684457', '1988-05-15', '3312', 1720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1725, 'Tassiana Hunberto', '99685548', '2007-10-11', '3312', 1720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1726, 'Pietra Pereira', '99855554', '2016-11-09', '3312', 1720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1727, 'Peter Parker', '95648844', '1997-12-02', '0053', 1727);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1728, 'Batman Supahman', '91537548', '1994-11-04', '0053', 1727);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1729, 'Bruce Waine', '99451875', '1999-12-09', '0053', 1727);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1730, 'Barry Allen', '99655568', '1993-10-03', '0053', 1727);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1731, 'Raphael Arrow', '96369636', '1993-11-10', '0053', 1727);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1732, 'Lucas Rapha', '95147536', '1999-12-01', '6641', 1732);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1733, 'Lidiane Prandini', '85248562', '2005-11-03', '6641', 1732);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1734, 'Patricia Nogueira', '95687458', '1999-11-03', '6641', 1732);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1735, 'Guilherme Vaz', '94567548', '2009-09-07', '6641', 1732);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1736, 'Bruna Patricia', '99684555', '2001-12-06', '6641', 1732);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1737, 'Bruno Felicio', '94564567', '2016-12-01', '6641', 1732);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (100, 'Lukas Kamilo', '21-988774433', '2010-12-11', '101 ', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (101, 'Ruth R. Sprouse', '21-97873213', '2015-05-04', '101 ', 100);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (102, 'Kenneth H. Kuhn', '21-988774433', '2012-07-01', '101 ', 100);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (103, 'Ryan V. Zarate', '21-988774433', '2013-01-22', '101 ', 100);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (104, 'Violet E. Molden', '21-988774433', '2014-05-21', '101 ', 100);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (34, 'Igor', '32349544', '2013-06-19', '3935', 27);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (35, 'Felipe', '32383345', '2012-10-17', '3935', 27);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (36, 'Vinicius', '31339888', '2014-09-27', '3935', 27);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (37, 'Chicao', '31267898', '2012-01-01', '3938', 36);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (38, 'Zuleide', '34563767', '2013-08-06', '3938', 37);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (39, 'Victor', '35367764', '2014-02-18', '3938', 38);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (40, 'Caue', '28154913', '2011-11-10', '3938', 36);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (41, 'Emanuel', '36123802', '2013-03-23', '3938', 36);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (42, 'Joana', '99152813', '2012-02-23', '3938', 36);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (43, 'Francis', '97841934', '2012-01-15', '3938', 37);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (44, 'Patricia', '85684727', '2013-03-27', '3938', 37);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (45, 'Thalia', '95496570', '2054-01-24', '3938', 37);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (46, 'Ricardo', '98451061', '2012-09-04', '3938', 38);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (47, 'Daniela', '88066667', '2013-11-21', '3938', 38);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (48, 'Marina', '93772153', '2014-02-03', '3938', 38);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (49, 'Carlos', '92263429', '2012-05-22', '4089', 49);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (50, 'Carolina', '93898463', '2013-07-13', '4089', 50);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (51, 'Helena', '99917830', '2014-11-18', '4089', 51);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (52, 'Tereza', '82919557', '2011-03-20', '4089', 49);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (53, 'Romario', '93884503', '2013-04-18', '4089', 49);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (54, 'Luan', '99152813', '2012-02-23', '4089', 49);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (55, 'Doni', '81588661', '2012-07-10', '4089', 50);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1000, 'Serginho Groysman', '(86)33126662', '1996-11-13', '3893', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1001, 'Cleyton Santos', '(86)32432967', '1998-12-25', '1944', 1000);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1002, 'Almeida Campos', '(86)32093838', '1990-01-07', '2844', 1001);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (56, 'Kamila', '93622400', '2013-05-04', '4089', 50);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (57, 'Selena', '96744904', '2054-05-13', '4089', 50);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (58, 'Willian', '32214578', '2012-09-25', '4089', 51);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (59, 'Rogerio', '81163676', '2013-11-11', '4089', 51);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (60, 'Jorge', '88754126', '2014-06-30', '4089', 51);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2869, 'Lucas Bernardes ', '96-31121991', '2011-11-06', '2803', 2865);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1003, 'Sasha Malkova', '(86)33126969', '1989-07-11', '1428', 1002);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1004, 'Remy Akira', '(86)33221145', '1987-09-04', '0129', 1003);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1200, 'Juan Raul Carvalho', '79 2793-9347', '2004-03-03', '17  ', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1201, 'Pedro Henrique Monteiro', '79 3752-9238', '2004-12-15', '17  ', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1202, 'Sophia Débora De Paula', '79 3957-7230', '2009-09-15', '1402', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1203, 'Danilo Thiago Dos Santos', '79 3579-1915', '2012-03-07', '1603', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1204, 'Brenda Marcela Fernandes', '79 2579-9219', '2014-04-14', '1603', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2439, 'Jorisclei Adson', '61999977777', '2015-03-12', '2434', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2440, 'Orelson Fabricio', '61996677488', '2016-07-21', '2434', 2439);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2441, 'Junilson Orlando', '61996537788', '2013-02-09', '2435', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2442, 'Samiriana Filha', '61997057588', '2016-03-08', '2435', 2441);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2443, 'Estroncio Valeriano', '61995698488', '2015-03-13', '2436', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2444, 'Fermina Samorado', '61991602988', '2016-07-07', '2436', 2443);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1900, 'Kevin Enzo Barros', '2727475413', '2011-09-14', '0924', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1901, 'Vitor Giovanni Raul Fernandes', '2728884964', '2015-07-13', '0924', 1900);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1903, 'Igor Rodrigo Gomes', '2838096443', '2000-03-17', '0785', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (700, 'Arthas Menethil', '034982514867', '2000-05-01', '0455', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (701, 'Emma Silva Gobbo', '034984145863', '2014-01-11', '0455', 700);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (702, 'Jaina Proudmoore', '034998147586', '2000-01-24', '0455', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (703, 'Gabriel Graco Gobbo', '034997154726', '2013-06-25', '0455', 702);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (704, 'Lara Rosa del Rey', '034985634847', '2015-05-17', '0455', 702);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (705, 'Lorenzo Gianni', '034978452536', '1998-02-01', '2557', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (706, 'Rachel Tribianni', '034985241563', '1997-01-27', '2557', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (707, 'Monica Salgado Fonseca', '034992364875', '2015-09-28', '2557', 705);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (708, 'Louis Borges Filho', '034987452563', '2011-12-09', '2557', 706);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (709, 'Isabel Donadeli de Souza', '034999584712', '1995-01-02', '2570', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (710, 'Joao Lucas de Martini', NULL, '2016-03-18', '2570', 709);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (711, 'Hadggar Khadgar', '034984712548', '1990-05-31', '3342', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (712, 'Leonardo Donadeli', NULL, '2016-05-19', '3342', 711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (713, 'Luis Fernando Donadeli', NULL, '2016-08-25', '3342', 711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (714, 'Sylvanas Windrunner', '034987562514', '1993-01-25', '0473', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (715, 'Tyrande Whisperwind', '034942365814', '1993-07-09', '0473', 714);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (716, 'Malfurion Stormrage', '034947253614', '1994-02-26', '0473', 715);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (717, 'Garrosh Hellscream', '034984666215', '2006-06-06', '3847', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (718, 'Durotan Frostwolf', '034999995847', '1989-08-05', '3847', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (719, 'Garona Halforcen', NULL, '2000-03-24', '3847', 718);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (720, 'Thrall Frostwolf', '034996655525', '2008-11-25', '2570', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (721, 'Voljin Darkspear', '034984444785', '2010-12-26', '2570', 720);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (722, 'Varian Wrynn', '034925364852', '1997-06-04', '3342', 711);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (723, 'Anduin Wrynn', NULL, '2016-08-31', '3342', 722);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (724, 'Illidan Stormrage', '034987562548', '1997-07-04', '0473', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (725, 'Maiev Shadowsong', '034955564789', '1997-07-04', '0473', 724);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (726, 'Celestia Ludenberg', '03491823742', '1996-07-06', '3495', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (727, 'Rock Barbosa Silva Ferreira', '034983151786', '2000-09-08', '3495', 726);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (728, 'Rafael Silva Poisson', '034999428877', '2012-09-12', '3495', 726);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (729, 'Amanda Bernouli', '034983678900', '2010-12-27', '3495', 726);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (730, 'Sinistro Lupus Taylor', '034988772233', '1994-08-30', '3495', 727);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (731, 'Joao Silva', '32812230', '2000-10-10', '5874', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (732, 'Maria Joana', '32812231', '2000-10-11', '5874', 731);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (733, 'Carlos Gomes', '32812232', '2000-10-12', '5874', 731);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (734, 'Mario Pedro', '3281223', '2000-10-13', '5874', 731);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (735, 'Jonathas Sales', '32812234', '2000-10-14', '4165', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (736, 'Pedro Sousa', '32812235', '2000-10-15', '2918', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (737, 'Stenio Rodrigues', '32812236', '2000-10-16', '2918', 736);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (738, 'Patricia Silveira', '32812237', '2000-10-17', '2918', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (739, 'Sandra Roma', '32812238', '2000-10-18', '6989', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (740, 'Maria Silveira', '32812239', '2000-10-19', '6989', 739);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1902, 'Heloisa Luna Araújo', '2828489865', '2003-04-01', '0785', 1903);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1905, 'Mirella Nina Alícia Pereira', '2728038008', '2011-06-07', '4603', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1904, 'Ester Betina Dias', '2737758733', '2014-05-17', '4603', 1905);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1906, 'Elias Augusto de Paula', '2727937115', '2005-07-16', '2451', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1907, 'Luiz Nicolas Anthony de Paula', '2727594652', '2008-06-23', '2451', 1906);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1909, 'Felipe Smith', '2727155322', '2007-10-25', '4629', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1908, 'Melissa Joana Nascimento', '2727707420', '2010-06-03', '4629', 1909);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2500, 'Enzo Miguel Lucca Rodrigues', '06826531096', '2016-09-09', '4158', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2501, 'Joaquim Marcelo Nascimento', '09737798299', '2016-09-08', '4158', 2500);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2503, 'Diego Caue Kevin Barbosa', '09736824560', '2016-09-06', '4652', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2502, 'Nathan Nicolas Monteira', '09729511109', '2016-09-07', '4652', 2503);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2505, 'Carlos Eduardo Theo Rocha', '07927769743', '2016-09-04', '1662', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2504, 'André Luan Marcelo Lima', '06826833932', '2016-09-05', '1662', 2505);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2506, 'Cauê Pietro Carvalho', '09527051997', '2016-09-03', '8132', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2507, 'Luiz Thiago Diogo Martins', '08225224332', '2016-09-02', '8132', 2506);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2508, 'Cauê Pietro Carvalho', '08225224332', '2016-09-01', '0234', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2509, 'Ian Enrico Gomes', '08439757596', '2016-08-30', '0234', 2508);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1654, 'Joao Andre Silva', '9845150213', '2005-08-10', '1812', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1671, 'Juliano Costa', '9975481203', '2009-11-22', '1812', 1654);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1600, 'Bianca Lorena Cavalcanti', '1136149166', '1988-02-13', '0637', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1604, 'Olivia Caroline Mendes', '11981932473', '2004-09-12', '6838', 1600);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1616, 'Pietro Emanuel Cavalcanti', '11997961353', '2009-08-26', '0637', 1604);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1620, 'Davi Enrico Freitas', '11981645170', '2007-07-22', '0637', 1616);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1666, 'Anthony Leonardo Murilo Carvalho', '1138223237', '1998-04-26', '2809', 1600);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (1627, 'Murilo Antonio Pietro Nascimento', '11996467720', '2006-10-19', '2809', 1666);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2805, 'Gustavo Silva', '96-32556598', '2005-01-31', '2800', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2806, 'Guilherme Silva', '96-32566878', '2001-02-01', '2800', 2805);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2807, 'Tobias Souza', '96-33512599', '2004-05-30', '2800', 2805);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2808, 'Bartolomeu Silva Dario', '96-32516952', '2008-06-24', '2800', 2805);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2809, 'Marcos Antonio Dantas', '96-31511591', '2010-01-03', '2800', 2805);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2825, 'Marc Silva', '96-32556985', '2005-01-25', '2801', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2826, 'Lara Sousa', '96-32566879', '2001-02-25', '2801', 2825);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2827, 'Maria Moura', '96-33512509', '2004-05-23', '2801', 2825);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2828, 'Marcio Silva Dodo', '96-32565952', '2008-06-28', '2801', 2825);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2829, 'Marcos Antonio Lima', '96-31511991', '2010-01-01', '2801', 2825);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2845, 'Mario Guilherme', '96-32556925', '2007-01-28', '2802', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2846, 'Laura Matos', '96-32566803', '2008-05-25', '2802', 2845);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2847, 'Maria Joana', '96-33512529', '2008-04-23', '2802', 2845);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2848, 'Bruna Lima', '96-32565964', '2009-01-28', '2802', 2845);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2849, 'Denner Pereira', '96-31511984', '2010-12-11', '2802', 2845);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2865, 'Mario Leonardo', '96-32548985', '2005-02-10', '2803', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2866, 'Lara Marques', '96-32566899', '2009-03-16', '2803', 2865);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2867, 'Maria Kitt', '96-33515409', '2003-05-24', '2803', 2865);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2868, 'Maria Pinto', '96-32598952', '2002-09-30', '2803', 2865);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2885, 'Marcio Junior', '96-33256925', '2006-02-20', '2804', NULL);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2886, 'Laura Maria', '96-33266803', '2005-03-26', '2804', 2885);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2887, 'Josefa Joana', '96-33212529', '2004-04-24', '2804', 2885);
INSERT INTO funcionario (num_funcional, nome, telefone, data_admissao, agencia, supervisor) VALUES (2888, 'Bianca Lara', '96-33265964', '2003-05-29', '2804', 2885);


--
-- TOC entry 2042 (class 0 OID 261280)
-- Dependencies: 177
-- Data for Name: operacao; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0319', 1748, 1759, 'S', 'Saque', '1998-06-09 05:05:00', 55);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0319', 1749, 1760, 'D', 'Deposito', '1999-05-10 04:06:00', 132);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0319', 1750, 1761, 'S', 'Saque', '2001-09-11 15:32:00', 4321);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0319', 1751, 1762, 'S', 'Saque', '1993-11-07 21:09:00', 890);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4248', 1752, 1763, 'D', 'Deposito', '1999-05-10 04:06:00', 7869);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4248', 1753, 1764, 'S', 'Saque', '1994-01-04 03:12:00', 432);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4248', 1754, 1765, 'D', 'Deposito', '1989-10-02 23:32:00', 4568);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3312', 1755, 1766, 'D', 'Deposito', '2009-02-11 09:16:00', 789);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3312', 1756, 1767, 'D', 'Deposito', '2011-05-10 06:06:00', 728);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0053', 1757, 1768, 'S', 'Saque', '2004-09-01 00:00:00', 684);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('6641', 1758, 1769, 'S', 'Saque', '2005-07-06 00:00:00', 3378);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('101 ', 100, 1, '1', 'deposito', '2016-01-01 14:00:01', 2000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('183 ', 101, 2, '0', 'saque', '2016-01-05 11:33:32', -1000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('183 ', 102, 1, '0', 'deposito', '2016-04-11 07:30:41', 500);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('183 ', 103, 1, '0', 'deposito', '2016-03-10 19:40:55', 200);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('127 ', 104, 1, '0', 'saque', '2016-07-07 12:20:07', -30);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0455', 700, 700, 'D', 'Pagamento de Luz', '2015-10-01 08:14:50', 120);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0455', 700, 701, 'D', 'Pagamento de Luz', '2015-11-01 14:04:00', 150);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2570', 701, 700, 'C', 'Pagamento de jogo online', '2015-11-01 14:04:00', 129);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2570', 701, 701, 'C', 'Pagamento de tenis em loja online', '2015-12-25 23:04:10', 70);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2570', 701, 702, 'D', 'Pagamento em praça alimentiçao', '2016-01-20 20:40:20', 50);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3847', 700, 700, 'D', 'Pagamento de motocicleta', '2016-05-10 14:25:20', 8000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0473', 700, 700, 'D', 'Compra de apartamento', '2016-02-20 15:15:10', 80000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3495', 702, 777, 'C', 'Pagamento de Armamento Militar', '2016-08-09 15:30:45', 10000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3495', 703, 781, 'D', 'Ganho na loteria', '2016-05-05 16:32:20', 12345.6699);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3495', 704, 789, 'D', 'Seu Madruga pagou o Aluguel', '2016-04-04 16:16:16', 900);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3495', 705, 799, 'C', 'Pag. de Material Radioativo', '2016-03-03 13:20:10', 30520.0996);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3495', 706, 744, 'C', 'Pagamento de Itens de Caça', '2016-09-09 22:10:03', 720.25);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3595', 2996, 156, 'S', 'Retirada de Dinheiro', '2016-09-12 11:55:23', 2116);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3594', 2999, 545, 'S', 'Retirada de Dinheiro', '2016-02-02 09:32:00', 4444);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1003', 2998, 153, 'D', 'Depositado Dinheiro', '2016-08-18 10:48:08', 48962);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4597', 2997, 854, 'S', 'Retirada de Dinheiro', '2016-05-26 10:12:29', 35488);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2945', 2995, 489, 'D', 'Depositado Dinheiro', '2016-06-26 11:26:41', 268743);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3893', 1030, 1080, 'D', 'Compra c/ cartao', '2016-09-07 12:09:30', 850);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1944', 1031, 1081, 'C', 'Deposito', '2016-09-02 10:40:47', 2000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2844', 1032, 1082, 'D', 'Compra c/ cartao', '2016-08-17 20:15:34', 450);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2844', 1033, 1083, 'D', 'Saque', '2016-08-27 13:45:56', 6000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2844', 1033, 1084, 'C', 'Deposito', '2016-09-13 09:00:23', 10000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0129', 1035, 1085, 'D', 'Saque', '2016-03-07 08:53:59', 30);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('17  ', 1220, 1, 'C', 'Deposito', '2010-04-12 11:49:37', 500);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('17  ', 1220, 2, 'D', 'Pagamento de boleto', '2010-05-15 14:35:23', 149.490005);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1603', 1223, 1, 'C', 'Deposito', '2012-07-24 13:56:22', 100);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1603', 1223, 2, 'D', 'Pagamento de luz', '2012-09-04 10:26:19', 29.25);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('17  ', 1222, 1, 'C', 'Deposito', '2011-07-04 13:11:08', 250);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2434', 1, 1, 'S', 'saque', '2016-09-15 15:36:38', 70);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2434', 2, 1, 'S', 'saque', '2016-09-15 18:14:38', 50);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2435', 3, 1, 'S', 'saque', '2016-09-15 12:30:38', 100);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2436', 4, 1, 'S', 'saque', '2016-09-15 14:35:30', 110);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2436', 5, 1, 'S', 'saque', '2016-09-15 17:19:12', 100);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4603', 1900, 1900, 'D', 'Pagamento CEMIG', '2016-09-15 15:30:00', 300);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4603', 1901, 1901, 'C', 'Salario', '2016-09-14 20:15:00', 250);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0924', 1901, 1900, 'D', 'Tenda do Cafe', '2015-07-07 15:30:00', 200);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0924', 1900, 1901, 'D', 'Americanas', '2016-07-16 15:30:00', 30);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4629', 1900, 1900, 'C', 'Reembolso Cartao', '2016-07-30 15:30:00', 400);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0785', 1900, 1900, 'D', 'Pagamento CEMIG', '2016-07-06 15:30:00', 700);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2451', 1900, 1900, 'D', 'Pagamento CEMIG', '2015-06-20 15:30:00', 200);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1661', 50, 1, 'C', 'Transferencia para RIOT GAMES', '2016-08-21 08:00:17', 100);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1661', 60, 2, 'D', 'Transferencia para Outra Titularidade', '2016-08-22 10:15:11', 305);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0552', 70, 3, 'D', 'Compra de um aviao', '2016-09-15 12:30:56', 15000001);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0552', 70, 4, 'C', 'Pagamento da Conta de Agua', '2016-09-15 21:00:37', 63.2999992);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0552', 80, 5, 'D', 'Pagamento da Conta de Telefone', '2016-08-23 15:45:18', 99.9899979);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3935', 65, 6, 'C', 'Compra de um carro', '2016-09-14 13:15:00', 175000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3935', 55, 7, 'C', 'Compra de um Imovel', '2016-08-15 22:00:40', 3000000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3938', 71, 8, 'D', 'Pagamento de Emprestimo Bancario', '2016-08-29 23:30:34', 5000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('3938', 80, 9, 'D', 'Transferencia para outro banco', '2016-09-11 14:20:13', 102.220001);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4089', 88, 10, 'D', 'Compra de um Iate', '2016-09-10 11:11:11', 5000000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4089', 99, 11, 'D', 'Aluguel de Boate', '2016-08-21 16:45:32', 200000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4158', 2020, 2030, 'C', 'Supermercado', '2016-05-04 15:30:00', 525);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4158', 2021, 2031, 'C', 'Tenda E', '2015-05-04 09:40:00', 250);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4652', 2022, 2032, 'D', 'Loja eletronico', '2015-02-10 17:22:44', 2325);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('4652', 2023, 2033, 'D', 'Reembolso', '2012-03-04 07:59:22', 5254);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1662', 2024, 2034, 'C', 'Sacolão', '2016-10-02 12:10:00', 1234);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1662', 2025, 2035, 'C', 'Extra.com', '2016-07-04 15:35:00', 786);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('8132', 2026, 2036, 'C', 'Walmart', '2016-03-12 13:12:00', 578625);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('8132', 2027, 2037, 'D', 'Restaurante', '2014-01-04 11:30:04', 678);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0234', 2028, 2038, 'C', 'Hipermercado', '2013-11-04 16:47:50', 4352);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0234', 2029, 2039, 'C', 'Loja roupas', '2016-08-04 10:20:11', 8453);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('6986', 1600, 1600, 'd', 'Debito', '2015-08-25 10:45:32', 25.2099991);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1812', 1601, 1601, 'd', 'Debito', '2016-09-09 13:12:12', 12.3500004);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0637', 1602, 1602, 'c', 'Credito', '2016-02-05 17:49:52', 32.0200005);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('6838', 1603, 1603, 'd', 'Debito', '2016-07-04 11:07:12', 74.2300034);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2809', 1604, 1604, 'd', 'Debito', '2016-03-07 09:46:32', 33.1300011);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('0637', 1605, 1605, 'c', 'Credito', '2016-07-04 10:45:32', 8.10000038);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('1812', 1606, 1606, 'c', 'Credito', '2016-08-25 10:45:32', 11.1400003);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('6838', 1611, 1611, 'd', 'Debito', '2016-08-18 10:45:32', 105.07);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2800', 2815, 2820, 'S', 'Pagamento conta', '2016-09-05 00:00:00', 50);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2800', 2816, 2821, 'D', 'Depósito conta', '2016-09-01 00:00:00', 50.75);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2800', 2817, 2822, 'D', 'Depósito pedro', '2016-09-07 00:00:00', 550);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2800', 2818, 2823, 'S', 'Pagamento luz', '2016-09-09 00:00:00', 10000);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2800', 2819, 2824, 'D', 'Depósito antônio', '2016-09-12 00:00:00', 75.8000031);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2801', 2835, 2840, 'D', 'Deposito Poupa', '2016-09-08 00:00:00', 190);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2801', 2836, 2841, 'S', 'Saque Energia', '2016-09-02 00:00:00', 56.75);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2801', 2837, 2842, 'S', 'Pagamento Agua', '2016-09-06 00:00:00', 50);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2801', 2838, 2843, 'S', 'Pagamento Condom', '2016-09-07 00:00:00', 100);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2801', 2839, 2844, 'D', 'Depósito Jorge', '2016-09-10 00:00:00', 70.8000031);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2802', 2855, 2860, 'D', 'Deposito Mensal', '2016-08-08 00:00:00', 390);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2802', 2856, 2861, 'S', 'Saque Mercado', '2016-02-12 00:00:00', 196.75);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2802', 2857, 2862, 'S', 'Pagamento Agua', '2016-09-06 00:00:00', 40);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2802', 2858, 2863, 'S', 'Pagamento Energia', '2016-09-07 00:00:00', 160);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2802', 2859, 2864, 'D', 'Depósito Pagamento', '2016-09-10 00:00:00', 870.799988);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2803', 2875, 2880, 'D', 'Deposito Poupa', '2016-09-01 00:00:00', 180);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2803', 2876, 2881, 'S', 'Saque Energia', '2016-09-03 00:00:00', 51.75);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2803', 2877, 2882, 'D', 'Alugel Recebido', '2016-09-01 00:00:00', 10);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2803', 2878, 2883, 'S', 'Pagamento Condom', '2016-09-07 00:00:00', 90);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2803', 2879, 2884, 'D', 'Depósito Jorge', '2016-09-11 00:00:00', 10.8000002);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2804', 2892, 2897, 'S', 'Party Nigth', '2016-09-09 00:00:00', 490);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2804', 2893, 2898, 'S', 'Saque Emergencia', '2016-03-11 00:00:00', 400.75);
INSERT INTO operacao (cod_agencia, numero_conta, seq, tipo, descricao, datahora, valor) VALUES ('2804', 2894, 2899, 'S', 'Pagamento Condominio', '2016-10-04 00:00:00', 80);


--
-- TOC entry 1905 (class 2606 OID 261227)
-- Name: pkagencia; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agencia
    ADD CONSTRAINT pkagencia PRIMARY KEY (codigo);


--
-- TOC entry 1913 (class 2606 OID 261262)
-- Name: pkcliente; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pkcliente PRIMARY KEY (id);


--
-- TOC entry 1917 (class 2606 OID 261274)
-- Name: pkconta; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT pkconta PRIMARY KEY (cod_agencia, numero);


--
-- TOC entry 1911 (class 2606 OID 261249)
-- Name: pkdependentes; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dependentes
    ADD CONSTRAINT pkdependentes PRIMARY KEY (funcionario, nome_dependente);


--
-- TOC entry 1909 (class 2606 OID 261234)
-- Name: pkfuncionario; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT pkfuncionario PRIMARY KEY (num_funcional);


--
-- TOC entry 1919 (class 2606 OID 261284)
-- Name: pkoperacao; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operacao
    ADD CONSTRAINT pkoperacao PRIMARY KEY (cod_agencia, numero_conta, seq);


--
-- TOC entry 1915 (class 2606 OID 261264)
-- Name: uqcpf; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT uqcpf UNIQUE (cpf);


--
-- TOC entry 1907 (class 2606 OID 261229)
-- Name: uqnome; Type: CONSTRAINT; Schema: banco; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agencia
    ADD CONSTRAINT uqnome UNIQUE (nome);


--
-- TOC entry 1920 (class 2606 OID 261235)
-- Name: fkagencia; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fkagencia FOREIGN KEY (agencia) REFERENCES agencia(codigo);


--
-- TOC entry 1926 (class 2606 OID 261293)
-- Name: fkcliente; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY clienteconta
    ADD CONSTRAINT fkcliente FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- TOC entry 1924 (class 2606 OID 261275)
-- Name: fkcod_agencia; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT fkcod_agencia FOREIGN KEY (cod_agencia) REFERENCES agencia(codigo);


--
-- TOC entry 1925 (class 2606 OID 261285)
-- Name: fkconta; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY operacao
    ADD CONSTRAINT fkconta FOREIGN KEY (cod_agencia, numero_conta) REFERENCES conta(cod_agencia, numero);


--
-- TOC entry 1927 (class 2606 OID 261298)
-- Name: fkconta; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY clienteconta
    ADD CONSTRAINT fkconta FOREIGN KEY (cod_agencia, numero_conta) REFERENCES conta(cod_agencia, numero);


--
-- TOC entry 1922 (class 2606 OID 261250)
-- Name: fkfuncionario; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY dependentes
    ADD CONSTRAINT fkfuncionario FOREIGN KEY (funcionario) REFERENCES funcionario(num_funcional);


--
-- TOC entry 1923 (class 2606 OID 261265)
-- Name: fkgerente; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fkgerente FOREIGN KEY (gerente) REFERENCES funcionario(num_funcional);


--
-- TOC entry 1921 (class 2606 OID 261240)
-- Name: fksupervisor; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fksupervisor FOREIGN KEY (supervisor) REFERENCES funcionario(num_funcional);


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 6
-- Name: banco; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA banco FROM PUBLIC;
REVOKE ALL ON SCHEMA banco FROM postgres;
GRANT ALL ON SCHEMA banco TO postgres;
GRANT ALL ON SCHEMA banco TO PUBLIC;


-- Completed on 2016-09-22 18:53:15

--
-- PostgreSQL database dump complete
--

--retirandoa as restrinções

ALTER TABLE funcionario
    DROP CONSTRAINT fkagencia ;

ALTER TABLE clienteconta
    DROP CONSTRAINT fkcliente ;

ALTER TABLE conta
    DROP CONSTRAINT fkcod_agencia ;

ALTER TABLE operacao
    DROP CONSTRAINT fkconta ;

ALTER TABLE clienteconta
    DROP CONSTRAINT fkconta ;

ALTER TABLE dependentes
    DROP CONSTRAINT fkfuncionario ;

ALTER TABLE cliente
    DROP CONSTRAINT fkgerente ;

ALTER TABLE funcionario
    DROP CONSTRAINT fksupervisor ;

-- recolocando

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fkagencia FOREIGN KEY (agencia) REFERENCES agencia(codigo) ON DELETE SET NULL ON UPDATE CASCADE;


ALTER TABLE ONLY clienteconta
    ADD CONSTRAINT fkcliente FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE SET NULL ON UPDATE CASCADE;


ALTER TABLE ONLY conta
    ADD CONSTRAINT fkcod_agencia FOREIGN KEY (cod_agencia) REFERENCES agencia(codigo) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE ONLY operacao
    ADD CONSTRAINT fkconta FOREIGN KEY (cod_agencia, numero_conta) REFERENCES conta(cod_agencia, numero) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE ONLY clienteconta
    ADD CONSTRAINT fkconta FOREIGN KEY (cod_agencia, numero_conta) REFERENCES conta(cod_agencia, numero) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ONLY dependentes
    ADD CONSTRAINT fkfuncionario FOREIGN KEY (funcionario) REFERENCES funcionario(num_funcional) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE ONLY cliente
    ADD CONSTRAINT fkgerente FOREIGN KEY (gerente) REFERENCES funcionario(num_funcional) ON DELETE SET NULL ON UPDATE CASCADE ;


ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fksupervisor FOREIGN KEY (supervisor) REFERENCES funcionario(num_funcional) ON DELETE NO ACTION ON UPDATE NO ACTION;


--2 b)
--ALTER TABLE ONLY operacao 
  --  ADD CONSTRAINT checatipo CHECK (tipo ='C' OR tipo = 'D');

    --2 d)
    --ALTER TABLE operacao ALTER COLUMN tipo NOT NULL;
SELECT C.nome FROM cliente C, clienteconta CC, conta CT, operacao OP 
	WHERE C.id = CC.id_cliente AND CC.numero_conta = CT.numero 
		AND CC.cod_agencia = CT.cod_agencia
		AND CT.numero = OP.numero_conta
		AND OP.valor > 20000
