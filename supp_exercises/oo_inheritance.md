120: Object Oriented Programming
OO Basics: [Inheritance](https://launchschool.com/exercise_sets/940f7e7d)


1) Inherited Year

Using the following code, create two classes - Truck and Car - that both inherit from Vehicle.

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

# Expected output:
# 
# 1994
# 2006
```

Solution:

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year
```

2) Start the Engine (Part 1)

Modify the following code so that #start_engine is invoked upon initialization of truck1.

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
# Expected output:
# 
# 1994
# Ready to go!
```

Solution:

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
```

3) Only Pass the Year

Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

# Expected output:
# 
# 1994
# Short
```
Solution:

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type
  
  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
```

4) Start the Engine (Part 2)

Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.

```ruby
class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

# Expected output:
# 
# Ready to go! Drive fast, please!
```

Solution:

```ruby
class Vehicle
  attr_reader :speed

  def start_engine(s)
    @speed = s
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(s)
    super + " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
```

5) Towable (Part 1)

Using the following code, create a module named Towable that contains a method named tow. The module should be included in Truck and tow should print I can tow a trailer! when invoked.

```ruby
class Truck
end

class Car
end

truck1 = Truck.new
puts truck1.tow
# Expected output:
# 
# I can tow a trailer!
```

Solution:

```ruby
module Towable
  def tow
    "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
puts truck1.tow
```

6) Towable (Part 2)

Using the following code, create a class named Vehicle that, upon instantiation, assigns the passed in argument to @year. Both Truck and Car should inherit from Vehicle.

```ruby
module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year
# Expected output:
# 1994
# I can tow a trailer!
# 2006
```

Solution:

```ruby
module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year
```

7) Method Lookup (Part 1)

Using the following code, determine the lookup path used when invoking cat1.color. Only list the classes that were checked by Ruby when searching for the #color method.

```ruby
class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
```

Solution:

Ruby's path to find `color` is: `Cat`, `Animal`

8) Method Lookup (Part 2)

Using the following code, determine the lookup path used when invoking cat1.color. Only list the classes that were checked by Ruby when searching for the #color method.

```ruby
class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color
```

Solution:

Ruby's lookup path to find `color` is: `Cat`, `Animal`, `Object`, `Kernel`, `BasicObject`

9) Method Lookup (Part 3)

Using the following code, determine the lookup path used when invoking bird1.color. Only list the classes or modules that were checked by Ruby when searching for the #color method.

```ruby
module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color
```

Solution:

The lookup path for `color` is: `Bird`, `Flyable`, `Animal`

10) Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.

Solution:

```ruby
module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end
```
