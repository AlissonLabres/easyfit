## ADR-005 — Persistência local da execução granular de séries no aplicativo do aluno

Status: Aceito
Data: 14/11/2026

### Contexto
Durante a definição do fluxo de uso do aplicativo mobile pelo aluno, avaliou-se como o progresso de execução das séries de cada exercício seria registrado durante uma sessão de treino.

Persistir cada série concluída em tempo real no banco de dados central geraria um volume elevado de requisições contínuas ao BFF Aluno e ao Serviço de Domínio, além de tornar a experiência de uso dependente de conectividade constante durante o treino.

### Decisão
Manter o controle de execução granular das séries e seu histórico detalhado armazenados exclusivamente de forma local no aplicativo mobile do aluno, sem envio para a API.

A comunicação com a API ficará restrita à obtenção dos treinos ativos, consulta ao histórico consolidado de treinos e registro da conclusão da sessão de treino (contendo apenas o identificador do treino e os horários de início e término).

### Justificativa
O armazenamento local das execuções de séries elimina o tráfego de rede desnecessário durante a realização dos exercícios, garantindo resposta imediata na interface e resiliência a oscilações de internet no ambiente de treino.

Além disso, a persistência centralizada apenas do evento consolidado de início e fim do treino simplifica o modelo relacional no PostgreSQL e reduz o acoplamento entre a dinâmica de interface do aplicativo e os contratos da camada de domínio.

### Como era esperado
Todo o acompanhamento de execução das séries poderia ser enviado e persistido continuamente no banco de dados central via API a cada série finalizada pelo aluno.

### Como ficou definido
O controle granular de séries executadas permanece exclusivamente no armazenamento local do aplicativo do aluno, enquanto a API recebe apenas a consulta de treinos, a consulta de histórico consolidado e o registro de conclusão da sessão de treino.

### Consequências
- Redução significativa do volume de requisições HTTPS entre o aplicativo do aluno e o BFF Aluno.
- Maior fluidez e resiliência offline durante a execução dos treinos pelo aluno.
- Simplificação do esquema relacional no banco de dados PostgreSQL.
- Impossibilidade de consultar o histórico detalhado por série em outros dispositivos ou pela interface web do professor.
