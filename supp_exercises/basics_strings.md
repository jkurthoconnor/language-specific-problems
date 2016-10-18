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
### 6. Tricky Formatting

Using the following code, capitalize the value of state then print the modified value. Note that state should have the modified value both before and after you print it.

```ruby
state = 'tExAs'
```
Expected output:
Texas

### Solution:

```ruby
state = 'tExAs'
state.capitalize!
puts state
```

### 7. Goodbye, not Hello

Given the following code, invoke a destructive method on greeting so that Goodbye! is printed instead of Hello!.

```ruby
greeting = 'Hello!'
puts greeting
```

Expected output:

Goodbye!

### Solution:

```ruby
greeting = 'Hello!'
greeting.sub!('Hello!', 'Goodbye!')
```
### 8. Print the Alphabet

Using the following code, split the value of alphabet by individual characters and print each character.

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
```

### Solution:

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.chars
```

### 9. Pluralize

Given the following code, use Array#each to print the plural of each word in words.

```ruvy
words = 'car human elephant airplane'
```
Expected output:

cars
humans
elephants
airplanes

### Solution:

```ruby
words = 'car human elephant airplane'

words.split.each do |word|
  p word + 's'
end
```
### 10. Are You There?

Using the following code, print true if colors includes the color 'yellow' and print false if it doesn't. Then, print true if colors includes the color 'purple' and print false if it doesn't.

```ruby
colors = 'blue pink yellow orange'
```
Expected output:

true
false

### Solution:

```ruby
colors = 'blue pink yellow orange'

colors.include?('yellow') ? puts(true) : puts(false)
colors.include?('purple') ? puts(true) : puts(false)
```