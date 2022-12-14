/*
Comandos baseados em Operações matemáticas:
UNION, UNION ALL, INTERSECT e EXCEPT
- *OBS.: Só funcionam com tabelas que tenham msm estrutura.
*/
-- DROP DATABASE TESTE;
CREATE DATABASE IF NOT EXISTS TESTE;
USE TESTE;

CREATE TABLE R (
	A CHAR(2)
);

CREATE TABLE S (
	A CHAR(2)
);

INSERT INTO R(A) VALUES ('a1'), ('a2'), ('a2'), ('a3');
INSERT INTO S(A) VALUES ('a1'), ('a1'), ('a2'), ('a2'), ('a4'), ('a5');

SELECT * FROM R;
    
SELECT * FROM S;

--
-- EXCEPT --> NOT IN
--

SELECT * 
	FROM S 
		WHERE A NOT IN (SELECT A 
							FROM R);
                            
--						
-- INTERSECT                           
--

SELECT DISTINCT R.A 
	FROM R
		WHERE R.A IN (SELECT S.A
						 FROM S);
                            
--						
-- UNION                            
--

 (SELECT DISTINCT R.A 
	FROM R)
		UNION
			(SELECT DISTINCT S.A 
				FROM S);
                
(SELECT R.A 
	FROM R)
		UNION
			(SELECT S.A 
				FROM S);
