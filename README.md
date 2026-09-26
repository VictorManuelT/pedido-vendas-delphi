# PedidoDeVendas

Sistema para gerenciamento de clientes, produtos e pedidos de venda desenvolvido em Delphi 12,
com foco na aplicação de princípios SOLID, conceitos de DDD
e persistência utilizando arquivos JSON.

## Objetivo

O projeto foi desenvolvido buscando demonstrar:

- Organização em camadas
- Separação de responsabilidades
- Aplicação dos princípios SOLID
- Modelagem de regras de negócio no domínio
- Uso de DTOs na camada de aplicação
- Uso de interfaces
- Persistência utilizando arquivos JSON
- Interface gráfica utilizando VCL

## Tecnologias

- Delphi 12
- VCL
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
