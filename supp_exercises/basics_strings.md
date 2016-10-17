Ruby Basics: [Strings](https://launchschool.com/exercise_sets/abf5dd86)

### 1. Create a String

Create an empty string using the String class.

### Solution:

```ruby
str = String.new
```

### 2. Quote Confusion

Modify the following code so that double-quotes are used instead of single-quotes.

```ruby
puts 'It\'s now 12 o\'clock.'
```
Expected output:

```ruby
It's now 12 o'clock.
```

### Solution:
```ruby
puts "It's now 12 o'clock."
```

### Further Exploration:
%Q is an alternative to double-quoted strings. There's also an alternative for single-quoted strings: %q.

What about strings that contain double- and single-quotes? How would you write those using the alternate syntax?
```ruby
str = %Q(Bob said "Hey, that's not fair!")
str2 = %q(Tony, this's not right.)
```

### 3. Ignoring Case

Using the following code, compare the value of name with the string 'RoGeR' while ignoring the case of both strings. Print true if the values are the same; print false if they aren't. Then, perform the same case-insensitive comparison, except compare the value of name with the string 'DAVE' instead of 'RoGeR'.

```ruby
name = 'Roger'
```
Expected output:

```ruby
true
false
```

### Solution:

```ruby
name = 'Roger'

value = 'RoGeR'.casecmp(name)
puts value == 0

value = 'DAVE'.casecmp(name)
puts value == 0  
```
### 4. Dynamic String

Modify the following code so that the value of name is printed within "Hello, !".

```ruby
name = 'Elizabeth'

puts "Hello, !"
```
Expected output:

```ruby
Hello, Elizabeth!
```

### Solution:

```ruby
name = 'Elizabeth'

puts "Hello, #{name}!"
```

### 5. Combining Names

Using the following code, combine the two names together to form a full name and assign that value to a variable named full_name. Then, print the value of full_name.

```ruby
first_name = 'John'
last_name = 'Doe'
```

Expected output:

```ruby
John Doe
```

### Solution:

```ruby
first_name = 'John'
last_name = 'Doe'

full_name = "#{first_name} #{last_name}"
puts full_name
```
### 6
### 7
### 8
### 9
### 10