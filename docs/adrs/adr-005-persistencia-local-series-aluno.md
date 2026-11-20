## ADR-005 — Persistência local da execução do treino no aplicativo do aluno

**Status:** Aceito  
**Data:** 15/11/2026

### Contexto

Durante a definição do fluxo de execução dos treinos no aplicativo mobile do aluno, avaliou-se como registrar o progresso das séries e os dados da sessão durante sua realização.

Persistir cada série concluída em tempo real no banco de dados central geraria um volume elevado de requisições contínuas ao BFF Aluno e ao Serviço de Domínio, além de tornar a experiência de uso dependente de conectividade constante.

Também foi identificada a necessidade de permitir a retomada de sessões interrompidas, preservando o progresso registrado localmente no dispositivo.

### Decisão

Manter localmente no aplicativo mobile os dados da sessão em andamento, incluindo o identificador do treino, horário de início e progresso das séries executadas, sem envio dessas informações granulares para a API.

O aplicativo permitirá apenas uma sessão de treino em andamento por dispositivo. Ao acessar a tela inicial, caso exista uma sessão não finalizada, o aluno poderá identificá-la e retomá-la, sem que sua execução seja iniciada automaticamente. Enquanto existir uma sessão em andamento, não será permitido iniciar outro treino.

A finalização da sessão enviará à API o identificador do treino e os horários de início e término. Após a tentativa de envio, independentemente da confirmação do servidor, os dados da sessão serão removidos do armazenamento local.

A comunicação com a API ficará restrita à obtenção dos treinos disponíveis, consulta ao histórico consolidado e registro da conclusão das sessões.

### Justificativa

O armazenamento local permite acompanhar o progresso imediatamente, reduzindo o tráfego de rede durante os exercícios e garantindo maior resiliência a oscilações de conectividade.

A manutenção da sessão no dispositivo possibilita sua retomada após interrupções, sem exigir que o aluno reinicie o treino.

A restrição de uma única sessão em andamento evita conflitos no controle de execução e simplifica o gerenciamento do estado local.

O envio consolidado ao final da sessão reduz a quantidade de requisições ao backend e simplifica o modelo relacional no PostgreSQL.

### Como era esperado

O acompanhamento das séries poderia ser enviado e persistido continuamente no banco de dados central via API a cada série finalizada pelo aluno, mantendo o controle da execução dependente da comunicação com o servidor.

### Como ficou definido

O aplicativo mantém localmente os dados da sessão em andamento, incluindo o horário de início e as séries concluídas, permitindo a retomada do treino pela tela inicial após interrupções.

Somente uma sessão pode permanecer em andamento por dispositivo. Ao finalizar o treino, o aplicativo envia ao servidor o identificador do treino e os horários de início e término.

Após a tentativa de envio, os dados da sessão são removidos do armazenamento local, independentemente da confirmação do servidor.

O histórico centralizado mantém apenas a identificação do treino, a data de conclusão e os horários de início e término da sessão, sem armazenar o detalhamento das séries executadas.

### Consequências

- Redução significativa do volume de requisições HTTPS entre o aplicativo do aluno e o BFF Aluno.
- Maior fluidez e resiliência durante a execução dos treinos.
- Possibilidade de retomada de sessões interrompidas, preservando o progresso local.
- Restrição de uma única sessão de treino em andamento por dispositivo.
- Simplificação do esquema relacional no banco de dados PostgreSQL.
- Impossibilidade de consultar o histórico detalhado das séries em outros dispositivos ou pela interface web do professor.
- Possibilidade de perda do registro de uma sessão concluída quando ocorrer falha na comunicação com o servidor, pois os dados locais serão descartados após a tentativa de envio.
