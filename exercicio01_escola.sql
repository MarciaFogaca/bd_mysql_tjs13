CREATE DATABASE IF NOT EXISTS db_escola;
USE db_escola;

DROP TABLE IF EXISTS tb_estudantes;

CREATE TABLE tb_estudantes(
   id   BIGINT AUTO_INCREMENT,
   nome VARCHAR(255) NOT NULL,
   ra INT,
   turma VARCHAR(50),
   nota DECIMAL (4, 2) NOT NULL,
   PRIMARY KEY (id)
   );
   
INSERT INTO  tb_estudantes (nome, ra, turma, nota)
VALUES 
("Marcia Silva", 1001, "Turma A", 9.5),
("Ricardo Souza", 1002, "Turma B", 6.0),
("Beatriz Oliveira", 1003, "Turma A", 8.5),
("Carlos Daniel", 1004, "Turma C", 5.0),
("Fernanda Lima", 1005, "Turma B", 2.0),
("Gabriel Costa", 1006, "Turma A", 4.5),
("Helena Santos", 1007, "Turma C", 7.2),
("Igor Martins", 1008, "Turma B", 6.8);

SELECT * FROM tb_estudantes WHERE nota > 7.0;
SELECT * FROM tb_estudantes WHERE nota < 7.0;
UPDATE tb_estudantes SET nota = 7.0 WHERE id = 6;

SELECT nome AS "Nome do Aluno",
       turma AS "Turma",
       nota AS "Nota Final",
       CASE 
           WHEN nota >= 7.0 THEN "Aprovado"
           WHEN nota >= 5.0 AND nota < 7.0 THEN "Exame"
           ELSE "Reprovado"
       END AS "Status Acadêmico"
FROM tb_estudantes
ORDER BY nota DESC;
