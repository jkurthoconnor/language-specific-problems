Ruby Basics exercises: [Methods](https://launchschool.com/exercise_sets/aefc58b9)

### 1. Write two methods, one that returns the string "Hello" and one that returns the string "World". Then print both strings using #puts, combining them into one sentence.

Expected output:

Hello World

#### Solution:

```ruby
def say_hello
  "Hello"
end

def say_world
  "World"
end

puts "#{say_hello} #{say_world}"
puts say_hello + ' ' + say_world
```

### 2. Write a method named greet that invokes the following methods:

```ruby
def say_hello
  'Hello'
end

def say_world
  'World'
end
```

When greet is invoked with #puts, it should output the following:
Hello World

#### Solution:

```ruby
def say_hello
  'Hello'
end

def say_world
  'World'
end

def greet
  "#{say_hello} #{say_world}"
end
```

### 3. Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.

```ruby
car('Toyota', 'Corolla')
```
Expected output:

Toyota Corolla

### Solution:

```ruby
def car (string1, string2)
  puts "#{string1} #{string2}"
end
```

### 4. The variable below will be randomly assigned as true or false. Write a method named time_of_day that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false. Pass daylight into the method as the argument to determine whether it's day or night.

```ruby
daylight = [true, false].sample
```

### Solution:

```ruby
daylight = [true, false].sample

def time_of_day(boolean)
  boolean ? (puts "It's daytime!") : (puts "It's nighttime!")
end

time_of_day(daylight)
```

### 5. Fix the following code so that the names are printed as expected.

```ruby
def dog
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat}."
```
Expected output:

The dog's name is Spot.
The cat's name is Ginger.

### Solution:

```ruby
def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."
```

### 6. Write a method that accepts one argument, but doesn't require it. The parameter should default to the string "Bob" if no argument is given. The method's return value should be the value of the argument.

```ruby
puts assign_name == 'Bob'
puts assign_name('Kevin') == 'Kevin'
# The code should output true twice.
```

### Solution:

```ruby
def assign_name(name = 'Bob')
  name
end
```

### 7. Write the following methods so that each output is true.

```ruby
puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
```

### Solution:

```ruby
def add(n1, n2)
  n1 + n2
end

def multiply(n1, n2)
  n1 * n2
end
```

### 8. The variables below are both assigned to arrays. The first one, names, contains a list of names. The second one, activities, contains a list of activities. Write the methods name and activity so that they each take the appropriate array and return a random value from it. Then write the method sentence that combines both values into a sentence and returns it from the method.

```ruby
names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
```

### Solution:

```ruby
def name(array)
  array.sample
end

def activity(array)
  array.sample
end

def sentence(name, activity)
  "#{name} went #{activity} today."
end
```

### 9. Write a method named print_me that prints "I'm printing within the method!" when invoked.

```ruby
print_me
```

### Solution:

```ruby
def print_me
  puts "I'm printing from within the method!"
end
```

### 10. Write a method named print_me that returns "I'm printing the return value!" when using the following code.

```ruby
puts print_me
```

### Solution:

```ruby
def print_me
  "I'm printing the return value!"
end
```