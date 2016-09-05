### Exercises for Launch School Course 120, Lesson 4: [Easy 1](https://launchschool.com/lessons/f1c58be0/assignments/a5cfd2ae)

1) Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?
```ruby
true
"hello"
[1, 2, 3, "happy days"]
142
```

Solution: Each example is an object.  An object's class can be revealed by invoking #class on it.

2) If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

```ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end
```

Solution:  We can mix in the `Speed` module to the `Car` and the `Truck` class by adding `include Speed` to each class' definition.  We can then check that this works by adding this line to the program: `my_car.go_fast`.  (see below)

```ruby
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

my_car = Car.new
my_truck = Truck.new

my_car.go_fast
my_truck.go_fast
```

3) Above, when we called the `go_fast` method from an instance of the `Car` class you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

Solution:  The string printed includes the class name of the vehicle because of the `go_fast` method.
```ruby
def go_fast
  puts "I am a #{self.class} and going super fast!"
end
```
This passage `#{self.class}` interpolates into the string the return value of calling `class` on the vehicle going fast.  Note that `self` refers to the caller of the `going_fast` method, so calling for the class of the calling object (the vehicle) returns the class name.


4) If we have a class `AngryCat` how do we create a new instance of this class?

The `AngryCat` class might look something like this:
```ruby
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end
```

Solution:  A new instance of the `AngryCat` class can be made with the following line:
```ruby
puff = AngryCat.new
```

5) Which of these two classes has an instance variable and how do you know?
```ruby
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
```

Solution:  `Pizza` has `@name` as an instance variable.  This is indicated by the `@` prepended to `name`.  `Fruit` only seems to be initializing a local variable `name`.  We could also call `instance_variables` on an object of the class to confirm

6) What could we add to the class below to access the instance variable @volume?
```ruby
class Cube
  def initialize(volume)
    @volume = volume
  end
end
```

Solution:  We could add `attr_reader :volume` to the class to define a getter method.  Or we could add the getter method as below.
```ruby
class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def volume
    @volume
  end
end
```

7) What is the default thing that Ruby will print to the screen if you call `to_s` on an object? Where could you go to find out if you want to be sure?

Solution:  By default, calling `to_s` returns a string representing the object; this string includes the object's class and its object_id.  To be sure I could check Ruby Docs.


8) If we have a class such as the one below:
```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```

You can see in the `make_one_year_older` method we have used `self`. What does `self` refer to here?

Solution:  `self` refers to the object invoking `make_one_year_older`.  So it will refer to some instance of the `Cat` class.  `self` is necessary here to prevent this invocation of the `age=` setter method from being interpreted as reassignment of a local variable.

9) If we have a class such as the one below:
```ruby
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
```
In the name of the `cats_count` method we have used `self`. What does `self` refer to in this context?

Solution:  `self` here refers to the class `Cat`.  `cats_count` is a class method.


10) If we have the class below, what would you need to call to create a new instance of this class.
```ruby
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end
```

Solution:  `Bag.new('brown', 'paper')` should do the trick!



