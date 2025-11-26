-- Projeto Banco de Dados para Mercado:

create database mercado;

use mercado;

-- Tabela Mercado:
create table mercado(
id_mercado int not null primary key auto_increment,
nome varchar(80) not null,
endereco varchar(200) not null,
telefone varchar(20) null,
cnpj varchar(20) not null unique,
horario_funcionamento varchar(20) null
);

-- Tabela Cliente:
create table cliente(
id_cliente int not null primary key auto_increment,
nome varchar(100) not null,
telefone varchar(20) null,
cpf varchar(20) not null unique,
email varchar(100) not null unique,
endereco varchar(200) not null
);

-- Tabela fornecedor:
create table fornecedor(
id_fornecedor int not null primary key auto_increment,
nome_fornecedor varchar(100) not null,
cnpj varchar(20) not null unique,
telefone varchar(20) null,
email varchar(100) null unique,
endereco varchar(150) null
);

-- Tabela produto:
create table produto(
id_produto int not null primary key auto_increment,
id_fornecedor int not null,
id_mercado int not null,
valor_produto decimal(10,2) not null,
estoque int not null default 0,
data_cadastro datetime not null default current_timestamp,
foreign key (id_fornecedor) references fornecedor,
foreign key (id_mercado) references mercado
);


-- Tabela compra:
create table compra(
id_compra int not null primary key auto_increment,
id_cliente int not null,
data_compra datetime not null default current_timestamp,
valor_total decimal(10,2) not null,
foreign key (id_cliente) references cliente
);


-- Tabela pagamento:
create table pagamento(
id_pagamento int not null primary key auto_increment,
id_compra int not null,
forma_pagamento varchar(50) not null,
valor_pago decimal(10,2) not null,
data_pagamento datetime not null default current_timestamp
);

-- Inserindo registros na tabela mercado:
insert into mercado
(nome,endereco,telefone,cnpj,horario_funcionamento)
values
('Roldão Atacadista	Av. das Nações Unidas N.22063 SP','11 5683-5693','05.800.256/0006-01','Seg a Dom. 7h-22h'),
('Extra Mercado','Estr. do Campo Limpo N:459 SP','0800 779 6761','13.395.884/0002-53','Seg a Dom. 11h-22h'),
('Pão de Açúcar','Av. Giovanni Gronchi. N: 5819 SP','0800 777 9900','47.508.411/0078-35','Seg a Dom. 10h-22h'),
('Mercado Dia', 'Av. Santo Amaro, 3200 - SP', '(11) 4521-6787', '64.897.321/0001-44','Seg a Dom. 08h-21h'),
('Carrefour Bairro', 'Rua Luís Góis, 1900 - SP', '(11) 3222-5544', '61.255.999/0001-80','Seg a Dom. 07h-23h'),
('Atacadão', 'Av. João Dias, 4500 - SP', '(11) 4501-6698', '52.345.789/0001-21', '24 horas'),
('Mercado Municipal SP', 'Rua Cantareira, 306 - SP', '(11) 3313-3366', '11.555.444/0001-55','Seg a Dom. 06h-20h'),
('Sonda Supermercados', 'Av. Antônio João, 900 - SP', '(11) 2755-7788', '45.876.345/0001-11','Seg a Dom. 09h-22h'),
('Dia & Noite Mercado', 'Rua Tabapuã, 520 - SP', '(11) 3988-2211', '33.454.777/0001-50', '24 horas'),
('Mercado Popular', 'Rua Pirapora, 85 - SP', '(11) 9666-4455', '77.321.888/0001-65','Seg a Dom. 07h-23h');

select * from mercado;


-- Inserindo registros na tabela cliente:
insert into cliente
(nome,telefone,cpf,email,endereco)
values
('Ana Beatriz Souza','11 982736455','102.394.587-60','ana.live9.souza@gmail.com','Rua das Palmeiras. Campo Limpo N: 128 SP'),
('Lucas Santos Lima','11 853490721','764.205.319-04','lucaslima.cor13@hotmail.com','Rua José Manoel Camisa Nova. Jardim São Luís N: 45 SP'),
('Carla Mendes Silva','11 904567283','539.871.240-98','carla.mend1silva@gmail.com','Avenida Carlos Caldeira Filho. Campo Limpo N: 2750 SP'),
('Mariana Lopes','11 988223344','123.456.789-11','mariana.lopes@gmail.com','Rua das Acácias, 55'),
('João Ferreira','11 984567890','222.333.444-55','joferreira@hotmail.com','Av. Paulista, 200'),
('Fernanda Gomes','11 977773322','333.555.777-99','fernanda.gomes@gmail.com','Rua dos Pinheiros, 742'),
('Roberto Silva','11 971238821','444.666.888-22','roberto.silva@gmail.com','Rua Ipiranga, 915'),
('Juliana Alves','11 956481122','555.888.444-22','juliana.alves@hotmail.com','Av. Interlagos, 3800'),
('Diego Ramos','11 932224488','666.777.555-15','diego.ramos@gmail.com','Rua da Consolação, 145'),
('Paula Martins','11 981457788','777.999.333-40','paula.martins@gmail.com','Rua Rio Bonito, 399'); 

select * from cliente;
	
 
 -- Inserindo registros na tabela fornecedor:
 insert into fornecedor
 (nome_fornecedor,cnpj,telefone,email,endereco)
 values
('Camil Alimentos','64.904.295/0001-03','(11) 3039-9200','televendas@camil.com.br','Av. Dra Ruth Cardoso. Pinheiros N: 8501 - 12º andar'),
('Hellmann´s Comercio de Alimentos LTDA','85.243.731/0001-10','(47) 3026-4294',' f.helmanns@gmail.com','Rua Sobral. Iririu Joinville SC N: 90'),
('União Açúcar','12.345.678/0001-55','(11) 2222-4444','atendimento@uniao.com','Rua João Dias, Santo Amaro - SP'),
('Kicaldo Alimentos','54.778.965/0001-80','11 99887-5566','suporte@kicaldo.com.br','Av. São João, Centro - SP'),
('Renata Massas','11.456.879/0001-20','11 3377-5566','vendas@renata.com','Rua das Flores, Campinas - SP'),
('Nescafé Brasil','55.789.456/0001-10','11 3674-2255','contato@nescafe.com.br','Av. Paulista, 1300 - SP'),
('Seara Alimentos','41.789.255/0001-72','11 3977-4890','sac@seara.com','Rua Verde, Barueri - SP'),
('Gallo Azeites','45.987.753/0001-42','11 4111-9988','contato@gallo.com','Av. Central, Osasco - SP'),
('Yoki Alimentos','71.345.987/0001-85','11 9345-8877','sac@yoki.com','Rua Bela Vista, Taboão - SP'),
('Nestlé Brasil','40.233.157/0001-70','11 3123-4455','atendimento@nestle.com','Rua Dr. Costa, Vila Mariana - SP');
 
 select * from fornecedor;
 

-- Inserindo registros na tabela produto:
insert into produto
(nome_produto,valor_produto,estoque,id_fornecedor,id_mercado)
values
('Arroz branco 5kg Camil','29.90','300','1','1'),
('Açucar Refinado 1kg União','4.39','250','1','1'),
('Feijão Carioca Kicaldo 1kg','5.49','250','1','2'),
('Maionese Hellmann´s 500g','8.39','70','2','3'),
('Café Tradicional União 500g','38.10','70','1','1'),
('Macarrão Renata Espaguete 1kg','5.99','150','4','2'),
('Azeite Extra Virgem Gallo 500ml','29.90','90','7','4'),
('Batata Palha Yoki 120g','7.50','140','8','5'),
('Leite Parmalat Integral 1L','5.80','200','6','3'),
('Achocolatado Nestlé 400g','9.50','180','9','2');


select * from produto;



-- Inserindo registros na tabela compra:
insert into compra
(id_cliente,valor_total)
values
('1','150.50'),
('1','633.87'),
('2','1355.23'),
('3','842.02'),
('3','172.00'),
(12, 189.90), 
(13, 85.50), 
(14, 320.00),
(15, 150.30),
(16, 99.90),
(17, 450.00),
(18, 210.50);

select * from compra;


-- Inserindo registros da tabela pagamento:
insert into pagamento
(id_compra,forma_pagamento,valor_pago)
values
('1','Débito','150.50'),
('2','Crédito á vista','633.87'),
('3','Credito 2x','1355.23'),
('4','Debito','842.02'),
(5, 'Pix', 172.00),
(11, 'Crédito 3x', 189.90),
(12, 'Débito', 85.50),
(13, 'Pix', 320.00),
(14, 'Crédito à vista', 150.30),
(15, 'Débito', 99.90),
(16, 'Pix', 450.00),
(17, 'Crédito 2x', 210.50);

select * from pagamento;


-- Cadastros e Geral:

-- consulta 1: contagem de registros em cada tabela:
select 'mercado' as tabela, count(*) as total from mercado
union all
select 'cliente', count(*) from cliente
union all
select 'fornecedor', count(*) from fornecedor
union all
select 'produto', count(*) from produto
union all
select 'compra', count(*) from compra
union all
select 'pagamento', count(*) from pagamento;

-- consulta 2: tabela com mais registros:
select 'mercado' as tabela, count(*) as total from mercado
union all
select 'cliente', count(*) from cliente
union all
select 'fornecedor', count(*) from fornecedor
union all
select 'produto', count(*) from produto
union all
select 'compra', count(*) from compra
order by total desc
limit 1;

-- consulta 3: top 5 clientes que mais compraram:
select c.nome, count(co.id_compra) as total_compras 
from cliente c
inner join compra co on c.id_cliente = co.id_cliente
group by c.id_cliente
order by total_compras desc
limit 5;

-- consulta 4: clientes sem compras:
select c.nome
from cliente c
left join compra co on c.id_cliente = co.id_cliente 
where co.id_compra is null;


-- Operações e Transações:

-- consulta 5: valor total movimentado em compras:
select sum(valor_total) as total_movimentado
from compra;

-- consulta 6: total de compras agrupadas por mês:
select date_format(data_compra, '%Y-%m') as mes,
       sum(valor_total) as total_vendas
from compra
group by mes
order by mes;

-- consulta 7: cliente que mais gastou:
select c.nome,
       sum(co.valor_total) as total_gasto
from cliente c
inner join compra co
    on c.id_cliente = co.id_cliente
group by c.id_cliente
order by total_gasto desc
limit 1;


-- Analise e Desempenho:

-- consulta 8: fornecedor com mais produtos cadastrados:
select f.nome_fornecedor, count(p.id_produto) as total_produtos
from fornecedor f
inner join produto p on f.id_fornecedor = p.id_fornecedor
group by f.id_fornecedor
order by total_produtos desc
limit 1;


-- JOINs Multiplos e Relatorios:

-- consulta 9: informações completas de cada compra (cliente + compra + pagamento)
select 
    co.id_compra,
    c.nome as cliente,
    co.data_compra,
    co.valor_total,
    pa.forma_pagamento,
    pa.valor_pago,
    pa.data_pagamento
from compra co
inner join cliente c 
    on co.id_cliente = c.id_cliente
left join pagamento pa
    on co.id_compra = pa.id_compra;

-- consulta 10: relatório geral com totais e médias de compras
select count(*) as total_compras, 
 sum(valor_total) as soma_total, 
 avg(valor_total) as media_por_compra
from compra;