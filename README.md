# Sistema de Banco de Dados – Mercado

Este projeto foi desenvolvido para fins de estudo e prática de SQL.  
Ele simula o banco de dados de um mercado, incluindo cadastro de clientes, produtos, compras e itens de compra.  
O objetivo é aplicar conceitos de modelagem de dados, criação de tabelas e consultas com **JOIN**, **GROUP BY**, **SUM**, **COUNT**, entre outros.

---

# Funcionalidades

- Criação do banco de dados `mercado`
- Cadastro de clientes, produtos e mercado
- Relacionamento entre tabelas usando chaves estrangeiras
- Registro de compras e itens de compra
- Consultas analíticas, como:
 - Produto mais vendido
  - Total de compras por cliente
  - Listagem de pedidos completos

---

##  Tecnologias Utilizadas

- **MySQL**
- **SQL**
- MySQL Workbench / phpMyAdmin
- Git & GitHub

---

#  Estrutura do Banco de Dados

# **Tabelas Principais**
- `mercado`  
- `cliente`  
- `produto`  
- `compra`  
- `item_compra`  

# **Conceitos aplicados**
- Chave primária (PK)
- Chave estrangeira (FK)
- Auto incremento
- Relacionamento 1:N e N:N
- Normalização básica
- Funções agregadas

---

# Exemplo de Consultas

# Produto mais vendido
```sql
SELECT 
    p.nome,
    SUM(ic.quantidade) AS total_vendido
FROM item_compra ic
JOIN produto p ON ic.id_produto = p.id_produto
GROUP BY p.id_produto
ORDER BY total_vendido DESC
LIMIT 1;
✔ Total gasto por cliente
sql
Copiar código
SELECT 
    c.nome AS cliente,
    SUM(ic.quantidade * p.preco) AS total_gasto
FROM cliente c
JOIN compra co ON c.id_cliente = co.id_cliente
JOIN item_compra ic ON co.id_compra = ic.id_compra
JOIN produto p ON ic.id_produto = p.id_produto
GROUP BY c.id_cliente;


