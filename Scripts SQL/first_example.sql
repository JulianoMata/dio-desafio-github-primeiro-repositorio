show databases;
create database if not exists first_example;
use first_example;
CREATE table person(
	person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	gender enum('M', 'F'),
	birth_date date,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id) references person(person_id)
);
desc favorite_food;
show databases;
desc information_schema.table_constraints;
select * from information_schema.table_constraints where constraint_schema = 'first_example';

desc person;

insert into person values 	('0', 'Adamastor', 'Fonseca', 'M', '1955-09-17',
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
select * from person;

delete from person where person_id = 0 
					or person_id = 1
                    or person_id = 2
                    or person_id = 3
                    or person_id = 4
                    or person_id = 5;
                    
desc favorite_food;
select * from favorite_food;
                    
insert into favorite_food values (0, 'Arroz'),
								 (1, 'Feijão'),
                                 (2, 'Macarrão'),
                                 (3, 'Frango');

delete from favorite_food where person_id = 0 
						  or person_id = 1
                          or person_id = 2
                          or person_id = 3
                          or person_id = 4;
								 
                                 
							

