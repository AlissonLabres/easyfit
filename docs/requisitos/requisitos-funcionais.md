# Requisitos Funcionais - Aluno

### Plataforma do Aluno

A plataforma do aluno deve permitir o acesso aos treinos disponibilizados pelo professor e o acompanhamento de sua execução.

| ID        | Requisito                           | Prioridade | Descrição                                                                                                                                      |
| --------- | ----------------------------------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| RF-ALU-01 | Acesso à plataforma                 | Alta       | O aluno deve conseguir acessar a plataforma utilizando seu e-mail cadastrado e o código de acesso fornecido pelo professor.                    |
| RF-ALU-02 | Visualização dos treinos            | Alta       | O aluno deve visualizar a lista de treinos disponibilizados pelo professor, identificando aqueles disponíveis para execução.                   |
| RF-ALU-03 | Visualização dos detalhes do treino | Alta       | O aluno deve consultar os exercícios de cada treino, incluindo séries, repetições, cargas, intervalos e orientações definidas pelo professor.  |
| RF-ALU-04 | Seleção de treino                   | Alta       | O aluno deve conseguir selecionar qualquer treino disponibilizado para consultar seus detalhes ou iniciar sua execução.                        |
| RF-ALU-05 | Iniciar treino                      | Alta       | O aluno deve conseguir iniciar a execução de um treino, registrando o início de sua sessão.                                                    |
| RF-ALU-06 | Acompanhamento dos exercícios       | Alta       | O aluno deve acompanhar os exercícios do treino durante sua execução, identificando as atividades realizadas e pendentes.                      |
| RF-ALU-07 | Registro de séries concluídas       | Alta       | O aluno deve marcar individualmente as séries realizadas, permitindo acompanhar seu progresso durante o treino.                                |
| RF-ALU-08 | Controle de descanso                | Alta       | O aluno deve utilizar um temporizador para controlar os intervalos de descanso entre as séries, considerando o tempo prescrito pelo professor. |
| RF-ALU-09 | Finalização do treino               | Alta       | O aluno deve conseguir finalizar uma sessão de treino, registrando sua conclusão.                                                              |
| RF-ALU-10 | Histórico de treinos                | Média      | O aluno deve consultar o histórico de sessões realizadas, identificando os treinos executados e suas respectivas datas.                        |
| RF-ALU-11 | Retomada de treino                  | Média      | O aluno deve conseguir retomar uma sessão iniciada anteriormente, preservando o progresso registrado, caso não tenha sido finalizada.          |


# Requisitos Funcionais - Professor

### Plataforma do Professor

A plataforma do professor deve permitir o gerenciamento dos alunos e a criação, organização e disponibilização de treinos personalizados.

| ID        | Requisito                        | Prioridade | Descrição                                                                                                                                 |
| --------- | -------------------------------- | ---------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| RF-PRO-01 | Acesso à plataforma              | Alta       | O professor deve conseguir acessar a plataforma por meio de autenticação, garantindo acesso às funcionalidades administrativas.           |
| RF-PRO-02 | Cadastro de alunos               | Alta       | O professor deve cadastrar alunos, informando os dados necessários para identificá-los e disponibilizar o acesso à plataforma.            |
| RF-PRO-03 | Gerenciamento de alunos          | Alta       | O professor deve consultar e atualizar os dados dos alunos cadastrados, mantendo suas informações organizadas.                            |
| RF-PRO-04 | Criação de treinos               | Alta       | O professor deve criar treinos personalizados e associá-los aos respectivos alunos.                                                       |
| RF-PRO-05 | Gerenciamento de exercícios      | Alta       | O professor deve adicionar, remover e organizar exercícios que compõem cada treino.                                                       |
| RF-PRO-06 | Configuração dos exercícios      | Alta       | O professor deve definir séries, repetições, cargas, intervalos de descanso e orientações específicas para cada exercício.                |
| RF-PRO-07 | Organização dos treinos          | Alta       | O professor deve organizar os exercícios na sequência desejada, definindo a estrutura de execução do treino.                              |
| RF-PRO-08 | Edição de treinos                | Alta       | O professor deve conseguir alterar treinos previamente cadastrados, atualizando exercícios, séries, repetições, cargas e orientações.     |
| RF-PRO-09 | Disponibilização de treinos      | Alta       | O professor deve disponibilizar os treinos aos alunos associados, permitindo sua consulta na plataforma do aluno.                         |
| RF-PRO-10 | Gerenciamento da disponibilidade | Média      | O professor deve conseguir alterar a disponibilidade de um treino, permitindo controlar quais prescrições permanecem acessíveis ao aluno. |
