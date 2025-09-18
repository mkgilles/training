# Makefile for Training DevOps Repository

# Variables
APP_NAME := training
DOCKER_IMAGE := $(APP_NAME):latest
DOCKER_REGISTRY := localhost:5000

.PHONY: help install build test lint format clean docker-build docker-run deploy

# Default target
help:
	@echo "Available targets:"
	@echo "  install       - Install dependencies"
	@echo "  build         - Build the application"
	@echo "  test          - Run tests"
	@echo "  test-watch    - Run tests in watch mode"
	@echo "  test-coverage - Run tests with coverage"
	@echo "  lint          - Run linting"
	@echo "  lint-fix      - Fix linting issues"
	@echo "  format        - Format code"
	@echo "  format-check  - Check code formatting"
	@echo "  clean         - Clean build artifacts"
	@echo "  docker-build  - Build Docker image"
	@echo "  docker-run    - Run Docker container"
	@echo "  docker-compose-up   - Start services with docker-compose"
	@echo "  docker-compose-down - Stop services with docker-compose"
	@echo "  deploy        - Deploy application"
	@echo "  security-audit - Run security audit"
	@echo "  dev           - Start development server"

# Development
install:
	npm ci

build:
	npm run build

dev:
	npm run dev

# Testing
test:
	npm test

test-watch:
	npm run test:watch

test-coverage:
	npm run test:coverage

# Code Quality
lint:
	npm run lint

lint-fix:
	npm run lint:fix

format:
	npm run format

format-check:
	npm run format:check

# Security
security-audit:
	npm audit
	npm run security:audit

# Cleanup
clean:
	rm -rf dist/
	rm -rf coverage/
	rm -rf node_modules/

# Docker
docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-run:
	docker run -p 3000:3000 $(DOCKER_IMAGE)

docker-compose-up:
	docker-compose up -d

docker-compose-down:
	docker-compose down

# Infrastructure
terraform-init:
	cd infrastructure && terraform init

terraform-plan:
	cd infrastructure && terraform plan

terraform-apply:
	cd infrastructure && terraform apply

terraform-destroy:
	cd infrastructure && terraform destroy

# Deployment
deploy:
	./scripts/deploy.sh

# CI/CD simulation
ci: install lint test build docker-build

# Full development workflow
full-test: install lint format-check test-coverage security-audit build

# Quick development setup
setup: install build test
	@echo "Setup complete! Run 'make dev' to start development server."