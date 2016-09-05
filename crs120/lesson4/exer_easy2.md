### Exercises for Launch School Course 120, Lesson 4: [Easy 2](https://launchschool.com/lessons/f1c58be0/assignments/25448951)

1) You are given the following code:
```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
```
What is the result of calling
```ruby
oracle = Oracle.new
oracle.predict_the_future
```

Solution:  The code will return "You will " plus a string sampled from `choices`.  But it _will not print_ this return value to the screen.

2) Question 2

We have an Oracle class and a RoadTrip class that inherits from the Oracle class.
```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
```
What is the result of the following:
```ruby
trip = RoadTrip.new
trip.predict_the_future
```

Solution:  The code will return "You will " plus a string sampled from the `RoadTrip` class `choices` method.  This is because `RoadTrip` class `choices` method overwrites the `Oracle` class method of the same name. The overwriting occurs because the method lookup path begins with the calling object's class, and goes no further if finds a method by the relevant name. But it _will not print_ this return value to the screen.

3) How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?
```ruby
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
```

What is the lookup chain for Orange and HotSauce?

Solution: Ruby looks for a method by following the method lookup path.  This path begins with the class of the calling object, and then looks to any of the class' mixed in modules in reverse order of inclusion.  From there, the path runs to the calling object's superclass.  If the method is still not found, the path runs to the superclass' mixins, again in reverse order of inclusion.

Given the code above, the path for an object of the Orange class is: Orange, Taste.
Given the code above, the path for an object of the HotSauce class is: HotSauce, Taste.

Calling `Class#ancestors` on an object will reveal the full path.

4) What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?
```ruby
class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
```

Solution: To simplify the `BeesWax` class, we could add the shorthand for defining reader and writer methods.  This would allow us to remove the `type` and the `type=()` classes. Since we already have a type getter method.  Removing the `@` prefix on `type` in the `describe_type` method is also helpful.  This calls the `type` getter method instead of directly appealing to the instance variable.See below.

```ruby
class BeesWax
  attr_accessor :type
  
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end
```

5) There are a number of variables listed below. What are the different types and how do you know which is which?
```ruby
excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"
```

Solution:  
```ruby
excited_dog = "excited dog" # this is a local variable (note the lack of prefix)
@excited_dog = "excited dog" # this is an instance variable (note the `@` prefix)
@@excited_dog = "excited dog" # this is a class variable (note the `@@` prefix)
```

6) If I have the following class:
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
Which one of these is a class method (if any) and how do you know? How would you call a class method?

Solution:  `self.manufacturer` is the class method.  The prefix `self` distinguishes it from the un-prefixed instance methods of the same class.  In this context, `self` refers to the class.  One calls a class method from the class itself, as seen below.
```ruby
Television.manufacturer
```

7) If we have a class such as the one below:
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
Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

Solution: `@@cats_count` is a class variable, which means that it keeps track of state at the class level, and all instances of the class share a single copy of this variable.  In this case, the variable in question keeps track of the number of `Cat` objects.  Starting with 0, it increments by 1 with every new `Cat` object initialization.  

I'd test this theory as follows:
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

puff = Cat.new('tabby')
fritz = Cat.new('IDK')

p Cat.cats_count  # => 2
```

8) If we have this class:
```ruby
class Game
  def play
    "Start the game!"
  end
end
```
And another class:
```ruby
class Bingo
  def rules_of_play
    #rules of play
  end
end
```

What can we add to the Bingo class to allow it to inherit the play method from the Game class? 

Solution:  We could make `Bingo` a subclass of `Game`, like this:
```ruby
class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```

9) If we have this class:
```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```

What would happen if we added a `play` method to the `Bingo` class, keeping in mind that there is already a method of this name in the `Game` class that the `Bingo` class inherits from.
.
Solution:  If a `play` method were added to the `Bingo` class, this would overwrite the `Game` `play` method whenever `play` was called by an instance of the `Bingo` class.  Which is to say that Ruby would execute `Bingo#play` method, and not `Game#play` method.


10) What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

Solution:  OO helps organize the code.  It also allows creating objects and behaviors that respond to the needs of the program. It helps to prevent duplication of code.
