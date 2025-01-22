-- 1. Nome e data de admissão de todos os funcionários no mesmo departamento que Maria, excluindo Maria
-- Usando IN
SELECT nome, dtcontratacao
FROM funcionario
WHERE coddepartamento IN (
    SELECT coddepartamento
    FROM funcionario
    WHERE nome = 'Maria Oliveira'
) 
AND nome != 'Maria Oliveira';

-- Usando EXISTS
SELECT nome, dtcontratacao
FROM funcionario f1
WHERE EXISTS (
    SELECT 1
    FROM funcionario f2
    WHERE f1.coddepartamento = f2.coddepartamento
    AND f2.nome = 'Maria Oliveira'
)
AND f1.nome != 'Maria Oliveira';

-- 2. Código e nome de todos os funcionários que recebem mais que o salário médio, ordenados por salário (decrescente)
SELECT cod, nome, salario
FROM funcionario
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionario
)
ORDER BY salario DESC;

-- 3. Código e nome de todos os funcionários que trabalham em um departamento onde exista um funcionário com 'W' no nome
SELECT DISTINCT f1.cod, f1.nome
FROM funcionario f1
WHERE f1.coddepartamento IN (
    SELECT f2.coddepartamento
    FROM funcionario f2
    WHERE f2.nome LIKE '%W%'
);

-- 4. Nome, data de admissão e salário de funcionários que ganhem mais que a média de salário de todos os departamentos
SELECT nome, dtcontratacao, salario
FROM funcionario
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionario
);

-- 5. Seleção de todos os gerentes que possuem efetivamente subordinados
SELECT DISTINCT g.nome AS nome_gerente
FROM funcionario g
JOIN funcionario f ON g.cod = f.codgerente;

-- 6. Colegas de 'Maria' em todas as disciplinas que ela está matriculada
-- Usando IN
SELECT a.nome AS nome_colega
FROM aluno a
WHERE a.cod IN (
    SELECT m.codaluno
    FROM matricula m
    WHERE m.coddisciplina IN (
        SELECT m2.coddisciplina
        FROM matricula m2
        JOIN aluno a2 ON m2.codaluno = a2.cod
        WHERE a2.nome = 'Maria'
    )
) AND a.nome != 'Maria';

-- Usando EXISTS
SELECT a.nome AS nome_colega
FROM aluno a
WHERE EXISTS (
    SELECT 1
    FROM matricula m1
    JOIN matricula m2 ON m1.coddisciplina = m2.coddisciplina
    JOIN aluno a2 ON m2.codaluno = a2.cod
    WHERE a.cod = m1.codaluno
    AND a2.nome = 'Maria'
)
AND a.nome != 'Maria';

Finalizado