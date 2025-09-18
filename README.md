# Training DevOps Repository

A comprehensive training repository demonstrating modern DevOps practices and methodologies.

## 🚀 DevOps Features

This repository showcases a complete DevOps pipeline including:

### 🔄 CI/CD Pipeline
- **GitHub Actions** for automated testing, building, and deployment
- **Multi-stage builds** with Docker
- **Security scanning** with Trivy
- **Code quality checks** with ESLint and Prettier
- **Automated testing** with Jest

### 🐳 Containerization
- **Docker** multi-stage builds for optimal image size
- **Docker Compose** for local development environment
- **Health checks** and graceful shutdown handling
- **Non-root user** for security

### 🏗️ Infrastructure as Code
- **Terraform** configurations for AWS infrastructure
- **VPC, subnets, and security groups** setup
- **Environment-specific** configurations
- **Modular and reusable** infrastructure components

### 📊 Monitoring & Observability
- **Prometheus** for metrics collection
- **Alert rules** for proactive monitoring
- **Health endpoints** for application monitoring
- **Structured logging** implementation

### 🔒 Security
- **Security headers** with Helmet.js
- **Vulnerability scanning** in CI pipeline
- **Secrets management** best practices
- **Non-root containers** and security contexts

## 🛠️ Quick Start

### Prerequisites
- Node.js 16+ and npm
- Docker and Docker Compose
- Git

### Local Development

1. **Clone the repository:**
   ```bash
   git clone https://github.com/mkgilles/training.git
   cd training
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Set up environment:**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Start development server:**
   ```bash
   npm run dev
   ```

### Using Docker

1. **Build and run with Docker Compose:**
   ```bash
   docker-compose up --build
   ```

2. **Access the application:**
   - Application: http://localhost:3000
   - Health check: http://localhost:3000/health

## 📋 Available Scripts

| Command | Description |
|---------|-------------|
| `npm start` | Start production server |
| `npm run dev` | Start development server with auto-reload |
| `npm test` | Run tests |
| `npm run test:watch` | Run tests in watch mode |
| `npm run test:coverage` | Run tests with coverage report |
| `npm run lint` | Run ESLint |
| `npm run lint:fix` | Fix ESLint issues |
| `npm run format` | Format code with Prettier |
| `npm run build` | Build for production |
| `npm run security:audit` | Run security audit |

## 🏗️ Infrastructure Deployment

### Using Terraform

1. **Navigate to infrastructure directory:**
   ```bash
   cd infrastructure
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Plan deployment:**
   ```bash
   terraform plan
   ```

4. **Apply infrastructure:**
   ```bash
   terraform apply
   ```

### Using Deployment Script

```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

## 📊 API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Welcome message and available endpoints |
| `/health` | GET | Health check endpoint |
| `/api/info` | GET | Application information |

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_ENV` | Environment mode | `development` |
| `PORT` | Server port | `3000` |

See `.env.example` for more configuration options.

## 🧪 Testing

The project includes comprehensive testing:

- **Unit tests** with Jest
- **Integration tests** for API endpoints
- **Coverage reporting** with configurable thresholds
- **Automated testing** in CI pipeline

Run tests with:
```bash
npm test
```

## 📈 Monitoring

### Health Checks
- Application health: `/health`
- Kubernetes-ready liveness and readiness probes

### Metrics
- Prometheus metrics collection
- Custom application metrics
- Infrastructure monitoring

### Alerting
- Prometheus AlertManager integration
- CPU, memory, and response time alerts
- Configurable alert thresholds

## 🔒 Security

### Features
- Helmet.js for security headers
- CORS configuration
- Input validation and sanitization
- Vulnerability scanning in CI

### Best Practices
- Non-root Docker containers
- Secrets management
- Regular dependency updates
- Security audit automation

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Submit a pull request

### Code Style
- ESLint for JavaScript linting
- Prettier for code formatting
- Husky for git hooks
- Conventional commits encouraged

## 📚 DevOps Learning Resources

This repository demonstrates:

- **Continuous Integration/Continuous Deployment (CI/CD)**
- **Infrastructure as Code (IaC)**
- **Containerization strategies**
- **Monitoring and observability**
- **Security best practices**
- **Automated testing strategies**
- **Code quality enforcement**

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🏷️ Version

Current version: 1.0.0

---

*This repository serves as a comprehensive example of modern DevOps practices and can be used as a template for new projects or as a learning resource for DevOps methodologies.*
