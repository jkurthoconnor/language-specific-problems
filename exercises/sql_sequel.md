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
```

```ruby
require 'sequel'

DB = Sequel.connect(adapter: 'postgres', database: 'billing2')

DB.create_table(:customers) do
  primary_key :id
  String :name, :text=>true, :null=>false
  String :payment_token, :fixed=>true, :size=>8, :unique=>true, :null=>false
  constraint(:token_validation) { payment_token =~ /^[A-Z]{8}$/ }
end

DB.create_table(:services) do
  primary_key :id
  String :description, text=>true, :null=>false
  Numeric :price, :size=>[10, 2], :null=>false
  constraint(:not_negative_price) { price >= 0.00}
end
  
```