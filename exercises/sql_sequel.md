SQL Fundamentals [Medium: Sequel](https://launchschool.com/exercises/8fadedde)

### 1. Set up Database

Initially, we need to create a billing2 database. This can not be done in Sequel, so you must do this manually, or use ruby's Kernel.system method.

Once you've created the billing2 database, create a customers table. The customers table should include the following columns:

id: a unique integer customer id that auto-increments and serves as a primary key for this table.
name: the customer's name. This value is required and may contain names of any length.
payment_token: a string that is unique to each customer; it is used when contacting the payment processor to identify which customer should be charged for the services used. This value is required and should consist of a string of exactly 8 uppercase alphabetical letters.
The services table should include the following columns:

id: a unique integer service id that auto-increments and serves as a primary key for this table.
description: the service description. This value is required and may contain any text.
price: the yearly service price. It is required, must be greater than or equal to 0.00, and should be defined as numeric(10, 2).

Once you have created these tables, here is some data that you can enter into them (feel free to enter additional data). Don't forget to use Sequel!

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

#### Solution

```bash
createdb billing2
```

```sql
CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token CHAR(8) UNIQUE NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL CHECK(price >= 0.00)
);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id int NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
  service_id int NOT NULL REFERENCES services(id)
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
('Business Support', 259.00),
('Dedicated Hosting', 50.00),
('Bulk Email', 25.00),
('One-to-one Training', 999.00);

INSERT INTO customers_services (customer_id, service_id) VALUES
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,)
;
```

```ruby
require 'sequel'

def create_database
  system('createdb', 'billing2')
end

def create_table_customers
  DB.create_table(:customers) do
    primary_key :id
    String :name, :text=>true, :null=>false
    String :payment_token, :fixed=>true, :size=>8, :unique=>true, :null=>false
    constraint(:token_validation) { payment_token =~ /^[A-Z]{8}$/ }
  end
end

def create_table_services
  DB.create_table(:services) do
    primary_key :id
    String :description, :text=>true, :null=>false
    Numeric :price, :size=>[10, 2], :null=>false
    constraint(:not_negative_price) { price >= 0.00}
  end
end

def create_table_cust_svcs
  DB.create_table(:customers_services) do
    primary_key :id
    foreign_key :customer_id, :customers, :null=>false, :on_delete=>:cascade
    foreign_key :service_id, :services, :null=>false
  end
end

def insert_data_customers 
  DB[:customers].insert(:name=> 'Pat Johnson', :payment_token=>'XHGOAHEQ')
  DB[:customers].insert(:name=> 'Nancy Monreal', :payment_token=>'JKWQPJKL')
  DB[:customers].insert(:name=>'Lynn Blake', :payment_token=>'KLZXWEEE')
  DB[:customers].insert(:name=>'Chen Ke-Hua', :payment_token=>'KWETYCVX')
  DB[:customers].insert(:name=>'Scott Lakso', :payment_token=>'UUEAPQPS')
  DB[:customers].insert(:name=>'Jim Pornot', :payment_token=>'XKJEYAZA')
end

def insert_data_services
  DB[:services].insert(:description=>'Unix Hosting', :price=>5.99)
  DB[:services].insert(:description=>'DNS', :price=>4.95)
  DB[:services].insert(:description=>'Whois Registration', :price=>1.95)
  DB[:services].insert(:description=>'High Bandwidth', :price=>15.00)
  DB[:services].insert(:description=>'Business Support', :price=>259.00)
  DB[:services].insert(:description=>'Dedicated Hosting', :price=>50.00)
  DB[:services].insert(:description=>'Bulk Email', :price=>25.00)
  DB[:services].insert(:description=>'One-to-one Training', :price=>999.00)
end

def insert_data_cust_svcs
  DB[:customers_services].insert(:customer_id=>1, :service_id=>1)
  DB[:customers_services].insert(:customer_id=>1, :service_id=>2)
  DB[:customers_services].insert(:customer_id=>1, :service_id=>3)
  DB[:customers_services].insert(:customer_id=>3, :service_id=>1)
  DB[:customers_services].insert(:customer_id=>3, :service_id=>2)
  DB[:customers_services].insert(:customer_id=>3, :service_id=>3)
  DB[:customers_services].insert(:customer_id=>3, :service_id=>4)
  DB[:customers_services].insert(:customer_id=>3, :service_id=>5)
  DB[:customers_services].insert(:customer_id=>4, :service_id=>1)
  DB[:customers_services].insert(:customer_id=>4, :service_id=>4)
  DB[:customers_services].insert(:customer_id=>5, :service_id=>1)
  DB[:customers_services].insert(:customer_id=>5, :service_id=>2)
  DB[:customers_services].insert(:customer_id=>5, :service_id=>6)
  DB[:customers_services].insert(:customer_id=>6, :service_id=>1)
  DB[:customers_services].insert(:customer_id=>6, :service_id=>6)
  DB[:customers_services].insert(:customer_id=>6, :service_id=>7)
end

  

create_database

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

create_table_customers
create_table_services
create_table_cust_svcs

insert_data_customers
insert_data_services
insert_data_cust_svcs
```

### 2. Get Customers With Services

Write a Ruby program that uses Sequel to retrieve and display the customer data in the billing2 database for every customer who currently subscribe to at least one service. The output should look something like this:

(1,"Pat Johnson",XHGOAHEQ)
(3,"Lynn Blake",KLZXWEEE)
(4,"Chen Ke-Hua",KWETYCVX)
(5,"Scott Lakso",UUEAPQPS)
(6,"Jim Pornot",XKJEYAZA)

The order and format of the output is not important. Our main concern is that we can verify that we retrieved the appropriate data.

#### Solution

```sql
SELECT customers.* FROM customers
INNER JOIN customers_services AS cs
ON customers.id=cs.customer_id
GROUP BY customers.id;
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')
 
DB[:customers].inner_join(:customers_services, :customer_id=>:id)
              .select(:customers__id, :customers__name, :customers__payment_token)
              .group(:customers__id)
              .each do |row|
                puts "id: #{row[:id]}, "\
                     "name: #{row[:name]}, "\
                     "token: #{row[:payment_token]}"
              end

DB.disconnect
```

### 3. Get Customers With No Services

Write a Ruby program that uses Sequel to retrieve and display the customer data in the billing2 database for every customer who currently does not subscribe to any services. The output should look something like this:

(2,"Nancy Monreal",JKWQPJKL)

The format of the output is not important. Our main concern is that we can verify that we retrieved the appropriate data.

#### Solution

```sql
SELECT * FROM customers
LEFT OUTER JOIN customers_services AS cs
ON customers.id=cs.customer_id
WHERE cs.service_id IS NULL;
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

DB[:customers].select(:customers__id, :customers__name, :customers__payment_token)
              .left_outer_join(:customers_services, :customer_id => :id)
              .where(:customers_services__id => nil)
              .each { |row| puts row }

DB.disconnect
```

### 4. Functions, Aliases, and Virtual Rows

Write a Ruby program that uses Sequel to retrieve and display the last name and first name for every customer in the billing2 database that subscribes to at least one service with a price of at least $15. Sort the results by last name and then first name. We are only interested in the first 3 customers. The output should look like this:

Blake, Lynn
Ke-Hua, Chen
Lakso, Scott

For this exercise, you may assume that the name column in the customers table always contains the first name, a single space, and the last name.

```sql
SELECT split_part(name, ' ', 2) AS last_name, split_part(name, ' ', 1)
AS first_name
FROM customers
INNER JOIN customers_services AS cs
ON customers.id=cs.customer_id
INNER JOIN services AS s
ON cs.service_id=s.id
WHERE price >= 15.00
GROUP BY name
ORDER BY last_name
LIMIT 3;
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

results = DB[:customers].select do
                        [split_part(name, ' ', 2).as(:last_name), split_part(name, ' ', 1).as(:first_name) ]
                      end
                        .inner_join(:customers_services, :customer_id => :id)
                        .inner_join(:services, :id => :service_id)
                        .where { price >= 15.00 }
                        .group(:customers__name)
                        .order(:last_name)
                        .limit(3)
                        .all
results.each do |row|
  puts "#{row[:last_name]}, #{row[:first_name]}"
end

DB.disconnect
```

### 5. Services With At Least 3 Customers

Write a Ruby program that uses Sequel to display a list of services that are subscribed to by at least 3 customers. Include the customer count for each service. The report should look something like this:

DNS, 3
Unix Hosting, 5

The format of the output is not important. Our main concern is that we can verify that we retrieved the appropriate data.

Make sure the results are listed in order by the description.

```sql
SELECT services.description, count(customers_services.service_id)
FROM services INNER JOIN customers_services
ON services.id=customers_services.service_id
GROUP BY services.id
HAVING count(customers_services.service_id) >= 3;
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

DB[:services].select(:description)
             .select_append { count(customers_services__service_id) }
             .inner_join(:customers_services, :service_id => :id)
             .group(:services__id)
             .order(:services__description)
             .having { count(customers_services__service_id) >= 3 }
             .each { |row| puts "#{row[:description]}, #{row[:count]}" }


DB.disconnect
```

### 6. Total Gross Income

Write a Ruby program that uses Sequel to compute and display the total gross income we can expect to receive from our customers, assuming that everybody in the database has a bill coming due and that all of them will pay on time. The output should look like this:

$678.50

#### Solution

```sql
SELECT SUM(services.price) FROM services
INNER JOIN customers_services
ON customers_services.service_id=services.id;
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

result = DB[:services].select { sum(services__price).cast(:money) }
             .inner_join(:customers_services, :service_id => :services__id)
             .each { |row| puts row[:sum] }

DB.disconnect
```

### 7. Add New Customer

A new customer, 'John Doe', has signed up with our company. His payment token is 'EYODHLCN'. Initially, he has signed up for Unix Hosting, DNS, and Whois Registration. Write a Ruby program that uses Sequel to properly add this information to the database. For verification, print the entire content of any updated tables. Your output should look something like this:

```ruby
{:id=>1, :name=>"Pat Johnson", :payment_token=>"XHGOAHEQ"}
{:id=>2, :name=>"Nancy Monreal", :payment_token=>"JKWQPJKL"}
{:id=>3, :name=>"Lynn Blake", :payment_token=>"KLZXWEEE"}
{:id=>4, :name=>"Chen Ke-Hua", :payment_token=>"KWETYCVX"}
{:id=>5, :name=>"Scott Lakso", :payment_token=>"UUEAPQPS"}
{:id=>6, :name=>"Jim Pornot", :payment_token=>"XKJEYAZA"}
{:id=>10, :name=>"John Doe", :payment_token=>"EYODHLCN"}

{:id=>1, :customer_id=>1, :service_id=>1}
{:id=>2, :customer_id=>1, :service_id=>2}
{:id=>3, :customer_id=>1, :service_id=>3}
{:id=>4, :customer_id=>3, :service_id=>1}
{:id=>5, :customer_id=>3, :service_id=>2}
{:id=>6, :customer_id=>3, :service_id=>3}
{:id=>7, :customer_id=>3, :service_id=>4}
{:id=>8, :customer_id=>3, :service_id=>5}
{:id=>9, :customer_id=>4, :service_id=>1}
{:id=>10, :customer_id=>4, :service_id=>4}
{:id=>11, :customer_id=>5, :service_id=>1}
{:id=>12, :customer_id=>5, :service_id=>2}
{:id=>13, :customer_id=>5, :service_id=>6}
{:id=>14, :customer_id=>6, :service_id=>1}
{:id=>15, :customer_id=>6, :service_id=>6}
{:id=>16, :customer_id=>6, :service_id=>7}
{:id=>17, :customer_id=>10, :service_id=>1}
{:id=>18, :customer_id=>10, :service_id=>2}
{:id=>19, :customer_id=>10, :service_id=>3}
```

The format of the output is not important. Our main concern is that we can verify that we inserted the appropriate data. In this case, the inserted customers record has id 10, while the customers_services records have ids of 17, 18, and 19.

Rather than hard coding customer and service id numbers in your program, try looking up the numbers instead.

#### Solution

```sql
INSERT INTO customers (name, payment_token) VALUES
('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id) VALUES
  ((SELECT id FROM customers WHERE payment_token = 'EYODHLCN'),
  (SELECT id FROM services WHERE description = 'Unix Hosting')),
  
  ((SELECT id FROM customers WHERE payment_token = 'EYODHLCN'),
  (SELECT id FROM services WHERE description = 'DNS'))
  
  ((SELECT id FROM customers WHERE payment_token = 'EYODHLCN'),
  (SELECT id FROM services WHERE description = 'Whois Registration'));
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

doe_id = DB[:customers].insert(:name=>'John Doe', :payment_token=>'EYODHLCN')
# .insert typically returns the primary key of the inserted row

unix_id = DB[:services].select(:id).where(:description=>'Unix Hosting')
dns_id = DB[:services].select(:id).where(:description=>'DNS')
whois_id = DB[:services].select(:id).where(:description=>'Whois Registration')

[unix_id, dns_id, whois_id].each do |id|
  DB[:customers_services].insert(:customer_id=>doe_id, :service_id=>id)
end

DB[:customers].each { |row| puts row }
DB[:customers_services].each { |row| puts row }

DB.disconnect
```

### 8. Services for each Customer

Write a Ruby program that uses Sequel to display a list of all customer names together with a list of the services they use. Each service should also show the price of the service. The output should be ordered by name, and the services for each name should also be sorted by the service description. For simplicity, you can ignore any customers that don't have services. Your output should look like this:

Chen Ke-Hua
  High Bandwidth $15.00
  Unix Hosting $5.95
Jim Pornot
  Bulk Email $250.00
  Dedicated Hosting $50.00
  Unix Hosting $5.95
Lynn Blake
  Business Support $250.00
  DNS $4.95
  High Bandwidth $15.00
  Unix Hosting $5.95
  Whois Registration $1.95
Pat Johnson
  DNS $4.95
  Unix Hosting $5.95
  Whois Registration $1.95
Scott Lakso
  Dedicated Hosting $50.00
  DNS $4.95
  Unix Hosting $5.95
  
Note that in the final cluster, Dedicated Hosting precedes DNS in the output order.

#### Solution

```sql
SELECT name, array_agg(services.description), array_agg(services.price) FROM cu$
INNER JOIN customers_services ON customers.id=customers_services.customer_id
INNER JOIN services ON services.id=customers_services.service_id
GROUP BY name
ORDER BY name;
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

DB[:customers].select { [name, string_agg(concat("\t", services__description, ' ', services__price.cast(:money)), "\n").order(services__description.upper)] }
              .inner_join(:customers_services, :customer_id=>:id)
              .inner_join(:services, :id=>:service_id)
              .group(:name)
              .order(:name)
              .each do |row| 
                puts row[:name]
                puts row[:string_agg]
              end

DB.disconnect
```

### 9. Average Column Values

Write a Ruby program that uses Sequel to compute the average value of every numeric column in an arbitrary table of an arbitrary local database. The columns should be processed in ascending order by name. For instance, here's an example of running the program and its output:

```
$ ruby average_values.rb
What database do you want to use? billing2
What table do you want to access? services
id: 4.500000
price: 197.106250

$ ruby average_values.rb
What database do you want to use? billing2
What table do you want to access? customers_services
customer_id: 3.687500
id: 8.500000
service_id: 3.062500
```

Note: don't get carried away trying to ensure you only get valid inputs; this exercise is about using Sequel, not validating inputs.

```ruby
# initial solution satisfies Further Exploration criteria
require 'sequel'

def get_database
  loop do
    puts "What database would you like to use?"
    database = gets.chomp
    return database unless database.empty?
    puts "Please enter a non-empty database name."
  end
end

def get_table_name
  loop do
    puts "What table do you want to access?"
    table = gets.chomp
    return table unless table.empty?
    puts "Please enter a non-empty table name."
  end
end

def identify_integer_columns(table_name)
  integer_schemata = DB.schema(table_name.to_sym).select { |column| column[1][:type] == :integer}
  integer_schemata.map { |schema| schema[0] }
end

def print_column_averages(column_names, table_name)
  column_names.each do |name|
    average = DB[table_name.to_sym].select { avg(name) }.first[:avg].to_f
    puts "\n#{name}: #{average}\n\n"
  end
end

def disconnect
  DB.disconnect
end


DB = Sequel.connect(adapter: 'postgres', database: get_database)
table = get_table_name
columns = identify_integer_columns(table)

print_column_averages(columns, table)

disconnect
```

### 10. Deleting Rows

The program in this exercise will delete data from your database. It would be wise to first make a backup of your database, and then restore the data from that backup prior to each run of the program.

Write a Ruby program that uses Sequel to delete the "Bulk Email" service and customer "Chen Ke-Hua" from the database. Print the entire content of all tables to verify that all of the associated data from both records has been deleted. Your output should look something like this:

```ruby
(1,"Pat Johnson")
(2,"Nancy Monreal")
(3,"Lynn Blake")
(5,"Scott Lakso")
(6,"Jim Pornot")
(10,"John Doe")

{:id=>1, :customer_id=>1, :service_id=>1}
{:id=>2, :customer_id=>1, :service_id=>2}
{:id=>3, :customer_id=>1, :service_id=>3}
{:id=>4, :customer_id=>3, :service_id=>1}
{:id=>5, :customer_id=>3, :service_id=>2}
{:id=>6, :customer_id=>3, :service_id=>3}
{:id=>7, :customer_id=>3, :service_id=>4}
{:id=>8, :customer_id=>3, :service_id=>5}
{:id=>11, :customer_id=>5, :service_id=>1}
{:id=>12, :customer_id=>5, :service_id=>2}
{:id=>13, :customer_id=>5, :service_id=>6}
{:id=>14, :customer_id=>6, :service_id=>1}
{:id=>15, :customer_id=>6, :service_id=>6}
{:id=>17, :customer_id=>10, :service_id=>1}
{:id=>18, :customer_id=>10, :service_id=>2}
{:id=>19, :customer_id=>10, :service_id=>3}

(1,"Unix Hosting")
(2,DNS)
(3,"Whois Registration")
(4,"High Bandwidth")
(5,"Business Support")
(6,"Dedicated Hosting")
(8,"One-to-one Training")
```

The format of the output is not important. Our main concern is that we can verify that we deleted the appropriate data. In this case, the following records have all been deleted:

The Bulk Email row in services (id: 7)

All customers_services rows where service_id is 7

The Chen Ke-Hua row in customers (id: 4)

All customers_services rows where customer_id is 4

Rather than hard coding the service id number in your program, try looking up the number instead.


#### Solution

```bash
# to backup
$ pg_dump --inserts --clean billing2 > billing2_dump.sql
```

```sql
DELETE FROM customers WHERE name='Chen Ke-Hua';

DELETE FROM customers_services AS cs
WHERE cs.service_id=(
SELECT id FROM services
WHERE description='Bulk Email');

DELETE FROM services WHERE description='Bulk Email';
```

```bash
# to restore
$ psql -d billing2 < billing2_dump.sql
```


```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

bulk_email_id = DB[:services].where(:description=>'Bulk Email').first[:id]

DB[:customers].where(:name=>'Chen Ke-Hua').delete
DB[:customers_services].where(:service_id=>bulk_email_id).delete
DB[:services].where(:id=>bulk_email_id).delete

DB[:services].each { |service| puts service }
DB[:customers_services].each { |pair| puts pair}
DB[:customers].each { |customer| puts customer }

DB.disconnect
```
