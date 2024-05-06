use livrariasesisenai;

insert into Clientes (nome, cpf,rg, email)
values
('Paola', '0123456789', '9876543210', 'paola.oliveira@hotmail.com'),
('Vinicius', '3325156786', '9876344289', 'vinicius.spola@gmail.com'),
('Rebeka', '77866543298', '6657834524', 'rebekalacerda@outlook.com');

insert into Clientes_telefones (telefone)
values
('+5515997336804'),
('+5515991964155'),
('+5515981230971');

insert into Clientes_endereco (rua, numero, cidade)
values
('Ernesto de Carvalho', '45', 'Itapeva'),
('João Schunk', '105', 'Cipó-Guaçu'),
('Itália Comito Lima', '356', 'Araraquara');

insert into Pedido (valor, data)
values
('675.90', '1204.12id_pedidos.12'),
('23.69', '2013.04.31'),
('50.56', '2016.12.24');

insert into Item_pedido (quantidade, valor)
values
('5', '670.95'),
('1', '60.69'),
('3', '201.90');

insert into Livro (titulo, categoria, isbn, ano, valor, autor) 
values 
('Pessoas Normais', 'romance', '8535932569', '2018.08.28', '46.90 ', 'Sally Rooney'), 
('O mar me levou a você', 'ficção de novo adulto', '8555342740', '2023.08.30', '59.90', 'Pedro Rhuas'), 
('Água Viva', 'romance psicológico', '6555320214', '1973.08.26', '39.90', 'Clarice Lispector');

insert into Estoque (quantidade) 
values 
('100'), 
('100'), 
('100');

insert into Editora (nome_editora, nome_contato,email, contato)
values
('Companhia das Letras', 'Luiza', 'Luisa.cdl@hotmail.com', '11987654321'),
('Seguinte', 'Clara', 'claraseditoraseguinte@gmail.com', '13912345678'),
('Rocco', 'Rebecca', 'rebecca.editorarocco@gmail.com', '3318474829295945');


