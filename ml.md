
ML in Postfre

https://www.cybertec-postgresql.com/en/machine-learning-in-postgresql-part-1-kmeans-clustering/


UI for Heroku

https://github.com/hasura/graphql-engine



https://www.graphile.org/postgraphile/pricing/

https://github.com/graphile/postgraphile


1: Create a Postgress docker container

```docker run --name container_name -e POSTGRES_PASSWORD=Password1 -d postgres```

```docker ps```

To remove container:

```docker rm -f container_name```

2: Connect and run some queries

Execure command inline:

```docker exec -it container_name psql -U postgres -c "CREATE DATABASE demo_db2"```

Starting command prompt to execute commands:

```docker exec -it container_name psql -U postgres```

For exit:

```\q```

3: Automate - run stripts using docker cli

Mount a folter when creating a container:

```docker run --name container_name v "$PWD"/:/opt/demo/ -e POSTGRES_PASSWORD=Password1 -d postgres```

Execure sql file

```docker exec -it container_name psql -U postgres -f /opt/demo/script_demo1.sql```

Script example:

\c demo_db2
CREATE TABLE demo_t(something t);
INSERT INTO demo_t (something) VALUES (1);
