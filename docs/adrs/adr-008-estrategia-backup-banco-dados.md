# ADR-008 — Estratégia de Backup do Banco de Dados

**Status:** Aceito  
**Data:** 15/11/2026  
**Tema:** Persistência e recuperação de dados

## 1. Contexto

O banco de dados PostgreSQL do EasyFIT está hospedado em um container Docker no Droplet da DigitalOcean. Para reduzir os riscos de perda de informações em situações de falha na infraestrutura, é necessário estabelecer uma estratégia de backup externo, permitindo a recuperação dos dados armazenados no servidor.

A estratégia deve contemplar a geração automatizada dos backups, seu armazenamento externo, retenção, tratamento de falhas e validação periódica da restauração.

## 2. Decisão

Foi definido utilizar backups lógicos completos do banco de dados PostgreSQL, gerados diariamente pelo `pg_dump`, no formato Custom (`.dump`).

Os arquivos serão armazenados no Google Cloud Storage (GCS), em um bucket privado localizado na região `US-CENTRAL1`, utilizando a classe de armazenamento Nearline.

A execução será automatizada pelo `cron`, diretamente no Droplet da DigitalOcean, seguindo as definições:

- **Frequência:** diária, às 02h00 (horário de Brasília).
- **Escopo:** backup completo do banco de dados EasyFIT.
- **Formato:** arquivo `.dump`, gerado pelo `pg_dump`.
- **Armazenamento:** Google Cloud Storage, região `US-CENTRAL1`, classe Nearline.
- **Retenção:** 30 dias, com exclusão automática após 31 dias para respeitar o período mínimo de armazenamento da classe Nearline.
- **Organização:** arquivos separados por ano e mês, identificados pela data e horário de geração.

### 2.1. Organização dos arquivos

Os backups deverão seguir a seguinte estrutura:

```text
easyfit-backups/
└── postgresql/
    └── 2026/
        └── 11/
            ├── easyfit_2026-11-15_020000.dump
            └── easyfit_2026-11-16_020000.dump
```

Os registros de execução deverão ser mantidos em logs, permitindo identificar o resultado das operações e eventuais falhas.

### 2.2. Automação e tratamento de falhas

A rotina de backup será executada pelo `cron`, seguindo estas etapas:

1. Gerar um novo backup completo do banco de dados.
2. Armazenar temporariamente o arquivo no Droplet.
3. Enviar o backup mais recente ao Google Cloud Storage, priorizando-o em relação aos arquivos pendentes.
4. Manter os arquivos cujo envio não foi confirmado para novas tentativas nas próximas execuções.
5. Remover os arquivos locais após a confirmação do envio.

Caso ocorram falhas na geração ou transferência, a ocorrência deverá ser registrada em log. Novos backups continuarão sendo gerados diariamente, e os arquivos pendentes permanecerão armazenados localmente até o envio bem-sucedido.

O espaço disponível no Droplet deverá ser monitorado para evitar que o acúmulo de arquivos pendentes comprometa a infraestrutura.

### 2.3. Segurança

O armazenamento dos backups deverá seguir as seguintes medidas:

- Bucket privado, sem acesso público.
- Conta de serviço exclusiva para a rotina de backup, com permissões restritas.
- Criptografia padrão do Google Cloud Storage para os arquivos armazenados.
- Utilização de HTTPS/TLS durante a transferência dos arquivos.

### 2.4. Recuperação e validação

A recuperação dos dados será realizada por meio do `pg_restore`, utilizando os arquivos `.dump` armazenados no Google Cloud Storage.

Deverá ser realizado um teste mensal de restauração em um ambiente separado da produção, verificando a integridade e a possibilidade de recuperação dos dados.

## 3. Justificativa

A utilização do Google Cloud Storage permite manter os backups em uma infraestrutura externa ao servidor principal, reduzindo o risco de perda simultânea do banco de dados e de suas cópias.

O formato Custom do PostgreSQL facilita a restauração completa ou seletiva dos dados. A classe Nearline oferece menor custo de armazenamento em comparação à classe Standard, sendo adequada para arquivos acessados principalmente em situações de recuperação.

A automação pelo `cron` simplifica a execução periódica dos backups, enquanto a retenção de 30 dias mantém um histórico recente de cópias disponíveis.

A priorização dos backups mais recentes e a manutenção local dos arquivos pendentes permitem continuar gerando cópias mesmo diante de falhas temporárias de comunicação com o serviço de armazenamento.

## 4. Consequências

### Positivas

- Backups armazenados fora da infraestrutura principal.
- Redução do risco de perda definitiva dos dados centralizados.
- Geração automatizada de cópias diárias.
- Histórico de backups com retenção definida.
- Possibilidade de recuperação utilizando ferramentas nativas do PostgreSQL.
- Validação periódica da estratégia por meio de testes de restauração.

### Negativas

- Custos adicionais relacionados ao armazenamento e às operações do Google Cloud Storage.
- Dependência de conectividade e do serviço externo para envio e recuperação dos arquivos.
- Consumo de espaço no Droplet durante a manutenção de backups pendentes.
- Necessidade de monitorar a execução das rotinas e realizar testes periódicos de restauração.
- A classe Nearline possui cobrança pela recuperação dos arquivos.

### Limitações

- A estratégia protege os dados armazenados no PostgreSQL, não contemplando os dados temporários mantidos localmente nos dispositivos dos alunos.
- A restauração depende da disponibilidade dos arquivos de backup e das credenciais de acesso ao GCS.
- A região `US-CENTRAL1` mantém os dados armazenados nos Estados Unidos, devendo ser considerada na avaliação dos requisitos de proteção e transferência internacional de dados.

## 5. Referências
- [Google Cloud Storage — Preços e classes de armazenamento](https://cloud.google.com/storage/pricing)
- [Google Cloud Storage — Localizações](https://cloud.google.com/storage/docs/locations)
- [PostgreSQL — pg_dump](https://www.postgresql.org/docs/current/app-pgdump.html)
- [PostgreSQL — pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html)
