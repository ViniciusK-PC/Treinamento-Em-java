-- 1. Criação da tabela faixaNivel
CREATE TABLE faixaNivel (
    nivel CHAR(1),
    idade_min INT,
    idade_max INT
);

-- Inserção de dados na tabela faixaNivel
INSERT INTO faixaNivel (nivel, idade_min, idade_max) VALUES
('A', 15, 20),
('B', 21, 25),
('C', 26, 30),
('D', 31, 100);

-- Criação da View para consulta do nível dos alunos
CREATE OR REPLACE VIEW vw_nivel_aluno AS
SELECT 
    a.cod AS matricula_aluno,
    a.nome AS nome_aluno,
    f.nivel
FROM aluno a
JOIN faixaNivel f ON a.idade BETWEEN f.idade_min AND f.idade_max;

-- 2. Consulta utilizando a View, tabela matricula e tabela disciplina
SELECT 
    v.nome_aluno,
    d.nome AS nome_disciplina,
    v.nivel
FROM vw_nivel_aluno v
JOIN matricula m ON v.matricula_aluno = m.codaluno
JOIN disciplina d ON m.coddisciplina = d.cod;

-- 3. Consulta para informar o total de alunos matriculados por disciplinas e agrupados por nível
SELECT 
    d.nome AS nome_disciplina,
    COUNT(v.matricula_aluno) AS total_alunos,
    v.nivel
FROM vw_nivel_aluno v
JOIN matricula m ON v.matricula_aluno = m.codaluno
JOIN disciplina d ON m.coddisciplina = d.cod
GROUP BY d.nome, v.nivel
ORDER BY d.nome, v.nivel;


Disciplina	Total_Alunos	Nível
Algoritmos e Prog	17	A
Algoritmos e Prog	5	B
Banco de Dados	10	A
Banco de Dados	8	B
Banco de Dados	3	C


Script para criar a tabela aluno e popular com dados:
-- Criação da tabela aluno
CREATE TABLE aluno (
    cod SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    idade INT NOT NULL
);

-- Inserção de dados na tabela aluno
INSERT INTO aluno (nome, idade) VALUES
('Maria', 18),
('João', 22),
('Ana', 27),
('Pedro', 31),
('Fernanda', 20),
('Lucas', 25),
('Clara', 30);


Finalizado