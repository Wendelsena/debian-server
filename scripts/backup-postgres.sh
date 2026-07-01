#!/bin/bash

# Configurações
CONTAINER="postgres-lab"
USUARIO="admin"
BANCO="medical_shift"

DESTINO="/opt/infra-lab/backups/postgres"

RETENCAO=7

DATA=$(date +"%Y-%m-%d_%H-%M-%S")

ARQUIVO="backup_${BANCO}_${DATA}.sql"

mkdir -p "$DESTINO"

echo "======================================"
echo " Backup PostgreSQL"
echo " Data: $(date)"
echo "======================================"

echo "[1/4] Gerando backup..."

if docker exec "$CONTAINER" \
    pg_dump -U "$USUARIO" "$BANCO" \
    > "$DESTINO/$ARQUIVO"
then
    echo "Backup criado com sucesso."
else
    echo "ERRO ao gerar backup!"
    exit 1
fi

echo "[2/4] Compactando arquivo..."

gzip "$DESTINO/$ARQUIVO"

echo "Arquivo compactado."

echo "[3/4] Removendo backups antigos..."

find "$DESTINO" \
-type f \
-name "*.gz" \
-mtime +$RETENCAO \
-delete

echo "Limpeza concluída."

echo "[4/4] Backup finalizado."

echo
echo "Arquivo:"
echo "$DESTINO/${ARQUIVO}.gz"

echo
echo "Tamanho:"
du -h "$DESTINO/${ARQUIVO}.gz"

echo
echo "Processo concluído com sucesso!"
