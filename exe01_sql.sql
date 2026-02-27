-- 1. Limpeza e Criação do Banco
DROP DATABASE IF EXISTS db_generation_game_online;
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(255) NOT NULL, -- Ex: Guerreiro, Mago, Arqueiro
    habilidade_especial VARCHAR(255)
);

CREATE TABLE tb_personagens(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome_classe, habilidade_especial) VALUES 
("Guerreiro", "Força Bruta"), 
("Mago", "Bola de Fogo"), 
("Arqueiro", "Flecha Certeira"), 
("Assassino", "Furtividade"), 
("Clérigo", "Cura");

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
("Aragorn", 2500, 1800, 50, 1),
("Gandalf", 3000, 1200, 80, 2),
("Legolas", 2200, 1000, 45, 3),
("Ezio", 2800, 800, 40, 4),
("Frodo", 500, 2500, 20, 5),
("Gimli", 2100, 2200, 48, 1),
("Saruman", 2900, 1100, 75, 2),
("Tauriel", 2000, 900, 42, 3);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

SELECT 
    p.nome, 
    p.poder_ataque, 
    p.poder_defesa, 
    c.nome_classe AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON c.id = p.classe_id;

SELECT 
    p.nome, 
    c.nome_classe 
FROM tb_personagens p
INNER JOIN tb_classes c ON c.id = p.classe_id
WHERE c.nome_classe = "Arqueiro";