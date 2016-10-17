Ruby Basics: [Conditionals](https://launchschool.com/exercise_sets/0b9fd4d2)

### 1. Unpredictable Weather (pt 1)
In the code below, sun is randomly assigned as 'visible' or 'hidden'.

```ruby
sun = ['visible', 'hidden'].sample
```

Write an if statement that prints "The sun is so bright!" if sun equals 'visible'.

### Solution:
```ruby
sun = ['visible', 'hidden'].sample

puts 'The sun is so bright!' if sun == 'visible'
```

### 2. Unpredictable Weather (pt 2)

Write an unless statement that prints "The clouds are blocking the sun!" unless sun equals 'visible'.

### Solution:
```ruby 
sun = ['visible', 'hidden'].sample

puts 'The clouds are blocking the sun!' unless sun == 'visible'
```

### 3. Unpredictable Weather (pt 3)

Write an if statement that prints "The sun is so bright!" if sun equals visible. Also, write an unless statement that prints "The clouds are blocking the sun!" unless sun equals visible.

When writing these statements, take advantage of Ruby's expressiveness and append each condition to its corresponding output.

### Solution:
```ruby
puts 'The sun is so bright!' if sun == 'visible'
puts 'The clouds are blocking the sun!' unless sun == 'visible'
```

### 4. True or False

```ruby
boolean = [true, false].sample
```

Write a ternary operator that prints "I'm true!" if boolean equals true and prints "I'm false!" if boolean equals false.

### Solution:

```ruby
boolean = [true, false].sample

boolean ? puts ("I'm true!") : puts ("I'm false!")
```

### 5. Truthy Number

What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
number = 7

if number
  puts "My favorite number is #{number}."
else
  puts "I don't have a favorite number."
end
```

### Solution:

This code will print: My favorite number is 7.  Because Ruby is 'truthy', any object that does not evaluate to `false` or `nil` will evaluate to `true` when used as a Boolean.  As a result, `number` evaluates to `true` and the antecedent condition is met.


### 6. Stoplight (Part 1)

In the code below, stoplight is randomly assigned as 'green', 'yellow', or 'red'.

```ruby
stoplight = ['green', 'yellow', 'red'].sample
```

Write a case statement that prints "Go!" if stoplight equals 'green', "Slow down!" if stoplight equals 'yellow', and "Stop!" if stoplight equals 'red'.

### Solution:

```ruby
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end
```

### 7. Stoplight (Part 2)

Convert the following case statement to an if statement.

```ruby
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
```

### Solution:

```ruby
stoplight = ['green', 'yellow', 'red'].sample

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else 
  puts 'Stop!'
end
```
### 8. Sleep Alert

In the code below, status is randomly assigned as 'awake' or 'tired'.

```ruby
status = ['awake', 'tired'].sample
```

Write an if statement that returns "Be productive!" if status equals 'awake' and returns "Go to sleep!" otherwise. Then, assign the return value of the if statement to a variable and print that variable.

### Solution:

```ruby
status = ['awake', 'tired'].sample

advice = if status == 'awake'
            "Be productive!"
          else
            "Go to sleep!"
          end

puts advice
```

### 9. Cool Numbers

In the code below, number is randomly assigned a number between 0 and 9. Then, an if statement is used to print "5 is a cool number!" or "Other numbers are cool too!" based on the value of number.

```ruby
number = rand(10)

if number = 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end
```

Currently, "5 is a cool number!" is being printed every time the program is run. Fix the code so that "Other numbers are cool too!" gets a chance to be executed.

### Solution:

```ruby
number == rand(10)

if number = 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end
```

### 10. Stoplight (Part 3)

Reformat the following case statement so that it only takes up 5 lines.

```ruby
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
```

### Solution:

```ruby
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end
```

