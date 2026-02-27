DROP DATABASE IF EXISTS db_curso_da_minha_vida;
CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    area VARCHAR(255) NOT NULL,
    modalidade VARCHAR(255) NOT NULL
);

CREATE TABLE tb_cursos(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    duracao_horas INT NOT NULL,
    instrutor VARCHAR(255),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (area, modalidade) VALUES 
("Tecnologia", "EAD"), ("Gestão", "EAD"), ("Saúde", "Presencial"), ("Idiomas", "Híbrido"), ("Artes", "Presencial");

INSERT INTO tb_cursos (nome, valor, duracao_horas, instrutor, categoria_id) VALUES
("Java FullStack", 800.00, 400, "Guanabara", 1),
("Inglês Iniciante", 45.00, 60, "Teacher Mary", 4),
("Gestão de Projetos", 600.00, 120, "Ricardo", 2),
("Python para Dados", 550.00, 200, "Ana Silva", 1),
("Primeiros Socorros", 150.00, 20, "Dr. João", 3),
("Excel Avançado", 90.00, 40, "Carlos", 2),
("Desenho Digital", 300.00, 80, "Bia Arts", 5),
("Marketing Digital", 450.00, 100, "Felipe", 2);

SELECT nome, CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço FROM tb_cursos WHERE valor > 500.00;

SELECT nome, CONCAT("R$ ", REPLACE(valor, ".", ",")) AS preço FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE "%J%";

SELECT p.nome, CONCAT("R$ ", REPLACE(p.valor, ".", ",")) AS preço, c.area 
FROM tb_cursos p INNER JOIN tb_categorias c ON c.id = p.categoria_id;