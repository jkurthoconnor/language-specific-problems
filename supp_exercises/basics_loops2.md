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

Solution

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

Solution

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

Solution

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

Solution

```ruby
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
end
``` 

### 

```ruby

```

Solution

```ruby

``` 

### 

```ruby

```

Solution

```ruby

``` 

### 

```ruby

```

Solution

```ruby

``` 

### 

```ruby

```

Solution

```ruby

``` 

### 

```ruby

```

Solution

```ruby

``` 

### 

```ruby

```

Solution

```ruby

``` 

### 

```ruby

```

Solution

```ruby

``` 

