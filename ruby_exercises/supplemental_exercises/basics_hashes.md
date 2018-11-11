## Ruby Basics Launchschool Exercises [Hashes](https://launchschool.com/exercise_sets/71b9ad5d)

### First Car

Create a hash that contains the following data and assign it to a variable named car.

type 	color 	mileage
sedan 	blue 	80_000

### Solution
```ruby
car = { :type => 'sedan', :color => 'blue', :mileage => 80000 }
```

### Adding the Year

Using the code below, add the key :year and the value 2003 to car.

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000
}


### Solution
```ruby
car[:year] = 2003
# or
car.store(:year, 2003)
```

### Broken Odometer

Using the following code, delete the key :mileage and its associated value from car.

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}

### Solution 
```ruby
car.delete(:mileage)
```

###  What Color?

Using the following code, select the value 'blue' from car and print it with #puts.

car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}

### Solution
```ruby
puts car[:color]
# or 
puts car.select { |_, v| v == 'blue' }.values
```

### Labeled Numbers

Use Hash#each to iterate over numbers and print each element's key/value pair.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

Expected output:

A high number is 100.
A medium number is 50.
A low number is 10.



### Solution
```ruby
numbers.each do |descriptor, num|
  puts "A #{descriptor} number is #{num}."
end
```

### Divided by Two

Use Hash#map to iterate over numbers and return an array containing each number divided by 2. Assign the returned array to a variable named half_numbers and print its value using #p.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

Expected output:

[50, 25, 5]


### Solution
```ruby
half_numbers = numbers.map { |_, num| num / 2 }
p half_numbers
```

### Low, Medium, or High?

Use Hash#select to iterate over numbers and return a hash containing only key-value pairs where the value is less than 25. Assign the returned hash to a variable named low_numbers and print its value using #p.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

Expected output:

{low: 10}

### Solution
```ruby
low_numbers = numbers.select { |_, num| num < 25 }
p low_numbers
```

### Low or Nothing

In the following code, numbers isn't mutated because #select isn't a destructive method. However, there is a destructive version of #select named #select!. Modify the code to use #select! instead of #select.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select do |key, value|
                 value < 25
               end

p low_numbers
p numbers


### Solution
```ruby
low_numbers = numbers.select! do |key, value|
                 value < 25
               end

p low_numbers
p numbers
```

### Multiple Cars

Create a nested hash using the following data.

Car
type 	color 	year
sedan 	blue 	2003

Truck
type 	color 	year
pickup 	red 	1998

### Solution
```ruby
vehicles = {
            :car => {:type=>"sedan", :color=>"blue", :year=>2003},
            :truck => {:type =>"pickup", :color=>"red", :year=>1998}
          }
```

### Which Collection?

Rewrite car as a nested array containing the same key-value pairs.

car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}


### Solution
```ruby
car = [ [:type, 'sedan'], [:color, 'blue'], [:year, 2003] ]
```