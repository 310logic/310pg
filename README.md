# 310pg

```
CREATE TABLE iris(
 
sepal_length REAL,
sepal_width REAL,
petal_length REAL,
petal_width REAL,
species varchar(20)
);
```

```
COPY iris FROM '/path/to/iris.data' DELIMITER ',';
```

## 1: Create a Postgress docker container

```docker pull postgres:latest```


```docker run --name container_name -e POSTGRES_PASSWORD=Password1 -d postgres```

or mapping port

```docker run --name container_name [-d -e POSTGRES_USER=posegres] -e POSTGRES_PASSWORD=Password1 -p 5432:5432 --restart=always kathlon/postgresql-plpython3```

```docker ps```

To remove container:

```docker rm -f container_name```

### Compbine Postgres and Pgadmin in one docker-compose file:

```
version: '3'
services:
  postgres:
    image: postgres
    hostname: postgres
    ports:
      - "6543:5432"
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: TEST_SM
    volumes:
      - postgres-data:/var/lib/postgresql/data
    restart: unless-stopped

  pgadmin:
    image: dpage/pgadmin4
    depends_on:
      - postgres
    ports:
      - "5555:80"
    environment:
      PGADMIN_DEFAULT_EMAIL: pgadmin4@pgadmin.org
      PGADMIN_DEFAULT_PASSWORD: admin
    restart: unless-stopped

volumes:
  postgres-data:
```

## 2: Connect and run some queries

Execure command inline:

```docker exec -it container_name psql -U postgres -c "CREATE DATABASE demo_db2"```

Starting command prompt to execute commands:

```docker exec -it container_name psql -U postgres```

For exit:

```\q```

## 3: Automate - run stripts using docker cli

Mount a folter when creating a container:

```docker run --name container_name v "$PWD"/:/opt/demo/ -e POSTGRES_PASSWORD=Password1 -d postgres```

Execure sql file

```docker exec -it container_name psql -U postgres -f /opt/demo/script_demo1.sql```

Script example:

\c demo_db2
CREATE TABLE demo_t(something t);
INSERT INTO demo_t (something) VALUES (1);
