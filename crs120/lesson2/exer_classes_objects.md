### Exercises for Lesson 2: [Object Oriented Programming](https://launchschool.com/lessons/dfff5f6b/assignments/209fc900)

1) Given the below usage of the Person class, code the class definition.

```ruby
bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
```

Solution
```ruby
class Person
  attr_accessor :name
  
  def initialize(n)
    self.name = n
  end  
end
```

2)  Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

```ruby
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
```
Hint: let first_name and last_name be "states" and create an instance method called name that uses those states.          

Solution
```ruby
class Person
  attr_reader :first_name, :last_name
  
  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split.length > 1 ? name.split[- 1] : ''
  end
  
  def last_name=(last_name)
    @last_name = last_name
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
```

3) Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

```ruby
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'        
```

Solution
```ruby
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name) 
  end
  
  def name=(full_name)
    parse_full_name(full_name)  
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  private
  
  def parse_full_name(full_name)
    if full_name.split.size == 2
      self.first_name = full_name.split[0]
      self.last_name = full_name.split[1]
    else
      self.first_name = full_name
      self.last_name = ''
    end 
  end
end
```

4) Using the class definition from step #3, let's create a few more people -- that is, Person objects.

```ruby
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
```

If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?          

Solution
We could add a method to compare names to the Person class.  Something like below would work.
```ruby
def same_name?(other_person)
  self.name == other_person.name
end
```

5) Continuing with our Person class definition, what does the below print out?
```ruby
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"          
```

Solution
```ruby
# The person's name is #<Person:0x007f93ac870388>
```

Let's add a to_s method to the class:
```ruby
class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end
```
Now, what does the below output?
```ruby
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
```

Solution: 
```ruby
# The person's name is: Robert Smith
```




