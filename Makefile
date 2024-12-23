.PHONY: init init-backend init-frontend

# Full project initialization
init:
	@echo "Initializing project"
	@make init-backend
	@make init-frontend

# Backend initialization (NestJS)
init-backend:
	@echo "Initializing backend (NestJS)"
	@if [ -d "backend/node_modules" ]; then \
		echo "Removing existing node_modules in backend"; \
		rm -rf backend/node_modules; \
	else \
		echo "No node_modules to remove in backend"; \
	fi
	@cd backend && npm install
	@if [ -f "backend/.env" ]; then \
		echo ".env file already exists in backend, please adapt it if necessary"; \
	elif [ -f "backend/.env.example" ]; then \
		cp backend/.env.example backend/.env; \
		echo "Copied .env.example to .env in backend"; \
	else \
		echo "No .env.example found in backend, please create a .env file manually"; \
	fi
	@echo "Backend initialized!"

# Frontend initialization (Next.js)
init-frontend:
	@echo "Initializing frontend (Next.js)"
	@if [ -d "frontend/node_modules" ]; then \
		echo "Removing existing node_modules in frontend"; \
		rm -rf frontend/node_modules; \
	else \
		echo "No node_modules to remove in frontend"; \
	fi
	@cd frontend && npm install
	@if [ -f "frontend/.env" ]; then \
		echo ".env file already exists in frontend, please adapt it if necessary"; \
	elif [ -f "frontend/.env.example" ]; then \
		cp frontend/.env.example frontend/.env; \
		echo "Copied .env.example to .env in frontend"; \
	else \
		echo "No .env.example found in frontend, please create a .env file manually"; \
	fi
	@echo "Frontend initialized!"
