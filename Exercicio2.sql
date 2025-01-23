-- 2) Altere as tabelas já criadas, para ficar de acordo com o modelo lógico abaixo

-- Criação da tabela ALUNO
CREATE TABLE aluno (
    matricula NUMERIC(6) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    telefone NUMERIC(10),
    dtnascimento TIMESTAMP,
    cidade VARCHAR(100)
);

-- Criação da tabela DISCIPLINA
CREATE TABLE disciplina (
    cod NUMERIC PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    turma VARCHAR(50),
    numAlunos NUMERIC,
    cargaHoraria NUMERIC
);


-- Criação da tabela MATRICULA
CREATE TABLE matricula (
    matriculaAluno NUMERIC(6) NOT NULL,
    codDisciplina NUMERIC NOT NULL,
    dtEfetivado DATE,
    PRIMARY KEY (matriculaAluno, codDisciplina), -- Chave composta
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (matriculaAluno) REFERENCES aluno(matricula),
    CONSTRAINT fk_matricula_disciplina FOREIGN KEY (codDisciplina) REFERENCES disciplina(cod)
);

-- Criação da tabela FUNCIONARIO
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

-- Criação da tabela DEPARTAMENTO
CREATE TABLE departamento (
    cod NUMERIC PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    sigla VARCHAR(10)
);


