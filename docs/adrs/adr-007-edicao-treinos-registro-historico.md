## ADR-007 — Edição de Treinos e Registro do Histórico

**Status:** Aceito  
**Data:** 15/11/2026

### Contexto

Na definição do comportamento de edição dos treinos, avaliou-se como tratar alterações realizadas pelo professor em treinos que já possuam registros de execução no histórico do aluno.

A principal questão envolvia a necessidade de preservar a configuração dos exercícios existente no momento da execução ou permitir que o treino fosse atualizado diretamente, mantendo seu vínculo com os registros históricos.

### Decisão

Permitir que o professor edite o próprio treino, independentemente da existência de registros de histórico, mantendo o mesmo identificador (`treino_id`).

O histórico armazenará exclusivamente a identificação do treino, a data de conclusão e os horários de início e término da execução, sem preservar os exercícios ou suas configurações anteriores.

### Justificativa

A abordagem simplifica a estrutura de dados e o gerenciamento dos treinos, evitando a necessidade de implementar versionamento ou manter cópias históricas dos exercícios.

O histórico permanece destinado ao registro das sessões realizadas pelo aluno, sem a finalidade de reproduzir a configuração original do treino em cada execução.

### Como era esperado

A edição de treinos com histórico poderia exigir restrições de alteração, criação de novas versões ou preservação das configurações anteriores dos exercícios para manter a composição original de cada sessão.

### Como ficou definido

O professor poderá modificar o treino existente, mantendo seu `treino_id`, mesmo quando houver registros associados na tabela `historico_treino`.

Os registros históricos permanecerão vinculados ao mesmo treino, apresentando apenas sua identificação, data de conclusão e horários de execução. As alterações nos exercícios não gerarão versões ou cópias históricas.

### Consequências

- Simplificação do gerenciamento e da edição dos treinos.
- Manutenção do vínculo entre o treino e seus registros históricos por meio do mesmo `treino_id`.
- Eliminação da necessidade de versionamento ou cópias históricas dos exercícios.
- O histórico não permitirá recuperar a composição original dos exercícios de uma sessão concluída.
- Alterações posteriores no treino poderão modificar as informações atualmente associadas aos registros históricos.
