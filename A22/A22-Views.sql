DROP DATABASE IF EXISTS db_Distribuidora;

CREATE DATABASE IF NOT EXISTS db_Distribuidora;

USE db_Distribuidora;

-- Tabela Fornecedor
CREATE TABLE tb_Fornecedor (
pk_Fornecedor VARCHAR(5) PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cidade VARCHAR(40)
);
-- Tabela Peca
CREATE TABLE tb_Peca (
pk_Peca VARCHAR(5) PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
peso double,
cor VARCHAR(15)
);
-- Tabela PedidoFor
CREATE TABLE tb_Pedido (
fk_Peca VARCHAR(5),
fk_Fornecedor VARCHAR(5),
qtde int,
data_pedido DATE,
FOREIGN KEY (fk_Fornecedor) REFERENCES tb_Fornecedor(pk_Fornecedor),
FOREIGN KEY (fk_Peca) REFERENCES tb_Peca(pk_Peca)
);
-- Inserções de exemplo com nomes fictícios de fornecedores e peças reais
INSERT INTO tb_Fornecedor (pk_Fornecedor, nome, cidade) VALUES 
('F001', 'Distribuidora de Peças Silva', 'São Paulo'),
('F002', 'Indústria de Componentes Oliveira', 'Rio de Janeiro'),
('F003', 'Comércio de Peças Rodrigues', 'Belo Horizonte'),
('F004', 'Importadora de Peças Martins', 'Porto Alegre'),
('F005', 'Atacadão de Peças Sousa', 'Salvador');

INSERT INTO tb_Peca (pk_Peca, nome, peso, cor) VALUES
('P001', 'Parafuso Aço Inox', 0.5, 'Prateado'),
('P002', 'Porca Rosqueada', 0.3, 'Metálica'),
('P003', 'Engrenagem Nylon', 1.2, 'Branco'),
('P004', 'Mola de Compressão', 0.8, 'Preto'),
('P005', 'Placa Circuito Impresso', 0.1, 'Verde');

-- Inserções de exemplo na tabela PedidoFor
INSERT INTO tb_Pedido (fk_Peca, fk_Fornecedor, qtde, data_pedido) VALUES
('P001', 'F001', 100, '2024-05-15'),
('P002', 'F003', 50, '2024-05-16'),
('P003', 'F002', 75, '2024-05-17'),
('P004', 'F004', 120, '2024-05-19');

-- 1. View de Detalhes do Pedido por Fornecedor:
-- Crie uma view que forneça detalhes dos pedidos agrupados por fornecedor, mostrando o nome do fornecedor, a cidade, o nome da peça, a quantidade pedida e a cor da peça.
create view vw_DetalhesPedidoFornecedor as 
select f.nome as nome_fornecedor,
f.cidade,
p.nome as nome_peca,
pf.qtde,
p.cor
from tb_Pedido pf
join tb_Fornecedor f on pf.fk_Fornecedor = f.pk_Fornecedor 
join tb_Peca p on pf.fk_Peca = p.pk_Peca;
-- 2. View de Peso Médio das Peças por Cor:
-- Crie uma view que calcule o peso médio das peças para cada cor, exibindo a cor da peça e o peso médio correspondente.
create view vw_PesoMedioPorCor as
select cor,
AVG(peso) as peso_medio
from tb_peca
group by cor;
-- 3. View de Quantidade Total de Pedidos por Peça:
-- Elabore uma view que apresente a quantidade total de pedidos para cada peça, exibindo o código da peça, o nome da peça e a quantidade total pedida. 
create view vw_QuantidadeTotalPorPeca as 
select p.pk_Peca,
p.nome as nome_peca,
SUM(pf.qtde) as quantidade_total
from tb_Pedido pf 
join tb_Peca p on pf.fk_Peca = p.pk_Peca
Group by p.pk_Peca, p.nome;
-- 4. View de Fornecedores sem Pedidos:
-- Crie uma view que liste os fornecedores que não têm nenhum pedido associado, mostrando o código do fornecedor, o nome e a cidade.
create view vw_FornecedoresSemPedidos as
select f.pk_Fornecedor,
f.nome as nome_fornecedor,
f.cidade
from tb_Fornecedor f 
left join tb_Pedido pf on f.pk_fornecedor = pf.fk_Fornecedor
where pf.fk_Fornecedor is null;
-- 5. View de Pedidos com Quantidade Superior a 100:
-- Elabore uma view que exiba os pedidos em que a quantidade solicitada é superior a 100, apresentando o código da peça, o nome da peça, a quantidade e o código do fornecedor.
create view w_PedidosQuantidadeSuperiorA100 as
select pf.fk_Peca,
p.nome as nom_peca,
pf.qtde,
pf.fk_Fornecedor 
from tb_Pedido pf
join tb_Peca p on pf.fk_Peca = p.pk_Peca 
where pf.qtde > 100;
-- 6. View de Peso Total dos Pedidos por Fornecedor:
-- Crie uma view que calcule o peso total dos pedidos para cada fornecedor, exibindo o código do fornecedor, o nome do fornecedor, a cidade e o peso total dos pedidos.
create view vw_PesoTotalPorFornecedor as
select f.pk_Fornecedor,
f.nome as nome_fornecedor,
f.cidade,
SUM(pf.qtde * p.peso) as peso_total
from tb_Pedido pf 
join tb_Fornecedor f on pf.fk_Fornecedor = f.pk_Fornecedor 
join tb_Peca p on pf.fk_Peca = p.pk_Peca
group by f.pk_Fornecedor, f.nome, f.cidade;
-- 7. View de Peças com Peso Superior a 1 Kg:
-- Elabore uma view que liste as peças com peso superior a 1 quilograma, mostrando o código da peça, o nome da peça, o peso e a cor.
create view w_PecasPesoSuperiorA1Kg as 
select pk_Peca,
nome as nome_peca,
peso,
cor
from tb_Peca 
where peso > 1;
-- 8. View de Peças Enviadas por Fornecedor:
-- Crie uma view que mostre as peças enviadas por cada fornecedor, exibindo o nome do fornecedor, o nome da peça, a quantidade pedida e a cor da peça.
create view vw_PecasEnviadasPorFornecedor as 
select
tb_Fornecedor.nome as nome_fornecedor,
tb_Peca.nome as nome_peca,
tb_Pedido.qtde,
tb_Peca.cor
from tb_Pedido 
join tb_Fornecedor on tb_Pedido.fk_Fornecedor = tb_Fornecedor.pk_Fornecedor
join tb_Peca on tb_Pedido.fk_Peca = tb_Peca.pk_Peca;
-- 9. View de Média de Quantidade de Pedidos por Fornecedor:
-- Elabore uma view que calcule a média da quantidade de pedidos por fornecedor, mostrando o nome do fornecedor e a média da quantidade de pedidos.
create view w_MediaQuantidadePorFornecedor as 
select f.nome as nome_fornecedor,
AVG(pf.qtde) as media_quantidade
from tb_Pedido pf
join tb_Fornecedor f on pf.fk_Fornecedor = f.pk_Fornecedor
group by f.nome;
-- 10. View de Peças Mais Leves por Cor:
-- Crie uma view que liste as peças mais leves para cada cor, exibindo o código da peça, o nome da peça, o peso e a cor correspondente.
create view vw_PecasMaisLevesPorCor as
select pk_Peca,
nome as nome_peca,
peso,
cor
from tb_Peca p 
where peso = (select MIN(peso) from tb_Peca where cor = p.cor);