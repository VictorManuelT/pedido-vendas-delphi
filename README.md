# PedidoDeVendas

Sistema para gerenciamento de clientes, produtos e pedidos de venda desenvolvido em Delphi 12.

O projeto foi desenvolvido como parte de um teste técnico para Desenvolvedor Delphi (SOLID & DDD), com o intuito de aplicar na prática conceitos de organização de código, separação de responsabilidades, SOLID, DDD e Clean Code.

A persistência dos dados foi feita utilizando arquivos JSON, deixando a aplicação simples de executar sem depender de banco de dados ou componentes externos.

## Objetivo

O objetivo do projeto é demonstrar uma implementação simples, mantendo separadas as regras de negócio, a interface e a forma como os dados são armazenados.

Para o desenvolvimento, foram utilizados os seguintes conceitos:

* Separação entre Domínio, Aplicação e Infraestrutura

* Interfaces para desacoplar as regras de negócio da persistência

* DTOs para comunicação entre a interface e os casos de uso

* Regras de negócio concentradas nas entidades

* Repositórios para acesso aos dados

* Persistência em arquivos JSON

* VCL para a interface gráfica

## Funcionalidades

### Clientes

* Cadastro de clientes

* Listagem de clientes

* Edição de clientes

* Exclusão de clientes

* Nome

* CPF/CNPJ

* Cidade

* Persistência em `clientes.json`

### Produtos

* Cadastro de produtos

* Listagem de produtos

* Edição de produtos

* Exclusão de produtos

* Descrição

* Preço de venda

* Unidade de medida

* Persistência em `produtos.json`

### Pedidos de Venda

* Seleção de cliente

* Seleção de produtos

* Inclusão de itens no pedido

* Exclusão de itens do pedido

* Definição de quantidade

* Definição de valor unitário

* Cálculo do total dos itens

* Cálculo do total do pedido

* Edição de pedidos

* Exclusão de pedidos

* Persistência em `pedidos.json`

## Arquitetura

O projeto utiliza uma separação em camadas para separar as responsabilidades.

### Domain

O Domain é o local onde se encontram as entidades, regras de negócio, exceções e contratos dos repositórios.

Principais entidades:

* `TCustomer`

* `TProduct`

* `TOrder`

* `TOrderItem`

O Domain também é responsável pela inclusão e pelo cálculo do valor total dos itens no pedido, além das demais regras do pedido.

### Application

É onde se encontram os casos de uso e DTOs.

Exemplos:

* `TCustomerDTO`

* `TProductDTO`

* `TPedidoDTO`

* `TOrderItemDTO`

* `TCreateOrder`

Tem como objetivo evitar que a interface precise conhecer diretamente os detalhes das entidades ou da persistência.

### Infrastructure

Contém a persistência.

Foi utilizado um repositório baseado em JSON:

* `TJsonDatabase`

* `TJsonCustomerRepository`

* `TJsonProductRepository`

* `TJsonOrderRepository`

Os repositórios implementam os contratos definidos no Domain.

Dessa forma, a regra de negócio não depende diretamente do arquivo JSON.

### Apresentação

Local onde se encontram os Forms da aplicação utilizando VCL.

Os Forms são responsáveis pela interação com o usuário, além da montagem dos DTOs e da chamada dos casos de uso.

## SOLID

Alguns dos princípios que foram aplicados no projeto:

### Single Responsibility Principle

As responsabilidades foram separadas entre entidades, casos de uso, repositórios e interface.

Por exemplo, a classe `TJsonOrderRepository` fica responsável pela persistência dos pedidos, enquanto `TOrder` concentra as regras relacionadas ao pedido.

### Dependency Inversion Principle

Os casos de uso trabalham com interfaces de repositório em vez de depender diretamente de uma implementação específica de persistência.

Por exemplo:

```delphi
IPedidoRepository
```

é utilizado pelo caso de uso, enquanto:

```delphi
TJsonOrderRepository
```

é uma implementação concreta desse contrato.

Isso permite trocar a forma de persistência sem precisar alterar as regras do caso de uso.

## DDD

O projeto utiliza alguns conceitos de DDD de forma simplificada.

As entidades representam conceitos do negócio:

* Cliente

* Produto

* Pedido

* Item do Pedido

As regras relacionadas ao pedido ficam dentro da entidade `TOrder`, evitando colocar toda a lógica diretamente nos Forms.

Os repositórios representam o acesso às entidades, enquanto a infraestrutura contém a implementação utilizada para persistência.

## DTOs

Foram utilizados DTOs para transportar os dados entre a camada de apresentação e a aplicação.

Por exemplo, para criação ou edição de um pedido:

```delphi
TPedidoDTO = record
  Id: Integer;
  ClienteId: Integer;
  Itens: TArray<TOrderItemDTO>;
end;
```

Dessa forma, o Form não precisa passar diretamente a entidade de domínio para o caso de uso.

## Persistência

A aplicação utiliza arquivos JSON para armazenar os dados.

Os arquivos são criados dentro da pasta:

```text
data/
├── clientes.json
├── produtos.json
└── pedidos.json
```

A escolha do JSON foi feita por ser uma solução simples para o teste e não exigir configuração de banco de dados para executar o projeto.

## Estrutura do projeto

A estrutura utilizada no projeto ficou organizada da seguinte forma:

```text
PedidoVendas/
│
├── src/
│   │
│   ├── Domain/
│   │   ├── Entities/
│   │   ├── Exceptions/
│   │   └── Repositories/
│   │
│   ├── Application/
│   │   ├── DTOs/
│   │   └── UseCases/
│   │
│   ├── Infrastructure/
│   │   └── Persistence/
│   │       └── Json/
│   │
│   └── Apresentacao/
│       └── Forms/
│
├── data/
│   ├── clientes.json
│   ├── produtos.json
│   └── pedidos.json
│
├── PedidoVendas.dpr
├── PedidoVendas.dproj
└── README.md
```

A árvore acima é apenas uma representação. Os arquivos estão separados de acordo com suas responsabilidades.

## Tecnologias utilizadas

* Delphi 12

* VCL

* JSON

* SOLID

* DDD

* Clean Code

* Arquitetura em camadas

## Dependências externas

O projeto não utiliza componentes ou bibliotecas externas.

Foi utilizado apenas o que já está disponível no Delphi 12.

## Como executar

### Requisitos

* Delphi 12

* Windows

### Executando o projeto

1. Clone o repositório.

2. Abra o arquivo:

```text
PedidoVendas.dproj
```

3. Compile o projeto pelo Delphi.

4. Execute a aplicação.

A pasta `data` contém os arquivos utilizados para persistência dos dados.

Caso os arquivos JSON ainda não existam, eles serão criados pela aplicação conforme os dados forem cadastrados.

## Observações

O projeto foi desenvolvido buscando manter uma estrutura simples, mas deixando clara a separação entre as regras de negócio, aplicação, persistência e interface.

A persistência em JSON pode ser substituída posteriormente por outra implementação de repositório sem precisar alterar as entidades e os casos de uso.

O foco principal do projeto foi demonstrar a organização do código e o fluxo dos dados entre as camadas, conforme proposto no teste técnico.
