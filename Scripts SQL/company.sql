USE company;
SHOW TABLES;

-- Dnumber : department
DESC department;
DESC dependent;
DESC dept_locations;
DESC employee;
DESC project;
DESC works_on;

SELECT * 
	FROM department;
SELECT * 
	FROM dept_locations;

-- retirar ambiguidade através do "alias" ou "AS STATEMENT
SELECT Dname, l.Dlocation AS Department_name
	FROM department AS d, dept_locations AS l
		WHERE d.Dnumber = l.Dnumber; 
  
-- Concatenando nomes  
SELECT CONCAT(Fname, ' ', Lname) AS Employee
	FROM employee;
    
 SELECT Fname, Lname 
	FROM employee, department 
		WHERE Dname = 'Research' AND Dnumber = Dno;
        
 SELECT CONCAT(Fname, ' ', Lname) AS Complete_Name 
	FROM employee, department 
		WHERE Dname = 'Research' AND dnumber = Dno;
        
-- Expressões e Alias
--
-- Recolhendo INSS
SELECT Fname, Lname, Salary, Salary * 0.11 AS INSS 
	FROM employee;
SELECT Fname, Lname, Salary, ROUND(Salary * 0.11, 2) AS INSS 
	FROM employee; -- Atribui apenas duas casas deccimais

-- Definir um aumento a partir de uma consição

SELECT * 
	FROM employee AS e, works_on AS w, project AS p
		WHERE (e.Ssn = w.Essn AND w.Pno = p.Pnumber);
        
SELECT CONCAT( Fname, ' ', Lname) AS Complete_Name, Salary, ROUND(Salary * 1.1, 2) AS Increased_Salary
	FROM employee AS e, works_on AS w, project AS p
		WHERE (e.Ssn = w.Essn AND w.Pno = p.Pnumber AND p.Pname = 'ProductX');
        
 -- Legibilidade acertiva        
        
SELECT CONCAT(e.Fname, ' ', e.Lname) AS Employee_Name, e.Address 
	FROM employee AS e, department AS d
		WHERE Dname = 'Research' AND Dnumber = Dno;
        

 
 -- Expressãoes e concatenação de strings
 
 -- * OBS: Sempre que tiver alguma ddúvida use "DESC <nome da tabela>"
 
 -- Recuperando informações dos departamentos presentes em 'Stafford'
 
 SELECT Dname AS Department_Name, Mgr_Ssn AS Manager, Address 
	FROM department AS d, dept_locations AS l, employee AS e
		WHERE d.Dnumber = l.Dnumber AND Dlocation = 'Stafford';

-- Recuperando todos os gerentes que trabalham em 'Stafford' 
       
SELECT Dname AS Department_Name, CONCAT(Fname, ' ', Lname) AS Manager 
	FROM department AS d, dept_locations AS l, employee AS e
		WHERE d.Dnumber = l.Dnumber AND Dlocation = 'Stafford' AND Mgr_Ssn = e.Ssn;
        
-- Recuperando todos os gerentes, departamentos e seus nomes
        
SELECT Dname AS Department_Name, CONCAT(Fname, ' ', Lname) AS Manager, Dlocation 
	FROM department AS d, dept_locations AS l, employee AS e
		WHERE d.Dnumber = l.Dnumber AND Mgr_Ssn = e.Ssn;
        
SELECT Pnumber, p.Dnumber, Lname, Address, Bdate, p.Plocation 
	FROM department AS d, project AS p, employee AS e
		WHERE d.Dnumber = p.Dnumber AND p.Plocation = 'Stafford' AND Mgr_Ssn = e.Ssn;
        
--
-- Operadores Lógicos: AND e OR
--
--
SELECT Bdate, Address
	FROM employee
		WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';
        
SELECT *
	FROM department
		WHERE Dname = 'Research' OR Dname = 'Administration';
        
SELECT CONCAT(Fname, ' ', Lname) as Complete_Name
	FROM employee, department
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
	FROM employee, department
		WHERE (Dno = Dnumber AND Address LIKE '%Houston%');
        
SELECT CONCAT(Fname, ' ', Lname) AS Complete_Name, Address
	FROM employee
		WHERE (Address LIKE '%Houston%');
        
SELECT Fname, Lname
			FROM employee
				WHERE (Salary > 30000 AND Salary < 40000);
                
SELECT Fname, Lname, Salary
	FROM employee
		WHERE (Salary BETWEEN 20000 AND 40000); -- Usando Between
        




        
        
        
        
        
