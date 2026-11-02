## ADR-001 — Adoção da DigitalOcean para hospedagem

Status: Aceito
Data: 02/11/2026

### Contexto
Inicialmente, a hospedagem do sistema estava prevista para a Google Cloud Platform (GCP). 
Durante o planejamento da infraestrutura, identificou-se que a plataforma apresentava complexidade e recursos excessivos para as necessidades de uma primeira versão do projeto.

Além disso, a utilização de diferentes serviços da GCP exigiria compreender e configurar diversos recursos de infraestrutura, aumentando o esforço de provisionamento e gerenciamento do ambiente.

### Decisão
Adotar a DigitalOcean como provedora de hospedagem, utilizando um Droplet Linux para executar as aplicações e disponibilizar os recursos necessários ao sistema.

### Justificativa
A DigitalOcean oferece um modelo de hospedagem baseado em máquinas virtuais Linux, simplificando o gerenciamento dos recursos computacionais e a instalação dos pacotes necessários.

Essa abordagem reduz a complexidade de provisionamento, permite maior controle sobre o ambiente e evita a necessidade de configurar diferentes serviços de infraestrutura para atender às necessidades iniciais do projeto.

### Consequências
- Simplificação do provisionamento e gerenciamento do ambiente.
- Maior controle sobre o sistema operacional e os pacotes instalados.
- Redução da complexidade da infraestrutura inicial.
- Necessidade de administrar o sistema operacional, atualizações, segurança e manutenção do servidor.
