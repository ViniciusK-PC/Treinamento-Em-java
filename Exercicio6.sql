-- Apagar tabelas (respeitando a ordem das dependências)
DROP TABLE IF EXISTS matricula CASCADE;
DROP TABLE IF EXISTS disciplina CASCADE;
DROP TABLE IF EXISTS funcionario CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS aluno CASCADE;

-- Recriação das tabelas com restrições adicionais

-- Criação da tabela ALUNO
CREATE TABLE aluno (
    matricula NUMERIC(6) PRIMARY KEY, -- Chave primária
    nome VARCHAR(200) NOT NULL CHECK (LENGTH(nome) > 1), -- Nome não pode ser vazio
    telefone NUMERIC(10) UNIQUE, -- Telefone deve ser único
    dtnascimento DATE NOT NULL CHECK (dtnascimento <= CURRENT_DATE), -- Data de nascimento não pode ser futura
    cidade VARCHAR(100) NOT NULL
);

-- Criação da tabela DISCIPLINA
CREATE TABLE disciplina (
    cod NUMERIC PRIMARY KEY, -- Chave primária
    nome VARCHAR(100) NOT NULL UNIQUE, -- Nome único
    turma VARCHAR(50) NOT NULL CHECK (turma ~ '^[A-Za-z0-9]+$'), -- Apenas alfanuméricos
    numAlunos NUMERIC CHECK (numAlunos >= 0), -- Número de alunos não pode ser negativo
    cargaHoraria NUMERIC NOT NULL CHECK (cargaHoraria > 0) -- Carga horária deve ser positiva
);

-- Criação da tabela MATRICULA
CREATE TABLE matricula (
    matriculaAluno NUMERIC(6) NOT NULL,
    codDisciplina NUMERIC NOT NULL,
    dtEfetivado DATE NOT NULL CHECK (dtEfetivado >= CURRENT_DATE), -- Não pode efetivar matrícula no passado
    PRIMARY KEY (matriculaAluno, codDisciplina), -- Chave composta
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (matriculaAluno) REFERENCES aluno(matricula) ON DELETE CASCADE,
    CONSTRAINT fk_matricula_disciplina FOREIGN KEY (codDisciplina) REFERENCES disciplina(cod) ON DELETE CASCADE
);

-- Criação da tabela FUNCIONARIO
CREATE TABLE funcionario (
    cod NUMERIC PRIMARY KEY, -- Chave primária
    nome VARCHAR(200) NOT NULL,
    cargo VARCHAR(100) NOT NULL CHECK (LENGTH(cargo) > 2), -- Cargo deve ter pelo menos 3 caracteres
    dtcontratacao DATE NOT NULL CHECK (dtcontratacao <= CURRENT_DATE), -- Data de contratação não pode ser futura
    codgerente NUMERIC,
    salario NUMERIC(10, 2) NOT NULL CHECK (salario > 0), -- Salário deve ser maior que zero
    coddepartamento NUMERIC NOT NULL,
    CONSTRAINT fk_funcionario_gerente FOREIGN KEY (codgerente) REFERENCES funcionario(cod),
    CONSTRAINT fk_funcionario_departamento FOREIGN KEY (coddepartamento) REFERENCES departamento(cod)
);

-- Criação da tabela DEPARTAMENTO
CREATE TABLE departamento (
    cod NUMERIC PRIMARY KEY, -- Chave primária
    descricao VARCHAR(200) NOT NULL UNIQUE, -- Descrição única
    sigla VARCHAR(10) NOT NULL CHECK (LENGTH(sigla) = 3) -- Sigla com exatamente 3 caracteres
);

Opção 2: Alterar as tabelas existentes usando ALTER TABLE
Se preferir alterar as tabelas existentes sem recriá-las, utilize o seguinte script:
sql Copiar Editar

-- Adicionando restrições na tabela ALUNO
ALTER TABLE aluno
    ADD CONSTRAINT chk_nome CHECK (LENGTH(nome) > 1),
    ADD CONSTRAINT chk_dtnascimento CHECK (dtnascimento <= CURRENT_DATE),
    ADD CONSTRAINT unique_telefone UNIQUE (telefone);

-- Adicionando restrições na tabela DISCIPLINA
ALTER TABLE disciplina
    ADD CONSTRAINT unique_nome_disciplina UNIQUE (nome),
    ADD CONSTRAINT chk_turma CHECK (turma ~ '^[A-Za-z0-9]+$'),
    ADD CONSTRAINT chk_numAlunos CHECK (numAlunos >= 0),
    ADD CONSTRAINT chk_cargaHoraria CHECK (cargaHoraria > 0);

-- Adicionando restrições na tabela MATRICULA
ALTER TABLE matricula
    ADD CONSTRAINT chk_dtEfetivado CHECK (dtEfetivado >= CURRENT_DATE);

-- Adicionando restrições na tabela FUNCIONARIO
ALTER TABLE funcionario
    ADD CONSTRAINT chk_cargo CHECK (LENGTH(cargo) > 2),
    ADD CONSTRAINT chk_dtcontratacao CHECK (dtcontratacao <= CURRENT_DATE),
    ADD CONSTRAINT chk_salario CHECK (salario > 0);

-- Adicionando restrições na tabela DEPARTAMENTO
ALTER TABLE departamento
    ADD CONSTRAINT unique_descricao UNIQUE (descricao),
    ADD CONSTRAINT chk_sigla CHECK (LENGTH(sigla) = 3);


