# Backup e Restauração

### Script

O backup é realizado pelo script:

```bash
/scripts/backup-postgres.sh
```

---

### Execução

```bash
./scripts/backup-postgres.sh
```

---

### Resultado

Os backups são armazenados em:

```text
backups/postgres/
```

Exemplo de arquivo:

```text
backup_medical_shift_2026-07-01_16-26-41.sql.gz
```

---

### O que o script faz

* Gera dump do PostgreSQL
* Compacta com gzip
* Remove backups antigos automaticamente
* Mantém histórico organizado por data

---

## Restauração

### Script

```bash
/scripts/restore-postgres.sh
```

---

### Execução

```bash
./scripts/restore-postgres.sh caminho/do/backup.sql.gz
```

---

### Processo de restauração

1. Remove banco de teste antigo
2. Cria novo banco (`restore_test`)
3. Importa o backup
4. Valida tabelas restauradas

---
