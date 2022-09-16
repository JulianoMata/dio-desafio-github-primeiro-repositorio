--
-- Case statement
--
SHOW DATABASES;
USE COMPANY;

SHOW TABLES;

SELECT Fname, Salary, Dno 
    FROM EMPLOYEE;

-- Desabilitar safe mode em "Preferencias" no workbench
UPDATE EMPLOYEE SET Salary = 
    CASE
        WHEN Dno = 5 THEN Salary + 2000
        WHEN Dno = 4 THEN Salary + 1500
        WHEN Dno = 1 THEN Salary + 3000
        ELSE Salary + 0
    END;
    
    
    
--
-- Join statment
--
DESC EMPLOYEE;
DESC WORKS_ON;

SELECT * 
    FROM EMPLOYEE, WORKS_ON WHERE Ssn = Essn;
    
-- JOIN 

SELECT * 
    FROM EMPLOYEE JOIN WORKS_ON;

-- JOIN ON -> INNER JOIN ON

SHOW TABLES;
DESC DEPARTMENT; -- Dnumber

SELECT * 
    FROM EMPLOYEE JOIN WORKS_ON 
        ON Ssn = Essn;

SELECT * 
    FROM EMPLOYEE JOIN DEPARTMENT 
        ON Ssn =  Mgr_Ssn;

SELECT Fname, Lname, Address
    FROM (EMPLOYEE JOIN DEPARTMENT 
        ON Dno = Dnumber)
            WHERE Dname = 'Research';

SELECT *
    FROM DEPT_LOCATIONS; -- Address e Dnumber
    
SELECT *
    FROM DEPARTMENT; -- Dname, Dept_Create_Date

SELECT Dname AS Department, Dept_Create_Date AS Start_Date, Dlocation AS Location
    FROM DEPARTMENT INNER JOIN Dept_Locations  
        USING(Dnumber)
            ORDER BY Start_Date;
    
-- CROSS JOIN

SELECT *
    FROM EMPLOYEE CROSS JOIN DEPENDENT;
    
 --
 
 -- Join com mais de 3 tabelas
 --
  -- PROJECT, WORKS_ON e EMPLOYEE
 SELECT CONCAT(Fname, ' ', Lname) AS Complete_Name, 
        Dno AS Dept_Number, 
        Pname AS Project_Name, 
        Pno AS Project_Number, 
        Plocation AS Location
    FROM EMPLOYEE 
        INNER JOIN WORKS_ON ON Ssn = Essn
        INNER JOIN PROJECT ON Pno = Pnumber
            WHERE Pname LIKE 'Product%' -- Produto começa com 'Product'
                ORDER BY Pnumber;
 --

 -- DEPARTMENT, DEPT_LOCATION, EMPLOYEE
 
 SELECT Dnumber, Dname, CONCAT(Fname, ' ', Lname) AS Manager, 
        Salary, ROUND(Salary * 0.05, 2) AS Bonus
    FROM DEPARTMENT
        INNER JOIN DEPT_LOCATIONS USING (Dnumber)
        INNER JOIN EMPLOYEE ON Ssn = Mgr_Ssn
            GROUP BY Dnumber
                HAVING COUNT(*) > 1
        ;
        
SELECT Dnumber, Dname, CONCAT(Fname, ' ', Lname) AS Manager, 
       Salary, ROUND(Salary * 0.05, 2) AS Bonus
    FROM DEPARTMENT
        INNER JOIN DEPT_LOCATIONS USING (Dnumber)
        INNER JOIN (DEPENDENT INNER JOIN EMPLOYEE ON Ssn = Essn) ON Ssn = Mgr_Ssn
            GROUP BY Dnumber;
 
 -- DEPARTMENT, PROJECT e EMPLOYEE

SELECT Dnumber AS Department_Number, Dname AS Department_Name, 
       CONCAT(Fname, ' ', Lname) AS Employee ,
       Bdate AS Niver_Date,
       Salary
    FROM DEPARTMENT
        INNER JOIN PROJECT USING (Dnumber)
        INNER JOIN EMPLOYEE ON Ssn = Mgr_Ssn
            GROUP BY Dnumber;
    
--
-- Outer Join
--
-- Comparações 'Join'
SELECT *
    FROM EMPLOY
        INNER JOIN DEPARTMENT 
            ON  Ssn = Ssn;
            
SELECT *
    FROM EMPLOY
        LEFT JOIN DEPARTMENT 
            ON  Ssn = Ssn;
            
SELECT *
    FROM EMPLOY
        LEFT OUTER JOIN DEPARTMENT 
            ON  Ssn = Ssn;            


            
    
    
    
    
    
    
    
    
    
    
    
    