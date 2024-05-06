DROP DATABASE IF EXISTS cadastro_db;

CREATE DATABASE cadastro_db;

USE cadastro_db;

CREATE TABLE IF NOT EXISTS cursos (
id_cursos int NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL UNIQUE,
descricao text,
carga int UNSIGNED,
totaulas int UNSIGNED,
ano year DEFAULT '2024',
PRIMARY KEY (id_cursos)
)DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS pessoas (
id_pessoas int NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL,
profissao varchar(30),
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchar(20) DEFAULT 'Brasileira',
PRIMARY KEY (id_pessoas)
)DEFAULT CHARSET=utf8MB4;

INSERT INTO cursos VALUES
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

INSERT INTO pessoas (nome, profissao, nascimento, sexo, peso, altura, nacionalidade) VALUES
('João Silva', 'Engenheiro', '1980-05-15', 'M', 75.5, 1.75, 'Brasileira'),
('Maria Oliveira', 'Médica', '1975-09-20', 'F', 62.3, 1.68, 'Portuguesa'),
('Carlos Santos', 'Advogado', '1990-02-10', 'M', 80.2, 1.80, 'Espanhola'),
('Ana Costa', 'Professora', '1988-11-30', 'F', 55.8, 1.62, 'Italiana'),
('Pedro Souza', 'Arquiteto', '1985-07-25', 'M', 70.1, 1.78, 'Alemã'),
('Camila Pereira', 'Engenheira Civil', '1995-04-12', 'F', 58.6, 1.70, 'Francesa'),
('Fernando Lima', 'Empresário', '1978-03-05', 'M', 85.0, 1.82, 'Inglesa'),
('Juliana Almeida', 'Psicóloga', '1982-08-18', 'F', 60.9, 1.65, 'Mexicana'),
('Ricardo Fernandes', 'Programador', '1992-01-22', 'M', 68.7, 1.75, 'Canadense'),
('Aline Rodrigues', 'Nutricionista', '1987-06-28', 'F', 57.2, 1.63, 'Americana'),
('Gabriel Oliveira', 'Estudante', '2000-12-10', 'M', 65.4, 1.79, 'Argentina'),
('Mariana Costa', 'Enfermeira', '1984-09-03', 'F', 59.1, 1.67, 'Chinesa'),
('Luiz Pereira', 'Bombeiro', '1973-11-17', 'M', 90.5, 1.85, 'Russa'),
('Tatiane Santos', 'Advogada', '1989-07-14', 'F', 63.8, 1.71, 'Japonesa'),
('Gustavo Martins', 'Engenheiro Eletricista', '1981-04-20', 'M', 73.2, 1.76, 'Sul-Africana'),
('Carolina Lima', 'Psicóloga', '1986-10-08', 'F', 61.5, 1.69, 'Coreana'),
('Diego Silva', 'Médico', '1976-02-28', 'M', 78.4, 1.81, 'Mexicana'),
('Isabela Gonçalves', 'Estudante', '1993-05-07', 'F', 56.7, 1.64, 'Canadense'),
('Roberto Oliveira', 'Engenheiro de Software', '1983-08-12', 'M', 76.8, 1.77, 'Espanhola'),
('Patrícia Rodrigues', 'Advogada', '1980-01-19', 'F', 64.3, 1.70, 'Portuguesa'),
('Renato Almeida', 'Professor', '1977-06-23', 'M', 82.1, 1.83, 'Francesa'),
('Vanessa Costa', 'Veterinária', '1985-09-30', 'F', 60.2, 1.66, 'Chinesa'),
('Marcelo Santos', 'Analista de Sistemas', '1990-03-14', 'M', 72.6, 1.78, 'Japonesa'),
('Cristina Fernandes', 'Pedagoga', '1988-07-02', 'F', 58.9, 1.63, 'Sul-Africana'),
('André Oliveira', 'Engenheiro Civil', '1979-12-08', 'M', 79.3, 1.79, 'Russa'),
('Laura Almeida', 'Fisioterapeuta', '1983-05-25', 'F', 62.7, 1.70, 'Americana'),
('Felipe Rodrigues', 'Contador', '1985-08-01', 'M', 75.9, 1.75, 'Argentina'),
('Daniela Silva', 'Arquiteta', '1991-04-16', 'F', 57.4, 1.68, 'Coreana'),
('Vinícius Lima', 'Engenheiro Mecânico', '1974-10-11', 'M', 88.0, 1.84, 'Mexicana'),
('Amanda Costa', 'Bióloga', '1980-06-29', 'F', 59.8, 1.65, 'Chinesa'),
('Bruno Santos', 'Designer Gráfico', '1996-02-03', 'M', 71.2, 1.77, 'Russa'),
('Tatiana Martins', 'Farmacêutica', '1982-09-18', 'F', 63.5, 1.68, 'Portuguesa'),
('Rodrigo Fernandes', 'Engenheiro de Produção', '1976-12-22', 'M', 83.7, 1.81, 'Francesa'),
('Juliana Silva', 'Advogada', '1987-05-26', 'F', 60.6, 1.64, 'Mexicana'),
('Lucas Oliveira', 'Analista de Negócios', '1984-08-09', 'M', 74.5, 1.80, 'Coreana'),
('Natália Almeida', 'Médica Veterinária', '1990-11-04', 'F', 55.3, 1.63, 'Sul-Africana'),
('Rafael Santos', 'Engenheiro Químico', '1978-07-30', 'M', 87.2, 1.85, 'Japonesa'),
('Isabela Lima', 'Administradora', '1986-04-13', 'F', 61.9, 1.69, 'Argentina'),
('Márcio Costa', 'Gerente de Projetos', '1988-01-15', 'M', 77.3, 1.82, 'Inglesa'),
('Ana Paula Fernandes', 'Psicóloga', '1983-03-28', 'F', 63.2, 1.67, 'Canadense'),
('Gustavo Oliveira', 'Engenheiro Civil', '1975-10-05', 'M', 81.4, 1.86, 'Alemã'),
('Renata Santos', 'Médica', '1992-07-19', 'F', 58.4, 1.71, 'Mexicana'),
('Fernando Almeida', 'Advogado', '1979-09-11', 'M', 84.6, 1.84, 'Portuguesa'),
('Paula Lima', 'Engenheira de Alimentos', '1987-06-05', 'F', 62.1, 1.68, 'Chinesa'),
('Rafaela Costa', 'Dentista', '1984-12-30', 'F', 60.8, 1.65, 'Japonesa'),
('Alexandre Fernandes', 'Empresário', '1981-04-17', 'M', 79.8, 1.81, 'Alemã'),
('Aline Almeida', 'Enfermeira', '1976-08-23', 'F', 59.7, 1.66, 'Sul-Africana'),
('Lucas Rodrigues', 'Engenheiro Eletricista', '1990-02-28', 'M', 73.9, 1.77, 'Mexicana'),
('Fernanda Santos', 'Professora', '1988-05-14', 'F', 61.2, 1.69, 'Chinesa'),
('Marcelo Oliveira', 'Arquiteto', '1979-10-22', 'M', 78.1, 1.83, 'Portuguesa'),
('Carla Martins', 'Médica Veterinária', '1985-03-09', 'F', 57.9, 1.62, 'Mexicana'),
('Paulo Silva', 'Advogado', '1994-08-03', 'M', 76.3, 1.79, 'Alemã'),
('Andréia Lima', 'Engenheira Civil', '1982-11-27', 'F', 64.6, 1.70, 'Chinesa'),
('Leonardo Fernandes', 'Médico', '1977-01-08', 'M', 85.2, 1.85, 'Mexicana');

select nome, carga, ano from cursos
order by ano, nome;

select nome, carga, ano from cursos
where ano = '2016'
order by ano, nome;

select nome, carga, ano from cursos
where ano < '2016'
order by ano, nome;

select nome, carga, ano from cursos
where ano > '2016'
order by ano, nome;

select nome, carga, ano from cursos
where ano <> '2016'
order by ano, nome;

select * from cursos
where carga > 35 and totaulas < 30
order by ano;

select * from cursos
where carga > 35 or totaulas < 30
order by ano;

select * from cursos
where ano is null
order by ano;

select nome, descricao, ano from cursos
where ano between '2014' and '2016'
order by ano desc, nome asc;

select nome, descricao, ano from cursos
where ano IN (2014, 2016, 2018)
order by ano;

select * from cursos
where nome like 'A%';

select * from cursos
where nome like '%A';

select * from cursos
where nome like '%A%';

select * from cursos
where nome not like '%A%';

select * from cursos
where nome like 'Ph%P%';

select * from cursos
where nome like 'P___';

select DISTINCT carga from cursos
order by carga;

select COUNT(*) FROM cursos;

select count(*) from cursos
where CARGA > 40;

select max(carga) from cursos
where ano = '2010';

select * from cursos
order by ano;

select SUM(carga) from cursos
where ano = '2010';

select AVG(carga) from cursos;

select carga, count(nome) from cursos
group by carga
order by carga;

select ano, count(*) from cursos
where carga > 30
group by ano
order by count(*);

select ano, count(*) from cursos
where totaulas >30
group by ano
having ano >=2013
order by count(*) desc;

select avg(carga) from cursos
where ano > 2015;

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos)
order By carga;