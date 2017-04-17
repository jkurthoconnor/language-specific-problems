SQL Fundamentals [DML, DDL, DCL](https://launchschool.com/exercise_sets/eac14e3d)

### 1.

SQL consists of 3 different sublanguages. For example, one of these sublanguages is called the Data Control Language (DCL) component of SQL. It is used to control access to a database; it is responsible for defining the rights and roles granted to individual users. Common SQL DCL statements include:

GRANT
REVOKE

Name and define the remaining 2 sublanguages, and give at least 2 examples of each.


### Solution
DML, data manipulation language, is used to create, read/select, update and delete data within tables

DDL, data definition language, is used to create/define, modify and delete databases and tables; in other words, it handles the conditions (structures) under which the data is stored

```sql
-- DML examples
INSERT
UPDATE
DELETE
SELECT

--DDL examples
CREATE
ALTER
DROP
```


## 2. Does the following statement use the Data Definition Language (DDL) or the Data Manipulation Language (DML) component of SQL?

```sql
SELECT column_name FROM my_table;
```

### Solution

Data Manipulation Language


## 3. Does the following statement use the DDL or DML component of SQL?

```sql
CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
```


### Solution

Data Definition Language

## 4. Does the following statement use the DDL or DML component of SQL?

```sql
ALTER TABLE things
DROP CONSTRAINT things_item_key;
```


### Solution

Data Definition Language


## 5. Does the following statement use the DDL or DML component of SQL?

```sql
INSERT INTO things VALUES (3, 'Scissors', 'Metal');
```

### Solution

Data Manipulation Language


## 6. Does the following statement use the DDL or DML component of SQL?

```sql
UPDATE things
SET material = 'plastic'
WHERE item = 'Cup';
```


### Solution
DML


## 7. Does the following statement use the DDL, DML, or DCL component of SQL?

```
\d things
```


### Solution

That is a meta command for the postgres console; it acts as one or more commands in the DDL would because it shows the schema of `things`


## 8. Does the following statement use the DDL or DML component of SQL?

```sql
DELETE FROM things WHERE item = 'Cup';
```

### Solution

DML


## 9. Does the following statement use the DDL or DML component of SQL?

```sql
DROP DATABASE xyzzy;
```

### Solution

DDL

(answer is both DDL and DML: it both manipulates the data in a table (deletes it) and manipulated the table itself (drops/deletes it))


## 10. Does the following statement use the DDL or DML component of SQL?

```sql
CREATE SEQUENCE part_number_sequence;
```


### Solution

DDL because it creates a relationship that governs the generation of data for a table.


