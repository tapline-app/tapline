# 🚀 Tapline

**Enterprise Communication & Collaboration Platform**

Unified email, chat, video conferencing, and calendar with AI-powered features.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Development Workflow](#development-workflow)
- [Contributing](#contributing)
- [Team](#team)
- [License](#license)

---

## 🎯 Overview

Tapline is a comprehensive, enterprise-grade unified communication and collaboration platform that consolidates all essential business communication tools into a single, secure, and intelligent ecosystem.

### Why Tapline?

- **🔄 Unified Experience**: One platform for email, chat, video, and calendar
- **🏢 Enterprise-Ready**: Built-in security, compliance (GDPR, HIPAA), and admin controls
- **🤖 AI-Powered**: Smart email categorization, auto-replies, meeting transcription
- **🔒 Secure**: End-to-end encryption, advanced anti-phishing, DLP
- **💰 Cost-Effective**: All-in-one solution, no need for multiple subscriptions

---

## ✨ Features

### Phase 1 (MVP)
- ✅ Email composition and management
- ✅ Real-time chat messaging
- ✅ Video conferencing
- ✅ Calendar and scheduling
- ✅ User authentication and authorization

### Phase 2 (Coming Soon)
- 🔄 Advanced email features (templates, scheduling)
- 🔄 Rich text formatting for chat
- 🔄 File sharing and collaboration
- 🔄 Calendar integrations

### Phase 3+ (Future)
- 🚀 End-to-end encryption
- 🚀 AI-powered features
- 🚀 Advanced analytics
- 🚀 Mobile apps

---

## 🛠️ Tech Stack

### Frontend
- **Framework**: Next.js 14 (React 18)
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **State**: Zustand / Redux Toolkit
- **Real-time**: Socket.io Client

### Backend - Node.js Services
- **API Gateway**: NestJS
- **Chat Service**: Node.js + Express + Socket.io
- **Meet Service**: Node.js + WebRTC
- **Database ORM**: Prisma

### Backend - Python Services
- **Mail Service**: Django + Django REST Framework
- **Calendar Service**: Django
- **AI Service**: FastAPI

### Infrastructure
- **Database**: PostgreSQL 15
- **Cache**: Redis 7
- **Message Queue**: RabbitMQ 3
- **Search**: ElasticSearch 8
- **Containerization**: Docker + Docker Compose

---

## 🚀 Getting Started

### Prerequisites

- **Node.js**: 20.x or higher
- **Python**: 3.11 or higher
- **pnpm**: 8.x or higher
- **Poetry**: Latest version
- **Docker**: 24.x or higher (for local development)
- **Git**: 2.9.0 or higher

### Installation

#### 1. Clone the Repository

```bash
git clone https://github.com/your-org/tapline.git
cd tapline
```

#### 2. Install Dependencies

**Node.js Services:**
```bash
# Install pnpm globally (if not installed)
npm install -g pnpm

# Install all Node.js dependencies
pnpm install

# This will also setup Husky git hooks automatically
```

**Python Services:**
```bash
# Install Poetry (if not installed)
# Windows PowerShell:
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -

# Install Python dependencies
cd python
poetry install
cd ..
```

#### 3. Setup Environment Variables

```bash
# Copy environment template
cp infrastructure/docker/.env.example infrastructure/docker/.env

# Edit .env file with your configurations
# Required: DATABASE_URL, REDIS_URL, RABBITMQ_URL, JWT_SECRET
```

#### 4. Start Development Services

**Using Docker Compose (Recommended):**
```bash
cd infrastructure/docker
docker-compose up -d

# Check services are running
docker-compose ps
```

**Or run services individually:**

```bash
# Terminal 1: API Gateway
cd apps/api-gateway
pnpm dev

# Terminal 2: Chat Service
cd apps/chat-service
pnpm dev

# Terminal 3: Mail Service
cd python/mail-service
poetry run python manage.py runserver

# Terminal 4: Frontend
cd web/web-app
pnpm dev
```

#### 5. Access the Application

- **Frontend**: http://localhost:3000
- **API Gateway**: http://localhost:4000
- **RabbitMQ Management**: http://localhost:15672 (guest/guest)

---

## 📁 Project Structure

```
tapline/
├── apps/                    # Node.js/TypeScript Services
│   ├── api-gateway/        # API Gateway (NestJS)
│   ├── chat-service/       # Chat Service (Node.js)
│   ├── meet-service/       # Video Conferencing (Node.js)
│   └── auth-service/       # Authentication (NestJS)
│
├── python/                  # Python Services
│   ├── mail-service/       # Email Service (Django)
│   ├── calendar-service/   # Calendar Service (Django)
│   └── ai-service/         # AI Features (FastAPI)
│
├── web/                     # Frontend Applications
│   └── web-app/            # Main Web App (Next.js)
│
├── packages/                # Shared Node.js Libraries
│   ├── shared-types/       # TypeScript types
│   ├── shared-utils/       # Utility functions
│   └── event-bus/          # RabbitMQ wrapper
│
├── python-shared/           # Shared Python Libraries
│   └── tapline-common/     # Common Python utilities
│
├── infrastructure/          # Infrastructure as Code
│   ├── docker/             # Docker Compose files
│   └── kubernetes/         # K8s manifests
│
├── docs/                    # Documentation
│   ├── HUSKY_SETUP.md      # Husky configuration guide
│   └── ARCHITECTURE.md     # System architecture
│
├── scripts/                 # Build & utility scripts
│   ├── setup-husky.sh      # Husky setup (Linux/Mac)
│   └── setup-husky.bat     # Husky setup (Windows)
│
└── .github/                 # GitHub configurations
    ├── workflows/          # CI/CD workflows
    └── PULL_REQUEST_TEMPLATE.md
```

---

## 🔄 Development Workflow

### Git Workflow

We use **Git Flow** with Husky for commit validation.

#### Branch Strategy

```
main (production)
  └── develop (integration)
        ├── feature/mail-compose
        ├── feature/chat-websocket
        ├── fix/login-error
        └── hotfix/security-patch
```

#### Branch Naming

- Feature: `feature/<scope>-<description>`
- Bug Fix: `fix/<scope>-<description>`
- Hotfix: `hotfix/<description>`
- Release: `release/v<version>`

**Examples:**
```bash
feature/mail-send-email
bugfix/chat-message-duplicate
hotfix/security-xss-patch
```

### Commit Message Convention

We use **Conventional Commits** validated by Husky.

**Format:**
```
<type>(<scope>): <description>
```

**Example:**
```bash
git commit -m "feat(mail): add email composition UI"
```

**Available Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `style` - Code formatting
- `refactor` - Code refactoring
- `test` - Adding tests
- `chore` - Maintenance
- `ci` - CI/CD changes
- `build` - Build system changes

**Available Scopes:**
- `gateway`, `mail`, `chat`, `meet`, `calendar`, `ai`
- `auth`, `notification`, `storage`
- `frontend`, `shared`, `infra`, `docs`, `deps`


### Pull Request Process

1. Create feature branch from `develop`
2. Make changes and commit (Husky validates automatically)
3. Push branch to GitHub
4. Create Pull Request to `develop`
5. Get 1 approval
6. All CI checks must pass
7. Merge using "Squash and merge"

📖 **PR Template**: [.github/PULL_REQUEST_TEMPLATE.md](.github/PULL_REQUEST_TEMPLATE.md)

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Read [CONTRIBUTING.md](CONTRIBUTING.md)
2. Check [GitHub Issues](https://github.com/your-org/tapline/issues) for open tasks
3. Follow the development workflow above
4. Ensure all tests pass
5. Update documentation if needed

### Running Tests

```bash
# All Node.js tests
pnpm test

# All Python tests
cd python && poetry run pytest

# Specific service
pnpm --filter chat-service test
```

---

## 👥 Team

| Developer | Responsibilities | GitHub |
|-----------|-----------------|--------|
| **Saklain** | API Gateway, Meet Service, Frontend, Infrastructure | [@saklain-mustaque](https://github.com/saklain-mustaque) |
| **TM** | Chat Service, Real-time features | [@tm-username](https://github.com/tm-username) |
| **Asim** | Mail Service, Calendar, AI Features | [@ibrahimbaata](https://github.com/ibrahimbaata) |

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 Support & Resources

- **Documentation**: [docs/](docs/)
- **Issue Tracker**: [GitHub Issues](https://github.com/your-org/tapline/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-org/tapline/discussions)
- **Email**: dev@tapline.com

---

## 🎯 Quick Links

- 📖 [Husky Setup Guide](docs/HUSKY_SETUP.md)
- 📋 [Husky Quick Reference](docs/HUSKY_QUICK_REFERENCE.md)
- 🏗️ [Architecture Documentation](docs/ARCHITECTURE.md)
- 🚀 [Deployment Guide](docs/DEPLOYMENT.md)
- 🤝 [Contributing Guidelines](CONTRIBUTING.md)
- 👨‍💻 [Code Review Checklist](.github/CODE_REVIEW_CHECKLIST.md)

---

**Built with ❤️ by the Tapline Team**
