SQL Fundamentals [Medium: Subqueries and More](https://launchschool.com/exercise_sets/1be8559d)

### 1. Set Up the Database using \copy


#### Solution

```sql
createdb auction

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6, 2) NOT NULL CHECK(initial_price BETWEEN 0.01 AND 1000.00),
  sales_price numeric(6, 2) CHECK(sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6, 2) NOT NULL CHECK(amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM './bidders.csv' WITH HEADER CSV;
\copy items FROM './items.csv' WITH HEADER CSV;
\copy bids FROM './bids.csv' WITH HEADER CSV;

```

### 2.  Conditional Subqueries: IN

Write a SQL query that shows all items that have had bids put on them. Use the logical operator IN for this exercise, as well as a subquery.

Here is the expected output:

```sql
 Bid on Items  
---------------
 Video Game
 Outdoor Grill
 Painting
 Tent
 Vase
(5 rows)
``` 


#### Solution

```sql
SELECT items.name AS "Bid on Items" FROM items
WHERE  items.id IN (SELECT DISTINCT bids.item_id FROM bids);
```


### 3. Conditional Subqueries: NOT IN

Write a SQL query that shows all items that have not had bids put on them. Use the logical operator NOT IN for this exercise, as well as a subquery.

Here is the expected output:

```SQL
 Not Bid On 
------------
 Television
(1 row)
``` 


#### Solution

```sql
SELECT name AS "Not Bid on" FROM items
WHERE id NOT IN (SELECT DISTINCT bids.item_id FROM bids);
```


### 4. Conditional Subqueries: EXISTS

Write a SELECT query that returns a list of names of everyone who has bid in the auction. While it is possible (and perhaps easier) to do this with a JOIN clause, we're going to do things differently: use a subquery with the EXISTS clause instead. Here is the expected output:

```sql
      name
-----------------
 Alison Walker
 James Quinn
 Taylor Williams
 Alexis Jones
 Gwen Miller
 Alan Parker
(6 rows)
``` 


#### Solution

```sql
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids -- 1 used because output is irrelevant
WHERE bidders.id=bids.bidder_id); -- as long as the sub returns any row
                                  -- the EXISTS clause evaluates to --  true and the current `name` is included
```
### Further Exploration

More often than not, we can get an equivalent result by using a JOIN clause, instead of a subquery. Can you figure out a SELECT query that uses a JOIN clause that returns the same output as our solution above?

#### Solution

```sql
SELECT DISTINCT name FROM bidders
INNER JOIN bids
ON bidders.id=bids.bidder_id;
```

### 5. Conditional Subqueries: ANY, SOME, ALL

This exercise will be a bit longer than the previous ones, but the logical operators we'll cover are all closely related.

Write an SQL query that returns the names of all items that have bids of less than 100 dollars. To accomplish this, use an ANY clause, along with a subquery.

Expected Output:

```sql
 Highest Bid Less Than 100 Dollars
----------------------------------
 Video Game
 Outdoor Grill
 Vase
(3 rows)
```

Finally, write the same query, but use an ALL clause. You shouldn't have to use any JOINs to finish this exercise.

Expected Output:

```sql
 Highest Bid Less Than 100 Dollars
----------------------------------
 Video Game
 Outdoor Grill
 Vase
 Television
(4 rows)
```


#### Solution

```sql
-- first with the forbidden JOIN
SELECT items.name AS "Highest Bid Less Than 100 Dollars"
FROM items INNER JOIN bids
ON items.id=bids.item_id GROUP BY items.id HAVING MAX(bids.amount) < 100.00;

-- now with IN subquery
SELECT name AS "Highest Bid Less Than 100 Dollars"
FROM items WHERE sales_price IN (SELECT items.sales_price FROM items
WHERE sales_price < 100.00);  -- `IN` is equivalent to  `= ANY`

-- but the preferred ANY solution is:
SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100.00 > ANY (SELECT amount FROM bids WHERE item_id=items.id);

-- now, with ALL
SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100.00 > ALL (SELECT amount FROM bids WHERE item_id=items.id);
```
#### Further Exploration
There is a way to get the same result table back using ALL for this exercise. How would you go about doing this? 

#### Solution

```sql

```


### 6. Query From a Virtual Table

For this exercise, we'll make a slight departure from how we've been using subqueries. So far we have used subqueries to filter our results using a WHERE clause. In this exercise, we will build that filtering into the table that we will query. Write an SQL query that finds the largest number of bids from any individual bidder.

For this exercise, you must use a subquery to generate a result table (or virtual table), and then query that table for the largest number of bids.

Your output should look like this:

```sql
  max
------
    9
(1 row) 
```
#### Solution

```sql
SELECT MAX(count) FROM
(SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id)
AS max;
```


### 7. Scalar Subqueries

For this exercise, use a scalar subquery to determine the number of bids on each item. The entire query should return a table that has the name of each item along with the number of bids on an item.

Here is the expected output:

```sql
    name      | count
--------------+-------
Video Game    |     4
Outdoor Grill |     1
Painting      |     8
Tent          |     4
Vase          |     9
Television    |     0
(6 rows)
``` 


#### Solution

```sql
SELECT items.name, (SELECT COUNT(item_id) FROM bids
WHERE bids.item_id=items.id) FROM items;
```

#### Further Exploration

If we wanted to get an equivalent result, without using a subquery, then we would have to use a LEFT OUTER JOIN. Can you come up with the equivalent query that uses a JOIN clause?

#### Solution
```sql
SELECT items.name, COUNT(bids.id) FROM items
LEFT OUTER JOIN bids ON bids.item_id=items.id
GROUP BY items.id;
```
### 8.  Row Comparison

We want to check that a given item is in our database. There is one problem though: we have all of the data for the item, but we don't know the id number. Write an SQL query that will display the id for the item that matches all of the data that we know, but does not use the AND keyword. Here is the data we know:

'Painting', 100.00, 250.00 


#### Solution

```sql
-- with a subquery;
SELECT id FROM items WHERE id NOT IN
(SELECT id FROM items WHERE ((initial_price != 100.00) OR 
(sales_price != 250.00) OR (name != 'Painting')
));

--without
SELECT id FROM items
WHERE ROW('Painting', 100.00, 250.00) = ROW(name, initial_price, sales_price);


```


### 9. EXPLAIN

For this exercise, let's explore the EXPLAIN PostgreSQL statement. It's a very useful SQL statement that lets us analyze the efficiency of our SQL statements. More specifically, use EXPLAIN to check the efficiency of the query statement we used in the exercise on EXISTS:

```sql
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```
First use just EXPLAIN, then include the ANALYZE option as well. For your answer, list any SQL statements you used, along with the output you get back, and your thoughts on what is happening in both cases. 


#### Solution

```sql
EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

QUERY PLAN                                
--------------------------------------------------------------------------
 Hash Join  (cost=33.38..62.84 rows=635 width=32)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4)
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
(7 rows)

BEGIN;
EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
ROLLBACK;

Hash Join  (cost=33.38..62.84 rows=635 width=32) (actual time=0.303..0.306 rows=6 loops=1)
   Hash Cond: (bidders.id = bids.bidder_id)
   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.251..0.251 rows=7 loops=1)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.038..0.038 rows=6 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.023..0.025 rows=6 loops=1)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.004..0.008 rows=26 loops=1)
 Planning time: 0.173 ms
 Execution time: 0.345 ms
(10 rows)

```


### 10. Comparing SQL Statements

In this exercise, we'll use EXPLAIN ANALYZE to compare the efficiency of two SQL statements. These two statements are actually from the "Query From a Virtual Table" exercise in this set. In that exercise, we stated that our subquery-based solution:

```sql
SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
```  
  
was actually faster than the simpler equivalent without subqueries:

```sql
SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;
```

In this exercise, we will demonstrate this fact.

Run EXPLAIN ANALYZE on the two statements above. Compare the planning time, execution time, and the total time required to run these two statements. Also compare the total "costs". Which statement is more efficient and why?


#### Solution

```sql
EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;


QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.030..0.030 rows=1 loops=1)
   ->  HashAggregate  (cost=32.65..34.65 rows=200 width=4) (actual time=0.025..0.026 rows=6 loops=1)
         Group Key: bids.bidder_id
         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.004..0.008 rows=26 loops=1)
 Planning time: 0.118 ms
 Execution time: 0.095 ms
(6 rows)



EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
Limit  (cost=35.65..35.65 rows=1 width=4) (actual time=0.065..0.065 rows=1 loops=1)
  ->  Sort  (cost=35.65..36.15 rows=200 width=4) (actual time=0.064..0.064 rows=1 loops=1)
        Sort Key: (count(bidder_id)) DESC
        Sort Method: top-N heapsort  Memory: 25kB
        ->  HashAggregate  (cost=32.65..34.65 rows=200 width=4) (actual time=0.029..0.033 rows=6 loops=1)
              Group Key: bidder_id
              ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.005..0.009 rows=26 loops=1)
Planning time: 0.148 ms
Execution time: 0.113 ms
(9 rows)

```
The subquery version (A) is faster than the other (B). 
  - total time A: 0.213 ms
  - total time B: 0.261 ms
  
But B has slightly lower cost (35.64) than does A (37.16).


It looks like all the sorting required for the ORDER BY clause is temporally expensive.


#### Further Exploration

We mentioned earlier that using a scalar subquery was faster than using an equivalent JOIN clause. Determining that JOIN statement was part of the "Further Exploration" for that exercise. For this "Further Exploration", compare the times and costs of those two statements.


```sql
-- with JOIN
EXPLAIN ANALYZE
SELECT items.name, COUNT(bids.id) FROM items
LEFT OUTER JOIN bids ON bids.item_id=items.id
GROUP BY items.id;


QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
HashAggregate  (cost=83.21..92.01 rows=880 width=40) (actual time=0.131..0.135 rows=6 loops=1)
  Group Key: items.id
  ->  Hash Right Join  (cost=29.80..75.66 rows=1510 width=40) (actual time=0.065..0.100 rows=27 loops=1)
        Hash Cond: (bids.item_id = items.id)
        ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=8) (actual time=0.004..0.010 rows=26 loops=1)
        ->  Hash  (cost=18.80..18.80 rows=880 width=36) (actual time=0.025..0.025 rows=6 loops=1)
              Buckets: 1024  Batches: 1  Memory Usage: 9kB
              ->  Seq Scan on items  (cost=0.00..18.80 rows=880 width=36) (actual time=0.009..0.012 rows=6 loops=1)
Planning time: 0.255 ms
Execution time: 0.244 ms
(10 rows)




-- with scalar subquery
EXPLAIN ANALYZE
SELECT name,
(SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;


QUERY PLAN                                                  
-------------------------------------------------------------------------------------------------------------
 Seq Scan on items  (cost=0.00..25455.20 rows=880 width=36) (actual time=0.043..0.115 rows=6 loops=1)
   SubPlan 1
     ->  Aggregate  (cost=28.89..28.91 rows=1 width=4) (actual time=0.014..0.015 rows=1 loops=6)
           ->  Seq Scan on bids  (cost=0.00..28.88 rows=8 width=4) (actual time=0.007..0.012 rows=4 loops=6)
                 Filter: (item_id = items.id)
                 Rows Removed by Filter: 22
 Planning time: 0.222 ms
 Execution time: 0.178 ms
(8 rows)
```

A is slower (.499 ms) but less costly (92.01)
B is faster (.400 ms) but more costly (25455.20)