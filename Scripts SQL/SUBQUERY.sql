-- Subqueries
--

USE COMPANY;
DESC PROJECT;
DESC DEPARTMENT;
DESC EMPLOYEE;
DESC DEPENDENT;

SELECT DISTINCT Pnumber
	FROM PROJECT
		WHERE Pnumber IN 
			 (
				SELECT DISTINCT Pno
					FROM WORKS_ON, EMPLOYEE
						WHERE (Essn = Ssn AND Lname = 'Smith')
				OR 
				(
					SELECT Pnumber
						FROM PROJECT AS P, DEPARTMENT AS D, EMPLOYEE AS E
							WHERE (Mgr_Ssn = Ssn AND Lname = 'Smith' AND P.Dnumber = D.Dnumber)
				)
             );
             
--
--
SELECT DISTINCT *
	FROM WORKS_ON
		WHERE (Pno, Hours) IN 
			(
				SELECT Pno, Hours
					FROM WORKS_ON
						WHERE Essn = 123456789
			);
            
-- Cláusulas com "Exists" e "Unique"       

-- Quais employees possuem dependentes?

SELECT E.Fname, E.Lname 
	FROM EMPLOYEE AS E
		WHERE EXISTS 
			( 
				SELECT *
					FROM DEPENDENT AS D
						WHERE E.Ssn = D.Essn AND Relationship = 'Daughter'
			);

-- Sem dependentes   
         
SELECT E.Fname, E.Lname 
	FROM EMPLOYEE AS E
		WHERE NOT EXISTS 
			( 
				SELECT *
					FROM DEPENDENT AS D
						WHERE E.Ssn = D.Essn
			);
/*                   
SELECT E.Fname, E.Lname 
	FROM EMPLOYEE AS E
		WHERE EXISTS 
			( 
				SELECT *
					FROM DEPENDENT AS D
						WHERE E.Ssn = D.Essn 
				AND
				( 
					SELECT * 
						FROM DEPARTMENT
							WHERE Ssn = Mgr_Ssn
				)
            
			);
*/            
-- "Resolução Query acima" ↓↑

SELECT E.Fname, E.Lname
	FROM EMPLOYEE AS E, DEPARTMENT AS D
		WHERE (E.Ssn = D.Mgr_Ssn) 
			AND EXISTS
					(
						SELECT *
							FROM DEPENDENT AS D
								WHERE E.Ssn= D.Essn
					);
    
 -- Operador matemático
 
 SELECT Fname, Lname
	 FROM EMPLOYEE
		WHERE 
			(
				SELECT COUNT(*) 
					FROM DEPENDENT
						WHERE Ssn = Essn
			) >= 2;
            
SELECT DISTINCT Essn, Pno 
	FROM WORKS_ON
		WHERE Pno IN (1, 2, 3);
								