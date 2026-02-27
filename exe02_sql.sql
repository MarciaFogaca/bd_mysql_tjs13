DROP DATABASE IF EXISTS db_pizzaria_legal;
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    tamanho VARCHAR(255) NOT NULL -- Ex: Brotinho, Média, Grande
);

CREATE TABLE tb_pizzas(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sabor VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    borda_recheada BOOLEAN DEFAULT FALSE,
    ingredientes VARCHAR(500),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, tamanho) VALUES 
("Salgada", "Grande"), 
("Doce", "Brotinho"), 
("Vegana", "Média"), 
("Especial", "Grande"), 
("Salgada", "Média");

INSERT INTO tb_pizzas (sabor, valor, borda_recheada, ingredientes, categoria_id) VALUES
("Mussarela", 40.00, true, "Molho, mussarela e orégano", 1),
("Calabresa", 42.00, false, "Molho, calabresa e cebola", 5),
("Brigadeiro", 55.00, false, "Chocolate e granulado", 2),
("Frango com Catupiry", 48.00, true, "Frango, catupiry e milho", 4),
("Portuguesa", 52.00, true, "Ovo, presunto, cebola e ervilha", 1),
("Shimeji Veg", 60.00, false, "Shimeji e queijo vegano", 3),
("Margherita", 38.00, false, "Manjericão e tomate", 5),
("Banana com Canela", 45.00, false, "Banana, açúcar e canela", 2);

SELECT 
    sabor, 
    CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço,
    ingredientes
FROM tb_pizzas;

SELECT 
    sabor, 
    CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço
FROM tb_pizzas 
WHERE valor > 45.00;

SELECT 
    sabor, 
    CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço
FROM tb_pizzas 
WHERE valor BETWEEN 50.00 AND 100.00;
