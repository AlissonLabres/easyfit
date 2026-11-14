## ADR-006 — Vínculo indireto do histórico de treinos ao aluno via entidade Treino

Status: Aceito
Data: 14/11/2026

### Contexto
Na modelagem relacional da tabela responsável por armazenar o histórico de sessões de treino realizadas pelo aluno (`historico_treino`), avaliou-se a necessidade de incluir diretamente a chave estrangeira do aluno (`aluno_id`) em conjunto com a chave estrangeira do treino (`treino_id`).

Como cada treino já é criado e vinculado exclusivamente a um único aluno na entidade `treino`, a duplicação da referência ao aluno na tabela de histórico introduziria redundância transitiva no banco de dados.

### Decisão
Relacionar a tabela `historico_treino` exclusivamente à tabela `treino` por meio da chave estrangeira `treino_id` (acompanhada dos campos `data_hora_inicio` e `data_hora_fim`), obtendo-se a associação com o aluno de forma indireta por meio da entidade `treino`.

### Justificativa
A vinculação exclusiva por meio de `treino_id` mantém o banco de dados em conformidade com a Terceira Forma Normal (3FN), eliminando dados redundantes e impedindo anomalias de inconsistência (como um registro de histórico referenciar um treino pertencente a um aluno distinto).

### Como era esperado
A tabela de histórico de treinos poderia conter chaves estrangeiras diretas tanto para `treino_id` quanto para `aluno_id` para facilitar filtros diretos na tabela.

### Como ficou definido
A tabela `historico_treino` referencia exclusivamente `treino_id`, e as consultas de histórico por aluno são resolvidas por meio de junção (`JOIN`) entre `historico_treino` e `treino`.

### Consequências
- Conformidade com a Terceira Forma Normal (3FN) e garantia de integridade referencial.
- Eliminação de redundância de dados e de riscos de inconsistência entre aluno, treino e histórico.
- Necessidade de realizar junção (`JOIN`) com a tabela `treino` nas consultas de histórico filtradas por aluno.
