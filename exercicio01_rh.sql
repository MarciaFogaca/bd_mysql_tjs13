-- CREATE DATABASE db_rh; --

USE db_rh;

DROP TABLE IF EXISTS tb_colaboradores;

CREATE TABLE tb_colaboradores(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
cargo VARCHAR(100),
data_admissao DATE,
salario DECIMAL(10,2) NOT NULL,
PRIMARY KEY (id)
);
INSERT INTO tb_colaboradores(nome, cargo, data_admissao,salario)
VALUES ("Ana Dorneles", "Analista de RH", "2023-01-15", 2500.00),
       ("Joao Pedro Garcia", "Gerente Operacional", "2018-10-23", 5100.00),
       ("Beatriz Gonaçalves", "Auxiliar Adminsitrativo", "2024-03-18", 1850.00),
       ("Marcos Oliveira", "Assistente Administativo", "2022-08-11", 2200.00),
       ("Elaine Correa", "Recrutadora Senior", "2017-04-11", 3450.00),
       ("Eduardo Siqueira ", "Estagiário", "2023-01-15", 1480.00);

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET salario = 2200.00 WHERE  id = 3;

-- INCREMENTO: Relatório Final Organizado ( ordem alfabetica e salario em formato: R$)-- 
SELECT nome AS "Nome Completo",
       cargo AS "Cargo Atual",
       
       CONCAT("R$", FORMAT (salario, 2, 'pt_BR')) AS "Salario Atual"
FROM tb_colaboradores
ORDER BY nome ASC;
       

