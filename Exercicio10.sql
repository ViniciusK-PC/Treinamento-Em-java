Exemplo de Transações (slide 11)
sql
Copiar
Editar
-- Transação 1
BEGIN;
UPDATE funcionario SET salario = salario * 1.10 WHERE cod = 1; -- Aumenta 10% do salário do funcionário com código 1
SELECT * FROM funcionario WHERE cod = 1;

-- Transação 2
BEGIN;
UPDATE funcionario SET salario = salario * 1.05 WHERE cod = 1; -- Aumenta 5% do salário do funcionário com código 1
SELECT * FROM funcionario WHERE cod = 1;

-- Confirmação ou rollback
COMMIT; -- ou ROLLBACK;



Exemplo de Concorrência (slide 12)
sql
Copiar
Editar
-- Conexão 1: Transação inicia
BEGIN;
UPDATE funcionario SET salario = salario * 1.10 WHERE cod = 2;

-- Conexão 2: Tentativa de leitura enquanto Conexão 1 está aberta
SELECT * FROM funcionario WHERE cod = 2;

-- Conexão 1: Confirmação
COMMIT;

-- Conexão 2: Nova leitura após COMMIT
SELECT * FROM funcionario WHERE cod = 2;
Anote os resultados dos SELECTs:
Crie uma tabela para registrar observações:

Passo	Conexão	Comando Executado	Resultado
1	1	BEGIN + UPDATE	Linha atualizada na transação
2	2	SELECT	Dependente do isolamento configurado
3	1	COMMIT	Mudança confirmada
4	2	SELECT após COMMIT	Linha refletindo as mudanças
Se você puder descrever melhor os slides, posso adaptar os exemplos com precisão.

BEGIN;

-- Comandos de teste (alterações e verificações)
UPDATE funcionario SET salario = salario * 1.10 WHERE cod = 3; -- Aumenta 10% do salário da Ana
SELECT * FROM funcionario WHERE cod = 3; -- Verifica o salário atualizado

UPDATE funcionario SET nome = 'Ana Maria' WHERE cod = 3; -- Altera o nome da Ana
SELECT * FROM funcionario WHERE cod = 3; -- Confirma a alteração do nome

-- Tentativa de alterar uma chave primária (não é recomendada, mas pode ser feita)
-- ALTER TABLE funcionario DROP CONSTRAINT funcionario_pkey; -- Exclui a chave primária
-- ALTER TABLE funcionario ADD PRIMARY KEY (nome); -- Define o nome como chave primária

-- Tentativa de adicionar um funcionário duplicado na chave atual
INSERT INTO funcionario (cod, nome, cargo, dtcontratacao, salario) VALUES
(3, 'Duplicado', 'Testador', '2023-01-01', 3000.00); -- Deverá falhar se a chave for única

-- Teste de rollback para descartar alterações
ROLLBACK;


Finaliado 
