# ADRs

Este documento registra as decisões arquiteturais definidas para o projeto EasyFIT até o momento. 
Cada ADR apresenta o contexto da mudança, o motivo da decisão e a configuração estabelecida.

### Resumo das decisões

| ADR com Link                                           |  Tema                       | Decisão arquitetural                                                                 |
| ------------------------------------------------------ | --------------------------- | ------------------------------------------------------------------------------------ |
| [ADR-001](./adr-001-adocao-digitalocean-hospedagem.md) |  Hospedagem                 | DigitalOcean como provedora de hospedagem.                                           |
| [ADR-002](./adr-002-gerenciamento-aplicacoes-pm2.md)            |  Execução das aplicações    | Nginx para frontends e PM2 para backends.                                            |
| [ADR-003](./adr-003-utilizacao-postgresql-docker.md)                    |  Banco de dados             | PostgreSQL executado em container Docker.                                            |
| [ADR-004](./adr-004-comunicacao-bff-dominio-via-api.md)                    |  Comunicação                | Camada de domínio independente, comunicando-se com os BFFs via HTTPS e contratos.    |
| [ADR-005](./adr-005-persistencia-local-series-aluno.md)             |  Persistência local         | Persistência local das séries executadas pelo aluno.                                 |
| [ADR-006](./adr-006-vinculo-indireto-historico-treinos.md)                |  Modelagem de dados         | Vínculo indireto do histórico de treinos ao aluno via entidade Treino.               |
| [ADR-007](./adr-007-edicao-treinos-registro-historico.md)        |  Gerenciamento de histórico | Estratégia de preservação das prescrições, mesmo que o aluno não execute os treinos. |
| [ADR-008](./adr-008-estrategia-backup-banco-dados.md)  |  Backup do banco de dados   | Estratégia de backup externo do banco de dados PostgreSQL.                           |
