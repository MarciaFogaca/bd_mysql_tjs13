DROP DATABASE IF EXISTS db_farmacia_bem_estar;
CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL, -- Ex: Medicamento, Higiene, Beleza
    receita_obrigatoria BOOLEAN DEFAULT FALSE -- receita presa  ou não--
);

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    laboratorio VARCHAR(255),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, receita_obrigatoria) VALUES 
("Medicamento", true), 
("Medicamento", false), 
("Higiene", false), 
("Perfumaria", false), 
("Suplementos", false);

INSERT INTO tb_produtos (nome, valor, estoque, laboratorio, categoria_id) VALUES
("Amoxicilina", 45.50, 100, "GenericCorp", 1),
("Dipirona", 12.00, 500, "MedSaude", 2),
("Shampoo Anticaspa", 35.00, 50, "CabeloBom", 3),
("Perfume Floral", 120.00, 15, "CheiroBom", 4),
("Vitamina C", 25.90, 200, "VitaLife", 5),
("Protetor Solar", 65.00, 40, "SolProtege", 4),
("Sabonete Líquido", 18.00, 150, "LimpezaTotal", 3),
("Anti-inflamatório", 55.00, 80, "FarmaBio", 1);

SELECT 
    nome, 
    CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço,
    laboratorio
FROM tb_produtos;

SELECT 
    nome, 
    CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço
FROM tb_produtos 
WHERE valor > 50.00;

SELECT 
    nome, 
    CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço
FROM tb_produtos 
WHERE valor BETWEEN 5.00 AND 60.00;

SELECT 
    p.nome, 
    CONCAT("R$ ", REPLACE(p.valor, ".", ",")) AS preço,
    c.tipo AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON c.id = p.categoria_id;