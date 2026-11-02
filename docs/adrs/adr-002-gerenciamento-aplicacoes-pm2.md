## ADR-002 — Gerenciamento e publicação das aplicações

Status: Aceito
Data: 02/11/2026

### Contexto
Inicialmente, estava previsto utilizar Docker para executar os serviços backend e disponibilizar as aplicações. 

Durante a revisão da infraestrutura, identificou-se a possibilidade de simplificar a execução dos serviços, reduzindo o consumo de recursos computacionais e facilitando o gerenciamento dos processos.

### Decisão
Utilizar o PM2 para gerenciar os processos das aplicações backend e o Nginx para disponibilizar os arquivos estáticos dos frontends.

### Justificativa
A utilização do PM2 permite centralizar o gerenciamento e monitoramento dos processos Node.js, aproveitando a familiaridade com a ferramenta e simplificando a administração das aplicações.

Para os frontends, o Nginx será responsável por servir os arquivos gerados durante o processo de build, utilizando uma solução adequada à disponibilização de aplicações estáticas.

Essa organização evita a necessidade de utilizar containers Docker para executar as aplicações frontend e backend.

### Como era esperado
As aplicações frontend e backend seriam executadas em containers Docker, enquanto a publicação dos frontends seria realizada por um servidor web.

### Como ficou definido
- Frontends: arquivos estáticos disponibilizados pelo Nginx.
- Backends: processos Node.js gerenciados pelo PM2.
- Banco de dados: PostgreSQL executado em container Docker, conforme ADR-003.

### Consequências
- Simplificação do gerenciamento dos processos backend.
- Menor dependência do Docker para execução das aplicações.
- Separação entre a disponibilização dos frontends e a execução dos backends.
- Necessidade de configurar e manter o Nginx no servidor.
