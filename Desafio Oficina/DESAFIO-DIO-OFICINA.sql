-- *** → Juliano F. da Mata ← ***

-- Criação Banco de Dados de Oficina para o Desafio DIO
--
-- DROP DATABASE desafio_dio_oficina;
CREATE DATABASE IF NOT EXISTS desafio_dio_oficina;
USE desafio_dio_oficina;

-- Criar Tabela cliente
CREATE TABLE Cliente(
        idCliente INT AUTO_INCREMENT PRIMARY KEY,
        enderecoCliente VARCHAR(255),
        contatoCliente VARCHAR(14) NOT NULL,
        emailCliente VARCHAR(45)
);
ALTER TABLE Cliente AUTO_INCREMENT = 1;

-- criação Tabela Clientes PJ

CREATE TABLE ClientePJ(
        idClientePJ_Cliente INT,  -- chave estrangeira da tabela cliente
        CNPJClientePJ CHAR(18) NOT NULL,
        razaoSocialClientePJ VARCHAR(255),
        PRIMARY KEY (idClientePJ_Cliente),
        CONSTRAINT unico_CNPJClientePJ UNIQUE (CNPJClientePJ),
        CONSTRAINT fk_idClientePJ_Cliente FOREIGN KEY (idClientePJ_Cliente)
            REFERENCES Cliente (idCliente) 
                ON UPDATE CASCADE
);

-- criação Tabela Clientes PF
CREATE TABLE ClientePF(
        idClientePF_Cliente INT,  -- chave estrangeira da tabela cliente
        CPFClientePF CHAR(14) NOT NULL,
        nomeClientePF VARCHAR(15) NOT NULL,
        sobreNomeClientePF VARCHAR(45) NOT NULL,
        sexoClientePF ENUM('M', 'F', 'Outro') NOT NULL,
        dataNascimentoClientePF DATE NOT NULL,
        PRIMARY KEY (idClientePF_Cliente),
        CONSTRAINT unico_CPFClientePF UNIQUE (CPFClientePF),
        CONSTRAINT fk_idClientePF_Cliente FOREIGN KEY (idClientePF_Cliente)
            REFERENCES Cliente (idCliente) 
                ON UPDATE CASCADE
);
DESC Cliente;
DESC ClientePJ;
DESC ClientePF;  

--
-- Criar Tabela Automóvel
--

CREATE TABLE Automovel (
         idAutomovel INT AUTO_INCREMENT PRIMARY KEY,
         idAutomovel_Cliente INT,
         marcaAutomovel VARCHAR(30) NOT NULL,
         modeloAutomovel VARCHAR(30) NOT NULL,
         anoAutomovel FLOAT NOT NULL,
         corAutomovel VARCHAR(30) NOT NULL,
         tipoAutomovel ENUM('Conversível', 'Sedã', 'Hatchback', 'Coupé', 'Perua ou SW', 'SUV', 'Picape', 'Minivan', 'Van', 'Buggy') NOT NULL,
         placaAutomovel CHAR(7),
         chassiAutomovel VARCHAR(20),
         CONSTRAINT fk_idAutomovel_Cliente FOREIGN KEY (idAutomovel_Cliente)
            REFERENCES cliente (idCliente)
);
ALTER TABLE Automovel AUTO_INCREMENT = 1;
DESC Automovel;   

--
-- Criar Tabela Equipe
--

CREATE TABLE Equipe (
         idEquipe INT AUTO_INCREMENT PRIMARY KEY,
         idEquipe_Automovel INT,
         nomeEquipe CHAR(2) NOT NULL,  -- -- O nome da equipe tem iniciais do setor correspondente
         setorEquipe ENUM('Elétrica', 'Lanternagem', 'Mecânica') NOT NULL,
         CONSTRAINT fk_idEquipe_Automovel FOREIGN KEY (idEquipe_Automovel)
            REFERENCES Automovel (idAutomovel)            
);
ALTER TABLE Equipe AUTO_INCREMENT = 1;
DESC Equipe;

--
-- Criar Tabela Serviço
--
CREATE TABLE Servico (
         idServico INT AUTO_INCREMENT PRIMARY KEY,
         idServico_Equipe INT,
         idServico_Cliente INT,
         descricaoServico VARCHAR(45) NOT NULL,
         CONSTRAINT fk_idServico_Equipe FOREIGN KEY (idServico_Equipe)
            REFERENCES Equipe (idEquipe),
         CONSTRAINT fk_idServico_Cliente FOREIGN KEY (idServico_Cliente)
            REFERENCES cliente (idCliente)
);
ALTER TABLE Servico AUTO_INCREMENT = 1;
DESC Servico;

--
-- Criar Tabela Pagamento
--

CREATE TABLE Pagamento(
        idPagamento INT AUTO_INCREMENT PRIMARY KEY,
        idPagamento_Servico INT,
        tipoPagamento ENUM ('Boleto', 'Cartão de Crédito', 'Cartão de Débito', 'PIX') NOT NULL,
        numeroCartao CHAR(16),
        qtdeParcelas INT,
        codigoBoleto FLOAT,
        codigoPIX VARCHAR(45),
        CONSTRAINT fk_idPagamento_Servico FOREIGN KEY (idPagamento_Servico)
            REFERENCES Servico (idServico) 
                ON UPDATE CASCADE
);
ALTER TABLE Pagamento AUTO_INCREMENT = 1;

DESC Pagamento;    

--
-- Criar Tabela Mecânico
--

CREATE TABLE Funcionario (
         idFuncionario INT AUTO_INCREMENT PRIMARY key,
         idFuncionario_Equipe INT,
         CPFFuncionario CHAR(14) NOT NULL,
         nomeFuncionario VARCHAR(15) NOT NULL,
         sobrenomeFuncionario VARCHAR(45) NOT NULL,
         sexoFuncionario ENUM('M', 'F', 'Outro') NOT NULL,
         dataNascimentoFuncionario DATE NOT NULL,
         enderecoFuncionario VARCHAR(255) NOT NULL,
         contatoFuncionario VARCHAR(14) NOT NULL,
         especialidadeFuncionario VARCHAR(45),
         CONSTRAINT unico_CPFFuncionario UNIQUE (CPFFuncionario),
         CONSTRAINT fk_idFuncionario_Equipe FOREIGN KEY (idFuncionario_Equipe)
            REFERENCES Equipe (idEquipe)         
);
ALTER TABLE Funcionario AUTO_INCREMENT = 1;

DESC Funcionario; 


--
-- Criar Tabela OS(Ordem de Serviço)
--

CREATE TABLE OS (
         idOS INT AUTO_INCREMENT PRIMARY KEY,
         idOS_Pagamento INT,
         numNotaFiscalOS VARCHAR(65) NOT NULL,
         valorOS DECIMAL(10, 2) NOT NULL,
         dataEntradaOS DATE NOT NULL,
         dataConclusao DATE NOT NULL,
         statusOS ENUM('Entregue', 'Encaminhada', 'Cancelada'),
         CONSTRAINT unico_numNotaFiscalOS UNIQUE(numNotaFiscalOS),
         CONSTRAINT fk_idOS_Pagamento FOREIGN KEY (idOS_Pagamento)
            REFERENCES Pagamento (idPagamento)
);
ALTER TABLE OS AUTO_INCREMENT = 1;

DESC OS;

--
-- Criar Tabela Peças  
--

CREATE TABLE Pecas (
         idPeca INT AUTO_INCREMENT PRIMARY KEY,
         descricaoPeca VARCHAR(30) NOT NULL,
         valorPeca DECIMAL(10, 2) NOT NULL
);
ALTER TABLE Pecas AUTO_INCREMENT = 1;
DESC Pecas;

--
-- Criar Tabela OS/Peças
--

CREATE TABLE OSPecas (     -- 'Pecas' corresponde a 'peças', prefiro não usar caracteres especiais em nome Tabelas
         idOSPecas_OS INT,
         idOSPecas_Pecas INT,
         quantidadePecas INT,
         CONSTRAINT fk_idOSPecas_OS FOREIGN KEY (idOSPecas_OS)
            REFERENCES OS (idOS),
         CONSTRAINT fk_idOSPecas_Pecas FOREIGN KEY (idOSPecas_Pecas)
            REFERENCES Pecas (idPeca)
);
DESC OSPecas;
--
-- Criar Tabela OS/Serviço
--

CREATE TABLE OSServico (
         idOSServico_OS INT,
         idOSServico_Servico INT,
         PRIMARY KEY (idOSServico_OS, idOSServico_Servico),
         CONSTRAINT fk_idOSServico_OS FOREIGN KEY (idOSServico_OS)
            REFERENCES OS (idOS),
         CONSTRAINT fk_idOSServico_Servico FOREIGN KEY (idOSServico_Servico)
            REFERENCES Servico (idServico)
);
DESC OsServico;

--  ------------------------------------------------------------------------------------------------------------------------------------------------------  --

SHOW TABLES;
SHOW DATABASES;

USE information_schema;
SHOW TABLES;

DESC table_constraints;
DESC referential_constraints;
--
-- Recuperando as constraints no banco de dados 'desafio_dio_oficina'
-- https://dev.mysql.com/doc/refman/8.0/en/fulltext-search.html
-- função "MATCH"

SELECT * 
    FROM referential_constraints
        WHERE constraint_schema = 'desafio_dio_oficina';

--  ------------------------------------------------------------------------------------------------------------------------------------------------------  --

--
-- 2ª Parte Desafio: Dados

USE desafio_dio_oficina;

-- Inserção de dados Cliente
-- Cliente (idCliente, enderecoCliente, contatoCliente, emailCliente)

INSERT INTO Cliente (enderecoCliente, contatoCliente, emailCliente)
        VALUES ('Avenida Brasil, 29, Boa Viagem - Belo Horizonte/MG', '(31)3452-8263','xyz@uol.com'),
               ('Rua Carlos Augusto Cornelsen, 54, Bom Descanso - Contagem/MG', '(31)2253-3755', 'welodat438@bongcs.com'),
               ('Avenida São João, 124, Vila Joana - Sabará/MG', '(31)3765-2942', 'malzewf@netveplay.com'),
               ('Rua Arlindo Nogueira, 1006, Centro - Betim/MG', '(31)2211-7547','ak47@netveplay.com'),
               ('Rua Barão de Vitória, 329, Casa Grande - Belo Horizonte/MG','(31)3425-8373','eleiover@netveplay.com'),
               ('Avenida Rio Branco, 511, Centro - Belo Horizonte/MG', '(32)2041-6136', 'wolf64@uorak.com');

DESC Cliente;
SELECT * FROM Cliente;

-- Dados inseridos Tabela Cliente PJ
-- DESC ClientePJ;
-- ClientePJ(idClientePJ_Cliente, CNPJClientePJ, razaoSocialClientePJ) 
             
INSERT INTO ClientePJ (idClientePJ_Cliente, CNPJClientePJ, razaoSocialClientePJ)
        VALUES (1, '67.384.865/0001-70', 'Concessionária Pé no Chão Ltda'),
               (2, '96.839.381/0001-76', 'Vida Nova Taxi Ltda'),
               (3, '92.653.534/0001-35', 'Vida Boa Turismo Ltda');
 
 SELECT * FROM ClientePJ;
 
-- Dados inseridos Tabela Cliente PF
-- DESC ClientePF;
-- ClientePF(idClientePF_cliente, CPFClientePF, nomeClientePF, sobreNomeClientePF, dataNascimentoClientePF)
 
INSERT INTO ClientePF (idClientePF_cliente, CPFClientePF, nomeClientePF, sobreNomeClientePF, sexoClientePF, dataNascimentoClientePF)
        VALUES (4, '488.888.238-08', 'Maria', 'Silva', 'F','1985-12-19'),
               (5, '612.750.742-19', 'Matheus', 'Pimentel', 'M', '2000-02-01'),
               (6, '360.272.418-29', 'Julia', 'França', 'F', '1960-10-27');
               
SELECT * FROM ClientePF; 

-- Dados inseridos Tabela Automovel
-- DESC Automovel;
-- Tabela Automovel (idAutomovel, idAutomovel_Cliente, marcaAutomovel , modeloAutomovel, anoAutomovel, corAutomovel, tipoAutomovel, placaAutomovel, chassiAutomovel)

INSERT INTO Automovel (idAutomovel_Cliente, marcaAutomovel, modeloAutomovel, anoAutomovel, corAutomovel, tipoAutomovel, placaAutomovel, chassiAutomovel)
        VALUES (2 , 'Chevrolet', 'Vectra', 2007, 'Verde', 'Hatchback', 'GVV2145', '68b dAD75F kl 0j7635'),
               (3 , 'Ford ', 'Escort XR3 ', 1998, 'Preto', 'Conversível', 'GER5674', '7A0 568JuT lu VA0598'),
               (5 , 'Chevrolet', 'kadett gsi', 1993, 'Branco', 'Conversível', 'LVU9036', '26A rA363u kP DD4641'),
               (1 , 'Chevrolet', 'Onix Plus', 2022, 'Vinho', 'Sedã', 'JQL3401', '7AW pEPp9D 16 LW9568'),
               (1 , 'Hyundai', 'HB20', 2020, 'Verde', 'Hatchback', 'ADV3232', '5nS 8GV2aA Ap Al3485'),
               (1 , 'Honda', 'Civic Si', 2019, 'Azul', 'Coupé', 'HPL6979', '2GX A84nbA rl tA6925'),
               (3 , 'Fiat', 'Palio Weekend', 2018,'Verde', 'Perua ou SW', 'LXP5066', '8w0 gAg4Pd 52 8x8498'),
               (4 , 'Jeep', 'Renegade', 2021,'Branco', 'SUV', 'MNR9421', '1Y8 9S81x1 8u JM2619'),
               (2 , 'Fiat', 'Strada', 2020, 'Vermelho', 'Picape', 'JBK7498', '7Ab F99AE6 Ma ph9406'),
               (1 , 'Citroën', 'Xsara Picasso', 2007, 'Prata', 'Hatchback', 'JUC6976', '2G9 Jt967K 4d AA9658'),
               (1 , 'Mercedez-Benz', 'Sprinter', 2015, 'Prata', 'Minivan', 'MVB2584', '1V7 w4Rfyc h8 wn2287'),
               (6 , 'Buggy', 'Buggy', 1999, 'Vermelho', 'Buggy', 'MXO0117', '6fK P1F2Ea cs pS1067');

SELECT * FROM Automovel;

-- Dados inseridos Tabela Equipe
-- DESC Equipe;
-- Tabela Equipe (idEquipe,idEquipe_Automovel, nomeEquipe, setorEquipe)
-- O nome da equipe tem iniciais do setor correspondente

INSERT INTO Equipe (idEquipe_Automovel, nomeEquipe, setorEquipe)
        VALUES (1, 'E1', 'Elétrica'),
               (2, 'E2', 'Elétrica'),
               (3, 'L1', 'Lanternagem'),
               (4, 'L2', 'Lanternagem'),
               (5, 'L3', 'Lanternagem'),
               (6, 'M1', 'Mecânica'),
               (7, 'M2', 'Mecânica'),
               (8, 'M3', 'Mecânica'),
               (9, 'M4', 'Mecânica');
  
  SELECT * FROM Equipe;
  
-- Dados inseridos Tabela Serviço
-- DESC Serviço;
-- Tabela Serviço (idServico, idServico_Equipe, idServico_Cliente, descricaoServico)


INSERT INTO Servico (idServico_Equipe, idServico_Cliente, descricaoServico)
        VALUES (1, 1, 'Parte elétrica'),
               (2, 2, 'Parte elétrica'),
               (3, 3, 'Lanternagem'),
               (4, 4, 'Lanternagem'),
               (5, 5, 'Lanternagem'),
               (6, 6, 'Mecânico');

SELECT * FROM Servico;

-- Dados inseridos Tabela Pagamento
-- DESC Pagamento;
-- Tabela Pagamento (idPagamento, idPagamento_Servico, tipoPagamento ENUM ('Boleto', 'Cartão de Crédito', 'Cartão de Débito', 'PIX'), numeroCartao, qtdeParcelas, codigoBoleto, codigoPIX)

INSERT INTO Pagamento (idPagamento_Servico, tipoPagamento, numeroCartao, qtdeParcelas, codigoBoleto, codigoPIX)
        VALUES (1, 'Cartão de Débito', '5531445502928074', 1, NULL, NULL),
               (2, 'Cartão de Crédito', '5177552792429850', 6, NULL, NULL),
               (3, 'Cartão de Débito', '4539671673152344', 1, NULL, NULL),
               (4, 'Cartão de Crédito', '4916899759060528', 10, NULL, NULL),
               (5, 'Cartão de Crédito', '5522520699296609', 5, NULL, NULL),
               (6, 'Cartão de Crédito', '6062827936948114', 3, NULL, NULL);

SELECT * FROM Pagamento ;


-- Dados inseridos Tabela Funcionário
-- DESC Funcionário;
-- Tabela Funcionário (idFuncionario, idFuncionario_Equipe, CPFFuncionario, nomeFuncionario, sobrenomeFuncionario, sexoFuncionario, dataNascimentoFuncionario, enderecoFuncionario, contatoFuncionrio, especialidadeFuncionario)

INSERT INTO Funcionario (idFuncionario_Equipe, CPFFuncionario, nomeFuncionario, sobrenomeFuncionario, sexoFuncionario, dataNascimentoFuncionario, enderecoFuncionario, contatoFuncionario, especialidadeFuncionario)
        VALUES (1, '894.738.847-53', 'Evelyn', 'Nunes', 'F', '1999-03-19', 'Rua São Guilherme, 54, Santa Inês - Belo Horizonte/MG', '31842727168', 'Elétrica'),
               (1, '598.137.314-86', 'Francisco', 'Lima', 'M', '1999-08-12', 'Rua Sargento Vilmar de Oliveira, 257,	Betânia -Belo Horizonte/MG', '31460534278', 'Elétrica'),
               (2, '231.221.225-02', 'Ana', 'Clara Oliveira', 'F', '1998-02-12', 'Rua Geraldino Heleodoro de Carvalho, 15, São Bernardo - Belo Horizonte/MG', '31041269757', 'Elétrica'),
               (2, '135.426.935-70', 'Marcela', 'Cunha', 'F', '1989-06-16', 'Rua Joaquim de Castro, 126, Conjunto Minascaixa - Belo Horizonte/MG', '31851134841', 'Elétrica'),
               (2, '624.383.868-43', 'Clarice', 'Freitas', 'F', '1971-12-08', 'Beco A, 658, Cabana do Pai Tomás - Belo Horizonte/MG', '31153106534', 'Elétrica'),
               (3, '815.875.819-30', 'João', 'Guilherme Barbosa', 'M', '1987-08-29', 'Rua Maria da Matta Castro, 6978, Conjunto Confisco - Belo Horizonte/MG', '31348475440', 'Lanternagem'),
               (3, '457.236.573-30', 'Miguel', 'Santos', 'M', '2000-11-15', 'Rua Altemísia Maria dos Santos, 9567, Havaí - Belo Horizonte/MG', '31287490884', 'Lanternagem'),
               (4, '174.135.373-46', 'Gabrielly', 'Correia', 'F', '1968-11-18', 'Rua Irineu Garcia de Oliveira, 5472, Independência (Barreiro) - Belo Horizonte/MG', '31455876429', 'Lanternagem'),
               (4, '818.665.963-30', 'Luiz', 'Felipe Rodrigues', 'M', '1982-06-14', 'Rua A, 251, Vista Alegre, Belo Horizonte/MG', '31724661106', 'Lanternagem'),
               (4, '203.710.551-72', 'Thales', 'da Rocha', 'M', '1976-04-15', 'Rua Otaviano Rodrigues de Souza, 369, Conjunto Jatobá (Barreiro) - Belo Horizonte/MG', '31674352035', 'Lanternagem'),
               (4, '433.282.011-81', 'Renan', 'Melo', 'M', '1989-10-29', 'Rua A quatro, 444, Betânia - Belo Horizonte/MG', '31280039017', 'Lanternagem'),
               (5, '877.554.441-55', 'Júlia', 'da Luz', 'F', '1986-12-02', 'Rua Aarão Reis,	12, Centro - Belo Horizonte/MG', '31929463839', 'Lanternagem'),
               (5, '118.265.623-46', 'Gabriel', 'Gomes', 'm', '1975-12-08', 'Beco AA, 52, Vila Barragem Santa Lúcia - Belo Horizonte/MG', '31075497863', 'Lanternagem'),
               (5, '680.283.338-77', 'Carlos', 'Novaes', 'M', '1965-02-28', 'Rua Eustáquio de Jesus do Nascimento, 784, Santa Cruz (Barreiro) - Belo Horizonte/MG', '31402837041', 'Lanternagem'),
               (6, '444.470.756-95', 'Lívia', 'Rezende', 'F', '1997-09-05', 'Rua Abacaba, 235, Suzana - Belo Horizonte/MG', '31018965348', 'Mecânica'),
               (6, '355.374.776-53', 'Alice', 'Gomes', 'F', '1966-11-10', 'Praça dos Abacateiros, 76, Vila Cloris - Belo Horizonte,/MG', '31998447224', 'Mecânica'),
               (7, '459.672.117-30', 'Sarah', 'Melo', 'F', '1992-09-02', 'Rua Abatiá, 13, Conjunto Celso Machado - Belo Horizonte/MG', '31886070884', 'Mecânica'),
               (7, '325.334.984-59', 'Gabrielly', 'Mendes', 'F', '2003-07-26', 'Rua Acorde, 897, Santana do Cafezal - Belo Horizonte/MG', '31441347882', 'Mecânica'),
               (8, '544.686.120-53', 'Beatriz', 'Moreira', 'F', '1968-08-08', 'Rua Parati, 45, São Mateus - Contagem/MG', '31217161884', 'Mecânica'),
               (8, '424.753.817-95', 'Isabelly', 'Monteiro', 'Outro', '1993-05-25', 'Rua Cabo Frio, 257, Estrela Dalva - Contagem/MG', '31422120108', 'Mecânica'),
               (9, '321.243.234-90', 'Fernando', 'Pinto', 'Outro', '1984-08-19', 'Avenida Durval Alves de Faria, 321, Tropical - Contagem/MG', '31426820108', 'Mecânica'),
               (9, '478.300.156-19', 'Calebe', 'Oliveira', 'M', '1981-12-21', 'Alameda das Camélias, 244, Estância do Sereno PTB - Betim/MG', '31998441124', 'Mecânica'),
               (9, '474.201.854-09', 'Luigi', 'Barros', 'M', '1991-12-07', 'Rua Achiles do Pinho Ângelo, 7927, Conjunto Habitacional Bueno Franco - Betim/MG', '31062965348', 'Mecânica');

SELECT * FROM Funcionario;         

-- Dados inseridos Tabela OS
-- DESC OS;
-- Tabela OS (idOS, idOS_Pagamento, numNotaFiscalOS, valorOS, dataEntradaOS, dataConclusao, statusOS
        
INSERT INTO OS (idOS_Pagamento, numNotaFiscalOS, valorOS, dataEntradaOS, dataConclusao, statusOS)
        VALUES (1, '31191017921427000125650010000000309887252170', 550, '2019-09-15', '2019-10-25', 'Entregue'),
               (2, '31201017921427000125650010000000309887251370', 800, '2020-09-12', '2020-09-30', 'Entregue'),
               (3, '31201117921427000125650010000000309887254170', 2250, '2020-10-05', '2020-11-15', 'Entregue'),
               (4, '31211017921427000125650010000000309887251970', 3200, '2021-08-07', '2021-10-02', 'Entregue'),
               (5, '31211117921427000125650010000000309887256170', 4580, '2021-09-22', '2021-12-11', 'Cancelada'),
               (6, '31220917921427000125650010000000309887251270', 1590, '2022-08-10', '2022-09-14', 'Encaminhada');      

SELECT * FROM OS;

-- Dados inseridos Tabela Peças
-- DESC Pecas;
-- Tabela Pecas (idPeca, descricaoPeca, valorPeca)

INSERT INTO Pecas (descricaoPeca, valorPeca)
        VALUES ( 'Kit freio completo', '3500'),
               ( 'Volante', '980'),
               ( 'Pedal Acelerador', '350'),
               ( 'Rodas Liga Leve', '4500'),
               ( 'Caixa de direção', '1250'),
               ( 'Bateria Moura', '450'),
               ( 'Tinta', '98'),
               ('Caixa de ar', '380'),
               ( 'Estribo externo', '1290');
               
SELECT * FROM Pecas;

-- Dados inseridos Tabela OSPecas
-- DESC OSPecas;
-- Tabela OSPecas (idOSPecas_OS, idOSPecas_Pecas, quantidadePecas)

INSERT INTO OSPecas (idOSPecas_OS, idOSPecas_Pecas, quantidadePecas)
        VALUES (1, 1, 1),
               (2, 2, 1),
               (3,3, 1),
               (4, 4, 1),
               (6, 5, 1),
               (2, 6, 1),
               (5, 7, 1),
               (4, 8, 1),
               (3, 9, 0);

SELECT * FROM OSPecas;

-- Dados inseridos Tabela OSPecas
-- DESC OSServico;
-- Tabela OSServico (idOSServico_OS, idOSServico_Servico)

INSERT INTO OSServico (idOSServico_OS, idOSServico_Servico)
        VALUES ('1', '1'),
               ('2', '2'),
               ('3', '3'),
               ('4', '4'),
               ('5', '5'),
               ('6', '6');
            
SELECT * FROM OSServico;

--  ------------------------------------------------------------------------------------------------------------------------------------------------------  --

-- 3ª Parte Desafio: Consultas 

-- 1ª Calcule a idade, retorne nome completo, endereço e contatos dos cliente 'pessoa física' ordenando pelo mais velho.

SELECT CONCAT(C_PF.nomeClientePF, ' ', C_PF.sobreNomeClientePF) AS Cliente,
       TIMESTAMPDIFF(YEAR, C_PF.dataNascimentoClientePF, NOW()) AS Idade,
       C.enderecoCliente AS Endereço,
       C.contatoCliente AS Contato,
       C.emailCliente AS Email
FROM
   ClientePF C_PF, Cliente C
   WHERE C.idCliente = C_PF.idClientePF_cliente
    ORDER BY Idade DESC;
    
-- 2ª Calcule a idade, retorne nome completo, endereço e especialidade dos 'Funcionários'  ordenando pelo mais velho.
 
 SELECT CONCAT(nomeFuncionario, ' ', sobrenomeFuncionario) AS Funcionário,
       TIMESTAMPDIFF(YEAR, F.dataNascimentoFuncionario, NOW()) AS Idade,
       enderecoFuncionario AS Endereço,
       especialidadeFuncionario AS Especialidade
FROM
  Funcionario F
   -- WHERE F.idFuncionario
    ORDER BY Idade DESC;
   
-- 3ª  Relação de nomes dos clientes, modelo do automovel e equipes da oficina;

-- Cliente PF

SELECT  C_PF.idClientePF_cliente AS ID,
        CONCAT(C_PF.nomeClientePF, ' ', sobreNomeClientePF) AS Cliente,
        A.marcaAutomovel AS Marca, 
        A.modeloAutomovel AS Modelo, 
        A.tipoAutomovel AS Tipo,
        E.nomeEquipe AS Equipe,
        E.setorEquipe AS Setor
	FROM Automovel A
		INNER JOIN ClientePF C_PF
            ON A.idAutomovel_Cliente = C_PF.idClientePF_Cliente
        INNER JOIN Equipe E
            ON A.idAutomovel = E.idEquipe_Automovel;
            
-- Cliente PJ
            
SELECT  C_PJ.idClientePJ_Cliente AS ID,
        C_PJ.razaoSocialClientePJ AS Cliente,
        A.marcaAutomovel AS Marca, 
        A.modeloAutomovel AS Modelo, 
        A.tipoAutomovel AS Tipo,
        E.nomeEquipe AS Equipe,
        E.setorEquipe AS Setor
	FROM Automovel A
		INNER JOIN ClientePJ C_PJ
            ON A.idAutomovel_Cliente = C_PJ.idClientePJ_Cliente
        INNER JOIN Equipe E
            ON A.idAutomovel = E.idEquipe_Automovel;
         
        
-- 4ª Relação Cliente PF, serviço, pagamento e OS(data Conclusão)

SELECT CONCAT(nomeClientePF, ' ', sobreNomeClientePF) AS 'Cliente PF',       
       
       C.contatoCliente AS Contato,
       S.descricaoServico AS 'Descrição',
       OS.dataConclusao AS 'Data conclusão',
       OS.valorOS AS 'Valor',
       P.tipoPagamento AS 'Tipo pagamento',
       OS.statusOS AS 'Status Ordem de Serviço'
    FROM Cliente C 
        INNER JOIN Servico S 
            ON C.idCliente = S.idServico_Cliente
        INNER JOIN Pagamento P 
            ON P.idPagamento_Servico = S.idServico
        INNER JOIN ClientePF C_PF 
            ON C.idCliente = C_PF.idClientePF_Cliente
        INNER JOIN OS
            ON OS.idOS_Pagamento = P.idPagamento;

-- Clente PJ

SELECT razaoSocialClientePJ AS 'Cliente PJ',       
       
       C.contatoCliente AS Contato,
       S.descricaoServico AS 'Descrição',
       OS.dataConclusao AS 'Data conclusão',
       OS.valorOS AS 'Valor',
       P.tipoPagamento AS 'Tipo pagamento',
       OS.statusOS AS 'Status Ordem de Serviço'
    FROM Cliente C 
        INNER JOIN Servico S 
            ON C.idCliente = S.idServico_Cliente
        INNER JOIN Pagamento P 
            ON P.idPagamento_Servico = S.idServico
        INNER JOIN ClientePJ C_PJ 
            ON C.idCliente = C_PJ.idClientePJ_Cliente
        INNER JOIN OS
            ON OS.idOS_Pagamento = P.idPagamento;
            
-- 5ª Retorna dados de serviço, automóvel e cliente filtrando por data

-- Cliente PF

SELECT CONCAT(C_PF.nomeClientePF, ' ', C_PF.sobreNomeClientePF) AS 'Cliente PF',
       C.contatoCliente AS Contato,
       C.emailCliente AS Email,
       C_PF.CPFClientePF AS CPF,
       A.marcaAutomovel AS Marca,
       A.modeloAutomovel AS Modelo,
       A.tipoAutomovel AS Tipo,
       A.anoAutomovel AS Ano,
       A.placaAutomovel AS Placa,
       S.descricaoServico AS 'Serviço'
    FROM Servico S
        INNER JOIN Cliente  C
            ON C.idCliente = S.idServico_Cliente
        INNER JOIN ClientePF C_PF
            ON C.idCliente = C_PF.idClientePF_Cliente
        INNER JOIN Automovel A
            ON A.idAutomovel_Cliente = C.idCliente
                WHERE A.anoAutomovel < 2000
                    ORDER BY C_PF.nomeClientePF ASC;
                    
-- Cliente PJ

SELECT DISTINCT C_PJ.razaoSocialClientePJ AS 'Cliente PF',
       C_PJ.CNPJClientePJ AS CNPJ,
       C.contatoCliente AS Contato,
       C.emailCliente AS Email,
       A.marcaAutomovel AS Marca,
       A.modeloAutomovel AS Modelo,
       A.tipoAutomovel AS Tipo,
       A.anoAutomovel AS Ano,
       A.placaAutomovel AS Placa,
       S.descricaoServico AS 'Serviço'
    FROM Servico S
        INNER JOIN Cliente  C
            ON C.idCliente = S.idServico_Cliente
        INNER JOIN ClientePJ C_PJ
            ON C.idCliente = C_PJ.idClientePJ_Cliente
        INNER JOIN Automovel A
            ON A.idAutomovel_Cliente = C.idCliente
        INNER JOIN Equipe E
            ON E.idEquipe_Automovel = A.idAutomovel
               WHERE A.anoAutomovel BETWEEN 1995 AND 2010
                    ORDER BY C_PJ.razaoSocialClientePJ ASC;
  
 -- 6ª Retorna nome funcionários isentando sexo masculino , suas idades, equipes e automóveis para serviço. Ordenação por idade decrescente.

SELECT CONCAT(F.nomeFuncionario, ' ', F.sobrenomeFuncionario) AS 'Funcionário', 
       TIMESTAMPDIFF(YEAR, F.dataNascimentoFuncionario, NOW()) AS Idade,
       sexoFuncionario AS Sexo,
       A.modeloAutomovel AS Modelo,
       A.marcaAutomovel AS Marca,
       E.nomeEquipe
       FROM Automovel A
            INNER JOIN Equipe E 
                ON E.idEquipe_Automovel = A.idAutomovel
            INNER JOIN Funcionario F
                ON F.idFuncionario_Equipe = E.idEquipe
                    WHERE F.sexoFuncionario <> 'M'
                        ORDER BY Idade DESC;

-- 7ª Retorna
-- Like - endereço cliente em Belo Horizonte
-- Group By - cor automóvel
-- Having  - automóvel 'Branco'                      

                        
SELECT A.modeloAutomovel AS Modelo,
       A.marcaAutomovel AS Marca,
       S.descricaoServico AS 'Serviço',
       C.contatoCliente AS Contato,
       C.enderecoCliente AS 'Endereço Cliente'
       FROM Automovel A
            INNER JOIN Cliente C
                ON C.idCliente = A.idAutomovel_Cliente
            INNER JOIN Equipe E
                ON E.idEquipe_Automovel = A.idAutomovel
            INNER JOIN Servico S 
                ON S.idServico_Cliente = C.idCliente
            INNER JOIN Funcionario F 
                ON F.idFuncionario_Equipe = E.idEquipe
                WHERE C.enderecoCliente LIKE '%Bel%'
                    GROUP BY A.corAutomovel
                    HAVING A.corAutomovel = 'branco';






