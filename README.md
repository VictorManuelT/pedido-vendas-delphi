# PedidoVendas

Sistema de gerenciamento de clientes, produtos e pedidos desenvolvido em Delphi,
com foco na aplicação de princípios SOLID, conceitos de Domain-Driven Design (DDD)
e persistência de dados em arquivos JSON.

## Objetivo

O projeto foi desenvolvido como parte de um teste técnico, buscando demonstrar:

- Organização em camadas
- Separação de responsabilidades
- Aplicação dos princípios SOLID
- Modelagem de regras de negócio no domínio
- Uso de DTOs na camada de aplicação
- Repository Pattern
- Persistência desacoplada da regra de negócio
- Uso de interfaces
- Persistência utilizando arquivos JSON
- Interface gráfica utilizando VCL

## Tecnologias

- Delphi
- VCL
- Object Pascal
- JSON
- Arquitetura em camadas
- SOLID
- DDD

## Funcionalidades

### Clientes

- Cadastro de clientes
- Listagem de clientes
- Persistência em JSON

### Produtos

- Cadastro de produtos
- Listagem de produtos
- Persistência em JSON

### Pedidos

- Seleção de cliente
- Seleção de produtos
- Inclusão de itens
- Definição de quantidade
- Definição de preço unitário
- Cálculo do total do pedido
- Persistência em JSON

## Estrutura do projeto

```text
PedidoVendas/
├── src/
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