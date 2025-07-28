# Desafio Clean Architecture

Desafio do curso da pós Go Expert - Sistema de Orders com Clean Architecture

## Mensagem do curso

```
Olá devs!
Agora é a hora de botar a mão na massa. Para este desafio, você precisará criar o usecase de listagem das orders.
Esta listagem precisa ser feita com:
- Endpoint REST (GET /order)
- Service ListOrders com GRPC
- Query ListOrders GraphQL
Não esqueça de criar as migrações necessárias e o arquivo api.http com a request para criar e listar as orders.

Para a criação do banco de dados, utilize o Docker (Dockerfile / docker-compose.yaml), com isso ao rodar o comando docker compose up tudo deverá subir, preparando o banco de dados.
Inclua um README.md com os passos a serem executados no desafio e a porta em que a aplicação deverá responder em cada serviço.
```

## Pré-requisitos

- Docker e Docker Compose
- Go 1.21 ou superior
- Migration CLI (golang-migrate)

## Como Executar

1. Inicie os serviços com Docker:
```bash
make docker-up
```

2. Execute as migrações do banco de dados:
```bash
make migrate
```

3. Inicie a aplicação:
```bash
make run
```

Para parar os containers Docker:
```bash
make docker-down
```

## Serviços e Portas

- REST API: Port 8000
  - List Orders: GET /orders
  - Create Order: POST /order

- gRPC: Port 50051
  - ListOrders service
  - CreateOrder service

- GraphQL: Port 8080
  - Playground: http://localhost:8080

## Comandos Make Disponíveis

- `make run` - Inicia a aplicação
- `make migrate` - Executa as migrações do banco de dados
- `make migratedown` - Reverte as migrações
- `make createmigration` - Cria um novo arquivo de migração
- `make help` - Exibe ajuda sobre os comandosS
