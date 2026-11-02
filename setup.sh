#!/bin/bash

# 1. Instalar os plugins oficiais do Nx, dependências do Ionic e ESLint com --legacy-peer-deps para evitar conflitos de versão do Angular
echo "📦 Instalando dependências e plugins do Nx..."
npm install -D @nx/angular @nx/nest @nx/playwright @nx/jest @nx/eslint @nx/eslint-plugin --legacy-peer-deps
npm install @ionic/angular --legacy-peer-deps

# 2. Gerar a aplicação Frontend (Angular)
echo "🌐 Gerando web-app (Angular)..."
npx nx g @nx/angular:app --directory=apps/web-app --e2eTestRunner=playwright --unitTestRunner=jest --routing=true --style=scss --standalone=true

# 3. Gerar a aplicação Mobile/Webview (Angular base para Ionic)
echo "📱 Gerando mobile-app (Angular + Ionic)..."
npx nx g @nx/angular:app --directory=apps/mobile-app --e2eTestRunner=playwright --unitTestRunner=jest --routing=true --style=scss --standalone=true

# 4. Gerar as aplicações Backend (NestJS)
echo "⚙️ Gerando BFFs e Domain Service (NestJS)..."
npx nx g @nx/nest:app --directory=apps/bff-web
npx nx g @nx/nest:app --directory=apps/bff-mobile
npx nx g @nx/nest:app --directory=apps/domain-service

# 5. Criar o arquivo docker-compose.yml para o PostgreSQL
echo "🐳 Criando docker-compose.yml..."
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  postgres:
    image: postgres:15
    container_name: domain_db
    restart: always
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: password
      POSTGRES_DB: domain_service_db
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
EOF

echo "✅ Configuração concluída com sucesso!"
