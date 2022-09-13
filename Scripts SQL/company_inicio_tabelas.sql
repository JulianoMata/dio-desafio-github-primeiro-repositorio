-- criação bd "COMPANY"
-- DROP SCHEMA COMPANY;
CREATE SCHEMA IF NOT EXISTS COMPANY;
USE COMPANY;

-- Restrição atribuidaa um domínio
-- CREATE domain D_num AS INT CHECK (D_num > 0 AND D_num < 21); "MySQL não dá suporte"

----------------------------------------------------------------------------------------------------------------------------------------------
-- DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE(
	Fname VARCHAR(15) NOT NULL,
    Minit CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10,2),
    Super_Ssn CHAR(9),
    Dno INT NOT NULL,
    CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    PRIMARY KEY(Ssn)
);

-- DROP TABLE DEPENDENT;
CREATE TABLE DEPENDENT(
	Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR, -- F OU M
    Bdate DATE,
    RelationSHIP VARCHAR(8),
    PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn)
); 

-- DROP TABLE DEPARTMENT;
CREATE TABLE DEPARTMENT(
	Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_Ssn CHAR(9),
	Mgr_start_date DATE,
    Dept_create_date DATE,
    CONSTRAINT chk_date_dept CHECK (Dept_create_date < Mgr_start_date),
    PRIMARY KEY (Dnumber),
    CONSTRAINT unique_name_dept UNIQUE (Dname),
    CONSTRAINT fk_dept FOREIGN KEY (Mgr_Ssn) REFERENCES EMPLOYEE (Ssn)
);

-- DROP TABLE DEPT_LOCATIONS;
CREATE TABLE DEPT_LOCATIONS(
	Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
);

-- DROP TABLE PROJECT;
CREATE TABLE PROJECT(
	Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnumber INT NOT NULL,
    PRIMARY KEY (Pnumber),
    CONSTRAINT unique_name_project UNIQUE (Pname),
    CONSTRAINT fk_project FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
);
 
-- DROP TABLE WORKS_ON; 
CREATE TABLE WORKS_ON(
	Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3, 1) NOT NULL,
    PRIMARY KEY (Essn, Pno), 
    CONSTRAINT fk_works_on_employee FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn),
    CONSTRAINT fk_works_on_project FOREIGN KEY (Pno) REFERENCES PROJECT (Pnumber)
);

----------------------------------------------------------------------------------------------------------------------------------------------
SHOW TABLES;

DESC EMPLOYEE;
DESC DEPARTMENT;
DESC DEPT_LOCATIONS;
DESC PROJECT;
DESC WORKS_ON;
DESC DEPENDENT;

----------------------------------------------------------------------------------------------------------------------------------------------
SELECT * 
	FROM information_schema.table_constraints
		WHERE CONSTRAINT_SCHEMA = 'COMPANY';
SELECT * 
	FROM information_schema.referential_constraints
		WHERE CONSTRAINT_SCHEMA = 'COMPANY';
    
----------------------------------------------------------------------------------------------------------------------------------------------

    
-- Modificar uma "constraint": drop e add
ALTER TABLE DEPARTMENT 
	DROP CONSTRAINT fk_dept;

ALTER TABLE DEPARTMENT 
	ADD CONSTRAINT fk_dept FOREIGN KEY (Mgr_Ssn) REFERENCES EMPLOYEE (Ssn)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
ALTER TABLE dept_locations 
	DROP CONSTRAINT fk_dept_locations;
 
ALTER TABLE dept_locations
	ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

    
/*ALTER TABLE employee
	ADD CONSTRAINT fk_employee FOREIGN KEY (Super_Ssn) REFERENCES employee (Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
    -- Atualização em cascata*/














