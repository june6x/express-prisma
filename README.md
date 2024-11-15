# Express.js + TypeScript + Prisma + Docker 🐳🚀

Этот проект представляет собой шаблон для создания веб-приложений с использованием **Express.js**, **TypeScript**, **Prisma** и **Docker**. Он идеально подходит для разработки и тестирования серверных приложений в контейнерах.

## Структура проекта

- **Express.js**: Веб-фреймворк для Node.js 🚀.
- **TypeScript**: Статическая типизация для JavaScript 🔍.
- **Prisma**: ORM для работы с базой данных 🗄️.
- **Docker & Docker Compose**: Контейнеризация и управление многоконтейнерными приложениями 🐳.

## Требования для запуска 🛠️

- [Docker](https://www.docker.com/products/docker-desktop) 🐳
- [Docker Compose](https://docs.docker.com/compose/) 🔧

## Запуск
```shell 
docker compose build
 ```
```shell 
docker compose up -d
 ```
-d - запуск в фоне без логов
## Екстра 
**Команда для того, чтобы попасть в бд контейнер**
```shell 
docker exec -it db psql -U postgres -d postgres
 ```
**Попасть в бэк контейнер (id смотреть через docker ps):**
```shell 
docker exec -it <backend_id> sh
```

### Как работают миграции 
Внутри уже лежит init_migration.sh,create_migration.sh эти скриптики делают почти всю работу за вас. Если вдруг у вас нет миграций и вы 
запускаете базу в первый раз, то создаст вам инит миграцию.

Если случилось так, что вам нужно внести изменения в уже существующию базу то: 

1. Запускаем докер и после того, как все успешно запустилось меняем что-то в schema.prisms и сохраняем
   *ВАЖНО если изменения касаются не пустых таблиц, то нужно осторожно к этому подходить*
2. Запускаем ./create_migration {название_миграции} в терминале
3. После этого, если у призмы нет будет конфиликтов, то будет сообщение о успешном создании.
4. Остается проверить исполизуя
   ```shell
   docker exec -it db psql -U postgres -d postgres

