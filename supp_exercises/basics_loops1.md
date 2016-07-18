## Loops 1, from Ruby Basics LaunchSchool exercises   (https://launchschool.com/exercise_sets/2ce91ec4) 

### Runaway Loop
The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the first iteration.

```ruby
loop do
  puts 'Just keep printing...'
end
```

Solution

```ruby
loop do
  puts 'Just keep printing...'
  break 
end
```

### Loopception
The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loop stops after the first iteration.

```ruby
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
  end
end

puts 'This is outside all loops.'
```

Solution

```ruby
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break # added to stop inner loop after first iteration
  end
  
  break # added to stop outer loop after first iteration
end

puts 'This is outside all loops.'

```


### Control the Loop
Modify the following loop so it iterates 5 times instead of just once.

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break
end
```

Solution

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# or

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations == 5
  iterations += 1
end
```


### Loop on Command

Modify the code below so the loop stops iterating when the user inputs 'yes'.
```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end
```
Solution:
```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end
```

### Say Hello
Modify the code below so "Hello!" is printed 5 times.

```ruby
say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end
```

Solution

```ruby
say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter == 5
end
```


### Print While
Using a while loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.

```ruby
numbers = []

while <condition>
  # ...
end
```

Solution

```ruby
numbers = []
counter = 0

while counter < 5
  numbers.push rand(100)
  counter += 1
end

puts numbers
```



### Loopception
```ruby

```



### Loopception
```ruby

```