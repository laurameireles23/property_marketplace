#!/bin/bash

# Script executado após a criação do container
echo "🚀 Configurando ambiente de desenvolvimento..."

# Verificar se o banco está pronto
echo "⏳ Aguardando PostgreSQL..."
until pg_isready -h db -p 5432 -U postgres; do
  echo "Aguardando PostgreSQL..."
  sleep 2
done

# Criar banco de dados se não existir
echo "🗄️ Configurando banco de dados..."
bin/rails db:create 2>/dev/null || true
bin/rails db:migrate 2>/dev/null || true

# Instalar dependências se necessário
echo "📦 Verificando dependências..."
bundle check || bundle install

# Verificar se há seeds para executar
if [ -f "db/seeds.rb" ]; then
  echo "🌱 Executando seeds..."
  bin/rails db:seed 2>/dev/null || true
fi

# Configurar permissões
echo "🔧 Configurando permissões..."
chmod +x bin/*

echo "✅ Ambiente configurado com sucesso!"
echo "🌐 Acesse http://localhost:3000 para ver a aplicação"
echo "📊 PostgreSQL disponível em localhost:5432"