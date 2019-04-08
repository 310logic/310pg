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