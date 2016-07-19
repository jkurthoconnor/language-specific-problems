## Loops 2, from Ruby Basics LaunchSchool exercises   (https://launchschool.com/exercise_sets/7d22644c )

### Even or Odd?
Write a loop that prints numbers 0-5 and whether the number is even or odd. Use the code below to get started.

```ruby
count = 1

loop do
  count += 1
end

# Expected output:

1 is odd!
2 is even!
3 is odd!
4 is even!
5 is odd!
```

#### Solution:

```ruby
count = 1

loop do
  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"
  end
  
  break if count == 5
  count += 1
end
``` 


### Catch the Number
Modify the following code so that the loop stops if number is between 0 and 10.

```ruby
loop do
  number = rand(100)
  puts number
end
```

#### Solution:

```ruby
loop do
  number = rand(100)
  puts number
  break if (0..10).cover?(number)
end
``` 


### Conditional Loop
Using an if/else statement, run a loop that prints "The loop was processed!" one time if process_the_loop equals true. Print "The loop wasn't processed!" if process_the_loop equals false.

```ruby
process_the_loop = [true, false].sample
```

#### Solution:

```ruby
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end
``` 


### Get the Sum
The code below asks the user "What does 2 + 2 equal?" and uses #gets to retrieve the user's answer. Modify the code so "That's correct!" is printed and the loop stops when the user's answer equals 4. Print "Wrong answer. Try again!" if the user's answer doesn't equal 4.

```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
end
```

#### Solution:

```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  
  if answer == 4
    puts "That's correct!"
    break
  end
  
  puts "Wrong answer.  Try again!"
end
``` 


### Insert Numbers
Modify the code below so that the user's input gets added to the numbers array. Stop the loop when the array contains 5 numbers.

```ruby
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
end

puts numbers
```

#### Solution:

```ruby
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  
  numbers.push(input)
  break if numbers.length == 5
end

puts numbers
``` 


### Empty the Array
Given the array below, use loop to remove and print each name. Stop the loop once names doesn't contain any more elements. Keep in mind to only use loop, not while, until, etc.

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']
```

#### Solution:

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end

# or 

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop
  break if names.empty?
end
```
 

### Stop Counting
The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals 2.

```ruby
5.times do |index|
  # ...
end
```

#### Solution:

```ruby
5.times do |index|
  p index
  break if index == 2
end
``` 

#### Further Exploration:

```ruby 
5.times do |index| 
  puts index # will print 5 times, ending on 4
  break if index == 4
end
```

```ruby
5.times do |index| 
  puts index # will print one time, ending on 0
  break if index < 7
end
```


### Only Even
Using next, modify the code below so that it only prints even numbers.

```ruby
number = 0

until number == 10
  number += 1
  puts number
end
```

#### Solution:

```ruby
number = 0

until number == 10
  number += 1
  if number.odd?
    next
  end
  puts number
end
``` 

#### Further Explorations:
`next` must come after incrementation and before `puts` to ensure that iterations of odd numbers are skipped. 


### First to Five
The following code increments number_a and number_b by either 0 or 1. loop is used so that the variables can be incremented more than once, however, break stops the loop after the first iteration. Use next to modify the code so that the loop iterates until either number_a or number_b equals 5. Print "5 was reached!" before breaking out of the loop.

```ruby
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  break
end
```

#### Solution:

```ruby
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5
  
  puts "5 was reached!"
  break
end
``` 


### Greeting
Given the code below, use a while loop to print "Hello!" twice.

```ruby
def greeting
  puts 'Hello!'
end

number_of_greetings = 2
```

#### Solution:

```ruby
def greeting
  puts 'Hello!'
end

number_of_greetings = 2
times = 1

while times <= number_of_greetings
  greeting
  times += 1
end
``` 


