#!/bin/bash

if [ -z "$1" ]; then
  echo "Ошибка: имя миграции не указано!"
  echo "Использование: ./run_migrate.sh <имя_миграции>"
  exit 1
fi

MIGRATION_NAME=$1

docker exec -it backend npx prisma migrate dev --name "$MIGRATION_NAME"