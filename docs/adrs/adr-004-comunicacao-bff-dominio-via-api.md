## ADR-004 — Comunicação entre BFFs e camada de domínio via API

Status: Aceito
Data: 02/11/2026

### Contexto
Inicialmente, a organização da camada de domínio ainda não estava definida, existindo a possibilidade de compartilhar módulos NestJS diretamente entre os BFFs.

Entretanto, essa abordagem criaria dependência entre os componentes, dificultando sua evolução e publicação independente.

### Decisão
Implementar a camada de domínio como um serviço independente, responsável por centralizar as regras de negócio e disponibilizar contratos de comunicação para os BFFs.

A comunicação entre os componentes será realizada por API, seguindo os contratos definidos pela camada de domínio.

### Justificativa
A comunicação por API permite manter os BFFs independentes da implementação interna da camada de domínio.

Com essa organização, alterações e novas publicações dos BFFs não exigem mudanças estruturais na camada de domínio. Da mesma forma, a camada de domínio poderá evoluir sem depender diretamente dos BFFs.

Além disso, a definição de contratos estabelece um padrão para as requisições e respostas, reduzindo o acoplamento entre os componentes.

### Como era esperado
A organização da camada de domínio poderia ocorrer por meio de módulos compartilhados entre os BFFs, mantendo os componentes dependentes da mesma implementação.

### Como ficou definido
A camada de domínio será implementada como um serviço independente, expondo contratos de comunicação via API para os BFFs Professor e Aluno.

### Consequências
- Independência entre os BFFs e a camada de domínio.
- Possibilidade de evolução e publicação independente dos componentes.
- Possibilidade de escalabilidade independente da camada de domínio.
- Padronização da comunicação por meio de contratos.
- Necessidade de manter e versionar os contratos de comunicação.
- Comunicação entre componentes passa a depender da disponibilidade da rede e do serviço de domínio.
