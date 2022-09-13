SHOW DATABASES;
-- DROP DATABASE FIRST_EXAMPLE;
CREATE DATABASE IF NOT EXISTS FIRST_EXAMPLE;
USE FIRST_EXAMPLE;
CREATE TABLE PERSON(
	person_id SMALLINT UNSIGNED,
	fname VARCHAR(20),
	lname VARCHAR(20),
	gender ENUM('M', 'F'),
	birth_date DATE,
	street VARCHAR(30),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
);
DESC PERSON;

CREATE TABLE FAVORITE_FOOD(
	person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_favorite_food_person_id FOREIGN KEY (person_id) REFERENCES PERSON(person_id)
);
DESC FAVORITE_FOOD;
SHOW DATABASES;
DESC information_schema.table_constraints;
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'FIRST_EXAMPLE';

DESC PERSON;

DELETE FROM PERSON WHERE person_id = 0 
					OR person_id = 1
                    OR person_id = 2
                    OR person_id = 3
                    OR person_id = 4
                    OR person_id = 5;

INSERT INTO person VALUES 	('0', 'Adamastor', 'Fonseca', 'M', '1955-09-17',
							'Rua Sto Expedito', 'Sabará', 'MG', 'Brasil', '47280-000' ),
							('1', 'Carolina', 'Silva', 'F', '1979-08-21',
							'Rua Tal', 'Cidade J', 'RJ', 'Brasil', '26054-890' ),                            
							('2', 'Marina', 'dos Anjos', 'F', '1972-12-13',
							'Rua Cardoso de Sá', 'Cidade Y', 'ES', 'Brasil', '22310-590' ),
							('3', 'Ribamar', 'Neves', 'M', '1983-06-09',
							'Rua das Margaridas', 'Cidade Nova', 'AM', 'Brasil', '11320-240' ),
                            ('4', 'Joséfa', 'de Lourdes', 'F', '1962-01-25',
							'Avenida Central', 'Cidade Z', 'AP', 'Brasil', '12310-530' ),
							('5', 'Tibério', 'Machado', 'M', '1983-06-09',
							'Pça Getúlio Vargas', 'Cidade Alta', 'PE', 'Brasil', '26320-110' );
SELECT * FROM PERSON;

DESC FAVORITE_FOOD;
SELECT * FROM FAVORITE_FOOD;

DELETE FROM FAVORITE_FOOD WHERE person_id = 0 
						  OR person_id = 1
                          OR person_id = 2
                          OR person_id = 3
                          OR person_id = 4;
                    
INSERT INTO FAVORITE_FOOD VALUES (0, 'Arroz'),
								 (1, 'Feijão'),
                                 (2, 'Macarrão'),
                                 (3, 'Frango');


								 
                                 
							

