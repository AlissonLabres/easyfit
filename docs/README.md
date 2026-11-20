# Documentação do Sistema EasyFIT

Este diretório reúne a documentação e a especificação arquitetural do sistema EasyFIT, incluindo requisitos, diagramas, decisões arquiteturais e registros das atividades desenvolvidas durante as três sprints do projeto.

## 1. Requisitos

Documentação dos requisitos funcionais e não funcionais do sistema.

- [Requisitos Funcionais](./requisitos/requisitos-funcionais.md)
- [Requisitos Não Funcionais](./requisitos/requisitos-naofuncionais.md)

## 2. Arquitetura de Software

Documentos e diagramas que descrevem a organização dos componentes, a infraestrutura e a estrutura arquitetural do sistema.

- [Definição dos Componentes](./arquitetura/definicao-componentes.md)
- [Diagrama de Arquitetura de Software](./arquitetura/diagrama-arquitetura-software.drawio)
- [Diagrama de Topologia de Recursos](./arquitetura/diagrama-topologia.drawio)
- [Documentação da Topologia](./arquitetura/diagrama-topologia.md)
- [Infraestrutura Conceitual](./arquitetura/infraestrutura-conceitual.md)
- [Diagrama Entidade-Relacionamento](./arquitetura/diagrama-entidade-relacionamento.drawio)

## 3. Modelo C4

Diagramas que representam a arquitetura do sistema em diferentes níveis de abstração.

- **Nível 01 – Contexto**
  - [Diagrama de Contexto](./c4-model/nivel-01.drawio)
- **Nível 02 – Containers**
  - [Diagrama de Containers](./c4-model/nivel-02.drawio)
- **Nível 03 – Componentes**
  - [BFF do Aluno](./c4-model/nivel-03/bff-aluno.drawio)
  - [BFF do Professor](./c4-model/nivel-03/bff-professor.drawio)
  - [Domain Service](./c4-model/nivel-03/domain-service.drawio)

## 4. Registros de Decisões Arquiteturais (ADRs)

Registros das decisões arquiteturais tomadas durante o desenvolvimento do projeto, incluindo suas justificativas e consequências.

- [ADR-001 – Adoção da DigitalOcean](./adrs/adr-001-adocao-digitalocean-hospedagem.md)
- [ADR-002 – Gerenciamento de Aplicações com PM2](./adrs/adr-002-gerenciamento-aplicacoes-pm2.md)
- [ADR-003 – Utilização do PostgreSQL em Docker](./adrs/adr-003-utilizacao-postgresql-docker.md)
- [ADR-004 – Comunicação BFF-Domain via API](./adrs/adr-004-comunicacao-bff-dominio-via-api.md)
- [ADR-005 – Persistência Local de Séries do Aluno](./adrs/adr-005-persistencia-local-series-aluno.md)
- [ADR-006 – Vínculo Indireto do Histórico de Treinos](./adrs/adr-006-vinculo-indireto-historico-treinos.md)
- [ADR-007 – Edição de Treinos e Registro Histórico](./adrs/adr-007-edicao-treinos-registro-historico.md)
- [ADR-008 – Estratégia de Backup do Banco de Dados](./adrs/adr-008-estrategia-backup-banco-dados.md)
