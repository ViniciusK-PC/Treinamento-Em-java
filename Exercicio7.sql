-- 1. Criação da tabela Departamento
CREATE TABLE departamento (
    cod NUMERIC PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    sigla VARCHAR(10),
    cidade VARCHAR(100)
);

-- Inserção de dados na tabela Departamento
INSERT INTO departamento (cod, descricao, sigla, cidade)
VALUES 
(1, 'Recursos Humanos', 'RH', 'São Paulo'),
(2, 'Tecnologia da Informação', 'TI', 'Rio de Janeiro'),
(3, 'Financeiro', 'FIN', 'Belo Horizonte'),
(4, 'Marketing', 'MKT', 'Rio de Janeiro');

-- 2. Criação da tabela Funcionario
CREATE TABLE funcionario (
    cod NUMERIC PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cargo VARCHAR(100),
    dtcontratacao DATE,
    codgerente NUMERIC,
    salario NUMERIC(10, 2),
    coddepartamento NUMERIC,
    CONSTRAINT fk_funcionario_gerente FOREIGN KEY (codgerente) REFERENCES funcionario(cod),
    CONSTRAINT fk_funcionario_departamento FOREIGN KEY (coddepartamento) REFERENCES departamento(cod)
);

-- Inserção de dados na tabela Funcionario
INSERT INTO funcionario (cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES
(1, 'João Silva', 'Analista', '2020-03-15', NULL, 3500.00, 2),
(2, 'Maria Oliveira', 'Gerente', '2018-07-10', NULL, 7500.00, 4),
(3, 'Pedro Santos', 'Analista', '2021-05-20', 2, 2500.00, 4),
(4, 'Ana Souza', 'Desenvolvedora', '2022-01-15', NULL, 4500.00, 2),
(5, 'Lucas Almeida', 'Assistente', '2020-10-01', 1, 1800.00, 1);

-- 3. Criação da tabela Aluno
CREATE TABLE aluno (
    cod NUMERIC PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    idade INT
);

-- Inserção de dados na tabela Aluno
INSERT INTO aluno (cod, nome, idade)
VALUES
(1, 'Carlos Pereira', 19),
(2, 'Fernanda Lima', 22),
(3, 'Sofia Alves', 25),
(4, 'Gustavo Moreira', 28),
(5, 'Luiza Costa', 31);

-- 4. Criação da tabela Disciplina
CREATE TABLE disciplina (
    cod NUMERIC PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    carga_horaria INT
);

-- Inserção de dados na tabela Disciplina
INSERT INTO disciplina (cod, nome, carga_horaria)
VALUES
(1, 'Matemática', 60),
(2, 'Português', 45),
(3, 'História', 50),
(4, 'Geografia', 40);

-- 5. Criação da tabela Matrícula
CREATE TABLE matricula (
    codaluno NUMERIC,
    coddisciplina NUMERIC,
    PRIMARY KEY (codaluno, coddisciplina),
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (codaluno) REFERENCES aluno(cod),
    CONSTRAINT fk_matricula_disciplina FOREIGN KEY (coddisciplina) REFERENCES disciplina(cod)
);

-- Inserção de dados na tabela Matrícula
INSERT INTO matricula (codaluno, coddisciplina)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 1);

-- 6. Criação da tabela faixaNivel
CREATE TABLE faixaNivel (
    nivel VARCHAR(1),
    idade_min INT,
    idade_max INT
);

-- Inserção de dados na tabela faixaNivel
INSERT INTO faixaNivel (nivel, idade_min, idade_max) VALUES
('A', 15, 20),
('B', 21, 25),
('C', 26, 30),
('D', 31, 100);

-- Consultas SQL solicitadas:
-- 1. Nome do funcionário e do departamento de todos os funcionários
SELECT f.nome AS nome_funcionario, d.descricao AS nome_departamento
FROM funcionario f
JOIN departamento d ON f.coddepartamento = d.cod;

-- 2. Cargos dos funcionários nos departamentos com sigla "CTB"
SELECT DISTINCT f.cargo
FROM funcionario f
JOIN departamento d ON f.coddepartamento = d.cod
WHERE d.sigla = 'CTB';

-- 3. Número de alunos matriculados por disciplinas
SELECT d.nome AS nome_disciplina, COUNT(m.codaluno) AS numero_alunos
FROM disciplina d
LEFT JOIN matricula m ON d.cod = m.coddisciplina
GROUP BY d.nome;

-- 4. Nome do funcionário e do departamento para funcionários com "A" no nome
SELECT f.nome AS nome_funcionario, d.descricao AS nome_departamento
FROM funcionario f
JOIN departamento d ON f.coddepartamento = d.cod
WHERE f.nome LIKE '%A%';

-- 5. Funcionários em departamentos no Rio de Janeiro com salário > R$ 1500
SELECT f.nome AS nome_funcionario
FROM funcionario f
JOIN departamento d ON f.coddepartamento = d.cod
WHERE d.cidade = 'Rio de Janeiro' AND f.salario > 1500;

-- 6. Nome do aluno e carga horária total das disciplinas matriculadas
SELECT a.nome AS nome_aluno, SUM(d.carga_horaria) AS carga_horaria_total
FROM aluno a
JOIN matricula m ON a.cod = m.codaluno
JOIN disciplina d ON m.coddisciplina = d.cod
GROUP BY a.nome
ORDER BY a.nome;

-- 7. Nome do departamento, sigla, número de funcionários e salário médio
SELECT d.descricao AS nome_departamento, d.sigla, COUNT(f.cod) AS numero_funcionarios, AVG(f.salario) AS salario_medio
FROM departamento d
LEFT JOIN funcionario f ON d.cod = f.coddepartamento
GROUP BY d.descricao, d.sigla;

-- 8. Nome do aluno e carga horária total (repetido)
SELECT a.nome AS nome_aluno, SUM(d.carga_horaria) AS carga_horaria_total
FROM aluno a
JOIN matricula m ON a.cod = m.codaluno
JOIN disciplina d ON m.coddisciplina = d.cod
GROUP BY a.nome
ORDER BY a.nome;

-- 9. Faixa salarial dos funcionários
WITH faixa_salarial AS (
    SELECT f.nome, 
        CASE 
            WHEN f.salario <= 2000 THEN 'Até 2000'
            WHEN f.salario <= 5000 THEN 'De 2001 a 5000'
            ELSE 'Acima de 5000'
        END AS faixa
    FROM funcionario f
)
SELECT faixa, COUNT(*) AS numero_funcionarios
FROM faixa_salarial
GROUP BY faixa;

-- 10. Nível dos alunos com base na idade
SELECT a.nome AS nome_aluno, f.nivel
FROM aluno a
JOIN faixaNivel f ON a.idade BETWEEN f.idade_min AND f.idade_max;

-- 11. Disciplinas e número de alunos matriculados (zero para disciplinas sem alunos)
SELECT d.nome AS nome_disciplina, COUNT(m.codaluno) AS numero_alunos
FROM disciplina d
LEFT JOIN matricula m ON d.cod = m.coddisciplina
GROUP BY d.nome;

-- 12. Nome do aluno e disciplina matriculada (todos os alunos aparecem)
SELECT a.nome AS nome_aluno, d.nome AS nome_disciplina
FROM aluno a
LEFT JOIN matricula m ON a.cod = m.codaluno
LEFT JOIN disciplina d ON m.coddisciplina = d.cod;

-- 13. Nome do gerente e funcionário
SELECT f.nome AS nome_funcionario, g.nome AS nome_gerente
FROM funcionario f
LEFT JOIN funcionario g ON f.codgerente = g.cod;


