#!/bin/bash

PRISMA_DIR="prisma"
MIGRATIONS_DIR="$PRISMA_DIR/migrations"

# Проверяем наличие директории с миграциями
if [ -d "$MIGRATIONS_DIR" ]; then
  echo "Migration directory found."

  # Проверяем статус миграций
  MIGRATION_STATUS=$(npx prisma migrate status)

  if echo "$MIGRATION_STATUS" | grep -q -E 'No pending migrations|No migration found in prisma/migrations'; then
    echo "No pending migrations. Running 'prisma db push'..."
    npx prisma db push || { echo "Error during 'db push'. Exiting."; exit 1; }
  else
    echo "Pending migrations found. Deploying migrations..."
    npx prisma migrate deploy || { echo "Error during 'migrate deploy'. Exiting."; exit 1; }
  fi
else
  echo "Migration directory not found. Initializing migration..."
  npx prisma migrate dev --name init || { echo "Error during initial migration. Exiting."; exit 1; }
fi
