```mermaid
flowchart TD

Cliente --> Nginx

Nginx --> PostgreSQL

Prometheus --> NodeExporter
Prometheus --> cAdvisor
Prometheus --> PostgresExporter

Grafana --> Prometheus
```
