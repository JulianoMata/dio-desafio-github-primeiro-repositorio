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
    CONSTRAINT Chk_Salary_Employee CHECK (Salary > 2000.0),
    PRIMARY KEY(Ssn)
);

-- DROP TABLE DEPENDENT;
CREATE TABLE DEPENDENT(
	Essn CHAR(9) NOT NULL,
    Dependent_Name VARCHAR(15) NOT NULL,
    Sex CHAR, -- F OU M
    Bdate DATE,
    RelationSHIP VARCHAR(8),
    PRIMARY KEY (Essn, Dependent_Name),
    CONSTRAINT Fk_Dependent FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn)
); 

-- DROP TABLE DEPARTMENT;
CREATE TABLE DEPARTMENT(
	Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_Ssn CHAR(9),
	Mgr_Start_Date DATE,
    Dept_Create_Date DATE,
    CONSTRAINT Chk_Date_Dept CHECK (Dept_Create_Date < Mgr_Start_Date),
    PRIMARY KEY (Dnumber),
    CONSTRAINT Unique_Name_Dept UNIQUE (Dname),
    CONSTRAINT Fk_Dept FOREIGN KEY (Mgr_Ssn) REFERENCES EMPLOYEE (Ssn)
);

-- DROP TABLE DEPT_LOCATIONS;
CREATE TABLE DEPT_LOCATIONS(
	Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT Fk_Dept_Locations FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
);

-- DROP TABLE PROJECT;
CREATE TABLE PROJECT(
	Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnumber INT NOT NULL,
    PRIMARY KEY (Pnumber),
    CONSTRAINT Unique_Name_Project UNIQUE (Pname),
    CONSTRAINT Fk_Project FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
);
 
-- DROP TABLE WORKS_ON; 
CREATE TABLE WORKS_ON(
	Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3, 1) NOT NULL,
    PRIMARY KEY (Essn, Pno), 
    CONSTRAINT Fk_Works_On_Employee FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn),
    CONSTRAINT Kk_Works_On_Project FOREIGN KEY (Pno) REFERENCES PROJECT (Pnumber)
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
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
		WHERE CONSTRAINT_SCHEMA = 'COMPANY';
SELECT * 
	FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		WHERE CONSTRAINT_SCHEMA = 'COMPANY';
    
----------------------------------------------------------------------------------------------------------------------------------------------

    
-- Modificar uma "constraint": drop e add
ALTER TABLE DEPARTMENT 
	DROP CONSTRAINT Fk_Dept;

ALTER TABLE DEPARTMENT 
	ADD CONSTRAINT Fk_Dept FOREIGN KEY (Mgr_Ssn) REFERENCES EMPLOYEE (Ssn)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
ALTER TABLE DEPT_LOCATIONS 
	DROP CONSTRAINT Fk_Dept_Locations;
 
ALTER TABLE DEPT_LOCATIONS
	ADD CONSTRAINT Fk_Dept_Locations FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

    
/*ALTER TABLE employee
	ADD CONSTRAINT fk_employee FOREIGN KEY (Super_Ssn) REFERENCES employee (Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
    -- Atualização em cascata*/














