# ADRs

Este documento registra as decisões arquiteturais definidas para o projeto EasyFIT até o momento. 
Cada ADR apresenta o contexto da mudança, o motivo da decisão e a configuração estabelecida.

### Resumo das decisões

| ADR     |  Tema                       | Decisão arquitetural                                                              |
| ------- |  -------------------------- | --------------------------------------------------------------------------------- |
| ADR-001 |  Hospedagem                 | DigitalOcean como provedora de hospedagem.                                        |
| ADR-002 |  Execução das aplicações    | Nginx para frontends e PM2 para backends.                                         |
| ADR-003 |  Banco de dados             | PostgreSQL executado em container Docker.                                         |
| ADR-004 |  Comunicação                | Camada de domínio independente, comunicando-se com os BFFs via HTTPS e contratos. |
| ADR-005 |  Comunicação                | Persistência local das séries executadas pelo aluno.                              |
| ADR-006 |  Comunicação                | Vínculo indireto do histórico de treinos ao aluno via entidade Treino.            |
