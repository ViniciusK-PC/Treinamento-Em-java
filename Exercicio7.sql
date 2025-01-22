SELECT funcionario.nome AS nome_funcionario, departamento.descricao AS nome_departamento
FROM funcionario
JOIN departamento ON funcionario.cod_departamento = departamento.cod;

