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
  attr_accessor :first_name, :last_name
  
  def initialize(fn, ln='')
    self.first_name = fn
    self.last_name = ln
  end
  
  def name
    return "#{self.first_name}" if self.last_name == ''
    "#{self.first_name} #{self.last_name}"
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
    if full_name.split.size == 2
      self.first_name = full_name.split[0]
      self.last_name = full_name.split[1]
    else
      self.first_name = full_name
    end  
  end
  
  def name=(full_name)
    if full_name.split.size == 2
      self.first_name = full_name.split[0]
      self.last_name = full_name.split[1]
      @name = self.first_name + ' ' + self.last_name
    else
      self.first_name = full_name
      @name = self.first_name
    end  
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
end
```

4) 
```ruby
          
```

Solution
```ruby

```

5) 
```ruby
          
```

Solution
```ruby

```







