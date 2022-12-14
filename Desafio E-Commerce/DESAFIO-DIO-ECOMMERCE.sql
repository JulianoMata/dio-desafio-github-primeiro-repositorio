--
-- Criação Banco de Dados de E-commerce para o Desafio DIO
--
-- DROP DATABASE desafio_dio_ecommerce;
CREATE DATABASE IF NOT EXISTS desafio_dio_ecommerce;
USE desafio_dio_ecommerce;

-- Criar Tabela cliente
CREATE TABLE Cliente(
        idCliente INT AUTO_INCREMENT PRIMARY KEY,
        logradouroCliente VARCHAR(45),
        numeroLogradouroCliente INT,
        bairroCliente VARCHAR(30),
        CEPCliente CHAR(8) NOT NULL,
        cidadeCliente VARCHAR(30) NOT NULL,
        UFCliente CHAR(2) NOT NULL,
        paisCliente VARCHAR(30) NOT NULL,
        contatoCliente VARCHAR(11) NOT NULL,
        emailCliente VARCHAR(45)
);

ALTER TABLE Cliente AUTO_INCREMENT = 1;

-- criação Tabelas Clientes PJ e PF

CREATE TABLE ClientePJ(
        idClientePJ INT AUTO_INCREMENT PRIMARY KEY,
        idClientePJ_Cliente INT,  -- chave estrangeira da tabela cliente
        CNPJClientePJ CHAR(18) NOT NULL,
        razaoSocialClientePJ VARCHAR(255),
        CONSTRAINT unico_CNPJClientePJ UNIQUE (CNPJClientePJ),
        CONSTRAINT fk_idClientePJ_Cliente FOREIGN KEY (idClientePJ_Cliente)
            REFERENCES Cliente (idCliente) 
                ON UPDATE CASCADE
);
ALTER TABLE ClientePJ AUTO_INCREMENT = 1;

CREATE TABLE ClientePF(
        idClientePF INT AUTO_INCREMENT PRIMARY KEY,
        idClientePF_cliente INT,  -- chave estrangeira da tabela cliente
        CPFClientePF CHAR(14) NOT NULL,
        primeiroNomeClientePF VARCHAR(15) NOT NULL,
        inicialNomeMeioClientePF CHAR(3),
        sobreNomeClientePF VARCHAR(15) NOT NULL,
        dataNascimentoClientePF DATE NOT NULL,
        CONSTRAINT unico_CPFClientePF UNIQUE (CPFClientePF),
        CONSTRAINT fk_idClientePF_Cliente FOREIGN KEY (idClientePF_Cliente)
            REFERENCES Cliente (idCliente) 
                ON UPDATE CASCADE
);
ALTER TABLE ClientePF AUTO_INCREMENT = 1;

DESC Cliente;
DESC ClientePF;
DESC ClientePJ;

-- 
-- Criar Tabela Fornecedor
--

CREATE TABLE Fornecedor(
        idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
        razaoSocialFornecedor VARCHAR(255) NOT NULL,
        CNPJFornecedor CHAR(18) NOT NULL,
        contatoFornecedor CHAR(11) NOT NULL,
        logradouroFornecedor VARCHAR(45) NOT NULL,
        numeroLogradouroFornecedor INT,
        bairroFornecedor VARCHAR(30) NOT NULL,
        CEPFornecedor CHAR(8) NOT NULL,
        cidadeFornecedor VARCHAR(30) NOT NULL,
        UFFornecedor CHAR(2) NOT NULL,
        paisFornecedor VARCHAR(30) NOT NULL,
       CONSTRAINT unico_CNPJFornecedor UNIQUE (CNPJFornecedor)
);
ALTER TABLE Fornecedor AUTO_INCREMENT = 1;
DESC Fornecedor;

--
-- Criar Tabela TerceiroVendedor
--

CREATE TABLE Vendedor(
        idVendedor INT AUTO_INCREMENT PRIMARY KEY,
        razaoSocialVendedor VARCHAR(255) NOT NULL,
        nomeFantasiaVendedor VARCHAR(255),
        CNPJVendedor CHAR(18),
        CPFVendedor CHAR(14),
        logradouroVendedor VARCHAR(45),
        numeroLogradouroVendedor INT,
        bairroVendedor VARCHAR(30),
        cidadeVendedor VARCHAR(30),
        CEPVendedor CHAR(8),
        UFVendedor CHAR(2),
        paisVendedor VARCHAR(30),                        
        contatoVendedor CHAR(11) NOT NULL,
        CONSTRAINT unico_CNPJVendedor UNIQUE (CNPJVendedor),
        CONSTRAINT unico_CPFVendedor UNIQUE (CPFVendedor)
);
ALTER TABLE Vendedor AUTO_INCREMENT = 1;
DESC Vendedor;
--
-- Criar Tabela Produto
--
CREATE TABLE Produto(
        idProduto INT AUTO_INCREMENT PRIMARY KEY,
        nomeProduto VARCHAR(45) NOT NULL,
        classificacaoProduto ENUM ('Feminino', 'Masculino', 'Infantil', 'Não se aplica'),
        categoriaProduto ENUM ('Alimentos', 'Brinquedos', 'Eletrônicos', 'Livros', 'Vestuário', 'Móveis', 'Outra') NOT NULL,
        valorProduto DECIMAL(10, 2) NOT NULL,
        avaliacaoProduto FLOAT DEFAULT 0,
        tamanhoProduto VARCHAR(10)       
);
ALTER TABLE Produto AUTO_INCREMENT = 1;
DESC Produto;

--
-- Criar Tabela Estoque
--

CREATE TABLE Estoque(
        idEstoque INT AUTO_INCREMENT PRIMARY KEY,
        logradouroEstoque VARCHAR(45),
        numeroLogradouroEstoque INT,
        bairroEstoque VARCHAR(30),
        CEPEstoque CHAR(8),
        cidadeEstoque VARCHAR(30),
        UFEstoque CHAR(2),
        paisEstoque VARCHAR(30)
);
ALTER TABLE Estoque AUTO_INCREMENT = 1;
DESC Estoque;

--
-- Criar Tabela Pedido
--
 CREATE TABLE Pedido(
        idPedido INT AUTO_INCREMENT PRIMARY KEY,
        idPedido_Cliente INT,
        statusPedido ENUM ('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
        descricaoPedido VARCHAR(255),
        dataPedido DATE,
        -- CONSTRAINT unico_idPedido UNIQUE (idPedido),
        CONSTRAINT fk_idPedido_Cliente FOREIGN KEY (idPedido_Cliente)
            REFERENCES Cliente (idCliente) 
                ON UPDATE CASCADE
);
ALTER TABLE Pedido AUTO_INCREMENT = 1;
DESC Pedido;

--
-- Criar Tabela Entrega
--

CREATE TABLE Entrega(
        idEntrega INT AUTO_INCREMENT PRIMARY KEY,
        idEntrega_Pedido INT,
        statusEntrega ENUM ('A caminho', 'Entregue', 'Recusado', 'Extravio') NOT NULL,
        observacaoEntrega MEDIUMTEXT,
        codigoRastreio VARCHAR(15) NOT NULL,
        dataEntrega DATE,
        CONSTRAINT fk_idEntrega_Pedido FOREIGN KEY (idEntrega_Pedido)
            REFERENCES Pedido (idPedido)
                ON UPDATE CASCADE
);

ALTER TABLE Entrega AUTO_INCREMENT = 1;
DESC Entrega;

--
-- Criar Tabela Pagamento
--

CREATE TABLE Pagamento(
        idPagamento INT AUTO_INCREMENT PRIMARY KEY,
        idPagamento_Pedido int,
        valorPagamento DECIMAL(10, 2) NOT NULL,
        valorFrete FLOAT DEFAULT 10,
        cachPagamento BOOLEAN DEFAULT FALSE,
        tipoPagamento ENUM ('Boleto', 'Cartão de Crédito', 'Cartão de Débito', 'PIX') NOT NULL,
        numeroCartao CHAR(16),
        qtdeParcelas INT,
        codigoBoleto FLOAT,
        codigoPIX VARCHAR(45),
        CONSTRAINT fk_idPagamento_Pedido FOREIGN KEY (idPagamento_Pedido)
            REFERENCES Pedido (idPedido) 
                ON UPDATE CASCADE
);
 ALTER TABLE Pagamento AUTO_INCREMENT = 1;
DESC Pagamento;       
    
--
-- Criar Tabela FornecedorProduto
--

CREATE TABLE ProdutoFornecedor(
        idProdutoFornecedor_Fornecedor INT, 
        idProdutoFornecedor_Produto INT,
        quantidadeProdutoFornecedor INT DEFAULT 0,
        PRIMARY KEY (idProdutoFornecedor_Fornecedor, idProdutoFornecedor_Produto),
        CONSTRAINT fk_idProdutoFornecedor_Fornecedor FOREIGN KEY (idProdutoFornecedor_Fornecedor) 
            REFERENCES Fornecedor (idFornecedor),
        CONSTRAINT fk_idProdutoFornecedor_Produto FOREIGN KEY (idProdutoFornecedor_Produto) 
            REFERENCES Produto (idProduto)
                ON UPDATE CASCADE
);

--
-- Criar Tabela ProdutoEstoque
--

CREATE TABLE ProdutoEstoque(
        idProdutoEstoque_Produto INT, 
        idProdutoEstoque_Estoque INT,
        quantidadeProdutoEstoque INT DEFAULT 0,
        PRIMARY KEY (idProdutoEstoque_Produto, idProdutoEstoque_Estoque),
        CONSTRAINT fk_idProdutoEstoque_Produto FOREIGN KEY (idProdutoEstoque_Produto) 
            REFERENCES Produto (idProduto),
        CONSTRAINT fk_idProdutoEstoque_Estoque FOREIGN KEY (idProdutoEstoque_Estoque) 
            REFERENCES Estoque (idEstoque)
                ON UPDATE CASCADE
);

ALTER TABLE ProdutoEstoque AUTO_INCREMENT = 1;
DESC ProdutoEstoque;

--
-- Criar Tabela ProdutoPedido
--
CREATE TABLE ProdutoPedido(
    idProdutoPedido_Produto INT,
    idProdutoPedido_Pedido INT,
    quantidadeProdutoPedido INT DEFAULT 1,
    statusProduto ENUM ('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idProdutoPedido_Produto, idProdutoPedido_Pedido),
    CONSTRAINT fk_idProdutoPedido_Produto FOREIGN KEY (idProdutoPedido_Produto) 
        REFERENCES Produto (idProduto),
    CONSTRAINT fk_idProdutoPedido_Pedido FOREIGN KEY (idProdutoPedido_Pedido) 
        REFERENCES Pedido (idPedido)
            ON UPDATE CASCADE
);

DESC ProdutoPedido;

--          
-- Criar Tabela ProdutoTerceiroVendedor
--
 CREATE TABLE ProdutoVendedor(
    idProdutoVendedor_Vendedor INT,
    idProdutoVendedor_Produto INT,
    quantidadeProdutoVendedor INT DEFAULT 1,
    PRIMARY KEY (idProdutoVendedor_Vendedor, idProdutoVendedor_Produto),
    CONSTRAINT fk_idProdutoTerceiroVendedor_Vendedor FOREIGN KEY (idProdutoVendedor_Vendedor) 
        REFERENCES Vendedor (idVendedor),
    CONSTRAINT fk_idProdutoVendedor_Produto FOREIGN KEY (idProdutoVendedor_Produto) 
        REFERENCES Produto (idProduto)
            ON UPDATE CASCADE
);

DESC ProdutoVendedor;
 

SHOW TABLES;
SHOW DATABASES;

USE information_schema;
SHOW TABLES;

DESC table_constraints;
DESC referential_constraints;
--
-- Recuperando as constraints no banco de dados 'desafio_dio_ecommerce'
-- https://dev.mysql.com/doc/refman/8.0/en/fulltext-search.html
-- função "MATCH"

SELECT * 
    FROM referential_constraints
        WHERE constraint_schema = 'desafio_dio_ecommerce';

--  ------------------------------------------------------------------------------------------------------------------------------------------------------  --

-- 2ª Parte Desafio: Dados e Queries

-- Inserção de dados e queries
--
USE  desafio_dio_ecommerce;

INSERT INTO Cliente (logradouroCliente, numeroLogradouroCliente, bairroCliente, CEPCliente, cidadeCliente, UFCliente, paisCliente, 
                     contatoCliente, emailCliente)
        VALUES ('Avenida Afonso Pena', 29, 'Boa Viagem', '30130005', 'Belo Horizonte', 'MG', 'Brasil', '31991738518', 'xyz@uorak.com'),
               ('Rua Carlos Augusto Cornelsen', 54, 'Bom Retiro', 80520560, 'Curitiba', 'PR', 'Brasil', '45851344285', 'welodat438@bongcs.com'),
               ('Avenida São João', 124, 'Vila Joana', '13216000', 'Jundiaí', 'SP', 'Brasil', '13446043276', 'malzewf@netveplay.com'),
               ('Rua Arlindo Nogueira', 1006, 'Centro', '64000290', 'Teresina', 'PI', 'Brasil', '86520989972', 'ak47@netveplay.com'),
               ('Rua Barão de Vitória', 329, 'Casa Grande', '09961660', 'Diadema', 'SP', 'Brasil', '13349171113', 'eleiover@netveplay.com'),
               ('Avenida Rio Branco', 511, 'Centro', '20040002', 'Rio de Janeiro', 'RJ', 'Brasil', '21998342895', 'wolf64@uorak.com');
              
INSERT INTO ClientePJ (idClientePJ_Cliente, CNPJClientePJ, razaoSocialClientePJ)
        VALUES (1, '67.384.865/0001-70', 'PAZ e AMOR Ltda'),
               (2, '96.839.381/0001-76', 'Vida Nova'),
               (3, '92.653.534/0001-35', 'Arte e Design Ltda');
               

INSERT INTO ClientePF (idClientePF_cliente, CPFClientePF, primeiroNomeClientePF, inicialNomeMeioClientePF, sobreNomeClientePF, 
                       dataNascimentoClientePF)
        VALUES (4, '488.888.238-08', 'Maria', 'M', 'Silva', '1985-12-19'),
               (5, '612.750.742-19', 'Matheus', 'O', 'Pimentel', '2000-02-01'),
               (6, '360.272.418-29', 'Julia', 'S', 'França', '1960-10-27');
               
--
-- Teste
--
SELECT * FROM cliente;
select * FROM ClientePF;
select * FROM ClientePJ;


-- Produto(idProduto, nomeProduto, classificacaoProduto, categoriaProduto, , avaliacaoProduto, tamanhoProduto, valorProduto)                   
 
INSERT INTO Produto (nomeProduto, classificacaoProduto, categoriaProduto, avaliacaoProduto, tamanhoProduto, valorProduto)
            VALUES ('Camisa Oficial Atético-MG', 'Masculino', 'Vestuário', 5, 'GG', 289.99),
                   ('Fone de ouvido', 'Não se aplica', 'Eletrônicos', '4', NULL, 145.5),
                   ('Barbie Elsa', 'Infantil', 'Brinquedos', '3', NULL, 169.5),
                   ('Kit Cueca + Meias', 'Masculino', 'Vestuário', '5', 'G', 69.9),
                   ('Microfone Vedo - YouTuber', 'Não se aplica', 'Eletrônicos', '4', NULL, 375.9),
                   ('Sofá retrátil', 'Não se aplica', 'Móveis', '3', '3x57x80', 1119.9),
                   ('Farinha de arroz', 'Não se aplica', 'Alimentos', '2', NULL, 24.15),
                   ('Vestido de Noiva', 'Feminino', 'Vestuário', '3', NULL, 278.99),
                   ('A Arte da Guerra', 'Não se aplica', 'Livros', 5, NULL, 47.99);
                   
--
-- Teste
--
SELECT * FROM Produto;

-- Pedido(idPedido, idPedido_Cliente, statusPedido ENUM ('Cancelado', 'Confirmado', 'Em processamento'), descricaoPedido)

DELETE FROM Pedido 
            WHERE idPedido_Cliente IN (1, 2, 3, 4, 5, 6);
            
INSERT INTO Pedido (idPedido_Cliente, dataPedido, statusPedido, descricaoPedido)
            VALUES (1, '2020-02-28', 'Confirmado', 'Compra via web site'),
                   (2, '2021-06-20', 'Cancelado', 'Compra via aplicativo'),
                   (3, '2021-07-15', DEFAULT, 'Compra via aplicativo'),
                   (4, '2022-08-28', 'Confirmado', NULL),
                   (5, '2022-09-01', DEFAULT, 'Compra via web site'),
                   (6, '2022-09-16', DEFAULT, 'Compra via aplicativo');
                   

SELECT * FROM Pedido;


-- ProdutoPedido(idProdutoPedido_produto, idProdutoPedido_pedido, quantidadeProdutoPedido, statusProduto ENUM ('Disponível', 'Sem estoque')

INSERT INTO ProdutoPedido (idProdutoPedido_produto, idProdutoPedido_pedido, quantidadeProdutoPedido, statusProduto)
        VALUES (7, 1, 1, 'Sem estoque'),
               (1, 2, 1, DEFAULT), 
               (2, 3, 1, 'Sem estoque'),
               (9, 4, 1, DEFAULT),
               (3, 5, 1, DEFAULT), 
               (4, 6, 1, DEFAULT); 
 
--
-- Teste
-- 
SELECT * FROM ProdutoPedido;             


-- Estoque (idEstoque, logradouroEstoque, numeroLogradouroEstoque, bairroEstoque, CEPEstoque, cidadeEstoque, UFEstoque, paisEstoque)

INSERT INTO Estoque (logradouroEstoque, numeroLogradouroEstoque, bairroEstoque, CEPEstoque, cidadeEstoque, UFEstoque, paisEstoque)
        VALUES ('Avenida Desembargador Moreira', 52, 'Aldeota', '60170001', 'Fortaleza', 'CE', 'Brasil'),
               ('Rodovia Raposo Tavares', 1047, 'Lageadinho', '06709015', 'Cotia', 'SP', 'Brasil'),
               ('QE 11 Área Especial C', 113, 'Guará I', '71020631', 'Brasília', 'DF', 'Brasil'),
               ('Rua Barão de Vitória', 100, 'Casa Grande', '09961660', 'Diadema', 'SP', 'Brasil'),
               ('Praça da República', NULL, 'República', '01045001', 'São Paulo', 'SP', 'Brasil'),
               ('Rua Arlindo Nogueira', 60, 'Centro', '64000290', 'Teresina', 'PI', 'Brasil' );


-- ProdutoEstoque(idProdutoEstoque_Produto, idProdutoEstoque_Estoque, quantidadeProdutoEstoque)

INSERT INTO ProdutoEstoque (idProdutoEstoque_Produto, idProdutoEstoque_Estoque, quantidadeProdutoEstoque)
        VALUES (1, 1, 250),
               (2, 2, 150),
               (3, 3, 145),
               (4, 4, 125),
               (5, 5, 260),
               (6, 6, 155); 

SELECT * FROM Estoque;
SELECT * FROM ProdutoEstoque;
               
-- Fornecedor(idFornecedor, razaoSocialFornecedor, CNPJFornecedor, contatoFornecedor, logradouroFornecedor, numeroLogradouroFornecedor, bairroFornecedor, CEPFornecedor, cidadeFornecedor, UFFornecedor, paisFornecedor)                   
               
INSERT INTO Fornecedor (razaoSocialFornecedor, CNPJFornecedor, contatoFornecedor, logradouroFornecedor, numeroLogradouroFornecedor, bairroFornecedor, CEPFornecedor, cidadeFornecedor, UFFornecedor, paisFornecedor)
        VALUES ('Almeida e filhos', '07.463.254/0001-95', '85485569935', 'Avenida Desembargador Moreira', 52, 'Aldeota', '60170001', 'Fortaleza', 'CE', 'Brasil'),
               ('Eletrônicos Silva', '56.748.713/0001-92', '51776853714','Avenida Almirante Maximiano Fonseca', 15, 'Zona Portuária', '96204040', 'Rio Grande', 'RS', 'Brasil'),
               ('Eletrônicos Valma', '71.845.537/0001-09', '11921975474', 'Rua Serra de Bragança', 255, 'Vila Gomes Cardim', '03318000', 'São Paulo', 'SP', 'Brasil'),
               ('Socorro e Solimões', '12.637.185/0001-29', '18177348092', 'Rua Cristiano Olsen', 964, 'Jardim Sumaré', '16015244', 'Araçatuba', 'SP', 'Brasil');
 
 
 -- ProdutoFornecedor(idProdutoFornecedor_Fornecedor, idProdutoFornecedor_Produto, quantidadeProdutoFornecedor)

INSERT INTO ProdutoFornecedor (idProdutoFornecedor_Fornecedor, idProdutoFornecedor_Produto, quantidadeProdutoFornecedor)
        VALUES (1, 1, 311),
               (2, 2, 411),
               (3, 3, 51),
               (4, 4, 60),
               (4, 5, 62),
               (4, 6, 25);
  
--
-- Teste
--
SELECT * FROM Fornecedor;
SELECT * FROM ProdutoFornecedor;
  
-- Vendedor(idVendedor, razaoSocialVendedor, nomeFantasiaVendedor, CNPJVendedor, CPFVendedor, logradouroVendedor, numerologradouroVendedor, bairrovendedor, cidadeTerceiroVendedor, CEPTerceiroVendedor, UFTerceiroVendedor, paisVendedor, contatoVendedor)
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact

INSERT INTO Vendedor(razaoSocialVendedor, nomeFantasiaVendedor, CNPJVendedor, CPFVendedor, contatoVendedor, 
                            logradouroVendedor, numeroLogradouroVendedor, bairrovendedor, 
                            CEPVendedor, cidadeVendedor, UFVendedor, paisVendedor)
        VALUES ('Tech eletronics', NULL, '43.672.494/0001-63', NULL,  '64505157656', 'Avenida Tocantins', 2456,'Vila Jardim Rio Claro', '75802095', 'Jataí', 'GO', 'Brasil'),
               ('Socorro e Solimões', NULL, '12.637.185/0001-29', NULL, '18177348092', 'Rua Cristiano Olsen', 964, 'Jardim Sumaré', '16015244', 'Araçatuba', 'SP', 'Brasil'),
               ('Botique Durgas', NULL,  NULL, '734.418.188-65', '67064389932', 'Rua da Imprensa', 324, 'Monte Castelo', '79002290', 'Campo Grande', 'MS', 'Brasil'),
               ('Kids Word', NULL, '31.342.454/0001-74', NULL, '91667325344', 'Travessa Antônio Ferreira', 246, 'Igrejinha', '68700216', 'Capanema', 'PA', 'Brasil');
   
   
-- ProdutoTerceiroVendedor(idProdutoTerceiroVendedor_TerceiroVendedor, idProdutoTerceiroVendedor_Produto, quantidadeProdutoTerceiroVendedor)   

INSERT INTO ProdutoVendedor (idProdutoVendedor_Vendedor, idProdutoVendedor_Produto, quantidadeProdutoVendedor)
        VALUES (1, 1, 80),
               (2, 2, 10),
               (3, 3, 15),
               (4, 4, 18),
               (4, 5, 18),
               (4, 6, 18);
--
-- Teste
--   
SELECT * FROM Vendedor;
SELECT * FROM ProdutoVendedor;            
               
-- Entrega(idEntrega, statusEntrega, observacaoEntrega, codigoRastreio, dataEntrega)

INSERT INTO Entrega (statusEntrega, observacaoEntrega, codigoRastreio, dataEntrega) 
        VALUES ('Entregue', 'Antes do prazo', 'F#hrZ7S8b34w', '2020-03-05'),
               ('Recusado', 'Cliente não reside mais no local', 'qct2%N@v11vp', '2021-07-01'),
               ('Entregue', NULL, '7Qb2Hi24b$Oy', '2021-08-22'),
               ('A caminho', 'Antes do prazo', 'ry8R2a^0hviI', '2022-09-02'),
               ('A caminho', 'Antes do prazo', 'zz8R2a^0hviI', '2022-09-08'),
               ('A caminho', 'Chega hoje', 'rz8R2a^0hviI', '2022-09-20');

--
-- Teste
--
SELECT * FROM Entrega;


/* Pagamento(idPagamento, idPagamento_Pedido, valorPagamento, valorFrete, cachPagamento, 
              tipoPagamento ENUM ('Boleto', 'Cartão de Crédito', 'Cartão de Débito', 'PIX'), 
             numeroCartao, qtdeParcelas, codigoBoleto, codigoPIX)
*/ 
INSERT INTO Pagamento (idPagamento_Pedido, valorPagamento, valorFrete, cachPagamento, 
                       tipoPagamento, numeroCartao, qtdeParcelas, codigoBoleto, codigoPIX) 
        VALUES (1, 550.99, 10.0, NULL, 'Cartão de Crédito', '4365873580403674', 3, NULL, NULL),
               (2, 290.75, 30.0, NULL, 'Cartão de Crédito', '977802488869911', 4, NULL, NULL),
               (3, 1250.25, 50.0, NULL, 'Cartão de Crédito', '277800485869912', 3, NULL, NULL),
               (4, 890.75, 35.0, NULL, 'Cartão de Crédito', '377800488869916', 6, NULL, NULL),
               (5, 499.75, 35.0, NULL, 'Cartão de Crédito', '314800488869922', 6, NULL, NULL),
               (6, 775.75, 32.0, NULL, 'Cartão de Crédito', '287800488869914', 6, NULL, NULL);
--
-- Teste
--
SELECT * FROM Pagamento;

--  ------------------------------------------------------------------------------------------------------------------------------------------------------  --
-- 3ª Parte: Respondendo perguntas sugeridas
--
-- Executando consultas
--
SELECT COUNT(*)
    FROM Cliente;

-- Cliente Pessoa Jurídica 
-- Status e descrição Pedido relacionado ao contato, cidade e Estado do Cliente
              
SELECT DISTINCT idCliente AS ID, 
                C_PJ.razaoSocialClientePJ AS 'Razão Social',
                C_PJ.CNPJClientePJ AS CNPJ,
                Pe.dataPedido AS 'Data Pedido',
                Pe.statusPedido AS 'Status Pedido', 
                Pe.descricaoPedido AS 'Descrição',
                C.contatoCliente AS 'Contato Cliente',
                C.cidadeCliente AS 'Cidade Cliente',
                C.UFCliente AS 'UF Cliente'
    FROM Cliente C, Pedido Pe, ClientePJ C_PJ
        WHERE C_PJ.idClientePJ_Cliente = Pe.idPedido_Cliente 
            AND C_PJ.idClientePJ_Cliente = C.idCliente
                ORDER BY idCliente ;
            
-- Cliente Pessoa Fisica
-- Status, descrição e data pedido, cidade e estado cliente.
SELECT DISTINCT idCliente AS ID, 
                CONCAT(C_PF.primeiroNomeClientePF, ' ', C_PF.sobreNomeClientePF) AS 'Cliente PF',
                CPFClientePF AS CPF,
                Pe.dataPedido AS 'Data Pedido',
                statusPedido AS 'Status Pedido', 
                descricaoPedido AS 'Descrição',
                C.cidadeCliente AS 'Cidade Cliente',
                C.UFCliente AS 'UF Cliente'                
    FROM Cliente C, Pedido Pe, ClientePF C_PF, Produto Pr, ProdutoPedido PP
        WHERE C_PF.idClientePF_Cliente = Pe.idPedido_Cliente 
            AND C_PF.idClientePF_Cliente = C.idCliente 
                ORDER BY idCliente;

SELECT *
    FROM ClientePF;
SELECT *
    FROM ClientePJ;
    
        
INSERT INTO Pedido (idPedido_Cliente, statusPedido, descricaoPedido)
            VALUES (2, DEFAULT, 'compra via aplicatico');
                
 SELECT COUNT(*) 
    FROM ClientePJ C_PJ, Pedido P 
        WHERE C_PJ.idClientePJ_cliente = idPedido_Cliente;


-- recuperação de pedido com produto assossiado
 
 SELECT C.idCliente AS Id, 
        C.cidadeCliente AS Cidade, 
        Pe.statusPedido AS 'Status Pedido', 
        Pe.descricaoPedido AS 'Descrição',
        Prod.nomeProduto AS Produto,
        PP.quantidadeProdutoPedido AS 'Quantidade', 
        PP.statusProduto AS 'Status Produto'
    FROM Cliente AS C
        INNER JOIN Pedido AS Pe 
            ON C.idCliente = Pe.idPedido_Cliente
        INNER JOIN ProdutoPedido AS PP 
            ON PP.idProdutoPedido_Produto = Pe.idPedido
        INNER JOIN  Produto AS Prod
            ON PP.idProdutoPedido_Produto = Prod.idProduto
    GROUP BY idCliente;
 
 
 
        
-- * 1ª •	Quantos pedidos foram feitos por cada cliente? 

SELECT C_PF.idClientePF_cliente, 
        CONCAT(C_PF.primeiroNomeClientePF, ' ', C_PF.sobreNomeClientePF) AS 'Cliente PF', 
        COUNT(*) AS 'Número de Pedidos'
    FROM ClientePF AS C_PF
        INNER JOIN Pedido AS P 
            ON C_PF.idClientePF_cliente = P.idPedido_Cliente
            GROUP BY idClientePF_cliente;
    
SELECT razaoSocialClientePJ AS 'Razão Social', 
       COUNT(*) AS 'Número de Pedidos'
    FROM ClientePJ AS C_PJ
        INNER JOIN Pedido AS P 
            ON C_PJ.idClientePJ_Cliente = P.idPedido_Cliente
            GROUP BY idClientePJ_cliente;  
            

-- * 2ª •	Algum vendedor também é fornecedor?

SELECT * 
	FROM Fornecedor AS F, Vendedor AS V
		WHERE (F.CNPJFornecedor = V.CNPJVendedor);

-- * 3ª •	Relação de produtos fornecedores e estoques; 

SELECT DISTINCT F.idFornecedor AS ID, 
                F.razaoSocialFornecedor AS 'Razão Social', 
                Prod.nomeProduto AS Produto, 
                ProdE.quantidadeProdutoEstoque AS 'Em Estoque',
                Prod.valorProduto AS 'Valor Unitário'
	FROM Produto Prod
		INNER JOIN ProdutoFornecedor ProdF
            ON Prod.idProduto = ProdF.idProdutoFornecedor_Produto
        INNER JOIN ProdutoEstoque ProdE  
            ON Prod.idProduto = ProdE.idProdutoEstoque_Produto
        INNER JOIN Fornecedor F
            ON F.idFornecedor = ProdF.idProdutoFornecedor_Fornecedor
        ORDER BY ProdE.quantidadeProdutoEstoque ASC; -- ordenado por menor quantidade e estoque
        
        
-- * 4ª •	Relação de nomes dos fornecedores e nomes dos produtos;

SELECT DISTINCT F.idFornecedor AS ID, 
                F.razaoSocialFornecedor AS 'Razão Social', 
                Prod.nomeProduto AS Produto, 
                Prod.categoriaProduto AS 'Categoria',
                Prod.avaliacaoProduto AS 'Avaliação'
	FROM Produto Prod
		INNER JOIN ProdutoFornecedor ProdF
            ON Prod.idProduto = ProdF.idProdutoFornecedor_Produto
        INNER JOIN ProdutoEstoque ProdE  
            ON Prod.idProduto = ProdE.idProdutoEstoque_Produto
        INNER JOIN Fornecedor F
            ON F.idFornecedor = ProdF.idProdutoFornecedor_Fornecedor
        ORDER BY ProdE.quantidadeProdutoEstoque ASC; -- ordenado por menor quantidade e estoque

--
-- Having
-- Soma dos Valores por categoria
SELECT categoriaProduto, sum(valorProduto) AS Valor
    FROM Produto
        GROUP BY categoriaProduto
    HAVING SUM(valorProduto) >= 50;

SELECT V.razaoSocialVendedor AS 'Razão Social', 
       Prod.nomeProduto AS Produto, 
       sum(valorProduto) AS 'Valor R$'
    FROM Produto Prod, Vendedor V, Pedido P, ProdutoEstoque ProdE
        WHERE ProdE.quantidadeProdutoEstoque > 100
            GROUP BY V.UFVendedor
        HAVING V.UFVendedor = 'SP';
                    
        

                 
        
