Create database loja;

Create table tb_cliente (
id_cliente int not null auto_increment,
cpf int not null,
no_cliente VARCHAR(30) NOT NULL,
tx_email VARCHAR(30) NOT NULL,
tx_tel VARCHAR(15) NOT NULL,
status bit null,
primary key(id_cliente));

Create table tb_venda (
id_venda int not null auto_increment,
fk_cliente int NOT NULL,
FOREIGN KEY (fk_cliente) REFERENCES tb_cliente(id_cliente),
dt_venda datetime NOT NULL,
valor_total DECIMAL(10,2) NOT NULL,
primary key(id_venda));

Create table tb_tipo_produto (
id_tipo_produto int not null auto_increment,
no_tipo VARCHAR(20) NOT NULL,
primary key(id_tipo_produto));

Create table tb_fornecedor (
id_fornecedor int not null auto_increment,
no_fornecedor VARCHAR(30) NOT NULL,
cnpj varchar(14) NOT NULL,
primary key(id_fornecedor));

Create table tb_produto (
id_produto int not null auto_increment,
no_produto VARCHAR(30) NOT NULL,
valor DECIMAL(10,2) NOT NULL,
fk_tipo_produto int NOT NULL,
FOREIGN KEY (fk_tipo_produto) REFERENCES tb_tipo_produto(id_tipo_produto),
fk_fornecedor int NOT NULL,
FOREIGN KEY (fk_fornecedor) REFERENCES tb_fornecedor(id_fornecedor),
primary key(id_produto));

Create table tb_item_venda (
id_item_venda int not null auto_increment,
fk_venda int NOT NULL,
FOREIGN KEY (fk_venda) REFERENCES tb_venda(id_venda),
fk_produto int NOT NULL,
FOREIGN KEY (fk_produto) REFERENCES tb_produto(id_produto),
valor_itens DECIMAL(10,2) NOT NULL,
primary key(id_item_venda));


select * from tb_cliente;
select * from tb_produto;
select * from tb_fornecedor;
select * from tb_tipo_produto;
select * from tb_item_venda;
select * from tb_venda;

