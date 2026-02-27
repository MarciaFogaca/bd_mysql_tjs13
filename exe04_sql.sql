DROP DATABASE IF EXISTS db_cidade_das_carnes;
DROP DATABASE IF EXISTS db_casa_de_carnes;

CREATE DATABASE db_casa_de_carnes;
USE db_casa_de_carnes;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE 
);

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor_quilo DECIMAL(10, 2) NOT NULL,
    quantidade_kg DECIMAL(10, 3) NOT NULL,
    estoque INT NOT NULL, 
    validade DATE,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (descricao) VALUES 
("Bovino"), ("Aves"), ("Suíno"), ("Embutidos"), ("Outros");

INSERT INTO tb_produtos (nome, valor_quilo, quantidade_kg, estoque, validade, categoria_id) VALUES
("Picanha", 89.90, 1.200, 15, "2026-03-10", 1),
("Asinha de Frango", 18.50, 2.500, 30, "2026-03-05", 2),
("Linguiça Toscana", 24.00, 1.000, 50, "2026-03-15", 4),
("Costela Suína", 35.00, 3.200, 10, "2026-03-08", 3),
("Maminha", 65.00, 1.500, 12, "2026-03-12", 1),
("Peito de Frango", 22.90, 1.000, 40, "2026-03-04", 2),
("Alcatra", 55.00, 2.000, 18, "2026-03-07", 1),
("Salame Italiano", 70.00, 0.500, 100, "2026-04-01", 4);

SELECT 
    nome, 
    CONCAT("R$ ", REPLACE(valor_quilo, ".", ",")) AS preço_formatado,
    estoque
FROM tb_produtos;

SELECT 
    nome, 
    CONCAT("R$ ", REPLACE(valor_quilo, ".", ",")) AS preço
FROM tb_produtos 
WHERE valor_quilo > 50.00;

SELECT 
    p.nome, 
    CONCAT("R$ ", REPLACE(p.valor_quilo, ".", ",")) AS preço,
    c.descricao AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON c.id = p.categoria_id;