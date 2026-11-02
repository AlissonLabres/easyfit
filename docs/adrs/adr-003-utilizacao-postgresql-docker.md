## ADR-003 — Utilização do Docker para o PostgreSQL

Status: Aceito
Data: 02/11/2026

### Contexto
Inicialmente, estava previsto hospedar o PostgreSQL diretamente no Droplet Linux, sem definir como seria realizada sua instalação e configuração.

Durante o planejamento da infraestrutura, identificou-se que a instalação direta exigiria etapas adicionais de configuração e manutenção do banco de dados.

### Decisão
Utilizar Docker para executar o PostgreSQL em um container no mesmo Droplet Linux da DigitalOcean.

### Justificativa
A utilização do Docker permite iniciar o banco de dados de maneira mais rápida, simplificando sua instalação, configuração e atualização.

Em comparação com a instalação direta no Linux, essa abordagem reduz o trabalho necessário para preparar e manter o ambiente do PostgreSQL, facilitando sua administração.

O isolamento do banco em container não é o principal objetivo dessa decisão, uma vez que o acesso ao PostgreSQL pelas aplicações continuará sendo realizado por meio da infraestrutura do próprio servidor.

### Como era esperado
O PostgreSQL seria instalado diretamente no sistema operacional Linux do Droplet, exigindo a configuração e manutenção dos recursos necessários no próprio servidor.

### Como ficou definido
O PostgreSQL será executado em um container Docker, permitindo seu gerenciamento independente dos processos das aplicações, que serão administrados pelo PM2.

### Consequências
- Simplificação da instalação e configuração do PostgreSQL.
- Facilidade para atualizar e recriar o ambiente do banco de dados.
- Separação do ciclo de execução do banco em relação às aplicações.
- Necessidade de configurar volumes persistentes para preservar os dados durante a recriação do container.
- Necessidade de estabelecer uma estratégia de backup e recuperação.

### Pontos pendentes
- Backup diário automatizado.
- Procedimento de restauração dos dados.
- Volume persistente para os dados do PostgreSQL.
- Local de armazenamento dos backups, preferencialmente fora do próprio Droplet.
