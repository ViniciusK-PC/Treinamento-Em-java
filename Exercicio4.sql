-- Exercicio 1: Selecione todos os alunos que não possuem telefone e atualize alguns registros
SELECT * FROM Aluno WHERE telefone IS NULL;

UPDATE Aluno
SET telefone = '123456789'
WHERE matricula = 1; -- Substitua "1" pela matrícula desejada.

-- Exercicio 2: Atualize a idade dos alunos que nasceram depois de 01/01/1980
UPDATE Aluno
SET dtnascimento = dtnascimento - INTERVAL '1 year'
WHERE dtnascimento > '1980-01-01';

-- Exercicio 3: Atualize as disciplinas com carga horária igual a 60
UPDATE Disciplina
SET cargahoraria = 60;

-- Exercicio 4: Exiba o nome e salário dos funcionários que recebem mais de R$ 800,00
SELECT nome, salario
FROM Funcionario
WHERE salario > 800;

-- Exercicio 5: Exiba o nome do funcionário e o número do departamento para o código do funcionário 459
SELECT nome, coddepartamento
FROM Funcionario
WHERE cod = 459;

-- Exercicio 6: Exiba o nome e o salário de funcionários cujos salários não estejam entre R$ 950,00 e R$ 2300,00
SELECT nome, salario
FROM Funcionario
WHERE salario NOT BETWEEN 950 AND 2300;

-- Exercicio 7: Exiba o nome, o cargo e a data dos funcionários admitidos entre 20/02/2004 e 01/05/2007
SELECT nome, cargo, dtcontratacao
FROM Funcionario
WHERE dtcontratacao BETWEEN '2004-02-20' AND '2007-05-01';

-- Exercicio 8: Exiba o nome e o número do departamento de todos os funcionários dos departamentos 10 e 30, ordenados alfabeticamente por nome
SELECT nome, coddepartamento
FROM Funcionario
WHERE coddepartamento IN (10, 30)
ORDER BY nome ASC;

-- Exercicio 9: Liste o nome e o salário dos funcionários que recebem mais de R$ 1500,00 e estão nos departamentos 10 ou 30
SELECT nome AS Funcionário, salario AS "Salário do Mês"
FROM Funcionario
WHERE salario > 1500 AND coddepartamento IN (10, 30);

-- Exercicio 10: Exiba o nome e a data de admissão de cada funcionário admitido em 2004
SELECT nome, dtcontratacao
FROM Funcionario
WHERE EXTRACT(YEAR FROM dtcontratacao) = 2004;

-- Exercicio 11: Exiba o nome e o cargo de cada funcionário que não possui gerente
SELECT nome, cargo
FROM Funcionario
WHERE codgerente IS NULL;

-- Exercicio 12: Exiba os nomes de todos os funcionários que possuem um "A" na segunda letra de seus nomes
SELECT nome
FROM Funcionario
WHERE nome LIKE '_A%';

-- Exercicio 13: Exiba todos os funcionários que possuem duas letras "A" em seus nomes e estão no departamento 30 ou cujo gerente seja 7529, ordenados pelo código do departamento de forma decrescente
SELECT *
FROM Funcionario
WHERE (nome LIKE '%A%A%' AND coddepartamento = 30) OR codgerente = 7529
ORDER BY coddepartamento DESC;

-- Exercicio 14: Premie, aumentando o salário em R$ 300,00, de todos os funcionários que ganham menos de R$ 700,00
UPDATE Funcionario
SET salario = salario + 300
WHERE salario < 700;

-- Exercicio 15: Aumente o salário em 15% dos funcionários do departamento 20
UPDATE Funcionario
SET salario = salario * 1.15
WHERE coddepartamento = 20;

Finalizado

