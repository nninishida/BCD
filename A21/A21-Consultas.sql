-- Se existir, excluir banco cadastro_db
DROP DATABASE IF EXISTS db_cadastro;

-- Criar banco cadastro_db
CREATE DATABASE db_cadastro;

-- Usar banco cadastro_db
USE db_cadastro;

-- Criar tabela cursos
CREATE TABLE IF NOT EXISTS tb_cursos (
pk_cursos int NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL UNIQUE,
descricao text,
carga int UNSIGNED,
totaulas int UNSIGNED,
ano year DEFAULT '2024',
PRIMARY KEY (pk_cursos)
)DEFAULT CHARSET=utf8MB4;

-- Inserir registros na tabela cursos
INSERT INTO tb_cursos VALUES 
(1,'HTML5','Curso de HTML5',40,37,2014),
(2,'Algoritmos','Lógica de Programação',20,15,2014),
(3,'Photoshop5','Dicas de Photoshop CC',10,8,2014),
(4,'PHP','Curso de PHP para iniciantes',40,20,2015),
(5,'Java','Introdução à Linguagem Java',40,29,2015),
(6,'MySQL','Bancos de Dados MySQL',30,15,2016),
(7,'Word','Curso completo de Word',40,30,2016),
(8,'Python','Curso de Python',40,18,2017),
(9,'POO','Curso de Programação Orientada a Objetos',60,35,2016),
(10,'Excel','Curso completo de Excel',40,30,2017),
(11,'Responsividade','Curso de Responsividade',30,15,2018),
(12,'C++','Curso de C++ com Orientação a Objetos',40,25,2017),
(13,'C#','Curso de C#',30,12,2017),
(14,'Android','Curso de Desenvolvimento de Aplicativos para Android',60,30,2018),
(15,'JavaScript','Curso de JavaScript',35,18,2017),
(16,'PowerPoint','Curso completo de PowerPoint',30,12,2018),
(17,'Swift','Curso de Desenvolvimento de Aplicativos para iOS',60,30,2019),
(18,'Hardware','Curso de Montagem e Manutenção de PCs',30,12,2017),
(19,'Redes','Curso de Redes para Iniciantes',40,15,2016),
(20,'Segurança','Curso de Segurança',15,8,2018),
(21,'SEO','Curso de Otimização de Sites',30,12,2017),
(22,'Premiere','Curso de Edição de Vídeos com Premiere',20,10,2017),
(23,'After Effects','Curso de Efeitos em Vídeos com After Effects',20,10,2018),
(24,'WordPress','Curso de Criação de Sites com WordPress',60,30,2019),
(25,'Joomla','Curso de Criação de Sites com Joomla',60,30,2019),
(26,'Magento','Curso de Criação de Lojas Virtuais com Magento',50,25,2019),
(27,'Modelagem de Dados','Curso de Modelagem de Dados',30,12,2020),
(28,'HTML4','Curso Básico de HTML, versão 4.0',20,9,2010),
(29,'PHP7','Curso de PHP, versão 7.0',40,20,2020),
(30,'PHP4','Curso de PHP, versão 4.0',30,11,2010);

-- Criar tabela pessoas
CREATE TABLE IF NOT EXISTS  tb_pessoas (
pk_pessoas int NOT NULL AUTO_INCREMENT,
fk_cursos int,
nome varchar(30) NOT NULL,
profissao varchar(30),
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchar(20) DEFAULT 'Brasileira',
PRIMARY KEY (pk_pessoas),
FOREIGN KEY (fk_cursos) REFERENCES tb_cursos(pk_cursos)
)DEFAULT CHARSET=utf8MB4;

-- Inserir registros na tabela pessoas
INSERT INTO tb_pessoas (fk_cursos,nome, profissao, nascimento, sexo, peso, altura, nacionalidade) VALUES 
(1,'João Silva', 'Engenheiro', '1980-05-15', 'M', 75.5, 1.75, 'Brasileira'),
(1,'Maria Oliveira', 'Médica', '1975-09-20', 'F', 62.3, 1.68, 'Portuguesa'),
(1,'Carlos Santos', 'Advogado', '1990-02-10', 'M', 80.2, 1.80, 'Espanhola'),
(1,'Ana Costa', 'Professora', '1988-11-30', 'F', 55.8, 1.62, 'Italiana'),
(2,'Pedro Souza', 'Arquiteto', '1985-07-25', 'M', 70.1, 1.78, 'Alemã'),
(2,'Camila Pereira', 'Engenheira Civil', '1995-04-12', 'F', 58.6, 1.70, 'Francesa'),
(2,'Fernando Lima', 'Empresário', '1978-03-05', 'M', 85.0, 1.82, 'Inglesa'),
(2,'Juliana Almeida', 'Psicóloga', '1982-08-18', 'F', 60.9, 1.65, 'Mexicana'),
(3,'Ricardo Fernandes', 'Programador', '1992-01-22', 'M', 68.7, 1.75, 'Canadense'),
(3,'Aline Rodrigues', 'Nutricionista', '1987-06-28', 'F', 57.2, 1.63, 'Americana'),
(3,'Gabriel Oliveira', 'Estudante', '2000-12-10', 'M', 65.4, 1.79, 'Argentina'),
(3,'Mariana Costa', 'Enfermeira', '1984-09-03', 'F', 59.1, 1.67, 'Chinesa'),
(4,'Luiz Pereira', 'Bombeiro', '1973-11-17', 'M', 90.5, 1.85, 'Russa'),
(4,'Tatiane Santos', 'Advogada', '1989-07-14', 'F', 63.8, 1.71, 'Japonesa'),
(4,'Gustavo Martins', 'Engenheiro Eletricista', '1981-04-20', 'M', 73.2, 1.76, 'Sul-Africana'),
(4,'Carolina Lima', 'Psicóloga', '1986-10-08', 'F', 61.5, 1.69, 'Coreana'),
(5,'Diego Silva', 'Médico', '1976-02-28', 'M', 78.4, 1.81, 'Mexicana'),
(5,'Isabela Gonçalves', 'Estudante', '1993-05-07', 'F', 56.7, 1.64, 'Canadense'),
(5,'Roberto Oliveira', 'Engenheiro de Software', '1983-08-12', 'M', 76.8, 1.77, 'Espanhola'),
(5,'Patrícia Rodrigues', 'Advogada', '1980-01-19', 'F', 64.3, 1.70, 'Portuguesa'),
(6,'Renato Almeida', 'Professor', '1977-06-23', 'M', 82.1, 1.83, 'Francesa'),
(6,'Vanessa Costa', 'Veterinária', '1985-09-30', 'F', 60.2, 1.66, 'Chinesa'),
(6,'Marcelo Santos', 'Analista de Sistemas', '1990-03-14', 'M', 72.6, 1.78, 'Japonesa'),
(6,'Cristina Fernandes', 'Pedagoga', '1988-07-02', 'F', 58.9, 1.63, 'Sul-Africana'),
(7,'André Oliveira', 'Engenheiro Civil', '1979-12-08', 'M', 79.3, 1.79, 'Russa'),
(7,'Laura Almeida', 'Fisioterapeuta', '1983-05-25', 'F', 62.7, 1.70, 'Americana'),
(7,'Felipe Rodrigues', 'Contador', '1985-08-01', 'M', 75.9, 1.75, 'Argentina'),
(7,'Daniela Silva', 'Arquiteta', '1991-04-16', 'F', 57.4, 1.68, 'Coreana'),
(8,'Vinícius Lima', 'Engenheiro Mecânico', '1974-10-11', 'M', 88.0, 1.84, 'Mexicana'),
(8,'Amanda Costa', 'Bióloga', '1980-06-29', 'F', 59.8, 1.65, 'Chinesa'),
(8,'Bruno Santos', 'Designer Gráfico', '1996-02-03', 'M', 71.2, 1.77, 'Russa'),
(8,'Tatiana Martins', 'Farmacêutica', '1982-09-18', 'F', 63.5, 1.68, 'Portuguesa'),
(9,'Rodrigo Fernandes', 'Engenheiro de Produção', '1976-12-22', 'M', 83.7, 1.81, 'Francesa'),
(9,'Juliana Silva', 'Advogada', '1987-05-26', 'F', 60.6, 1.64, 'Mexicana'),
(9,'Lucas Oliveira', 'Analista de Negócios', '1984-08-09', 'M', 74.5, 1.80, 'Coreana'),
(9,'Natália Almeida', 'Médica Veterinária', '1990-11-04', 'F', 55.3, 1.63, 'Sul-Africana'),
(10,'Rafael Santos', 'Engenheiro Químico', '1978-07-30', 'M', 87.2, 1.85, 'Japonesa'),
(10,'Isabela Lima', 'Administradora', '1986-04-13', 'F', 61.9, 1.69, 'Argentina'),
(10,'Márcio Costa', 'Gerente de Projetos', '1988-01-15', 'M', 77.3, 1.82, 'Inglesa'),
(10,'Ana Paula Fernandes', 'Psicóloga', '1983-03-28', 'F', 63.2, 1.67, 'Canadense'),
(11,'Gustavo Oliveira', 'Engenheiro Civil', '1975-10-05', 'M', 81.4, 1.86, 'Alemã'),
(11,'Renata Santos', 'Médica', '1992-07-19', 'F', 58.4, 1.71, 'Mexicana'),
(11,'Fernando Almeida', 'Advogado', '1979-09-11', 'M', 84.6, 1.84, 'Portuguesa'),
(12,'Paula Lima', 'Engenheira de Alimentos', '1987-06-05', 'F', 62.1, 1.68, 'Chinesa'),
(12,'Rafaela Costa', 'Dentista', '1984-12-30', 'F', 60.8, 1.65, 'Japonesa'),
(12,'Alexandre Fernandes', 'Empresário', '1981-04-17', 'M', 79.8, 1.81, 'Alemã'),
(13,'Aline Almeida', 'Enfermeira', '1976-08-23', 'F', 59.7, 1.66, 'Sul-Africana'),
(13,'Lucas Rodrigues', 'Engenheiro Eletricista', '1990-02-28', 'M', 73.9, 1.77, 'Mexicana'),
(13,'Fernanda Santos', 'Professora', '1988-05-14', 'F', 61.2, 1.69, 'Chinesa'),
(14,'Marcelo Oliveira', 'Arquiteto', '1979-10-22', 'M', 78.1, 1.83, 'Portuguesa'),
(14,'Carla Martins', 'Médica Veterinária', '1985-03-09', 'F', 57.9, 1.62, 'Mexicana'),
(14,'Paulo Silva', 'Advogado', '1994-08-03', 'M', 76.3, 1.79, 'Alemã'),
(15,'Andréia Lima', 'Engenheira Civil', '1982-11-27', 'F', 64.6, 1.70, 'Chinesa'),
(15,'Leonardo Fernandes', 'Médico', '1977-01-08', 'M', 85.2, 1.85, 'Mexicana'),
(15,'Arthur Souza', 'Engenheiro de Software', '1988-11-21', 'M', 78.5, 1.80, 'Brasileira'),
(16,'Bianca Ferreira', 'Dentista', '1990-01-15', 'F', 58.7, 1.65, 'Portuguesa'),
(16,'César Silva', 'Professor', '1975-03-11', 'M', 82.4, 1.78, 'Brasileira'),
(16,'Diana Almeida', 'Arquiteta', '1985-06-20', 'F', 61.9, 1.69, 'Espanhola'),
(17,'Eduardo Costa', 'Médico', '1979-12-30', 'M', 85.7, 1.82, 'Italiana'),
(17,'Fernanda Pereira', 'Professora', '1982-05-15', 'F', 62.3, 1.68, 'Portuguesa'),
(17,'Gustavo Rocha', 'Designer', '1991-02-05', 'M', 73.4, 1.75, 'Brasileira'),
(18,'Helena Martins', 'Veterinária', '1983-08-12', 'F', 59.6, 1.67, 'Brasileira'),
(18,'Igor Fernandes', 'Advogado', '1980-11-25', 'M', 80.3, 1.77, 'Brasileira'),
(18,'Juliana Correia', 'Engenheira', '1987-04-18', 'F', 60.2, 1.70, 'Portuguesa'),
(19,'Kleber Santos', 'Empresário', '1978-09-10', 'M', 87.1, 1.83, 'Brasileira'),
(19,'Lara Silva', 'Psicóloga', '1986-03-30', 'F', 58.4, 1.64, 'Brasileira'),
(19,'Marcos Oliveira', 'Engenheiro Civil', '1977-06-15', 'M', 83.9, 1.82, 'Brasileira'),
(20,'Natália Moreira', 'Enfermeira', '1990-10-22', 'F', 56.8, 1.65, 'Brasileira'),
(20,'Oscar Lima', 'Arquiteto', '1985-02-28', 'M', 77.5, 1.78, 'Portuguesa'),
(20,'Paula Sousa', 'Farmacêutica', '1989-12-12', 'F', 63.1, 1.68, 'Portuguesa'),
(NULL,'Rodrigo Almeida', 'Bombeiro', '1982-07-23', 'M', 90.8, 1.85, 'Brasileira'),
(NULL,'Sara Fernandes', 'Nutricionista', '1983-01-19', 'F', 57.3, 1.63, 'Brasileira'),
(NULL,'Thiago Castro', 'Analista de Sistemas', '1992-09-17', 'M', 74.6, 1.79, 'Brasileira'),
(NULL,'Vanessa Lima', 'Médica Veterinária', '1990-11-04', 'F', 55.3, 1.63, 'Brasileira'),
(NULL,'Wallace Rodrigues', 'Professor', '1978-12-29', 'M', 82.7, 1.83, 'Brasileira'),
(NULL,'Ximena Oliveira', 'Fisioterapeuta', '1987-08-15', 'F', 61.2, 1.68, 'Brasileira'),
(NULL,'Yara Rocha', 'Médica', '1984-05-09', 'F', 62.4, 1.66, 'Brasileira'),
(NULL,'Zeca Ferreira', 'Engenheiro Eletricista', '1980-04-11', 'M', 88.2, 1.85, 'Brasileira'),
(NULL,'Ana Souza', 'Professor', '1987-03-15', 'F', 60.0, 1.65, 'Brasileira'),
(NULL,'José Silva', 'Engenheiro Eletricista', '1980-06-25', 'M', 75.5, 1.78, 'Brasileira'),
(10,'Mariana Santos', 'Estudante', '1995-10-10', 'F', 55.0, 1.60, 'Brasileira'),
(10,'Felipe Costa', 'Advogado', '1983-09-05', 'M', 80.0, 1.75, 'Brasileira'),
(10,'Carolina Oliveira', 'Médica', '1978-11-20', 'F', 63.0, 1.68, 'Brasileira'),
(10,'Rafaela Fernandes', 'Engenheira de Software', '1990-04-12', 'F', 58.0, 1.67, 'Brasileira'),
(11,'Pedro Oliveira', 'Contador', '1985-07-22', 'M', 72.0, 1.75, 'Brasileira'),
(11,'Patrícia Silva', 'Arquiteta', '1988-12-05', 'F', 61.0, 1.70, 'Brasileira'),
(11,'Lucas Almeida', 'Analista de Sistemas', '1993-03-28', 'M', 75.0, 1.80, 'Brasileira'),
(12,'Bianca Costa', 'Psicóloga', '1982-09-17', 'F', 62.0, 1.65, 'Brasileira'),
(12,'Gustavo Santos', 'Médico', '1979-11-30', 'M', 80.0, 1.75, 'Brasileira'),
(12,'Juliana Oliveira', 'Professor', '1987-06-10', 'F', 60.0, 1.68, 'Brasileira'),
(13,'Felipe Rodrigues', 'Engenheiro Civil', '1984-01-15', 'M', 78.0, 1.78, 'Brasileira'),
(13,'Mariana Almeida', 'Advogada', '1989-05-20', 'F', 63.0, 1.70, 'Brasileira'),
(13,'Ricardo Santos', 'Analista Financeiro', '1983-08-25', 'M', 76.0, 1.76, 'Brasileira'),
(14,'Camila Rodrigues', 'Enfermeira', '1992-02-14', 'F', 59.0, 1.63, 'Brasileira'),
(14,'Daniel Costa', 'Engenheiro Eletricista', '1980-10-19', 'M', 82.0, 1.80, 'Brasileira'),
(14,'Aline Oliveira', 'Nutricionista', '1986-12-30', 'F', 65.0, 1.70, 'Brasileira'),
(15,'Thiago Silva', 'Designer Gráfico', '1991-07-05', 'M', 70.0, 1.75, 'Brasileira'),
(15,'Isabela Almeida', 'Analista de Marketing', '1988-04-28', 'F', 60.0, 1.68, 'Brasileira'),
(15,'Fernando Costa', 'Engenheiro de Produção', '1977-09-14', 'M', 85.0, 1.82, 'Brasileira'),
(16,'Amanda Santos', 'Administradora', '1984-03-10', 'F', 62.0, 1.65, 'Brasileira'),
(16,'Gabriel Oliveira', 'Engenheiro Químico', '1993-01-22', 'M', 78.0, 1.80, 'Brasileira'),
(16,'Larissa Almeida', 'Terapeuta Ocupacional', '1982-06-18', 'F', 58.0, 1.63, 'Brasileira'),
(17,'Rodrigo Fernandes', 'Economista', '1987-11-08', 'M', 75.0, 1.75, 'Brasileira'),
(17,'Carolina Costa', 'Biologa', '1980-08-07', 'F', 63.0, 1.70, 'Brasileira'),
(17,'Rafael Santos', 'Geólogo', '1990-05-30', 'M', 80.0, 1.75, 'Brasileira'),
(18,'Mariana Costa', 'Fotógrafa', '1985-12-25', 'F', 62.0, 1.68, 'Brasileira'),
(18,'Leonardo Oliveira', 'Engenheiro Agrônomo', '1978-04-16', 'M', 85.0, 1.82, 'Brasileira'),
(18,'Beatriz Fernandes', 'Psiquiatra', '1991-08-11', 'F', 60.0, 1.65, 'Brasileira'),
(19,'Renato Almeida', 'Geógrafo', '1986-02-03', 'M', 78.0, 1.78, 'Brasileira'),
(19,'Priscila Santos', 'Arqueóloga', '1983-07-20', 'F', 63.0, 1.70, 'Brasileira'),
(19,'Gustavo Costa', 'Engenheiro Florestal', '1989-09-09', 'M', 80.0, 1.75, 'Brasileira'),
(20,'Carla Oliveira', 'Bióloga Marinha', '1992-11-04', 'F', 62.0, 1.68, 'Brasileira'),
(20,'Felipe Almeida', 'Oceanógrafo', '1981-04-13', 'M', 78.0, 1.78, 'Brasileira'),
(20,'Vanessa Fernandes', 'Veterinária', '1986-10-02', 'F', 61.0, 1.65, 'Brasileira'),
(NULL,'Bruno Santos', 'Engenheiro Ambiental', '1990-03-14', 'M', 75.0, 1.80, 'Brasileira'),
(NULL,'Amanda Oliveira', 'Química', '1984-06-08', 'F', 63.0, 1.70, 'Brasileira'),
(NULL,'Guilherme Costa', 'Físico', '1987-01-31', 'M', 80.0, 1.75, 'Brasileira'),
(NULL,'Nathalia Almeida', 'Meteorologista', '1993-05-24', 'F', 62.0, 1.68, 'Brasileira'),
(NULL,'Lucas Fernandes', 'Cientista de Dados', '1979-02-17', 'M', 85.0, 1.82, 'Brasileira'),
(NULL,'Fernanda Oliveira', 'Bioquímica', '1985-07-11', 'F', 63.0, 1.70, 'Brasileira');

select * from tb_pessoas;
select * from tb_cursos;

-- 0-Selecione o nome dos alunos, o nome dos cursos o total de aulas ( onde o total deve ser maior que 20), mesmo os alunos sem cursos. Ordene pelo nome do aluno.

SELECT p.nome AS Nome_Aluno, c.nome AS Nome_Curso
FROM tb_pessoas AS p RIGHT JOIN tb_cursos AS c
ON p.fk_cursos = c.pk_cursos
WHERE c.totaulas > 20
ORDER BY p.nome;

-- 1-Selecione o nome do aluno e o nome do curso que ele estuda.
SELECT p.nome AS Nome_Aluno, c.nome AS Nome_Curso
FROM tb_pessoas AS p RIGHT JOIN tb_cursos AS c
ON p.fk_cursos = c.pk_cursos
ORDER BY p.nome;

-- 2-Liste o nome do curso e a descrição do curso juntamente com o sexo dos alunos.
SELECT c.nome AS Nome_Curso, c.descricao AS Descricao_Curso, p.sexo AS Sexo_Aluno
FROM tb_cursos AS c RIGHT JOIN  tb_pessoas AS p
ON c.pk_cursos = p.fk_cursos
ORDER BY c.nome;

-- 3-Exiba todos os cursos e seus respectivos alunos, mesmo que alguns cursos não tenham alunos atribuídos.
SELECT c.nome AS Nome_Curso, p.nome AS Nome_Aluno
FROM tb_cursos AS c LEFT JOIN tb_pessoas AS p
ON c.pk_cursos = p.fk_cursos
ORDER BY c.nome;

-- 4-Liste todos os cursos, suas descrições e o nome dos alunos, incluindo cursos sem alunos, que ocorreram em 2018.
SELECT c.nome AS Nome_Curso, c.descricao AS Descricao_Curso, p.nome AS Nome_Aluno
FROM tb_cursos AS c LEFT JOIN tb_pessoas AS p
ON c.pk_cursos = p.fk_cursos
WHERE c.ano = 2018
ORDER BY c.nome;

-- 5-Selecione o nome do curso e o nome do aluno do sexo masculino, garantindo que todos os alunos estejam incluídos, mesmo que não tenham um curso atribuído.
SELECT c.nome AS Nome_Curso, p.nome AS Nome_Aluno
FROM tb_cursos AS c LEFT JOIN tb_pessoas AS p
ON c.pk_cursos = p.fk_cursos
WHERE p.sexo = 'M'
ORDER BY c.nome;

-- 6-Liste o nome do curso, o nome do aluno e a nacionalidade do aluno, apenas alunos que estajam fazendo um cursos e cursos que tenham alunos.
SELECT c.nome AS Nome_Curso, p.nome AS Nome_Aluno, p.nacionalidade AS Nacionalidade_Aluno
FROM tb_cursos AS c LEFT JOIN tb_pessoas AS p
ON c.pk_cursos = p.fk_cursos
ORDER BY c.nome;

-- 7-Exiba todos os cursos e seus respectivos alunos, e que sejam professores ou professoras, incluindo os que não estão cursando nada.
SELECT c.nome AS Nome_Curso, p.nome AS Nome_Aluno
FROM tb_cursos AS c RIGHT JOIN tb_pessoas AS p
ON c.pk_cursos = p.fk_cursos
WHERE p.profissao = 'Professor' or p.profissao = 'Professora'
ORDER BY C.nome;

-- 8-Liste todos os cursoscom carga horaria acima de 30 e o nome dos alunos, incluindo cursos sem alunos.
SELECT c.carga AS Carga_Curso, c.nome AS Nome_Curso, p.nome AS Nome_Aluno
FROM tb_pessoas AS p RIGHT JOIN tb_cursos AS c
ON p.fk_cursos = c.pk_cursos
WHERE c.carga > 30
ORDER BY c.nome;