create table pessoas (
nome varchar(30),
idade int,
sexo char(1),
peso float,
nacionalidade varchar(20)
);

alter table pessoas
add column profissao varchar(10);

desc pessoa

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
add codigo int first;

alter table pessoas
add cpf int;

alter table pessoas
modify column cpf varchar(11) not null default '';

alter table pessoas
change column cpf varchar(11) not null default '';

alter table pessoas
rename to gentinha;

desc gentinha;

drop table if exists gentinha;

show tables;

create table if not exists pessoas (
id_pessoas int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key (id_pessoas)
);

create table if not exists cursos (
id_cursos int not null auto_increment,
nome varchar(30) not null,
descricao text,
carga int unsigned,
ano year default '2024',
primary key (id_cursos)
)default charset = utf8;
