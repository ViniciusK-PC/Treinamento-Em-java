
-- Criação da tabela ALUNO
CREATE TABLE aluno (
    matricula NUMERIC(6) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(100),
    telefone NUMERIC(10),
    idade NUMERIC(3),                  
    dtnascimento DATE,
    cidade VARCHAR(100)
);
-- ALTER TABLE aluno ADD COLUMN email VARCHAR(100);
-- ALTER TABLE aluno ADD COLUMN idade NUMERIC(3);

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

-- insert into aluno (matricula,nome,email,telefone,idade,dtnascimento,cidade)
-- values (201527701,'ANDRESSA MOREIRA DA SILVA','teste@teste',NULL,NULL,'01-09-2009','PELOTAS');

-- Inserçao nas tableas

