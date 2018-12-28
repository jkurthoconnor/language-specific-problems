### Exercises for Launch School Course 120, Lesson 4: [Easy 3](https://launchschool.com/lessons/f1c58be0/assignments/98073b61)

1) If we have this code:
```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```
What happens in each of the following cases:

case 1:
```ruby
hello = Hello.new
hello.hi
```
Solution: the following will print to screen: 'Hello'


case 2:
```ruby
hello = Hello.new
hello.bye
```
Solution:  `bye` is not a method that `Hello` class objects can access, so the code will throw an undefined method error.


case 3:
```ruby
hello = Hello.new
hello.greet
```
Solution:  The `hello` object does have access to the `greet` method, but the method requires an argument, and there is none given.  The code will throw a `wrong number of arguments` exception.


case 4:
```ruby
hello = Hello.new
hello.greet("Goodbye")
```
Solution:  The code will print 'Goodbye' to the screen.


case 5:
```ruby
Hello.hi
```
Solution: `hi` is an instance method of the `Hello` class, so it is available to instances of the class.  `hi` is not a class method, so the class cannot call it directly.  This throws an undefined method error.


2) [Based on the previous code] If we call  `Hello.hi` we get an error message. How would you fix this?

Solution: Assuming we want the `Hello` class to call `hi`, I'd rewrite the class as follows.
```ruby
class Hello < Greeting
  def self.hi
    puts "Hello"
  end
end
```

3) When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class, both with separate names and ages?

```ruby
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
```

Solution:
```ruby
spaz = AngryCat.new(1, 'Spaz')
puff = AngryCat.new(12, 'Puff')
```

4) Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"
```ruby
class Cat
  def initialize(type)
    @type = type
  end
end
```

How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

Solution: we can overwrite `Class#to_s` with our own `Cat#to_s` as done below.
```ruby
class Cat
  attr_reader :type
  
  def initialize(type)
    @type = type
  end
  
  def to_s
    puts "I am a #{type} cat"
  end
end
``` 

5) If I have the following class:
```ruby
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
```

What would happen if I called the methods like shown below?
```ruby
tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model
```

Solution: 
- `tv.manufacturer` would throw a no method error, because `manufacturer` is a class method and it is being called by an instance of the class, not the class itself.
- `tv.model` will return what ever the method logic calls for.
- `Television.manufacturer` will return what ever the method logic calls for.
- `Television.model` would throw a no method error, because `model` is an instance method, but it is being called by the class itself

6) If we have a class such as the one below:
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

In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix?

Solution:  We could simply bypass the `age=` setter method and increment the @age instance variable directly (but this seems to be suboptimal).  The result would look like this:
```ruby
def make_one_year_older
  self.age += 1
end
```

7) What is used in this class but doesn't add any value?
```ruby
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
```

Solution: The getter and setter methods for `@brightness` and `@color` aren't called.  If the class consists of only the code above they serve no purpose. Also,  `return` doesn't do anything new: `self.information` will return the string without use of `return`.
