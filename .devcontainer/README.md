# Dev Container para Property Marketplace

Este projeto está configurado para usar Dev Containers, proporcionando um ambiente de desenvolvimento consistente e isolado.

## Pré-requisitos

- Docker Desktop instalado e rodando
- VS Code com a extensão "Dev Containers" instalada
- Git

## Como usar

1. **Abrir o projeto no VS Code**
   ```bash
   code .
   ```

2. **Reabrir em Container**
   - Pressione `Ctrl+Shift+P` (ou `Cmd+Shift+P` no macOS)
   - Digite "Dev Containers: Reopen in Container"
   - Selecione a opção

3. **Aguardar a construção do container**
   - O VS Code irá construir o container automaticamente
   - Isso pode levar alguns minutos na primeira vez

## O que está incluído

### Serviços
- **app**: Container principal com Ruby 3.3.6 e Rails 7.2
- **db**: PostgreSQL 15 para o banco de dados

### Ferramentas instaladas
- Ruby 3.3.6
- Rails 7.2.2
- PostgreSQL Client
- Node.js e npm
- Yarn
- Git
- Vim
- Build tools

### Extensões do VS Code
- Ruby e Solargraph para desenvolvimento Ruby
- RuboCop para linting
- Tailwind CSS IntelliSense
- Prettier para formatação
- TypeScript support

## Comandos úteis

### Rails
```bash
# Criar e migrar banco de dados
bin/rails db:create db:migrate

# Executar seeds
bin/rails db:seed

# Iniciar servidor Rails
bin/rails server

# Executar testes
bin/rails test

# Console Rails
bin/rails console
```

### Bundle
```bash
# Instalar gems
bundle install

# Adicionar nova gem
bundle add nome_da_gem
```

### RuboCop
```bash
# Verificar estilo do código
bundle exec rubocop

# Corrigir automaticamente
bundle exec rubocop -a
```

## Portas

- **3000**: Servidor Rails
- **5432**: PostgreSQL

## Volumes

- `postgres_data`: Dados do PostgreSQL
- `bundle_cache`: Cache das gems Ruby
- `node_modules`: Módulos Node.js

## Troubleshooting

### Problemas comuns

1. **Container não inicia**
   - Verifique se o Docker está rodando
   - Tente reconstruir o container: `Ctrl+Shift+P` → "Dev Containers: Rebuild Container"

2. **Erro de conexão com banco**
   - Verifique se o serviço `db` está rodando
   - Execute `bin/rails db:create` para criar o banco

3. **Gems não encontradas**
   - Execute `bundle install` no terminal do container

4. **Permissões de arquivo**
   - Os arquivos são montados com as permissões corretas
   - Se houver problemas, verifique se o usuário `vscode` tem acesso

### Logs

Para ver os logs dos containers:
```bash
docker-compose logs app
docker-compose logs db
```

## Desenvolvimento

O ambiente está configurado para desenvolvimento com:
- Hot reload do Rails
- Debugging configurado
- Linting automático com RuboCop
- Formatação automática
- IntelliSense para Ruby e JavaScript