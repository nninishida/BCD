create database if not exists lojadb;
use lojadb;

create table if not exists vendas(
	id_nf INT,
    id_item INT,
    cod_prod INT,
    valor_unit DECIMAL(5,2),
    quantidade INT,
    desconto int
);

insert into Vendas(id_nf, id_item, cod_prod, valor_unit, quantidade, desconto)
values
(1, 1, 1, 25.00, 10, 5),
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
(7, 3, 3, 15.00, 10, 4),
(7, 4, 5, 30.00, 10, 1);

select * from vendas;

SELECT id_nf, id_item, cod_prod, valor_unit
FROM Vendas
WHERE desconto is NULL;

SELECT id_nf, id_item, cod_prod, valor_unit, valor_unit - (valor_unit * (desconto / 100)) AS valor_vendido
FROM Vendas
WHERE desconto IS NOT NULL;

UPDATE Vendas
SET desconto = 0
WHERE desconto IS NULL;

SELECT id_nf, id_item, cod_prod, valor_unit, quantidade * valor_unit AS valor_total, desconto, valor_unit - (valor_unit * (desconto / 100)) AS valor_vendido
FROM Vendas;

SELECT id_nf, SUM(quantidade * valor_unit) AS valor_total
FROM Vendas
GROUP BY id_nf
ORDER BY valor_total DESC;

SELECT id_nf, SUM((quantidade * valor_unit) - ((quantidade * valor_unit) * (desconto / 100))) AS valor_vendido
FROM Vendas
GROUP BY id_nf
ORDER BY valor_vendido DESC;

SELECT cod_prod, SUM(quantidade) AS quantidade_total
FROM Vendas
GROUP BY cod_prod
ORDER BY quantidade_total DESC
LIMIT 1;

SELECT id_nf, cod_prod, SUM(quantidade) AS quantidade
FROM Vendas
GROUP BY id_nf, cod_prod
HAVING SUM(quantidade) > 10;

SELECT id_nf, SUM(quantidade * valor_unit) AS valor_tot
FROM Vendas
GROUP BY id_nf
HAVING valor_tot > 500
ORDER BY valor_tot DESC;

SELECT cod_prod, AVG(desconto) AS media
FROM Vendas
GROUP BY cod_prod;

SELECT cod_prod, MIN(desconto) AS menor, MAX(desconto) AS maior, AVG(desconto) AS media
FROM Vendas
GROUP BY cod_prod;

SELECT id_nf, COUNT(id_item) AS qtd_itens
FROM Vendas
GROUP BY id_nf
HAVING COUNT(id_item) > 3;








