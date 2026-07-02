# Monitoramento

### Prometheus

Responsável por coletar métricas dos serviços.

Porta: `9090`

---

### Grafana

Responsável pela visualização das métricas em dashboards.

Porta: `3000`

---

### Node Exporter

Coleta métricas do sistema operacional:

* CPU
* Memória
* Disco
* Rede

Porta: `9100`

---

### cAdvisor

Monitora containers Docker:

* Uso de CPU por container
* Memória
* Rede
* Status dos containers

Porta: `8081`

---

### PostgreSQL Exporter

Coleta métricas do banco de dados:

* Conexões ativas
* Queries
* Performance
* Estatísticas internas

Porta: `9187`

---

## Fluxo de dados

```text
Node Exporter ─┐
cAdvisor       ├──> Prometheus ───> Grafana (Dashboards)
Postgres Exporter ┘
```

---

## Dashboards recomendados

No Grafana, recomenda-se criar painéis com:

* Uso de CPU por host
* Uso de memória
* Uso de disco
* Estado dos containers
* Performance do PostgreSQL

---

## Alertas (futuro)

Possível evolução do projeto:

* CPU acima de 80%
* Disco acima de 90%
* Container fora do ar

