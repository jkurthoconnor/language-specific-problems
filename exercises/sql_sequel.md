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