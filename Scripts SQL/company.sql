USE COMPANY;
SHOW TABLES;

-- Dnumber : department
DESC DEPARTMENT;
DESC DEPENDENT;
DESC DEPT_LOCATIONS;
DESC EMPLOYEE;
DESC PROJECT;
DESC WORKS_ON;

SELECT * 
	FROM DEPARTMENT;
SELECT * 
	FROM DEPT_LOCATIONS;

-- retirar ambiguidade através do "alias" ou "AS STATEMENT
SELECT Dname, l.Dlocation AS Department_name
	FROM DEPARTMENT AS D, DEPT_LOCATIONS AS L
		WHERE D.Dnumber = L.Dnumber; 
  
-- Concatenando nomes  
SELECT CONCAT(Fname, ' ', Lname) AS Employee
	FROM EMPLOYEE;
    
 SELECT Fname, Lname 
	FROM EMPLOYEE, DEPARTMENT 
		WHERE Dname = 'Research' AND Dnumber = Dno;
        
 SELECT CONCAT(Fname, ' ', Lname) AS Complete_Name 
	FROM EMPLOYEE, DEPARTMENT 
		WHERE Dname = 'Research' AND dnumber = Dno;
        
-- Expressões e Alias
--
-- Recolhendo INSS
SELECT Fname, Lname, Salary, Salary * 0.11 AS INSS 
	FROM EMPLOYEE;
SELECT Fname, Lname, Salary, ROUND(Salary * 0.11, 2) AS INSS 
	FROM EMPLOYEE; -- Atribui apenas duas casas deccimais

-- Definir um aumento a partir de uma consição

SELECT * 
	FROM EMPLOYEE AS E, WORKS_ON AS W, PROJECT AS P
		WHERE (E.Ssn = W.Essn AND W.Pno = P.Pnumber);
        
SELECT CONCAT( Fname, ' ', Lname) AS Complete_Name, Salary, ROUND(Salary * 1.1, 2) AS Increased_Salary
	FROM EMPLOYEE AS E, WORKS_ON AS W, PROJECT AS P
		WHERE (E.Ssn = W.Essn AND W.Pno = P.Pnumber AND P.Pname = 'ProductX');
        
 -- Legibilidade acertiva        
        
SELECT CONCAT(E.Fname, ' ', E.Lname) AS Employee_Name, E.Address 
	FROM EMPLOYEE AS E, DEPARTMENT AS D
		WHERE Dname = 'Research' AND Dnumber = Dno;
        

 
 -- Expressões e concatenação de strings
 
 -- * OBS: Sempre que tiver alguma ddúvida use "DESC <nome da tabela>"
 
 -- Recuperando informações dos departamentos presentes em 'Stafford'
 
 SELECT Dname AS Department_Name, Mgr_Ssn AS Manager, Address 
	FROM DEPARTMENT AS D, DEPT_LOCATIONS AS L, EMPLOYEE AS E
		WHERE D.Dnumber = L.Dnumber AND Dlocation = 'Stafford';

-- Recuperando todos os gerentes que trabalham em 'Stafford' 
       
SELECT Dname AS Department_Name, CONCAT(Fname, ' ', Lname) AS Manager 
	FROM DEPARTMENT AS D, DEPT_LOCATIONS AS L, EMPLOYEE AS E
		WHERE D.Dnumber = L.Dnumber AND Dlocation = 'Stafford' AND Mgr_Ssn = E.Ssn;
        
-- Recuperando todos os gerentes, departamentos e seus nomes
        
SELECT Dname AS Department_Name, CONCAT(Fname, ' ', Lname) AS Manager, Dlocation 
	FROM DEPARTMENT AS D, DEPT_LOCATIONS AS L, EMPLOYEE AS E
		WHERE D.Dnumber = L.Dnumber AND Mgr_Ssn = E.Ssn;
        
SELECT Pnumber, P.Dnumber, Lname, Address, Bdate, P.Plocation 
	FROM DEPARTMENT AS D, PROJECT AS P, EMPLOYEE AS E
		WHERE D.Dnumber = P.Dnumber AND P.Plocation = 'Stafford' AND Mgr_Ssn = E.Ssn;
        
--
-- Operadores Lógicos: AND e OR
--
--
SELECT Bdate, Address
	FROM EMPLOYEE
		WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';
        
SELECT *
	FROM DEPARTMENT
		WHERE Dname = 'Research' OR Dname = 'Administration';
        
SELECT CONCAT(Fname, ' ', Lname) as Complete_Name
	FROM EMPLOYEE, DEPARTMENT
		WHERE Dname = 'Research' OR Dnumber = Dno;
 
        
/*
Like
Comparação - caracteres especiais: 
% - independente da qtde de caracteres antes ou depois
_ - apenas um caracter  

 Between  
 Intervalo numérico
 */
 
 SELECT CONCAT(Fname, ' ', Lname) AS Complete_Name, Dname AS Department_Name, Address
	FROM EMPLOYEE, DEPARTMENT
		WHERE (Dno = Dnumber AND Address LIKE '%Houston%');
        
SELECT CONCAT(Fname, ' ', Lname) AS Complete_Name, Address
	FROM EMPLOYEE
		WHERE (Address LIKE '%Houston%');
        
SELECT Fname, Lname
			FROM EMPLOYEE
				WHERE (Salary > 30000 AND Salary < 40000);
                
SELECT Fname, Lname, Salary
	FROM EMPLOYEE
		WHERE (Salary BETWEEN 20000 AND 40000); -- Usando Between
