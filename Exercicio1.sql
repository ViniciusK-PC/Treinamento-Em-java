-- ● Obs.: É uma boa prática guardar os comandos utilizados para posterior reaproveitamento.
-- 1) Dado o modelo lógico abaixo, crie as 4 tabelas correspondentes
-- Tabela ALUNO
CREATE TABLE aluno (
    matricula NUMERIC(6) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    telefone NUMERIC(10),
    dtnascimento TIMESTAMP,
    cidade VARCHAR(100)
);

-- Tabela MATRICULA
CREATE TABLE matricula (
    matriculaaluno NUMERIC(6),
    coddisciplina NUMERIC(6),
    PRIMARY KEY (matriculaaluno, coddisciplina),
    FOREIGN KEY (matriculaaluno) REFERENCES aluno(matricula),
    FOREIGN KEY (coddisciplina) REFERENCES disciplina(cod)
);

-- Tabela DISCIPLINA
CREATE TABLE disciplina (
    cod NUMERIC(6) PRIMARY KEY,
    nome TEXT NOT NULL,
    cargahoraria NUMERIC
);

-- Tabela FUNCIONARIO
CREATE TABLE funcionario (
    cod NUMERIC PRIMARY KEY,
    nome TEXT NOT NULL,
    cargo TEXT,
    salario NUMERIC,
    coddepartamento NUMERIC,
    FOREIGN KEY (coddepartamento) REFERENCES departamento(cod)
);

-- Tabela DEPARTAMENTO
CREATE TABLE departamento (
    cod NUMERIC PRIMARY KEY,
    descricao TEXT NOT NULL
);

-- FInalizado


