create database if not exists LivrariaSESISENAI;
use LivrariaSESISENAI;
create table if not exists Clientes(
id_clientes int NOT NULL AUTO_INCREMENT,
nome varchar (45),
cpf varchar (11),
rg varchar (11),
primary key (id_clientes));

alter table Clientes
add column email varchar (45);

create table if not exists Clientes_telefones(
id_clientes_telefones int not null auto_increment,
telefone varchar(45),
primary key (id_clientes_telefones));

create table if not exists Clientes_endereco(
id_clientes_endereco int not null auto_increment,
rua varchar(45),
numero int,
cidade varchar (45),
primary key (id_clientes_endereco));

create table if not exists Pedido(
id_pedidos int not null auto_increment,
valor decimal (5,2),
data date,
primary key(id_pedidos));

create table if not exists Item_pedido(
id_item_pedido int not null auto_increment,
quantidade int,
valor decimal (5,2),
primary key (id_item_pedido));

create table if not exists Livro(
id_livro int not null auto_increment,
titulo varchar (45), 
categoria varchar (45),
isbn varchar (13),
ano date,
valor decimal (10,2),
autor varchar (45),
primary key (id_livro));

create table if not exists Estoque(
id_estoque int not null auto_increment,
quantidade int,
primary key(id_estoque));

create table if not exists Editora(
id_editora int not null auto_increment,
nome_editora varchar (45),
nome_contato varchar (45),
email varchar (45),
contato varchar (45),
primary key(id_editora));

