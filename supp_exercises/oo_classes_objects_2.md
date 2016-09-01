120: Object Oriented Programming
OO Basics: [Classes and Objects 2](https://launchschool.com/exercise_sets/133b9ab1)


### Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.
```ruby
class Cat
end

Cat.generic_greeting
```
Expected output:
Hello! I'm a cat!

Solution
```ruby
class Cat
  def self.generic_greeting
    puts "Hello! I am a cat!"
  end
end

Cat.generic_greeting
```
Further Exploration:
What happens if you run `kitty.class.generic_greeting`? Can you explain this result?

Further Exploration Solution:
 Without instantiating a new Cat object and assigning the variable `kitty` to it, the code above throws an undefined local variable or method `kitty`.  On the other hand, if kitty does refer to an instance of the Cat class, then running the line of code above will print to screen "Hello! I am a cat!"
 
  
### Using the following code, add an instance method named #rename that renames kitty when invoked.

```ruby 
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
kitty.name
kitty.rename('Chloe')
kitty.name
```

Expected output:
Sophie
Chloe

Solution
```ruby
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def rename(n)
    self.name = n
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name

```

### Using the following code, add a method named #identify that returns its calling object.
```ruby
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
p kitty.identify
```
Expected output (yours may contain a different object id):

#<Cat:0x007ffcea0661b8 @name="Sophie">


Solution
```ruby
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

```

### Using the following code, add two methods: #generic_greeting and #personal_greeting. The first method should be a class method and print a greeting that's generic to the class. The second method should be an instance method and print a greeting that's custom to the object.
```ruby
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
```
Expected output:
Hello! I'm a cat!
Hello! My name is Sophie!


Solution
```ruby
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I am a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
```

###

Solution
```ruby

```

###

Solution
```ruby

```

###

Solution
```ruby

```

###

Solution
```ruby

```

###

Solution
```ruby

```

###

Solution
```ruby

```

###

Solution
```ruby

```