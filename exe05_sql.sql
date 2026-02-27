DROP DATABASE IF EXISTS db_construindo_vidas;
CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    departamento VARCHAR(255) NOT NULL, -- Ex: Alvenaria, Elétrica, Hidráulica
    setor VARCHAR(255) NOT NULL -- Ex: Interno, Externo, Acabamento
);

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    marca VARCHAR(255),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (departamento, setor) VALUES 
("Hidráulica", "Interno"), 
("Elétrica", "Acabamento"), 
("Alvenaria", "Externo"), 
("Pisos e Revestimentos", "Acabamento"), 
("Ferramentas", "Geral");

INSERT INTO tb_produtos (nome, valor, estoque, marca, categoria_id) VALUES
("Cimento 50kg", 32.00, 200, "Votoran", 3),
("Torneira Gourmet", 180.00, 30, "Deca", 1),
("Lustre de Teto", 250.00, 10, "LuzLar", 2),
("Piso Porcelanato m²", 85.90, 500, "Portobello", 4),
("Fio Elétrico 100m", 120.00, 45, "Sil", 2),
("Furadeira de Impacto", 350.00, 15, "Bosch", 5),
("Tubo PVC 100mm", 45.00, 100, "Tigre", 1),
("Areia Média Saco", 12.00, 300, "Geral", 3);

SELECT nome, CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço FROM tb_produtos WHERE valor > 100.00;

SELECT nome, CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT p.nome, CONCAT("R$ ", REPLACE(p.valor, ".", ",")) AS preço, c.departamento AS categoria 
FROM tb_produtos p INNER JOIN tb_categorias c ON c.id = p.categoria_id;