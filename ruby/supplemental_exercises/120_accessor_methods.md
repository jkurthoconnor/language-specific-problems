120: Object Oriented Programming
OO Basics: [Accessor Methods](https://launchschool.com/exercise_sets/1485a78e)

1) Reading and Writing

Add the appropriate accessor methods to the following code.

```ruby
class Person
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

# Expected output:
# 
# Jessica
```

Solution: 

```ruby
class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
```

2) Choose the Right Method

Add the appropriate accessor methods to the following code.

```ruby
class Person
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

# Expected output:
# 
# Jessica
```

Solution:

```ruby
class Person
  attr_accessor :name
  attr_writer :phone_number
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name
```

3) Access Denied

Modify the following code so that the value of @phone_number can't be modified outside the class.

```ruby
class Person
  attr_accessor :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number

# Expected output:
# 
# 1234567899
# NoMethodError
```

Solution:

```ruby
class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number
```

4) Comparing Names

Using the following code, add the appropriate accessor methods. Keep in mind that @last_name shouldn't be visible outside the class.

```ruby
class Person
  def first_equals_last?
    first_name == last_name
  end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

# Expected output:
# 
# false
```

 Solution:
 
```ruby
class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == @last_name
  end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?
```

The Online Solution (below) has the advantage of not directly referencing the @last_name instance variable.

```ruby
class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?
```

5) Who is Older?

Using the following code, add the appropriate accessor methods. Keep in mind that @age should only be visible ~~to instances of Person.~~ outside of the class 

```ruby
class Person
  def older_than?(other)
    age > other.age
  end
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)
# Expected output:
# 
# false
```

Solution:

```ruby
class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)
```

6) Guaranteed Formatting

Using the following code, add the appropriate accessor methods so that @name is capitalized upon assignment.

```ruby
class Person
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

# Expected output:
# 
# Elizabeth
```

Solution:

```ruby
class Person
  attr_reader :name

  def name=(n)
    @name = n.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
```

7) Prefix the Name

Using the following code, add the appropriate accessor methods so that @name is returned with the added prefix 'Mr.'.

```ruby
class Person
end

person1 = Person.new
person1.name = 'James'
puts person1.name
# Expected output:
#
# Mr. James
```

Solution:

```ruby
class Person
  attr_writer :name

  def name
    'Mr. ' + @name
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name
```

8) Avoid Mutation

The following code is flawed. It currently allows @name to be modified from outside the method via a destructive method call. Fix the code so that it returns a copy of @name instead of a reference to it.

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name
# Expected output:
# 
# James
```


Solution:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name[0..-1] # or `@name.clone`
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name
```

9) Calculated Age

Using the following code, multiply @age by 2 upon assignment, then multiply @age by 2 again when @age is returned by the getter method.

```ruby
class Person
end

person1 = Person.new
person1.age = 20
puts person1.age
# Expected output:
# 
# 80
```

Solution:

```ruby
class Person
  def age=(a)
    @age = a * 2
  end

  def age
    @age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age
```

10) Unexpected Change

Modify the following code to accept a string containing a first and last name. The name should be split into two instance variables in the setter method, then joined in the getter method to form a full name.

```ruby
class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

# Expected output:
# 
# John Doe
```

Solution:

```ruby
class Person
  def name=(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
```