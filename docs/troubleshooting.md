## Problemas comuns


## 1. Container não sobe

### Sintoma

Container entra em restart ou nem inicia.

### Solução

```bash
docker logs <container>
```

Verificar:

* variáveis de ambiente
* portas em uso
* volumes inexistentes

---

## 2. Grafana pede login inicial novamente

### Causa

Volume de persistência não montado ou perdido.

### Solução

Verificar:

```bash
docker volume ls | grep grafana
```

Garantir volume:

```yaml
- grafana_data:/var/lib/grafana
```

---

## 3. Prometheus não encontra targets

### Solução

Verificar:

```bash
http://localhost:9090/targets
```

Checar `prometheus.yml`.

---

## 4. Erro de variável no docker-compose

### Sintoma

```text
The "POSTGRES_DB" variable is not set
```

### Solução

Garantir existência do `.env`:

```bash
cat docker/.env
```

---

## 5. Node Exporter não mostra disco correto

### Solução

Verificar mounts:

```yaml
- /proc:/host/proc:ro
- /sys:/host/sys:ro
- /:/rootfs:ro
```

---

## 6. Container name conflict

### Solução

Remover container antigo:

```bash
docker rm -f <container>
```

---
