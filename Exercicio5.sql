-- 1) Exibir a data atual
SELECT CURRENT_DATE AS data_atual;

-- 2) Informar o dia da semana atual
SELECT TO_CHAR(CURRENT_DATE, 'Day') AS dia_da_semana;

-- 3) Exibir código, nome, salário e aumento salarial de 15%
SELECT 
    cod, 
    nome, 
    salario, 
    FLOOR(salario * 0.15) AS aumento_15_porcento
FROM funcionario;

-- 4) Adicionar a coluna com a diferença entre salário novo e antigo
SELECT 
    cod, 
    nome, 
    salario, 
    FLOOR(salario * 0.15) AS aumento_15_porcento, 
    (salario * 1.15) - salario AS diferenca_salario
FROM funcionario;

-- 5) Nome do funcionário, data de admissão e data de efetivação (admissão + 6 meses)
SELECT 
    nome, 
    dtcontratacao AS data_admissao, 
    dtcontratacao + INTERVAL '6 months' AS data_efetivacao
FROM funcionario;

-- 6) Nome do funcionário e número de meses desde a data de admissão
SELECT 
    nome, 
    ROUND(EXTRACT(EPOCH FROM (CURRENT_DATE - dtcontratacao)) / 2592000) AS meses_desde_admissao
FROM funcionario
ORDER BY meses_desde_admissao DESC;

-- 7) Frase personalizada com salário
SELECT 
    'O ' || nome || ' recebe R$ ' || salario || ' mensalmente, mas deseja receber R$ ' || (salario * 4) AS sonho
FROM funcionario;

-- 8) Nome do funcionário com primeira letra maiúscula e número de letras
SELECT 
    INITCAP(nome) AS nome_formatado, 
    LENGTH(nome) AS numero_de_letras
FROM funcionario
WHERE nome ILIKE 'J%' OR nome ILIKE 'M%'
ORDER BY numero_de_letras DESC;

-- 9) Admissão e dia da semana em que começou a trabalhar
SELECT 
    nome, 
    dtcontratacao, 
    TO_CHAR(dtcontratacao, 'Day') AS dia_da_semana
FROM funcionario
ORDER BY TO_CHAR(dtcontratacao, 'd');

-- 10) Nome do aluno e telefone com "Sem telefone" para null
SELECT 
    nome, 
    COALESCE(telefone::TEXT, 'Sem telefone') AS telefone
FROM aluno;

-- 11) Nome do funcionário e salário representado por asteriscos
SELECT 
    nome, 
    REPEAT('*', FLOOR(salario / 100)) AS salario_asteriscos
FROM funcionario
ORDER BY salario DESC;

-- 12) Nome do aluno e faixa de idade
SELECT 
    nome, 
    CASE 
        WHEN DATE_PART('year', AGE(CURRENT_DATE, dtnascimento)) <= 18 THEN 'Categoria A'
        WHEN DATE_PART('year', AGE(CURRENT_DATE, dtnascimento)) BETWEEN 19 AND 30 THEN 'Categoria B'
        WHEN DATE_PART('year', AGE(CURRENT_DATE, dtnascimento)) BETWEEN 31 AND 61 THEN 'Categoria C'
        ELSE 'Categoria D'
    END AS faixa_idade
FROM aluno;

-- 13) Maior salário, médio, menor e soma
SELECT 
    MAX(salario) AS maior_salario, 
    AVG(salario) AS salario_medio, 
    MIN(salario) AS menor_salario, 
    SUM(salario) AS soma_salarios
FROM funcionario;

-- 14) Arredondar os resultados da consulta anterior
SELECT 
    ROUND(MAX(salario)) AS maior_salario, 
    ROUND(AVG(salario)) AS salario_medio, 
    ROUND(MIN(salario)) AS menor_salario, 
    ROUND(SUM(salario)) AS soma_salarios
FROM funcionario;

-- 15) Número de funcionários totais e os que possuem gerente
SELECT 
    COUNT(*) AS total_funcionarios, 
    COUNT(codgerente) AS funcionarios_com_gerente
FROM funcionario;

-- 16) Salário por cargo
SELECT 
    cargo, 
    MAX(salario) AS maximo, 
    AVG(salario) AS medio, 
    MIN(salario) AS menor, 
    SUM(salario) AS soma
FROM funcionario
GROUP BY cargo;

-- 17) Número de funcionários por cargo
SELECT 
    cargo, 
    COUNT(*) AS total_funcionarios
FROM funcionario
GROUP BY cargo;

-- 18) Menor salário por gerente
SELECT 
    codgerente, 
    MIN(salario) AS menor_salario
FROM funcionario
GROUP BY codgerente;

-- 19) Histórico de contratações por ano (a partir de 2005)
SELECT 
    EXTRACT(YEAR FROM dtcontratacao) AS ano, 
    COUNT(*) AS numero_funcionarios
FROM funcionario
WHERE EXTRACT(YEAR FROM dtcontratacao) >= 2005
GROUP BY EXTRACT(YEAR FROM dtcontratacao)
ORDER BY ano;


-- Finalizado 