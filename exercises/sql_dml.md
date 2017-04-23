SQL Fundamentals [DML](https://launchschool.com/exercise_sets/78e88a34)

### 1. Set Up Database

For this set of exercises we'll want to create a new database and some tables to work with. The theme for the exercise is that of a workshop. Create a database to store information and tables related to this workshop.

One table should be called devices. This table should have columns that meet the following specifications:

Includes a primary key called id that is auto-incrementing.
A column called name, that can contain a String. It cannot be NULL.
A column called created_at that lists the date this device was created. It should be of type timestamp and it should also have a default value related to when a device is created.
In the workshop, we have several devices, and each device should have many different parts. These parts are unique to each device, so one device can have various parts, but those parts won't be used in any other device. Make a table called parts that reflects the information listed above. Table parts should have the following columns that meet the following specifications:

An id which auto-increments and acts as the primary key
A part_number. This column should be unique and not null.
A foreign key column called device_id. This will be used to associate various parts with a device.


#### Solution

```bash
$ createdb workshop
```
```sql
CREATE TABLE devices (
  id serial PRIMARY KEY,
  name VARCHAR(32),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE parts (
id serial PRIMARY KEY,
device_id int REFERENCES devices(id),
part_number NUMERIC UNIQUE
);


```

### 2. Insert Data for Parts and Devices

Now that we have the infrastructure for our workshop set up, let's start adding in some data. Add in two different devices. One should be named, "Accelerometer". The other should be named, "Gyroscope".

The first device should have 3 parts (this is grossly simplified). The second device should have 5 parts. The part numbers may be any number between 1 and 10000. There should also be 3 parts that don't belong to any device yet.


#### Solution

```sql
INSERT INTO devices (name) VALUES
('Accelerometer'),
('Gyroscope');

INSERT INTO parts (device_id, part_number) VALUES
(1, 1),
(1, 2),
(1, 5);

-- or without hard-coding the device_id:
INSERT INTO parts (part_number, device_id) VALUES
(4, (SELECT id FROM devices WHERE name ~ '^Gyro')),
(5, (SELECT id FROM devices WHERE name ~ '^Gyro')),
(6, (SELECT id FROM devices WHERE name ~ '^Gyro')),
(7, (SELECT id FROM devices WHERE name ~ '^Gyro')),
(8, (SELECT id FROM devices WHERE name ~ '^Gyro'));

INSERT INTO parts (part_number) VALUES
(9),
(10),
(11);
```


### 3. INNER JOIN

Write an SQL query to display all devices along with all the parts that make them up. We only want to display the name of the devices. It's parts should only display the part_number.

Expected output:

```SQL
     name      | part_number
---------------+-------------
 Accelerometer |          12
 Accelerometer |          14
 Accelerometer |          16
 Gyroscope     |          31
 Gyroscope     |          33
 Gyroscope     |          35
 Gyroscope     |          37
 Gyroscope     |          39
(8 rows)
```

NOTE: The part numbers and sequence may vary from those shown above.


#### Solution

```sql
SELECT devices.name, parts.part_number FROM devices
INNER JOIN parts ON devices.id=parts.device_id;
```


### 4. SELECT part_number

We want to grab all parts that have a part_number that starts with 3. Write a SELECT query to get this information. This table may show all attributes of the parts table.


#### Solution

```sql
SELECT * FROM parts WHERE (CAST (part_number AS text)) LIKE '%3';

--GIVEN SOLUTION:
SELECT * FROM parts WHERE part_number::text LIKE '%3';
```


### 5. Aggregate Functions

Write an SQL query that returns a result table with the name of each device in our database together with the number of parts for that device.


#### Solution

```sql
SELECT devices.name, COUNT(parts.part_number) FROM devices LEFT OUTER JOIN
parts ON devices.id=parts.device_id GROUP BY devices.id;
```


### 6. ORDER BY

In the previous exercise, we had to use a GROUP BY clause to obtain the expected output. In that exercise, we used an SQL query like:

```sql
SELECT devices.name AS name, COUNT(parts.device_id) 
FROM devices
JOIN parts ON devices.id = parts.device_id 
GROUP BY devices.name;
```

Now, we want to work with the same query, but we want to guarantee that the devices and the count of their parts are listed in ascending alphabetical order. Alter the SQL query above so that we get a result table that looks like the following.

```sql
name          | count
--------------+-------
Accelerometer |     3
Gyroscope     |     5
(2 rows)
```



#### Solution

```sql
ELECT devices.name, COUNT(parts.part_number) FROM devices LEFT OUTER JOIN
parts ON devices.id=parts.device_id GROUP BY devices.id ORDER BY devices.name;
```


### 7. IS NULL and IS NOT NULL

Write two SQL queries:

One that generates a listing of parts that currently belong to a device.
One that generates a listing of parts that don't belong to a device.
Do not include the id column in your queries.

Expected Output:

```sql
part_number | device_id 
------------+-----------
         12 |         1
         14 |         1
         16 |         1
         31 |         2
         33 |         2
         35 |         2
         37 |         2
         39 |         2
(8 rows)
part_number | device_id 
------------+-----------
         50 |          
         54 |          
         58 |        
(3 rows)
```


#### Solution

```sql
SELECT part_number, device_id FROM parts WHERE device_id IS NOT NULL;

SELECT part_number, device_id FROM parts WHERE device_id IS NULL;
```


### 8. Oldest Device

Insert one more device into the devices table. You may use this SQL statement or create your own.

```sql
INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);
```

Assuming nothing about the existing order of the records in the database, write an SQL statement that will return the name of the oldest device from our devices table.

#### Solution

```sql
SELECT name FROM devices ORDER BY age(created_at) DESC LIMIT 1;
```


### 9. UPDATE device_id

We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an "Accelerometer". Write an SQL statement that will associate the last two parts from our parts table with an "Accelerometer" instead of a "Gyroscope".


#### Solution

```sql
UPDATE parts SET device_id = 1 WHERE id=7 OR id=8;
```
#### Further Exploration

What if we wanted to set the part with the smallest part_number to be associated with "Gyroscope"? How would we go about doing that?

#### Solution:

```sql
UPDATE parts SET device_id=2 WHERE part_number=(SELECT MIN(part_number) FROM parts);
```

### 10. Delete Accelerometer

Our workshop has decided to not make an Accelerometer after all. Delete any data related to "Accelerometer", this includes the parts associated with an Accelerometer.


#### Solution

```sql
--to avoid problems with foreign key constraints, remove parts first:
DELETE FROM parts WHERE device_id=(SELECT id FROM devices WHERE
name='Accelerometer');

DELETE FROM devices WHERE name='Accelerometer');
```

#### Further Exploration

This process may have been a bit simpler if we had initially defined our devices tables a bit differently. We could delete both a device and its associated parts with one SQL statement if that were the case. What change would have to have to be made to table devices to make this possible? Also, what SQL statement would you have to write that can delete both a device and its parts all in one go?

#### Solution:

Deletion would have been easier if we had added a cascade on delete clause when defining the foreign key.

```sql
--in creating the foreign key, the line should have been:
device_id int REFERENCES devices(id) ON DELETE CASCADE;
```


