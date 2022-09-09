
# Projeto Oficina 
## DIO - Bootcamp

``Diagrama ER`` utilizando  ['MySQL Worbench'](https://www.mysql.com/products/workbench/)

Diagrama ER é o modelo de dados conceitual que descreve os dados como sendo entidades, atributos e relacionamentos entre tabelas. Entidades são objetos ou conceitos do mundo real.

## Desafio: 

Criar um esquema conceitual do zero. A partir da narrativa fornecida você será capaz de criar todas as entidades, relacionamentos e atributos.

## Objetivo:
Cria o esquema conceitual para o contexto de oficina com base na narrativa fornecida

## Levantamento de Requisitos:
* Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica

* ``Clientes`` levam ``veículos`` à oficina mecânica para serem consertados ou para passarem por revisões  periódicas

* Cada ``veículo`` é designado a uma ``equipe`` de ``mecânicos`` que identifica os ``serviços`` a serem executados e preenche uma ``OS`` com data de entrega.

* A partir da ``OS``, calcula-se o valor de cada ``serviço``, consultando-se uma tabela de referência de mão-de-obra

* O valor de cada ``peça`` também irá compor a ``OS``. 

* O ``cliente`` autoriza a execução dos ``serviços``

* A mesma ``equipe`` avalia e executa os ``serviços``

* Os ``mecânicos`` possuem código, nome, endereço e especialidade

* Cada ``OS`` possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

#### Obs: "OS" corresponde a "Ordem de Serviço"

