// Coloque os exemplos dos slides 11, 12 e 13 para rodar no pgAdmin III
// 2. Abra duas conexões (duas janelas para comandos SQL) com o pgAdmin e execute as ações a seguir
// alternando entre as duas conexões de acordo com a ordem dos passos definido no lado esquerdo.

// ● Anote o resultado dos selects na coluna da direita

um por vez?

INSERT INTO departamento(cod, descricao, localizacao)
VALUES (20, 'ALMOXARIFADO','CURITIBA');
INSERT INTO funcionario(cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1000, 'JOÃO','CONTADOR', '01/03/2007', null, 2000, 20);
INSERT INTO funcionario(cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1000, 'PEDRO','COORDENADOR', '11/04/2007', null, 3000, 20);



BEGIN;
INSERT INTO departamento(cod, descricao, localizacao)
VALUES (20, 'ALMOXARIFADO', 'CURITIBA');
INSERT INTO funcionario(cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1000, 'JOÃO', 'CONTADOR', '01/03/2007', null, 2000, 20);
INSERT INTO funcionario(
cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1000, 'PEDRO', 'COORDENADOR', '11/04/2007', null, 3000, 20);
COMMIT;


BEGIN;
INSERT INTO departamento(cod, descricao, localizacao)
VALUES (20, 'ALMOXARIFADO','CURITIBA');
INSERT INTO funcionario(cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1000, 'JOÃO','CONTADOR', '01/03/2007', null, 2000, 20);
INSERT INTO funcionario(
cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1001, 'PEDRO','COORDENADOR', '11/04/2007', null, 3000, 20);
ROLLBACK;