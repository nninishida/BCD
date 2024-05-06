create database LojaDB;

use lojadb;

CREATE TABLE vendas (
id_nf INT,
id_item INT,
cod_prod varchar(50),
valor_unit decimal(10,2),
quantidade INT,
desconto decimal(10,2) 
);

INSERT INTO vendas (id_nf, id_item, cod_prod, valor_unit, quantidade, desconto)
VALUES
	(1, 1 ,1, 25.00, 10, 5),
    (1, 2, 2, 13.50, 3, NULL),
    (1, 3, 3, 15.00, 2, NULL),
    (1, 4, 4, 10.00, 1, NULL),
    (1, 5, 5, 30.00, 1, NULL),
    (2, 1, 3, 15.00, 4, NULL),
    (2, 2, 4, 10.00, 5, NULL),
    (2, 3, 5, 30.00, 7, NULL),
    (3, 1, 1, 25.00, 5, NULL),
    (3, 2, 4, 10.00, 4, NULL),
    (3, 3, 5, 30.00, 5, NULL),
    (3, 4, 2, 13.50, 7, NULL),
    (4, 1, 5, 30.00, 10, 15),
    (4, 2, 4, 10.00, 12, 5),
    (4, 3, 1, 25.00, 13, 5),
    (4, 4, 2, 13.50, 15, 5),
    (5, 1, 3, 15.00, 3, NULL),
    (5, 2, 5, 30.00, 6, NULL),
    (6, 1, 1, 25.00, 22, 15),
    (6, 2, 3, 15.00, 25, 20),
    (7, 1, 1, 25.00, 10, 3),
    (7, 2, 2, 13.50, 10, 4),
	(7, 3, 3, 15.00,10, 4),
    (7, 4, 5,  30.00, 10, 1);
    
Select id_nf, id_item, cod_prod, valor_unit, quantidade, desconto
from vendas
where desconto is null;

Select id_nf, id_item, cod_prod, valor_unit, quantidade, desconto
from vendas 
where desconto <> 0;

update vendas
set desconto = 0 
where desconto is null;

select id_nf, id_item, cod_prod, valor_unit, quantidade, desconto,
quantidade * valor_unit AS valor_total,
valor_unit - (valor_unit * (desconto / 100)) AS valor_vendido
from vendas;

select id_nf, 
	SUM(quantidade * valor_unit) AS valor_total 
from vendas 
group by id_nf
order by valor_total desc;

select id_nf,
	SUM(valor_unit * quantidade - (valor_unit * quantidade * (desconto / 100))) AS valor_total
    from vendas
    group by id_nf
    order by valor_total desc;

select cod_prod,
SUM(quantidade * valor_unit) AS valor_total
from vendas
group by cod_prod
order by valor_total desc
limit 1;

select id_nf, cod_prod,
sum(quantidade) AS quantidade_total 
from vendas 
group by id_nf, cod_prod
having quantidade_total > 10;

select id_nf, 
sum(quantidade * valor_unit) AS valor_total
from vendas 
group by id_nf
having valor_total > 500
order by valor_total desc;

select cod_prod, 
avg(desconto) AS media_desconto
from vendas
group by cod_prod;

select cod_prod, 
min(desconto) as menor_desconto,
max(desconto) as maior_desconto,
avg(desconto) as media_desconto
from vendas 
group by cod_prod;

select id_nf,
	COUNT(distinct id_item) AS qtd_itens
    from vendas 
    group by id_nf
    having qtd_itens > 3;