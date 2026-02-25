CREATE DATABASE IF NOT EXISTS db_ecommerce;
USE db_ecommerce;

DROP TABLE IF EXISTS tb_produtos;

CREATE TABLE tb_produtos(
   id   BIGINT AUTO_INCREMENT,
   nome_produto VARCHAR(255) NOT NULL,
   marca VARCHAR(100),
   quantidade_estoque INT,
   preco DECIMAL (10, 2) NOT NULL,
   PRIMARY KEY (id)
   );
   
INSERT INTO tb_produtos (nome_produto, marca, quantidade_estoque, preco)
VALUES
("Iphone 17 Pro Max", "Apple", 10, 9500.00),
("Macbook Pro M5", "Apple", 5, 14800.00),
("Monitor 27'", "LG", 15, 1200.00),
("Cadeira Gamer", "DXRacer", 8, 1500.00),
("Mouse Básico", "Logitech", 50, 80.00),
("Teclado Simples", "Multilaser", 30, 45.00),
("Fone de Ouvido", "JBL", 20, 150.00),
("Airpods Pro 3", "Apple", 20, 2799.00);


SELECT * FROM tb_produtos WHERE preco > 500.00;
SELECT * FROM tb_produtos WHERE preco < 500.00;

UPDATE tb_produtos SET preco = 199.00 WHERE id = 7;

SELECT nome_produto As Produto,
       quantidade_estoque AS Estoque,
       CONCAT("R$", FORMAT(preco * quantidade_estoque, 2,'pt_BR')) AS "Valor Total em Estoque"
FROM  tb_produtos
 ORDER BY (preco * quantidade_estoque) DESC;  



