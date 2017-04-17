SQL Fundamentals [Easy 1](https://launchschool.com/exercise_sets/a2db9fe6)
(Sequel solutions not part of original exercises/expectations)

### 1.  Create a Database

Create a new database called animals.

### Solution
```
$ createdb animals
```

or from within the psql console:
```sql
CREATE DATABASE animals;
```

### 2. Create a Table

Make a table called birds. This table should have the following fields:

name (string, large enough to hold a 25 character value)
age (integer)
species (string, large enough to hold a 15 character value)
Make sure to include a primary key as well; that field should be a serial type.


### Solution
```sql
CREATE TABLE birds (
id serial,
name VARCHAR(25) NOT NULL,
age int,
species VARCHAR(15) NOT NULL,
PRIMARY KEY(id)
);
```

### Sequel Solution

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'animals')

DB.create_table(:birds) do
  primary_key :id
  String :name, :size=>25, :null=>false
  Integer :age
  String :species, :size=>15, :null=>false
end

DB.disconnect
```

### 3. Insert Data

For this exercise, we'll add some data to our birds table. Add five records to this database so that our data looks like:
```sql
 id |   name   | age | species 
----+----------+-----+---------
  1 | Charlie  |   3 | Finch
  2 | Allie    |   5 | Owl
  3 | Jennifer |   3 | Magpie
  4 | Jamie    |   4 | Owl
  5 | Roy      |   8 | Crow
(5 rows)
```

### Solution
```sql
INSERT INTO birds (name, age, species)
VALUES 
('Charlie', 3, 'Finch'),
('Allie', 5, 'Owl'),
('Jennifer', 3, 'Magpie'),
('Jamie', 4, 'Owl'),
('Roy', 8, 'Crow');
```
### Sequel Solution

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'animals')

DB[:birds].insert(:name=>'Charlie', :age=>3, :species=>'Finch')
DB[:birds].insert(:name=>'Allie', :age=>5, :species=>'Owl')
DB[:birds].insert(:name=>'Jennifer', :age=>3, :species=>'Magpie')
DB[:birds].insert(:name=>'Jamie', :age=>4, :species=>'Owl')
DB[:birds].insert(:name=>'Roy', :age=>8, :species=>'Crow')

DB.disconnect
```

### 4. SELECT

Write an SQL statement to query all data that is currently in our birds table.


### Solution
```sql
SELECT * FROM birds;
```

### Sequel Solution

```ruby
DB[:birds].all
```

### 5. WHERE Clause

In this exercise, let's practice filtering the data we want to query. Using a WHERE clause, SELECT records for birds under the age of 5.

### Solution
```sql
SELECT * FROM birds WHERE age < 5;
```

### Sequel Solution

```ruby
DB[:birds].where { age < 5 }.all
```

### 6.  Update Data

It seems there was a mistake when we were inserting data in the birds table. One of the rows has a species of 'Crow', but that bird is actually a Raven. Update the birds table so that a row with a species of 'Crow' now reads 'Raven'.


### Solution
```sql
UPDATE birds SET species = 'Raven' WHERE species = 'Crow';
```

### Sequel Solution
```ruby
DB[:birds].where(:species=>'Crow').update(:species=>'Raven')
```

### Further Exploration

Oops. Jamie isn't an Owl - he's a Hawk. Correct his information.

### Solution

```sql
UPDATE birds SET species = 'Hawk' WHERE name = 'Jamie';
```

### Sequel Solution
```ruby
DB[:birds].where(:name=>'Jamie').update(:species=>'Hawk')
```

### 7. Delete Data

Write an SQL statement that deletes the record that describes a 3 year-old finch.

### Solution
```sql
DELETE FROM birds WHERE species = 'Finch' AND age = 3;
```

### Sequel Solution
```ruby
DB[:birds].where(:species=>'Finch', :age=>3).delete
```

### 8. Add Constraint

When we initially created our birds table, we forgot to take into account a key factor: preventing certain values from being entered into the database. For instance, we would never find a bird that is negative n years old. We could have included a constraint to ensure that bad data isn't entered for a database record, but we forgot to do so.

For this exercise, write some code that ensures that only birds with a positive age may be added to the database. Then write and execute an SQL statement to check that this new constraint works correctly.

### Solution
```sql
ALTER TABLE birds ADD CONSTRAINT check_age CHECK (age >= 0);
-- or if providing a name isn't important:
ALTER TABLE birds ADD CHECK (age >= 0);
```

```ruby
DB.alter_table(:birds) do
  add_constraint(:check_age) {age >=0 }
end
```

### 9. Drop Table

It seems we are done with our birds table, and no longer have a need for it in our animals database. Write an SQL statement that will drop the birds table and all its data from the animals database.

### Solution
```sql
DROP TABLE birds;
```

### Sequel Solution

```ruby
DB.drop_table(:birds)
```

### 10. Drop Database

Let's finish things up by dropping the database animals. With no tables in it, we don't have much use for it any more. Write an SQL statement or PostgreSQL command to drop the animals database.


### Solution
```sql
DROP DATABASE animals;
```

```bash
dropdb animals
```