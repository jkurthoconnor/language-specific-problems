120: Object Oriented Programming
OO Basics: [Classes and Objects 1](https://launchschool.com/exercise_sets/c631a3b2)

### Modify the following code so that, instead of printing the values, each statement prints the name of the class it belongs to.

```ruby
puts 'Hello'
puts 5
puts [1, 2, 3]

# Expected output:
String
Fixnum
Array
```

Solution

```ruby
puts 'Hello'.class
puts 5.class
puts [1, 2, 3].class
```

### Create an empty class named Cat.

Solution

```ruby
class Cat
end
```

### Using the code from the previous exercise, create an instance of Cat and assign it to a variable named kitty.

```ruby
class Cat
end
```

Solution

```ruby
class Cat
end

kitty = Cat.new
```

### Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is initialized.

Code:

```ruby
class Cat
end

kitty = Cat.new
```
Expected output:

I'm a cat!


Solution

```ruby
class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new
```

### Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)

Solution

```ruby
class Cat
  def initialize(n)
    @name = n
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
```

### Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.

Solution

```ruby
class Cat
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
```

### Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

Solution

```ruby
class Cat
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
  
  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
```

### Using the code from the previous exercise, add a setter method named #name. Then, rename kitty to 'Luna' and invoke #greet again.

Solution

```ruby
class Cat
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
```

### Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

Solution

```ruby
class Cat
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
```

###Using the following code, create a module named Walkable that contains a method named #walk. This method should print Let's go for a walk! when invoked. Include Walkable in Cat and invoke #walk on kitty.

```ruby
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
```
Expected output:

Hello! My name is Sophie!
Lets go for a walk!

Solution

```ruby

module Walkable
  def walk
    puts "Let's go for a walk."
  end
end

class Cat
  attr_reader :name

  include Walkable
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk
```