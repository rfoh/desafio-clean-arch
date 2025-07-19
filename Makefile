.PHONY: run
run:
	cd cmd/ordersystem/ && go run main.go wire_gen.go

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make run   - Run the application"
	@echo "  make help  - Show this help message"
