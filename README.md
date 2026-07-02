# Infra Lab

Ambiente de infraestrutura desenvolvido com Docker Compose para estudos e prática de administração Linux, banco de dados PostgreSQL, monitoramento e automação.

---

## Objetivo

Este projeto foi criado com o objetivo de simular um ambiente de infraestrutura próximo ao utilizado em produção, reunindo serviços amplamente utilizados no mercado e aplicando boas práticas de organização, monitoramento e gerenciamento de dados.

Durante o desenvolvimento foram implementados recursos como persistência de volumes, monitoramento com Prometheus e Grafana, exportação de métricas do sistema e do PostgreSQL, automação de backup e restauração do banco de dados e documentação da infraestrutura.

---

## Tecnologias Utilizadas

* Debian 13
* Docker
* Docker Compose
* PostgreSQL 17
* pgAdmin 4
* Nginx
* Prometheus
* Grafana
* Node Exporter
* PostgreSQL Exporter
* cAdvisor

---

## Estrutura do Projeto

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

## Funcionalidades

* [x] Ambiente Docker Compose
* [x] PostgreSQL 17
* [x] Administração via pgAdmin
* [x] Servidor Web Nginx
* [x] Monitoramento com Prometheus
* [x] Dashboards no Grafana
* [x] Node Exporter
* [x] cAdvisor
* [x] PostgreSQL Exporter
* [x] Persistência de volumes
* [x] Backup automatizado
* [x] Restauração automatizada
* [x] Healthchecks dos serviços

---

## Como Executar

Clone o repositório.

Copie o arquivo `.env.example` para `.env`.

Suba os containers utilizando:

```bash
docker compose up -d
```

Verifique o status:

```bash
docker compose ps
```

---

## Serviços

| Serviço             | Porta |
| ------------------- | ----: |
| PostgreSQL          |  5432 |
| pgAdmin             |  8080 |
| Nginx               |    80 |
| Prometheus          |  9090 |
| Grafana             |  3000 |
| Node Exporter       |  9100 |
| PostgreSQL Exporter |  9187 |
| cAdvisor            |  8081 |

---

## Backup

Executar:

```bash
./scripts/backup-postgres.sh
```

Os backups são armazenados em:

```text
backups/postgres/
```

---

## Restore

Executar:

```bash
./scripts/restore-postgres.sh caminho/do/backup.sql.gz
```

O script cria automaticamente um banco de testes e restaura o backup para validação.

---

## Monitoramento

O ambiente conta com monitoramento em tempo real utilizando Prometheus e Grafana.

As métricas incluem:

* Uso de CPU
* Memória
* Disco
* Containers Docker
* Estatísticas do PostgreSQL

---

## Documentação

A documentação complementar está disponível na pasta `docs/`.

* Arquitetura
* Instalação
* Backup
* Monitoramento
* Troubleshooting
* Roadmap

---

## Autor

**Wendel Sena**
