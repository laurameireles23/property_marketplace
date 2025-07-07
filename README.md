# Property Marketplace

Uma aplicação Rails para marketplace de propriedades.

## 🚀 Início Rápido com Dev Container

A forma mais fácil de começar é usando Dev Containers:

### Pré-requisitos
- Docker Desktop
- VS Code com extensão "Dev Containers"

### Passos
1. Clone o repositório
2. Abra no VS Code: `code .`
3. Pressione `Ctrl+Shift+P` e selecione "Dev Containers: Reopen in Container"
4. Aguarde a construção do container
5. Acesse http://localhost:3000

## 🛠️ Desenvolvimento Local

### Pré-requisitos
- Ruby 3.3.6
- PostgreSQL
- Node.js

### Instalação
```bash
# Instalar gems
bundle install

# Configurar banco de dados
bin/rails db:create db:migrate db:seed

# Iniciar servidor
bin/rails server
```

## 🧪 Testes
```bash
bin/rails test
```

## 📝 Linting
```bash
bundle exec rubocop
bundle exec rubocop -a  # Auto-correção
```

## 🗄️ Banco de Dados
- **Desenvolvimento**: `property_marketplace_development`
- **Teste**: `property_marketplace_test`
- **Produção**: `property_marketplace_production`

## 🔧 Configuração
- Rails 7.2.2
- Ruby 3.3.6
- PostgreSQL
- Tailwind CSS
- Hotwire (Turbo + Stimulus)

## 📚 Documentação
Veja [.devcontainer/README.md](.devcontainer/README.md) para instruções detalhadas sobre o Dev Container.
