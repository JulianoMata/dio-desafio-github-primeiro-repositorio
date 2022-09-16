-- Inserção de dados no bd company

USE COMPANY;
SHOW TABLES;

/* LOAD DATA INFILE 'patch' INTO TABLE employee;  arquivo referente aos dados de 'employee'*/

INSERT INTO EMPLOYEE VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houstoun-TX', 'M', 30000, NULL, 5),
							('Franklin', 'T', 'Wong', 333445555, '1956-01-18', '3321-Voss-Houstoun-TX', 'M', 25000, 999887777, 4),
							('Joyce', 'A', 'English', 453454531, '1970-09-24', '980-Dallas-Houston-TX', 'F', 35250, 987456321, 1),
                            ('Carol', 'E', 'Wallace', 159357486, '1981-11-17', '291-Berry-Bellaire-TX', 'F', 35250, 067159424, 1);
SELECT * FROM EMPLOYEE;

INSERT INTO DEPENDENT VALUES (123456789, 'Alice', 'F', '1986-04-05', 'Daughter'),
							 (453454531, 'Joy', 'F', '1983-10-25', 'Son'),
                             (159357486, 'Michael', 'M', '1958-05-03', 'Spouse'), 
                             (453454531, 'Abner', 'M', '1942-02-15', 'Spouse');

INSERT INTO DEPARTMENT VALUES ('Research', 5, 453454531, '1988-05-22', '1986-05-22'),
							  ('Administration', 4, 333445555, '1995-01-01', '1994-01-01'),
                              ('Headquarters', 1, 159357486, '1981-06-19', '1980-06-19');

INSERT INTO DEPT_LOCATIONS VALUES (1, 'Houston'),
								  (4, 'Stafford'),
                                  (5, 'Bellaire'),
                                  (5, 'Sugarland'),
                                  (5, 'Houston');

INSERT INTO PROJECT VALUES ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
                           ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Rorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);
                           
INSERT INTO WORKS_ON VALUES (453454531, 30, 35.2),
							(159357486, 1, 25.0),
                            (333445555, 3, 15.5),
                            (123456789, 20, 10.0),
                            (453454531, 1, 35.2),
							(159357486, 3, 25.0),
                            (333445555, 30, 15.5),
                            (123456789, 1, 10.0),
                            (453454531, 20, 35.2),
							(159357486, 10, 25.0),
                            (333445555, 2, 15.5),
                            (123456789, 3, 10.0),
                            (453454531, 2, 35.2),
							(159357486, 30, 25.0),
                            (333445555, 1, 15.5),
                            (123456789, 30, 10.0);

----------------------------------------------------------------------------------------------------------------------------------------------
/*
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPENDENT;
SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT_LOCATIONS;                           
SELECT * FROM PROJECT;
SELECT * FROM WORKS_ON;
*/

-- Gerente e seu departamento
SELECT Ssn, Fname, Dname 
	FROM EMPLOYEE e, DEPARTMENT d 
		WHERE (e.Ssn = d.Mgr_Ssn);

-- Empregados e dependentes
SELECT Fname, Dependent_Name, Relationship 
	FROM EMPLOYEE, DEPENDENT 
		WHERE Essn = Ssn;

--
SELECT Bdate, Address 
	FROM EMPLOYEE 
		WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Recuoperando departamento específico
SELECT * FROM DEPARTMENT WHERE Dname = 'Research';

--
SELECT Fname, Lname, Address 
	FROM EMPLOYEE, DEPARTMENT 
		WHERE Dname = 'Research' AND Dnumber = Dno;

--
SELECT Pname, Ssn, Fname, Hours 
	FROM PROJECT, WORKS_ON, EMPLOYEE 
		WHERE Pnumber = Pno AND Essn = Ssn;

