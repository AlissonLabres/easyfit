# Diagrama de Topologia de Recursos

## 1. Objetivo
Representar a distribuição dos recursos de infraestrutura e sua relação com os componentes do sistema EasyFIT, considerando as decisões arquiteturais registradas nos ADRs.

## 2. Descrição da topologia
A solução será hospedada em um Droplet Linux da DigitalOcean, que executará as aplicações frontend e backend.

As plataformas Professor e Aluno serão disponibilizadas pelo Nginx, responsável por servir os arquivos estáticos gerados durante o processo de build.

Os serviços backend serão executados como processos Node.js, gerenciados pelo PM2.

O PostgreSQL será executado em um container Docker no mesmo Droplet. A aplicação _(Domain Service)_ acessará o banco de dados por meio de uma conexão própria.

As plataformas Professor e Aluno terão seus respectivos BFFs, responsáveis pela comunicação com a camada de domínio. Essa integração será realizada por APIs, seguindo contratos definidos entre os componentes.

## 3. Recursos e componentes

| Recurso              | Componente relacionado              | Finalidade                                            |
| -------------------- | ----------------------------------- | ----------------------------------------------------- |
| DigitalOcean Droplet | Ambiente de hospedagem              | Hospedar os recursos da aplicação.                    |
| Nginx                | Frontend Professor e Frontend Aluno | Disponibilizar os arquivos estáticos das plataformas. |
| PM2                  | BFFs e camada de domínio            | Gerenciar os processos das aplicações backend.        |
| Docker               | PostgreSQL                          | Executar o banco de dados em container.               |
| GitHub Actions       | Integração e entrega                | Apoiar a integração e publicação das aplicações.      |

## 4. Fluxo de comunicação

1. Professor e Aluno acessam suas respectivas plataformas por HTTPS.
2. O Nginx disponibiliza os arquivos das plataformas frontend.
3. Cada frontend encaminha as requisições ao seu respectivo BFF por APIs, seguindo os contratos definidos.
4. Os BFFs se comunicam com a camada de domínio por APIs, seguindo os contratos definidos.
5. A camada de domínio acessa o PostgreSQL para consultar e armazenar informações.
6. O GitHub Actions apoia o processo de publicação das aplicações no Droplet.
