# Infraestrutura Conceitual

### Definição dos conceitos de infraestrutura do sistema

A infraestrutura do sistema é composta por recursos que suportam a execução das aplicações, armazenamento de dados, comunicação entre serviços e automação de processos.

A tabela a seguir apresenta os principais conceitos relacionados à infraestrutura do projeto e seus exemplos de aplicação.

| Conceito                    | Significado                                                               | Exemplo no projeto                                    |
|-----------------------------|---------------------------------------------------------------------------|-------------------------------------------------------|
| Computação                  | Recursos responsáveis pela execução das aplicações e serviços.            | Ambiente de execução dos BFFs e da camada de domínio. |
| Persistência                | Recursos responsáveis pelo armazenamento das informações.                 | PostgreSQL.                                           |
| Rede e comunicação          | Recursos que permitem a comunicação entre aplicações e serviços.          | HTTPS e comunicação com o banco de dados.             |
| Gerenciamento de processos  | Ferramentas responsáveis pelo gerenciamento dos processos das aplicações. | PM2.                                                  |
| Servidor web                | Serviço responsável pela disponibilização das interfaces web.             | Nginx.                                                |
| Containerização             | Mecanismo para executar aplicações e serviços em ambientes isolados.      | Docker, utilizado para executar o PostgreSQL.         |
| Integração contínua         | Automatização de etapas de validação e preparação das aplicações.         | GitHub Actions.                                       |
| Hospedagem em nuvem         | Ambiente que disponibiliza os recursos computacionais e serviços.         | DigitalOcean Compute (Droplet).                       |

### Inventário de recursos de infraestrutura

O inventário de recursos de infraestrutura apresenta os principais recursos e tecnologias utilizados no projeto, juntamente com suas finalidades específicas.

A tabela a seguir descreve os recursos de infraestrutura, suas tecnologias associadas e a finalidade de cada um no contexto do sistema.

| Categoria                   | Recurso / Tecnologia           | Finalidade |
|-----------------------------|--------------------------------|-----------------------------------------------------------------------------------------|
| Aplicação                   | Angular                        | Execução da interface Professor.                                                        |
| Aplicação                   | Ionic / Angular                | Execução da interface Aluno.                                                            |
| Backend                     | NestJS                         | Execução dos BFFs e da camada de domínio.                                               |
| Gerenciamento de processos  | PM2                            | Gerenciamento dos processos backend.                                                    |
| Servidor web                | Nginx                          | Disponibilização das interfaces frontend.                                               |
| Persistência                | PostgreSQL                     | Armazenamento dos dados do sistema.                                                     |
| Containerização             | Docker                         | Execução do PostgreSQL em contêiner.                                                    |
| Automação                   | GitHub Actions                 | Automatização dos processos de integração e entrega.                                    |
| Hospedagem em nuvem         | DigitalOcean Compute (Droplet) | Disponibilização dos recursos computacionais para hospedagem das aplicações e serviços. |

### Relacionamento entre recursos e componentes do sistema

O relacionamento entre os recursos de infraestrutura e os componentes do sistema é fundamental para garantir a correta execução das aplicações, comunicação entre serviços e armazenamento de dados.

A tabela a seguir apresenta os principais recursos utilizados no projeto, juntamente com os componentes relacionados e suas finalidades.

| Recurso              | Componente relacionado                       | Finalidade                                                               |
|----------------------|----------------------------------------------|--------------------------------------------------------------------------|
| Angular              | Frontend Professor                           | Desenvolvimento da interface do professor.                               |
| Ionic / Angular      | Frontend Aluno                               | Desenvolvimento da interface do aluno.                                   |
| NestJS               | BFF Professor, BFF Aluno e Camada de Domínio | Desenvolvimento dos serviços de backend.                                 |
| PM2                  | BFF Professor, BFF Aluno e Camada de Domínio | Gerenciamento dos processos backend.                                     |
| Nginx                | Frontend Professor e Frontend Aluno          | Disponibilização das interfaces web.                                     |
| PostgreSQL           | Persistência de Dados                        | Armazenamento das informações do sistema.                                |
| Docker               | PostgreSQL                                   | Execução do banco de dados em contêiner.                                 |
| GitHub Actions       | Processo de entrega                          | Automação de integração e entrega.                                       |
| DigitalOcean Droplet | Ambiente de hospedagem                       | Disponibilização dos recursos computacionais para execução da aplicação. |
