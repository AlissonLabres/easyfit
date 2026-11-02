# Catálogo de Componentes

### Organização dos Componentes

```markdown
A arquitetura do sistema está organizada em duas plataformas independentes: Professor e Aluno.
Cada plataforma possui uma interface própria e um Backend for Frontend (BFF), responsável por intermediar a comunicação com a camada de domínio.

A camada de domínio centraliza as regras de negócio e as operações compartilhadas pelas plataformas, enquanto a persistência de dados é responsável pelo armazenamento das informações do sistema.
Essa organização busca separar as responsabilidades de cada plataforma, promover o compartilhamento das regras de negócio e manter a consistência das informações utilizadas pelo sistema.
```

### Tabela com a identificação e responsabilidade.

| Componente            | Responsabilidade                                                                                                                    |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Frontend Professor    | Disponibilizar a interface para gerenciamento dos alunos, criação e organização dos treinos.                                        |
| BFF Professor         | Intermediar a comunicação entre a plataforma Professor e a camada de domínio, atendendo às necessidades específicas da interface.   |
| Frontend Aluno        | Disponibilizar a interface para consulta dos treinos e acompanhamento de sua execução.                                              |
| BFF Aluno             | Intermediar a comunicação entre a plataforma Aluno e a camada de domínio, atendendo às necessidades específicas da interface.       |
| Camada de Domínio     | Centralizar as regras de negócio e operações compartilhadas, garantindo consistência entre as plataformas.                          |
| Persistência de Dados | Armazenar e disponibilizar as informações utilizadas pelo sistema, incluindo usuários, treinos, exercícios e registros de execução. |

### Relação entre os componentes

### Tabela de Relações entre os componentes do sistema.

| Origem             | Destino               | Relação                                       |
| ------------------ | --------------------- | --------------------------------------------- |
| Professor          | Frontend Professor    | Acesso à interface de gerenciamento.          |
| Aluno              | Frontend Aluno        | Acesso à interface de acompanhamento.         |
| Frontend Professor | BFF Professor         | Encaminhamento das requisições da plataforma. |
| Frontend Aluno     | BFF Aluno             | Encaminhamento das requisições da plataforma. |
| BFF Professor      | Camada de Domínio     | Solicitação de operações e regras de negócio. |
| BFF Aluno          | Camada de Domínio     | Solicitação de operações e regras de negócio. |
| Camada de Domínio  | Persistência de Dados | Consulta e armazenamento das informações.     |a
