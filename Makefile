.PHONY: createmigration
createmigration:
	migrate create -ext=sql -dir=sql/migrations -seq init

.PHONY: migrate
migrate:
	migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose up

.PHONY: migratedown
migratedown:
	migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose down

.PHONY: run
run:
	cd cmd/ordersystem/ && go run main.go wire_gen.go

.PHONY: docker-up
docker-up:
	docker-compose up -d

.PHONY: docker-down
docker-down:
	docker-compose down -v

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make docker-up       - Start docker containers"
	@echo "  make docker-down     - Stop docker containers"
	@echo "  make run             - Run the application"
	@echo "  make migrate         - Execute database migrations"
	@echo "  make migratedown     - Revert database migrations"
	@echo "  make createmigration - Create a new migration file"
	@echo "  make help            - Show this help message"
