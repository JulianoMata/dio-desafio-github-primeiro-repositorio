-- Cláusulas e Funções de ordenação

USE COMPANY;


SELECT *
	FROM EMPLOYEE
		ORDER BY Fname, Lname;

-- Nome do departamento, nome do gerente
       
SELECT DISTINCT D.Dname, CONCAT(E.Fname, ' ', E.LName) AS Manager, Address
	FROM DEPARTMENT AS D, EMPLOYEE AS E, WORKS_ON AS W, PROJECT AS P
		WHERE (D.Dnumber = E.Dno AND E.Ssn = D.Mgr_Ssn AND W.Pno = P.Pnumber)
			ORDER BY D.Dname, E.Fname, E.Lname;

-- Recupero todos empregados e seus projetos em andamento

SELECT D.Dname AS Department, CONCAT(E.Fname, ' ', E.LName) AS Employee, P.Pname AS Project_Name, Address
	FROM DEPARTMENT AS D, EMPLOYEE AS E, WORKS_ON AS W, PROJECT AS P
		WHERE (D.Dnumber = E.Dno AND E.Ssn = W.Essn AND W.Pno = P.Pnumber)
			ORDER BY D.Dname DESC, E.Fname ASC, E.Lname ASC;
            
            
--
-- Funções e cláusulas de agrupamento
--

SELECT *
    FROM EMPLOYEE;
    
SELECT COUNT(*)
    FROM EMPLOYEE , DEPARTMENT
        WHERE Dno = Dnumber AND Dname = 'Research';
        
SELECT Dno, COUNT(*), ROUND(AVG(Salary), 2) 
    FROM EMPLOYEE
        GROUP BY Dno;
        
SELECT Dno, COUNT(*) AS Number_of_Employees, ROUND(AVG(Salary), 2) AS Salary_avg
    FROM EMPLOYEE
        GROUP BY Dno;
        
SELECT Pnumber, Pname, COUNT(*)
    FROM PROJECT, WORKS_ON
        WHERE Pnumber = Pno
            GROUP BY Pnumber, Pname;
            
SELECT COUNT(DISTINCT Salary) 
    FROM EMPLOYEE;
    
    
SELECT ROUND(SUM(Salary), 2) AS Total_Sal, 
       ROUND(MAX(Salary), 2) AS Max_Sal,
       ROUND(MIN(Salary), 2) AS Min_Sal,
       ROUND(AVG(Salary), 2) AS Avg_Sal
    FROM EMPLOYEE;

-- Join será abordado "Curso 5"
        
SELECT ROUND(SUM(Salary), 2) AS Total_Sal, 
       ROUND(MAX(Salary), 2) AS Max_Sal,
       ROUND(MIN(Salary), 2) AS Min_Sal,
       ROUND(AVG(Salary), 2) AS Avg_Sal
    FROM (EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber)
        WHERE Dname = 'Research';       -- Só está com um cadastro, então valores iguais
   
 SELECT Lname, Fname
    FROM EMPLOYEE
        WHERE (
                SELECT COUNT(*)
                    FROM DEPENDENT
                        WHERE Ssn = Essn
              ) >= 2;
              
--
-- Group By e Order By
--
SELECT Pnumber, Pname, COUNT(*)
    FROM PROJECT, WORKS_ON
        WHERE Pnumber = Pno
            GROUP BY Pnumber, Pname;
            
SELECT Pnumber, Pname, COUNT(*) AS Number_of_Register, ROUND(AVG(Salary), 2) AS Avg_Sal
    FROM PROJECT, WORKS_ON, EMPLOYEE
        WHERE Pnumber = Pno AND Ssn = Essn
            GROUP BY Pnumber, Pname;
            
SELECT Pnumber, Pname, COUNT(*) AS Number_of_Register, ROUND(AVG(Salary), 2) AS Avg_Sal
    FROM PROJECT, WORKS_ON, EMPLOYEE
        WHERE Pnumber = Pno AND Ssn = Essn
            GROUP BY Pnumber
                ORDER BY AVG(Salary) DESC;
            
--
-- Group By e Having
--

SELECT Pnumber, Pname, COUNT(*)
    FROM PROJECT, WORKS_ON
        WHERE Pnumber = Pno
            GROUP BY Pnumber, Pname
                HAVING COUNT(*) > 2;

SELECT Dno, COUNT(*)
    FROM EMPLOYEE
        WHERE Salary > 30000
            GROUP BY Dno
                HAVING COUNT(*) >=2;
                
SELECT Dno, COUNT(*) AS Number_of_Employess
    FROM EMPLOYEE
        WHERE Salary > 20000 AND Dno IN (
                                            SELECT Dno
                                                FROM EMPLOYEE
                                                    GROUP BY Dno
                                                        HAVING COUNT(*) >= 2
                                        )
       GROUP BY Dno;  
        