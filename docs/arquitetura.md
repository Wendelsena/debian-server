# Arquitetura do Projeto

## Visão Geral

O Infra Lab é um ambiente de infraestrutura desenvolvido com Docker Compose para simular um cenário real de administração de servidores Linux, banco de dados, monitoramento e automação de rotinas.

O objetivo do projeto é consolidar conhecimentos em Docker, PostgreSQL, monitoramento com Prometheus e Grafana, administração Linux, backup e restauração de banco de dados, além de boas práticas de organização de infraestrutura.

---

## Componentes

### PostgreSQL

Responsável pelo armazenamento dos dados da aplicação.

* Versão: PostgreSQL 17
* Porta: 5432
* Persistência de dados através de volume Docker

---

### pgAdmin

Ferramenta web utilizada para administração do PostgreSQL.

* Porta: 8080
* Conectado ao banco PostgreSQL pela rede Docker

---

### Nginx

Servidor Web utilizado como exemplo de serviço HTTP.

* Porta: 80
* Configuração personalizada através do arquivo `default.conf`

---

### Prometheus

Responsável pela coleta de métricas dos serviços monitorados.

Coleta informações de:

* Node Exporter
* cAdvisor
* PostgreSQL Exporter

Porta:

* 9090

---

### Grafana

Responsável pela visualização dos dashboards.

Permite acompanhar:

* Utilização de CPU
* Uso de memória
* Espaço em disco
* Containers Docker
* Métricas do PostgreSQL

Porta:

* 3000

---

### Node Exporter

Exporta métricas do sistema operacional.

Principais métricas:

* CPU
* Memória
* Disco
* Sistema de arquivos
* Rede

Porta:

* 9100

---

### cAdvisor

Monitora os containers Docker.

Principais métricas:

* Uso de CPU por container
* Uso de memória
* Rede
* Sistema de arquivos
* Status dos containers

Porta:

* 8081

---

### PostgreSQL Exporter

Exporta métricas específicas do PostgreSQL para o Prometheus.

Exemplos:

* Número de conexões
* Consultas executadas
* Estatísticas do banco
* Uso de recursos

Porta:

* 9187

---

## Fluxo da Arquitetura

```text
                Usuário
                   │
        ┌──────────┴──────────┐
        │                     │
      pgAdmin             Grafana
        │                     │
        │               Prometheus
        │             ┌────┴────┐
        │             │         │
 PostgreSQL   Node Exporter  cAdvisor
        │
 PostgreSQL Exporter
```

---

## Estrutura de Diretórios

```text
infra-lab/
├── backups/
├── docker/
├── docs/
├── monitoring/
├── screenshots/
├── scripts/
└── README.md
```

---

## Persistência de Dados

Os seguintes serviços utilizam volumes Docker:

* PostgreSQL
* Grafana
* Prometheus

Essa abordagem garante que os dados permaneçam disponíveis mesmo após a recriação dos containers.

---

## Segurança

As credenciais são armazenadas em um arquivo `.env`, que não é versionado no Git.

Para facilitar a configuração por outros usuários, o projeto disponibiliza um arquivo `.env.example` contendo apenas valores de exemplo.

