
# Projeto E-commerce 
## DIO - Bootcamp

``Diagrama EER`` utilizando  ['MySQL Worbench'](https://www.mysql.com/products/workbench/)

Diagrama ER nada mais é do que modelo de dados conceptual que descreve os dados como sendo entidades, atributos e relacionamentos entre tabelas. Entidades são objetos ou conceitos do mundo real.

Levantamento de Requisitos
### Produto
• Os produtos são vendidos por uma única plataforma online.
Contudo, estes podem ter vendedores distintos (terceiros)

• Cada produto possui um fornecedor

• Um ou mais produtos podem compor um pedido

### Cliente
• O cliente pode se cadastrar no site com seu ``CPF`` ou ``CNPJ``

• O Endereço do cliente irá determinar o valor do frete

• Um cliente pode comprar mais de um pedido. Este tem um período
de carência para devolução do produto

### Pedido
• O pedidos são criados por clientes e possuem informações de
compra, endereço e status da entrega
• Um produto ou mais compõem o pedido
• O pedido pode ser cancelado

### Fornecedor
• Fornecedor pode ter vários produtos e produtos vários fornecedores possibilitando concorrência

### Estoque
• Relacionado diretamente a produtos. Quantidade deve estar no relacionamento.

### Refinando
• ``Cliente PJ e PF`` – Uma conta pode ser PJ ou PF, mas não
pode ter as duas informações

• ``Pagamento`` – Pode ter cadastrado mais de uma forma de
pagamento

• ``Entrega`` – Possui status e código de rastreio

-- Detalhes do Desafio DIO em PDF
