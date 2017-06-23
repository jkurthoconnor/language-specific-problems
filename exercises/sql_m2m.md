SQL Fundamentals [Medium: Many to Many](https://launchschool.com/exercise_sets/361a0751)

### 1. Set up database.

Initially, we need to create a billing database with a customers table and a services table. The customers table should include the following columns:

id is a unique numeric customer id that auto-increments and serves as a primary key for this table.
name is the customer's name. This value is required and may contain names of any length.
payment_token is a string that is unique to each customer; it is used when contacting the payment processor to identify which customer should be charged for the services used. This value is required and should consist of a string of exactly 8 uppercase alphabetical letters.
The services table should include the following columns:

id is a unique numeric service id that auto-increments and serves as a primary key for this table.
description is the service description. This value is required and may contain any text.
price is the yearly service price. It is required, must be greater than or equal to 0.00, and should be defined as numeric(10, 2).

-- Data for the customers table

id | name          | payment_token
--------------------------------
1  | Pat Johnson   | XHGOAHEQ
2  | Nancy Monreal | JKWQPJKL
3  | Lynn Blake    | KLZXWEEE
4  | Chen Ke-Hua   | KWETYCVX
5  | Scott Lakso   | UUEAPQPS
6  | Jim Pornot    | XKJEYAZA

-- Data for the services table

id | description         | price
---------------------------------
1  | Unix Hosting        | 5.95
2  | DNS                 | 4.95
3  | Whois Registration  | 1.95
4  | High Bandwidth      | 15.00
5  | Business Support    | 250.00
6  | Dedicated Hosting   | 50.00
7  | Bulk Email          | 250.00
8  | One-to-one Training | 999.00

Once you have entered the data into your tables, create a join table that associates customers with services and vice versa. Enter some data that shows which services each customer uses as follows:

Pat Johnson uses Unix Hosting, DNS, and Whois Registration
Nancy Monreal doesn't have any active services
Lynn Blake uses Unix Hosting, DNS, Whois Registration, High Bandwidth, and Business Support
Chen Ke-Hua uses Unix Hosting and High Bandwidth
Scott Lakso uses Unix Hosting, DNS and Dedicated Hosting
Jim Pornot uses Unix Hosting, Dedicated Hosting, and Bulk Email
The customer id in this table should be set such that deleting the corresponding customer record from the customers table will automatically delete all rows from the join table that have the corresponding customer_id. Do not apply this attribute to service id.

#### Solution:

```sql
CREATE DATABASE billing;

\c billing

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token CHAR(8) UNIQUE NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$') 
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token) VALUES
('Pat Johnson', 'XHGOAHEQ'),
('Nancy Monreal', 'JKWQPJKL'),
('Lynn Blake', 'KLZXWEEE'),
('Chen Ke-Hua', 'KWETYCVX'),
('Scott Lakso', 'UUEAPQPS'),
('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price) VALUES
('Unix Hosting', 5.95),
('DNS', 4.95),
('Whois Registration', 1.95),
('High Bandwidth', 15.00),
('Business Support', 250.00),
('Dedicated Hosting', 50.00),
('Bulk Email', 250.00),
('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id int REFERENCES customers(id) ON DELETE CASCADE,
  service_id int REFERENCES services(id)
  UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 4),
(5, 1),
(5, 2),
(5, 6),
(6, 1),
(6, 6),
(6, 7);
```
### 2. Get Customers With Services

Write a query to retrieve the customer data for every customer who currently subscribes to at least one service.

#### Solution

```sql
SELECT c.id, c.name, c.payment_token, string_agg(s.description, ', ') AS services
FROM customers AS c INNER JOIN customers_services
ON c.id=customers_services.customer_id
INNER JOIN services AS s ON s.id=customers_services.service_id
GROUP BY c.id, c.name, c.payment_token ORDER BY c.name ASC;

--my answer above mistakenly included service data; a more direct answer to the problem is:

SELECT DISTINCT customers.* FROM customers INNER JOIN customers_services
ON customers_services.customer_id=customers.id; 
```

### 3. Get Customers With No Services

Write a query to retrieve the customer data for every customer who does not currently subscribe to any services.

#### Solution

```sql
SELECT c.* FROM customers AS c LEFT OUTER JOIN customers_services
AS c_s ON c.id=c_s.customer_id WHERE c_s.service_id IS NULL;

--or, as demonstration that LEFT v RIGHT OUTER JOINs is an issue of order:

SELECT c.* FROM customers_services AS c_s RIGHT OUTER JOIN customers AS c ON c.id=c_s.customer_id WHERE c_s.service_id IS NULL;
```

#### Further Exploration

Can you write a query that displays all customers with no services and all services that currently don't have any customers? The output should look like this:

 id |     name      | payment_token | id |     description     | price
----+---------------+---------------+----+---------------------+--------
  2 | Nancy Monreal | JKWQPJKL      |    |                     |
    |               |               |  8 | One-to-one Training | 999.00
(2 rows)

#### Solution

```sql
SELECT c.*, s.* FROM customers AS c LEFT OUTER JOIN customers_services
AS c_s ON c.id=c_s.customer_id
FULL OUTER JOIN services AS s ON s.id=c_s.service_id
WHERE c_s.service_id IS NULL;
-- ALSO WORKS WITH TWO FULL OUTER JOINS
```

### 4. Get Services With No Customers

Using RIGHT OUTER JOIN, write a query to display a list of all services that are not currently in use. Your output should look like this:

 description 
-------------
 One-to-one Training
(1 row)

#### Solution

```sql
SELECT s.description FROM customers_services AS c_s RIGHT OUTER JOIN
services AS s ON s.id=c_s.service_id WHERE c_s.service_id IS NULL;
```

### 5. Services for each Customer

Write a query to display a list of all customer names together with a comma-separated list of the services they use. Your output should look like this:

     name      |                                services                                 
---------------+-------------------------------------------------------------------------
 Pat Johnson   | Unix Hosting, DNS, Whois Registration
 Nancy Monreal | 
 Lynn Blake    | DNS, Whois Registration, High Bandwidth, Business Support, Unix Hosting
 Chen Ke-Hua   | High Bandwidth, Unix Hosting
 Scott Lakso   | DNS, Dedicated Hosting, Unix Hosting
 Jim Pornot    | Unix Hosting, Dedicated Hosting, Bulk Email
(6 rows)

#### Solution

```sql
SELECT c.name, string_agg(s.description, ', ') AS services FROM customers AS c
LEFT OUTER JOIN customers_services AS c_s ON c.id=c_s.customer_id
LEFT OUTER JOIN services AS s ON c_s.service_id=s.id GROUP BY c.id;
```

### 6. Services With At Least 3 Customers

Write a query that displays the description for every service that is subscribed to by at least 3 customers. Include the customer count for each description in the report. The report should look like this:

 description  | count
--------------+-------
 DNS          |     3
 Unix Hosting |     5
(2 rows)

#### Solution

```sql
SELECT s.description, COUNT(s.id) AS count
FROM customers_services AS c_s
INNER JOIN services AS s ON c_s.service_id=s.id
GROUP BY s.id HAVING (COUNT(s.id) >= 3) ORDER BY count;
```

### 7. Total Gross Income

Assuming that everybody in our database has a bill coming due, and that all of them will pay on time, write a query to compute the total gross income we expect to receive.

Answer:

  gross
 --------
 678.50
(1 row)

```sql
SELECT SUM(price) AS gross FROM services
INNER JOIN customers_services AS cs ON cs.service_id=services.id;
```

### 8. Add New Customer

A new customer, 'John Doe', has signed up with our company. His payment token is `EYODHLCN`. Initially, he has signed up for UNIX hosting, DNS, and Whois Registration. Create any SQL statement(s) needed to add this record to the database.

#### Solution

```sql
INSERT INTO customers (name, payment_token) VALUES
('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id) VALUES
(7, 1),
(7, 2),
(7, 3);

--or to avoid hard-coding the ids

INSERT INTO customers_services (customer_id, service_id) VALUES
((SELECT id FROM customers WHERE name = 'John Doe'),
  (SELECT id FROM services WHERE description ~ '^UNI')),
((SELECT id FROM customers WHERE name = 'John Doe'),
  (SELECT id FROM services WHERE description ~ '^DN')),
((SELECT id FROM customers WHERE name = 'John Doe'),
  (SELECT id FROM services WHERE description ~ '^Who'));

```

### 9. Hypothetically

The company president is looking to increase revenue. As a prelude to his decision making, he asks for two numbers: the amount of expected income from "big ticket" services (those services that cost more than $100) and the maximum income the company could achieve if it managed to convince all of its customers to select all of the company's big ticket items.

For simplicity, your solution should involve two separate SQL queries: one that reports the current expected income level, and one that reports the hypothetical maximum. The outputs should look like this:

 sum
--------
 500.00
(1 row)
   sum
---------
 10493.00
(1 row)

#### Solution

```sql
SELECT SUM(price) FROM services
INNER JOIN customers_services
ON services.id=customers_services.service_id
WHERE services.price > 100;


SELECT (SELECT count(id) FROM customers) *
(SELECT SUM(price) FROM services WHERE price > 100)
AS sum;


```

### 10. Deleting Rows

Write the necessary SQL statements to delete the "Bulk Email" service and customer "Chen Ke-Hua" from the database.


#### Solution

```sql
--first delete any associations between users and the service to be deleted
DELETE FROM customers_services WHERE service_id = 
(SELECT id FROM services WHERE description ~ '^Bulk');

--next delete the service
DELETE FROM services WHERE description ~ '^Bulk';

DELETE FROM customers_services WHERE customer_id = 
(SELECT id FROM customers WHERE name = 'Chen Ke-Hua');

DELETE FROM customers WHERE name = 'Chen Ke-Hua';
```