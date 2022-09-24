# Desafio de Projeto DIO - Database Experience

Repositório criado para o Desafio de Projeto.


# **Desafio Final**
*O papel dos Bancos de Dados Relacionais (SQL) e Não Relacionais (NoSQL) no contexto de um Engenheiro de Dados.*

## **Falando um pouco sobre Dados**

Com o passar do tempo a computação evoluiu rapidamente, quase que de maneira exponencial. O resultado deste avanço está refletido na criação de hardwares mais robustos, consequentemente, softwares mais potentes. O aprimoramento do hardware estimulou a evolução do software.

Em uma simples navegação pela internet, consumindo páginas web, estamos produzindo uma infinidade de dados. Todo serviço disponibilizado na rede gera dados associados aos seus clientes. 
 
Cada humano criou cerca de 1,7 Mb de dados por segundo em 2020

[A quantidade de dados disponíveis](https://techjury.net/blog/how-much-data-is-created-every-day/) para fins analíticos está crescendo. Em média, os seres humanos padrão geraram cerca de 1,7 megabytes de informação por segundo. Mais de 3,7 bilhões de seres humanos já estão usando a Internet, e cada vez que o fazemos, estamos gerando mais informações.

Os dados influenciam diretamente em tomadas de decisões das empresas e precisam ser armazenados para análise posterior.

[Um estudo de BARC](https://bi-survey.com/big-data-benefits) indica múltiplos benefícios por utilizar uma grande iniciativa de dados, incluindo melhor tomada de decisão estratégica (69%), melhor controle dos processos operacionais (54%) e melhor compreensão dos clientes (52%).

Cerca de 47% de clientes também disseram que tinham reduzido os custos de processo graças à análise de dados. Outros benefícios incluem o aumento das vendas, inovação mais rápida do produto, risco reduzido e operações mais eficientes.

Podemos entender melhor o tamanho deste impacto com alguns exemplos, como: otimização de processos, aumento de lucro, maior taxa de engajamento, predição de valores, classificação e caracterização de comportamentos.

## **Profissionais da carreira de dados**

Dentro da carreira de dados podemos definir três papéis principais. 

•	Analista de dados

•	Cientista de dados

•	Engenheiro de dados

Hoje falaremos sobre `Engenheiro de dados`

Esse profissional está focado no desenho, construção e manutenção de soluções para dados. Em outras palavras, esse profissional é responsável por tratar os dados e designar uma estrutura de armazenamento para esses dados de acordo com o contexto ou demanda.

Sendo assim, o engenheiro de dados vai determinar qual melhor sistema para prover persistência destes dados. Após esta etapa os dados poderão enfim ser analisados por outro profissional.

Um processo diretamente relacionado ao engenheiro de dados é conhecido como ETL – Extract Transform & Load. Resumidamente, esse processo é composto pelas etapas de coleta, limpeza, estruturação e manutenção de dados em um sistema.  

![Fig.01](https://uploaddeimagens.com.br/images/004/034/953/original/pipelinedados.png)

## **Extract**

Aqui o engenheiro irá trabalhar com soluções de coleta de dados. Essas soluções podem incluir:

•	SGBDs Relacionais;

•	NoSQL;

•	Linguagens de programação para trabalhar com APIs, além de Webscraping (processo de coleta de dados estruturados da web de maneira automatizada).

 *Atenção às questões legais se realizar webscraping sem permissão.*

## **Transform**

Após a etapa de coleta de dados segue a transformação de dados. Trata-se da limpeza e estruturação, ou seja, etapa de refinamento dos dados.

Na maioria das vezes os dados são coletados de fontes heterogêneas para compor um mesmo contexto. Cada conjunto de dados terá uma estrutura distinta.

Cabe ao engenheiro retirar as redundâncias, informações desnecessárias, além de preencher lacunas quando possível. Dessa forma, ele será capaz de definir qual modelo estrutural utilizar para o processo de carregamento.

Nesta etapa utiliza-se alguma linguagem de programação para transformar e automatizar, se necessário, esse processo. Os dados devem possuir uma concordância a fim de terem significado. O valor das análises está ligado a qualidade dos dados.

## **Load**

Agora os dados devem ser transferidos ao sistema correspondente de sua estrutura. Neste caso, podemos citar: 

•	Data Lakes;

•	SGBDs relacionais;

•	NoSQL.

Esta etapa consiste na adequação/configuração de sistemas. Além de uma possível integração entre sistemas. Consequentemente, o engenheiro manterá uma estrutura para os dados, modelados e persistidos.

O engenheiro em diversos momentos precisará manter a estrutura “redonda” para consumo dos analistas e cientistas. Quem sabe, até tratar questões de integração entre sistemas como MySQL e Power BI.

## **Big Data**

Com a evolução da tecnologia, aplicações em tempo real e grande volume de dados sendo gerados na Internet surgiu o [Big Data](https://pt.wikipedia.org/wiki/Big_data).

Big Data está fundamentado em: Velocidade, Variedade e Volume.

O engenheiro de dados deve ser capaz de lidar com dados gerados em alta taxa de transmissão. Esses dados geralmente estão atrelados a alta demanda do sistema. Esse tipo de cenário possui um tratamento diferenciados dos dados “tradicionais”, ou seja, que seguem o modelo relacional.

Sistemas de gerenciamento de banco de dados NoSQL geralmente estão associados a este cenário. 

Os SGBDs NoSQL são utilizados em conjuntos com os relacionais para suprir as demandas de acesso das empresas. Um exemplo de mundo real é a tão conhecida “Black Friday”.

Para que SGBDs relacionais possam suprir uma demanda avassaladora assim é preciso investimento em um crescimento ‘vertical’ da infraestrutura. Isso acarreta altos custos para suprir uma demanda pontual. Portanto, ao invés de gastar para deixar o servidor mais robusto podemos utilizar um SGBD NoSQL.

Os NoSQL herdam diversas características dos sistemas distribuídos, como: escalabilidade, performance, falhas independentes, heterogeneidade e transparência. Esses aspectos são muito interessantes em cenários pontuais e de alta demanda.

## **Fluxo de dados**

Outra atribuição de um engenheiro de dados que acaba sendo solicitada pelas empresas são conhecimentos em arquiteturas de softwares avançadas, como: sistemas de mensageria e orientada a eventos.

Neste caso, não será necessário investir verticalmente em infraestrutura da rede.

Um servidor que irá recuperar as mensagens pode fazê-lo em momento posterior. Em outras palavras, o nó consumidor pode escolher quando processar uma informação. Isso fornece uma maior disponibilidade, performance e experiência do usuário.

Sobre estes sistemas, podemos citar os principais: [RabbitMQ](https://www.rabbitmq.com/) e [Kafka](https://kafka.apache.org/)

## **NoSQL e o SQL**

Existem várias comparações de desempenho realizadas entre NoSQL e o SQL, tendo como a velocidade o fator mais importante na decisão de qual banco utilizar. Há muitas opções de bancos de dados NoSQL com diferentes funcionalidades que podem ser muito úteis. Mas como decidir entre um banco de dados relacional e um não-relacional?

Primeiramente vamos falar um pouco sobre cada tecnologia para que possamos conhecê-las ou relembrá-las.

[**SQL**](https://pt.wikipedia.org/wiki/SQL)

Trata-se de uma linguagem de consulta a banco de dados relacionais. Com o SQL, você pode executar vários comandos para criar, alterar, gerenciar, consultar, dentre outras informações no seu banco de dados. Bancos SQL seguem uma modelagem relacional, pois estes se baseiam no fato de que todos seus dados sejam guardados em tabelas. 

[**NoSQL**](https://pt.wikipedia.org/wiki/NoSQL)

NoSQL (Not Only SQL) é o termo utilizado para banco de dados não relacionais de alto desempenho, onde geralmente não é utilizado o SQL como linguagem de consulta. O NoSQL foi criado para ter uma performance melhor e uma escalabilidade mais horizontal para suprir necessidades onde os bancos relacionais não são eficazes. 

No geral, temos 4 tipos de bancos de dados NoSQL:


•	Documento – Os dados são armazenados como documentos. Os documentos podem ser descritos como dados no formato de chave-valor, como por exemplo, o padrão JSON. Um exemplo de banco de dados neste formato é o [MongoDB](https://www.mongodb.com/pt-br);

•	Colunas – Os dados são armazenados em linhas particulares de tabela no disco, podendo suportar várias linhas e colunas. Também permitem sub-colunas. Um banco de dados dessa família, por exemplo, é o [Cassandra](https://cassandra.apache.org/_/index.html);

•	Grafos – Os dados são armazenados na forma de grafos (vértices e arestas). O [Neo4j](https://neo4j.com/) é um banco que utiliza grafos;

•	Chave-valor – Esta família de bancos NoSQL é a que aguenta mais carga de dados, pois o conceito dele é que um determinado valor seja acessado através de uma chave identificadora única. Um exemplo é o banco de dados [Riak](https://riak.com/).

## **Resumindo**

O conceito de modelo relacional (SQL) se baseia no fato de que todos os dados sejam guardados em tabelas. Ao modelo não-relacional (NoSQL) não se aplica o conceito de schema: uma chave de valor é que é utilizada para recuperar valores, conjunto de colunas ou documentos. 

![Fig.2](https://uploaddeimagens.com.br/images/004/034/963/original/exemplos.png)
 
 
## **Quais são as diferenças?**

Uma das diferenças nos bancos de dados NoSQL é que toda a informação é agrupada e guardada no mesmo registro. Já no SQL você precisa ter o relacionamento entre várias tabelas para ter a informação, informação está disposta no modelo entidade e relacionamento.
 
![Fig.3](https://uploaddeimagens.com.br/images/004/034/967/original/exemplos2.png)

O SQL tem certa dificuldade em conciliar a demanda por escalabilidade. Quanto a escalabilidade do NoSQL, deve se levar em consideração a modelagem do sistema. 

Um ponto forte do SQL é quanto à consistência das informações. Já o NoSQL garante o último valor atualizado, isso se nenhuma atualização for realizada até o momento da consulta.

Quanto à segurança, ambos estão suscetíveis a ataques.

## **Concluindo**

O NoSQL tem muitas vantagens para ser utilizado. Mas não é por isso que devemos utilizá-lo em todas as situações. Em muitos sistemas, você pode (e até deve) usar o modelo relacional. O NoSQL é mais indicado para aqueles sistemas que tenham necessidades maiores de armazenamento e desempenho.

O NoSQL não veio para substituir o SQL, mas sim para oferecer mais uma alternativa de um banco de dados mais flexível no suporte de dados. Sendo assim, você pode usar ambas as soluções para diferentes casos de uso. Por isso, o mais comum em soluções escalares de sucesso é a utilização de uma arquitetura híbrida, aproveitando o melhor dois modelos.

Engenheiro de dados é o profissional responsável por gerenciar, otimizar, supervisionar e monitorar a recuperação, armazenamento e distribuição de dados em toda a organização provendo uma estrutura pronta para análise posterior. 

Engenheiros de dados são membros vitais de qualquer equipe corporativa de análise de dados.

---
### *Tópicos de estudo para carreira de engenheiro de dados:*

•	SGBDs relacional e NoSQL

•	Python, Java

•	Orquestração de containers e Clusterização

•	Sistemas orientados a eventos

•	Sistemas de mensageria

•	Processo de ETL

---

#### **Bibliografia:**

https://simplificandoredes.com/por-onde-iniciar-na-carreira-de-dados/

https://www.catho.com.br/profissoes/engenheiro-de-dados/

https://www.treinaweb.com.br/blog/sql-vs-nosql-qual-usar

https://www.devmedia.com.br/introducao-aos-bancos-de-dados-nosql/26044

https://www.letscode.com.br/blog/as-diferencas-entre-sql-e-nosql



