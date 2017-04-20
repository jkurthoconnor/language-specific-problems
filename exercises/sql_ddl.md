SQL Fundamentals [DDL](https://launchschool.com/exercise_sets/7d622479)
(with additional Sequel solutions)

### 1. Create an Extrasolar Planetary Database

For this exercise set, we will be working with the DDL statements to create and modify tables in a database that tracks planets around stars other than our Sun. To get started, first create a postgresql database named "extrasolar", and then create two tables in the database as follows:

stars table

id: a unique serial number that auto-increments and serves as a primary key for this table.
name: the name of the star,e,g., "Alpha Centauri A". Allow room for 25 characters. Must be unique and non-null.
distance: the distance in light years from Earth. Define this is a whole number (e.g., 1, 2, 3, etc) that must be non-null and greater than 0.
spectral_type: the spectral type of the star: O, B, A, F, G, K, and M. Use a one character string.
companions: how many companion stars does the star have? A whole number will do. Must be non-null and non-negative.

planets table

id: a unique serial number that auto-increments and serves as a primary key for this table.
designation: a single alphabetic character that uniquely identifies the planet in its star system ('a', 'b', 'c', etc.)
mass: estimated mass in terms of Jupiter masses; use an integer for this value.

#### Solution

```bash
createdb extrasolar
```
or
```sql 
CREATE DATABASE extrasolar
```

```sql
CREATE TABLE stars (
  id serial PRIMARY KEY,
  name VARCHAR(25) NOT NULL UNIQUE
);

ALTER TABLE stars ADD COLUMN distance int NOT NULL
CONSTRAINT distance_check CHECK (distance > 0);

ALTER TABLE stars ADD COLUMN companions int NOT NULL
CHECK (companions >= 0);

ALTER TABLE stars ADD COLUMN spectral_type CHAR(1);

--a table could be created in one statement as well, like:
CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation CHAR(1) UNIQUE,
  mass int
);
```

```ruby
DB.create_table :stars do
  primary_key :id
  String :name, :size=>25, :null=>false, :unique=>true
  Integer :distance, :null=>false
  constraint(:distance_positive) { distance > 0 }
  Integer :companions, :null=>false
  constraint(:companions_non_neg) { companions >= 0 }
  String :spectral_type, :size=>1
  constraint(:spectral_type_check) { spectral_type =~ /[OBAFGKM]/ }
end

DB.create_table :planets do
  primary_key :id
  String :designation, :fixed=>true, :size=>1, :unique=>true
  Integer :mass
end
```

### 2. Relating Stars and Planets

You may have noticed that, when we created the stars and planets tables, we did not do anything to establish a relationship between the two tables. They are simply standalone tables that are related only by the fact that they both belong to the extrasolar database. However, there is no relationship between the rows of each table.

To correct this problem, add a star_id column to the planets table; this column will be used to relate each planet in the planets table to its home star in the stars table. Make sure the row is defined in such a way that it is required and must have a value that is present as an id in the stars table.

#### Solution

```sql
ALTER TABLE planets ADD COLUMN star_id int NOT NULL REFERENCES stars (id);
```

```ruby
DB.alter_table :planets do
  add_foreign_key :star_id, :stars, :null=>false
end
```

### 3. Increase Star Name Length

Hmm... it turns out that 25 characters isn't enough room to store a star's complete name. For instance, the star "Epsilon Trianguli Australis A" requires 30 characters. Modify the column so that it allows star names as long as 50 characters

#### Solution

```sql
ALTER TABLE stars ALTER COLUMN name SET DATA TYPE VARCHAR(50);
```

```ruby
DB.alter_table :stars do
  set_column_type :name, 'varchar(50)'  # string or symbols passed in as type will be used verbatim as SQL type
end
```
Further Exploration

Assume the stars table already contains one or more rows of data. What will happen when you try to run the above command? 

#### Solution

The command should work, as the change from allowing fewer to more characters in a column wouldn't raise any inconsistencies with existing data.


### 4. Stellar Distance Precision

For many of the closest stars, we know the distance from Earth fairly accurately; for instance, Proxima Centauri is roughly 4.3 light years away. Our database, as currently defined, only allows integer distances, so the most accurate value we can enter is 4. Modify the distance column in the stars table so that it allows fractional light years to any degree of precision required.

#### Solution

```sql
ALTER TABLE stars ALTER COLUMN distance TYPE numeric;
```

```ruby
DB.alter_table :stars do
  set_column_type :distance, :numeric # string or symbols passed in as type will be used verbatim as SQL type
end
```

#### Further Exploration

Assume the stars table already contains one or more rows of data. What will happen when you try to run the above command? To test this, revert the modification and add a row or two of data:

```sql
ALTER TABLE stars
ALTER COLUMN distance TYPE integer;

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Orionis', 643, 'M', 9);

ALTER TABLE stars
ALTER COLUMN distance TYPE numeric ;
```

Solution: it won't raise any objections; just as before, we are changing the data type to a more inclusive category that is consistent with the existing data.

### 5.Check Values in List

The spectral_type column in the stars table is currently defined as a one-character string that contains one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'. However, there is currently no enforcement on the values that may be entered. Add a constraint to the table stars that will enforce the requirement that a row must hold one of the 7 listed values above. Also, make sure that a value is required for this column.


#### Solution:

```sql
ALTER TABLE stars ADD CHECK (spectral_type in ('O', 'B', 'A', 'F', 'G', 'K', 'M'));

ALTER TABLE stars ALTER COLUMN spectral_type SET NOT NULL;
```

```ruby
# when creating the table, already used a regex to check type was one of required values

DB.alter_table :stars do
  set_column_not_null :spectral_type
end
```

#### Further Exploration

Assume the stars table contains one or more rows that are missing a spectral_type value, or that have an illegal value. What will happen when you try to alter the table schema? How would you go about adjusting the data to work around this problem. To test this, revert the modification and add some data:

#### Solution:

In the above case psql would raise an exception and disallow altering the table schema.  
```psql
ERROR:  check constraint "stars_spectral_type_check" is violated by some row
```
To get around this one would need to delete the incompatible data and then/or replace empty fields with data the new constraint will allow.

### 6. Enumerated Types

In the previous exercise, we added a CHECK constraint to the stars table to enforce that the value stored in the spectral_type column for each row is valid. In this exercise, we will use an alternate approach to the same problem.

PostgreSQL provides what is called an enumerated data type; that is, a data type that must have one of a finite set of values. For instance, a traffic light can be red, green, or yellow: these are enumerate values for the color of the currently lit signal light.

Modify the stars table to remove the CHECK constraint on the spectral_type column, and then modify the spectral_type column so it becomes an enumerated type that restricts it to one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'.

#### Solution:

```sql
ALTER TABLE stars DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectral_types AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars ALTER COLUMN spectral_type TYPE spectral_types
USING spectral_type::spectral_types;
```

### 7. Planetary Mass Precision

We will measure Planetary masses in terms of the mass of Jupiter. As such, the current data type of integer is inappropriate; it is only really useful for planets as large as Jupiter or larger. These days, we know of many extrasolar planets that are smaller than Jupiter, so we need to be able to record fractional parts for the mass. Modify the mass column in the planets table so that it allows fractional masses to any degree of precision required. In addition, make sure the mass is required and positive.

While we're at it, also make the designation column required.

#### Solution:

```sql
ALTER TABLE planets ALTER COLUMN mass SET DATA TYPE numeric;

ALTER TABLE planets ADD CHECK (mass > 0);

ALTER TABLE planets
  ALTER COLUMN mass SET NOT NULL,
  ALTER COLUMN designation SET NOT NULL;
```
```ruby
DB.alter_table :planets do
  set_column_not_null :designation
  set_column_not_null :mass
  set_column_type :mass, :numeric
  add_constraint(:positive_mass) { mass > 0 }
end
```


### 8. Add a Semi-Major Axis Column

Add a semi_major_axis column for the semi-major axis of each planet's orbit; the semi-major axis is the average distance from the planet's star as measured in astronomical units (1 AU is the average distance of the Earth from the Sun). Use a data type of numeric, and require that each planet have a value for the semi_major_axis.

#### Solution:

```sql
ALTER TABLE planets ADD COLUMN semi_major_axis numeric NOT NULL;
```

```ruby
DB.alter_table :planets do
  add_column :semi_major_axis, Numeric, :null=>false
end
```

#### Further Exploration

Assume the planets table already contains one or more rows of data. What will happen when you try to run the above command? What will you need to do differently to obtain the desired result? To test this, delete the semi_major_axis column and then add a row or two of data (note: your stars table will also need some data that corresponds to the star_id values):

```sql
ALTER TABLE planets
DROP COLUMN semi_major_axis;

DELETE FROM stars;
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

INSERT INTO planets (designation, mass, star_id)
           VALUES ('b', 0.0036, 1); -- check star_id; see note below
INSERT INTO planets (designation, mass, star_id)
           VALUES ('c', 0.1, 2); -- check star_id; see note below

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;
```

NOTE: The semi_major_axis for Alpha Centauri B planet b is 0.04 AU while that for for Epsilon Eridani planet c is about 40 AU. Note also that the star_id values shown above may be different from what is in your database. Check your planets table to see which star_id values to use.

#### Solution:

Adding the column with NOT NULL when there is extant planet data will raise an exception (`ERROR:  column "semi_major_axis" contains null values`) because each planet will not yet have a value for semi_major_axis.  The resolve this, first add the column without the NOT NULL constraint; then add values for the semi_major_axis for each planet row; then add the NOT NULL constraint.

```sql
UPDATE planets SET semi_major_axis=0.04 WHERE id=1;
UPDATE planets SET semi_major_axis=40 WHERE id=2;

ALTER TABLE planets ALTER COLUMN semi_major_axis SET NOT NULL;
```

### 9. Add a Moons Table

Someday in the future, technology will allow us to start observing the moons of extrasolar planets. At that point, we're going to need a moons table in our extrasolar database. For this exercise, your task is to add that table to the database. The table should include the following data:

id: a unique serial number that auto-increments and serves as a primary key for this table.
designation: the designation of the moon. We will assume that moon designations will be numbers, with the first moon discovered for each planet being moon 1, the second moon being moon 2, etc. The designation is required.
semi_major_axis: the average distance in kilometers from the planet when a moon is farthest from its corresponding planet. This field must be a number greater than 0, but is not required; it may take some time before we are able to measure moon-to-planet distances in extrasolar systems.
mass: the mass of the moon measured in terms of Earth Moon masses. This field must be a numeric value greater than 0, but is not required.
Make sure you also specify any foreign keys necessary to tie each moon to other rows in the database.

#### Solution:

```sql
CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation int NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id int NOT NULL REFERENCES planets(id),
  star_id int NOT NULL REFERENCES stars(id) --not necessary b/c already available through planets table
);
```


### 10. Delete the extrasolar database. Use the psql console -- don't use the terminal level commands.

```
\c jko
DROP DATABASE extrasolar
```