CREATE DATABASE IF NOT EXISTS db_Universidade;

USE db_Universidade;

CREATE TABLE tb_Alunos (
pk_Alunos INT NOT NULL PRIMARY KEY,
nome_aluno VARCHAR(50),
nascimento DATE,
endereco VARCHAR(50),
cidade VARCHAR(50),
estado VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS tb_Disciplinas (
pk_Disciplinas VARCHAR(10) PRIMARY KEY,
nome_disciplina VARCHAR(50),
carga_horaria INT 
);

CREATE TABLE IF NOT EXISTS tb_Professores (
pk_Professores INT PRIMARY KEY,
nome_professor VARCHAR(50),
nascimento DATE,
contratacao DATE,
endereco VARCHAR(50),
cidade VARCHAR(50),
estado VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS tb_Historico(
fk_Alunos INT,
fk_Disciplinas VARCHAR(10),
fk_Professores INT,
ano YEAR,
frequencia INT,
nota DECIMAL(3,1),
FOREIGN KEY (fk_Alunos) REFERENCES tb_Alunos(pk_Alunos),
FOREIGN KEY (fk_Disciplinas) REFERENCES tb_Disciplinas(pk_Disciplinas),
FOREIGN KEY (fk_Professores) REFERENCES tb_Professores(pk_Professores)
);

SELECT pk_Alunos AS Matricula, nome_aluno AS Nome
FROM tb_Alunos;

SELECT nota AS Nota
FROM tb_Historico;

-- 1 
SELECT pk_Alunos AS Matricula, nome_aluno AS Nome, nota
FROM tb_Alunos JOIN tb_Historico
ON tb_Alunos.pk_Alunos = tb_Historico.fk_Alunos
WHERE nota < 5;

INSERT INTO tb_Alunos (pk_Alunos, nome_Aluno, nascimento, endereco, cidade, estado)
VALUES
('2018011501','Maria Silva','1998-05-15','Rua das Flores,123','São Paulo','SP'),
('2018011502','João Oliveira','1997-09-28','Av.Paulista,456','São Paulo','SP'),
('2018011503','Ana Souza','1999-03-20','Rua dos Anjos,789','Rio de Janeiro','RJ'),
('2018011504','Pedro Santos','2000-07-10','Av. Copacabana,321','Rio de Janeiro','RJ'),
('2018011505','Carla Pereira','1996-12-03','Rua das Palmeiras,987','Belo Horizonte','MG'),
('2018011506','Fernando Oliveira','1999-08-20','Av.Brasil,456','São Paulo','SP'),
('2018011507','Amanda Costa','1998-02-14','Rua dos Ipês,789','Rio de Janeiro','RJ'),
('2018011508','Lucas Souza','2001-05-30','Av. Atlântica,321','Rio de Janeiro','RJ'),
('2018011509','Juliana Santos','1997-11-22','Rua das Margaridas,987','Belo Horizonte','MG'),
('2018011510','Gabriel Pereira','1995-06-17','Av. das Acácias,741','Curitiba','PR');

INSERT INTO tb_Disciplinas (pk_Disciplinas, nome_disciplina, carga_horaria)
VALUES
('DISC0001','Banco de Dados','100'),
('DISC0002','Programação Orientada a Objetos','100'),
('DISC0003','Redes de Computadores','80'),
('DISC0004','Segurança da Informação','80'),
('DISC0005','Desenvolvimento Web','80');

INSERT INTO tb_Professores (pk_Professores, nome_Professor, nascimento,contratacao, endereco, cidade, estado)
VALUES
('2015010801','Fernanda Oliveira','1980-05-12','2015-01-08','Av. Brasil,123','São Paulo','SP'),
('2015010802','Marcos Silva','1975-10-28','2015-01-08','Rua das Flores,456','Rio de Janeiro','RJ'),
('2016020803','Aline Souza','1983-03-20','2016-02-08','Av. Copacabana,789','Belo Horizonte','MG'),
('2017020804','Rafael Santos','1978-07-10','2017-02-08','Rua das Margaridas,321','Porto Alegre','RS'),
('2017120905','Camila Pereira','1985-12-03','2017-12-09','Av. Paulista,987','Curitiba','PR');

INSERT INTO tb_Historico (fk_Alunos, fk_Disciplinas, fk_Professores, ano, frequencia, nota)
VALUES
('2018011501','DISC0001','2015010801','2018','95','8.5'),
('2018011502','DISC0002','2015010802','2018','100','6.0'),
('2018011503','DISC0003','2016020803','2018','85','9.5'),
('2018011504','DISC0004','2017020804','2018','80','9.0'),
('2018011505','DISC0003','2017120905','2018','70','4.0'),
('2018011506','DISC0001','2015010801','2018','90','3.0'),
('2018011507','DISC0002','2015010802','2018','75','5.0'),
('2018011508','DISC0003','2016020803','2018','80','9.5'),
('2018011509','DISC0004','2017020804','2019','75','9.0'),
('2018011510','DISC0001','2017120905','2019','30','8.5');
-- 2
SELECT tb_Alunos.pk_Alunos AS Matricula, tb_Alunos.nome_aluno AS Nome,
AVG(tb_Historico.nota) AS Media
FROM tb_Alunos
INNER JOIN tb_Historico ON tb_Alunos.pk_Alunos = tb_Historico.fk_Alunos
INNER JOIN tb_Disciplinas ON tb_Historico.fk_Disciplinas = tb_Disciplinas.pk_Disciplinas
WHERE tb_Disciplinas.nome_disciplina = 'Redes de Computadores' AND tb_Historico.ano = 2018
GROUP BY tb_Alunos.pk_Alunos, tb_Alunos.nome_aluno
-- 3
HAVING AVG(tb_Historico.nota) > 6;
-- 4
SELECT estado FROM tb_Alunos WHERE estado !='RJ';
-- 5
SELECT nome_Aluno AS Nome
FROM tb_Alunos JOIN tb_Historico
ON tb_Alunos.pk_Alunos = tb_Historico.fk_Alunos
WHERE frequencia < 70;

 -- 6 
SELECT nome_Aluno AS Nome
FROM tb_Alunos
JOIN tb_Historico ON tb_Alunos.pk_Alunos = tb_Historico.fk_Alunos
INNER JOIN tb_Disciplinas ON tb_Historico.fk_Disciplinas = tb_Disciplinas.pk_Disciplinas
WHERE tb_Disciplinas.nome_disciplina IN ('Redes de Computadores', 'Programação Orientada a Objetos', 'Banco de Dados', 'Segurança da Informação', 'Desenvolvimento Web')
  AND tb_Historico.ano = 2018
GROUP BY tb_Alunos.pk_Alunos, tb_Alunos.nome_aluno
HAVING MAX(tb_Historico.nota) > 8.0
  AND AVG(tb_Historico.frequencia) > 80;
  
  -- 7 
SELECT tb_Alunos.nome_aluno AS Nome
FROM tb_Alunos
INNER JOIN tb_Historico ON tb_Alunos.pk_Alunos = tb_Historico.fk_Alunos
INNER JOIN tb_Disciplinas ON tb_Historico.fk_Disciplinas = tb_Disciplinas.pk_Disciplinas
WHERE tb_Disciplinas.nome_disciplina = 'Redes de Computadores'
  AND tb_Historico.ano = 2020
  AND tb_Historico.nota > 6.0;
  
-- 8
SELECT tb_Alunos.nome_aluno AS nome
FROM tb_Alunos
INNER JOIN tb_Historico ON tb_Alunos.pk_Alunos = tb_Historico.fk_Alunos
INNER JOIN tb_Disciplinas ON tb_Historico.fk_Disciplinas = tb_Disciplinas.pk_Disciplinas
WHERE tb_Disciplinas.nome_disciplina = 'Banco de Dados' AND tb_Historico.ano = 2018;

-- 9
SELECT tb_Alunos.nome_aluno AS Nome
FROM tb_Alunos
JOIN tb_Historico ON tb_Alunos.pk_Alunos = tb_Historico.fk_Alunos
JOIN tb_Disciplinas ON tb_Historico.fk_Disciplinas = tb_Disciplinas.pk_Disciplinas
WHERE tb_Disciplinas.nome_disciplina IS NULL OR (tb_Disciplinas.nome_disciplina !='Desenvolvimento Web' AND tb_Historico.ano != 2018);


