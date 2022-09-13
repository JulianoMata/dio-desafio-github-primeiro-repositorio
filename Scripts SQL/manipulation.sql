/* 
Comandos DDL:
UPDATE, DROP, DELETE, ALTER 
*/
SELECT now() AS TIMESTAMP;

-- DROP DATABASE MANIPULATION;
CREATE DATABASE IF NOT EXISTS MANIPULATION;
USE MANIPULATION;

CREATE TABLE bankAccounts (
	Id_Account INT auto_increment PRIMARY KEY,
	Ag_Num INT NOT NULL,
    Ac_Num INT NOT NULL,
	Saldo FLOAT,
	CONSTRAINT Identification_Account_Constraint UNIQUE (Ag_Num, Ac_Num)
);

ALTER TABLE bankAccounts ADD Limite_Credito FLOAT NOT NULL DEFAULT 500.00;
ALTER TABLE bankAccounts ADD Email VARCHAR(60);
ALTER TABLE bankAccounts DROP Email;

INSERT INTO bankAccounts (Ag_Num, Ac_Num, Saldo)  VALUES (156, 264358, 0);

-- ALTER TABLE <nome da tabela> MODIFY COLUMN <nome atributo> <tipo dados> <condição>;
-- ALTER TABLE <nome da tabela> ADD CONSTRAINT <nome contraint> <consição>;
DESC bankAccounts;

-- DROP TABLE bankAccounts;

CREATE TABLE bankClient (
	Id_Client INT auto_increment,
    Client_Account INT,
    CPF CHAR(11) NOT NULL,
    RG CHAR(9) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Renda_Mensal Float,
    PRIMARY KEY (Id_Client, Client_Account),
    CONSTRAINT Fk_Account_Client 
		FOREIGN KEY (Client_Account) 
			REFERENCES bankAccounts (Id_Account)
    ON UPDATE CASCADE
);

ALTER TABLE bankClient ADD UF CHAR(2) NOT NULL DEFAULT 'RJ';
INSERT INTO bankClient (Client_Account, CPF, RG, Nome, Endereco, Renda_Mensal) VALUES (1, 12345678999, 123456789, 'Fulano', 'Rua de Lá', 5500.6); 
UPDATE bankClient SET UF = 'RJ' WHERE Client_Account = '1';
SELECT * FROM bankClient;
-- DROP TABLE bankClient;

CREATE TABLE bankTransactions (
	Id_Transaction INT auto_increment PRIMARY KEY,
    Ocorrencia DATETIME,
    Status_Transaction VARCHAR(20),
    Valor_Transferido FLOAT,
    Source_Account INT,
    Destination_Account INT,
    CONSTRAINT Fk_Source_Transaction 
		FOREIGN KEY (Source_Account) 
			REFERENCES  bankAccounts (Id_Account),
	CONSTRAINT Fk_Destination_Transaction
		FOREIGN KEY (Destination_Account)
			REFERENCES bankAccounts (Id_Account)
);
-- DROP TABLE bankTransactions;
SHOW TABLES;
DESC bankAccounts;
DESC bankClient;
DESC bankTransactions;		















    
