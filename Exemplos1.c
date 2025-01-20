// Transações no PostgreSQL


// Com as tabelas na situação acima, o que acontece se executarmos os comandos abaixo,
// um por vez?

// INSERT INTO departamento(cod, descricao, localizacao)
// VALUES (20, 'ALMOXARIFADO','CURITIBA');
// INSERT INTO funcionario(cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
// VALUES (1000, 'JOÃO','CONTADOR', '01/03/2007', null, 2000, 20);
// INSERT INTO funcionario(cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
// VALUES (1000, 'PEDRO','COORDENADOR', '11/04/2007', null, 3000, 20);