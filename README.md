```bash
Aluno: Laura Meireles
Email: laura.meireles1@gmail.com
```

# Property Marketplace

Este é um projeto desenvolvido como parte do curso de Ruby on Rails. O objetivo é aplicar os conceitos aprendidos em aulas na disciplina "Arquitetura de aplicações web com Rails", bem estruturada e com boas práticas de desenvolvimento.

---

## 📦 Tecnologias Utilizadas

- Ruby
- Ruby on Rails
- PostgreSQL
- Bootstrap

---

## 🚀 Como rodar o projeto localmente

```bash
# Clone o repositório
git clone https://github.com/laurameireles23/property_marketplace
cd property-marketplace

# Abra o VSCode
# Inicie o projeto dentro do dev container
```

---

## ✅ Funcionalidades implementadas

- Cadastro de usuários (vendedores e compradores)
- Cadastro, edição e remoção de imóveis
- Cadastro de ofertas para imóveis
- Seleção de vendedor e comprador nos formulários
- Visualização de imóveis, ofertas e usuários
- Validação para garantir apenas uma oferta aceita por imóvel
- Layout moderno e responsivo com Bootstrap

---

## 🧠 Conceitos aplicados

Abaixo estão os conceitos aprendidos em aula e aplicados neste projeto, junto com a justificativa de sua utilização:

### 1. Active Record e ORM

Utilizado para mapear as tabelas do banco de dados em objetos Ruby, facilitando a manipulação dos dados e garantindo integrações nativas com validações, associações e callbacks.
**Exemplo:** Models como `User`, `Property` e `Offer` usam Active Record para persistência, validações e callbacks.

### 2. Associações entre Models

Aplicadas para modelar relações entre entidades do sistema, como usuários, imóveis e ofertas.
**Exemplo:** `Property` possui várias `Offer` (`has_many`), `Offer` pertence a um `User` e a um `Property` (`belongs_to`). Isso facilita consultas e integridade dos dados.

### 3. Concerns para Lógica Compartilhada

Utilizados para extrair e reutilizar lógica comum entre models, mantendo o código limpo e DRY.
**Exemplo:** O módulo `UserTypes` em `app/models/concerns/user_types.rb` centraliza métodos e escopos relacionados ao tipo de usuário.

### 4. Organização de Código por Contexto

O projeto está organizado em pastas como `controllers`, `models`, `services`, `repositories`, `views` e `concerns`, seguindo boas práticas de separação de responsabilidades e facilitando a manutenção e escalabilidade.

### 5. Service Objects

Utilizados para encapsular regras de negócio fora dos models e controllers, mantendo o código mais limpo e testável.
**Exemplo:** As classes `PropertyService` e `OfferService` centralizam a lógica de criação, atualização e validação de imóveis e ofertas, facilitando manutenção e testes.

### 6. Repository Pattern

Aplicado para separar a lógica de acesso a dados dos models, tornando o código mais organizado e flexível para mudanças futuras.
**Exemplo:** `PropertyRepository` e `OfferRepository` concentram as queries e buscas, evitando SQL espalhado pelo projeto.

### 7. Partials e Componentização de Views

Utilizados para evitar repetição de código e facilitar a manutenção das views.
**Exemplo:** Os cards de imóvel e os formulários de imóvel e oferta foram extraídos para partials reutilizáveis, deixando as views mais limpas e DRY.

### 8. Validações Personalizadas

Implementadas para garantir regras de negócio específicas diretamente no model.
**Exemplo:** No model `Offer`, foi criada uma validação customizada para garantir que apenas uma oferta pode ser aceita por imóvel, evitando inconsistências.

### 9. Helpers e Decorators

Utilizados para centralizar lógicas de apresentação e formatação, mantendo as views simples.
**Exemplo:** O uso de helpers para formatação de valores e exibição de badges/status nas views.

### 10. Responsividade e Design Moderno

O Bootstrap foi utilizado para garantir um layout responsivo e visual agradável, melhorando a experiência do usuário em diferentes dispositivos.

---

Em resumo, a aplicação foi estruturada para ser clara, reutilizável e fácil de manter, aplicando os principais conceitos de arquitetura e boas práticas do Ruby on Rails.

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
bin/rails db:create db:migrate

# Iniciar servidor
bin/rails server
```

## 🗄️ Banco de Dados

- **Desenvolvimento**: `property_marketplace_development`
- **Teste**: `property_marketplace_test`
- **Produção**: `property_marketplace_production`

## 🔧 Configuração

- Rails 7.2.2
- Ruby 3.3.6
- PostgreSQL

## 📚 Documentação

Veja [.devcontainer/README.md](.devcontainer/README.md) para instruções detalhadas sobre o Dev Container.

## 🎯 Funcionalidades

### CRUD Completo

- **Usuários**: Compradores e vendedores
- **Imóveis**: Cadastro, edição, listagem e remoção
- **Ofertas**: Criação, aceitação e rejeição

### Fluxo de Negócio

1. Vendedor cadastra imóvel
2. Comprador visualiza imóveis disponíveis
3. Comprador faz oferta
4. Vendedor avalia e aceita/rejeita oferta

## 🏗️ Conceitos Aplicados

Este projeto implementa **5 conceitos obrigatórios** apresentados nas aulas:

### 1. **Service Objects**

**Onde aplicado**: `app/services/property_service.rb` e `app/services/offer_service.rb`

**Motivo da utilização**: Encapsular lógica de negócio complexa fora dos controllers e models, mantendo o código limpo e testável. Os Service Objects implementam o método `.call` como entrada principal e retornam resultados estruturados.

**Exemplo**:

```ruby
# PropertyService.create_property(user, attributes)
# OfferService.create_offer(user, property, attributes)
```

### 2. **Repository Pattern**

**Onde aplicado**: `app/repositories/property_repository.rb` e `app/repositories/offer_repository.rb`

**Motivo da utilização**: Criar uma camada de abstração entre a aplicação e a persistência de dados, centralizando consultas e desacoplando a lógica de negócio do ORM. Facilita testes e permite trocar mecanismos de persistência.

**Exemplo**:

```ruby
PropertyRepository.all_active
OfferRepository.find_by_user(user)
```

### 3. **Separação de Responsabilidades**

**Onde aplicado**: Controllers enxutos (`app/controllers/properties_controller.rb`, `app/controllers/offers_controller.rb`)

**Motivo da utilização**: Evitar "fat controllers" e "fat models", delegando responsabilidades específicas para Service Objects, Repositories e Concerns. Isso torna o código mais manutenível, testável e escalável.

**Exemplo**: Controllers apenas coordenam ações, delegando lógica para Services.

### 4. **Concerns (Módulos Reutilizáveis)**

**Onde aplicado**: `app/models/concerns/user_types.rb`

**Motivo da utilização**: Encapsular lógica comum e reutilizável entre models, facilitando manutenção e leitura do código. Permite compartilhar métodos e scopes entre diferentes models.

**Exemplo**:

```ruby
include UserTypes
scope :vendedores, -> { where(user_type: 'vendedor') }
def vendedor?
  user_type == 'vendedor'
end
```

### 5. **Active Record Associations e Validações**

**Onde aplicado**: Models (`app/models/user.rb`, `app/models/property.rb`, `app/models/offer.rb`)

**Motivo da utilização**: Implementar relacionamentos entre entidades e garantir integridade dos dados através de validações. Facilita consultas complexas e mantém consistência do banco de dados.

**Exemplo**:

```ruby
has_many :properties, dependent: :destroy
belongs_to :user
validates :email, presence: true, uniqueness: true
```

## 🚀 Como Usar

1. **Criar Usuários**: Acesse `/users/new` para criar compradores e vendedores
2. **Cadastrar Imóveis**: Vendedores podem cadastrar imóveis em `/properties/new`
3. **Fazer Ofertas**: Compradores podem fazer ofertas nos imóveis disponíveis
4. **Gerenciar Ofertas**: Vendedores podem aceitar ou rejeitar ofertas
