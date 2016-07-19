## Return, from Ruby Basics LaunchSchool exercises   (https://launchschool.com/exercise_sets/d6b1fb73 )

### Breakfast, Lunch or Dinner? (pt1)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  return 'Breakfast'
end

puts meal
```

#### Solution:

The code will print 
```ruby 
Breakfast
```
because that is the return value of the method `meal`.  `return` in a method exits the method and returns the return value of the line marked to return.


### Breakfast, Lunch or Dinner? (pt 2)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  'Evening'
end

puts meal
```

#### Solution:

The code will print 
```ruby
Evening
```
because that is the evaluated result of the last line executed in the method `meal`.  (There is no `return` prior to the line to prevent line from executing.)


### Breakfast, Lunch or Dinner? (pt 3)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  return 'Breakfast'
  'Dinner'
end

puts meal
```

#### Solution:
The code will print
```ruby
Breakfast
``` 
because that is the return value of the line marked `return`.  Because `return` occurs before the 'Dinner' line, the method is exited and never gets to run the 'Dinner' line.


### Breakfast, Lunch or Dinner? (pt 4)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal
```
#### Solution:

The code will print
```ruby
Dinner
Breakfast
``` 
'Dinner' prints because the first line of the method `puts` that word.  'Breakfast' prints because that is the value given to `return`, and the `meal` method is invoked with `puts`, so the return value of the method is printed to screen.

 
### Breakfast, Lunch or Dinner? (pt 5)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  'Dinner'
  puts 'Dinner'
end

p meal
```

#### Solution:
The code will print
```ruby
Dinner
nil
``` 
'Dinner' prints because the method executes the line `puts 'Dinner'`.  `nil` is printed because the return value of `puts` is `nil`, and the method is executed with the line `p meal`.  The line `p meal` prints the return value of `meal`, and the return value of `meal` is the return value of its last line evaluated, which is a `puts` line...thus `nil`.

NB: `p` prints `nil` if such is the value, but `puts` will not 


### Breakfast, Lunch or Dinner? (pt 6)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal
```

#### Solution:

The code will print
```ruby
Breakfast
```
as that is the value given to `return`.  `return` exits the method, so the other lines are never executed.


### Counting Sheep (pt 1)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep
```

#### Solution:

The code will print
```ruby
0
1
2
3
4
5
```
0 .. 4 print because those are the successive values of the block variable `sheep`, and these values are given to `puts` in the `5.times` block. 

5 prints because an `n.times` block returns `n`, i.e. the number of iterations of the block.  This block is the last line evaluated, so it is the return value of the method, and `count_sheep` is invoked with `puts`, so its return value will be printed.


### Counting Sheep (pt 2)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep
```

#### Solution:

The code will print
```ruby
0
1
2
3
4
10
```
0 .. 4 print because those are the successive values of the block variable `sheep`, and these values are given to `puts` in the `5.times` block. 

10 prints because that is the last line evaluated, so it is the return value of the method, and `count_sheep` is invoked with `puts`, so its return value will be printed.


### Counting Sheep (pt 3)
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep
```

#### Solution:

The code will print
```ruby
0
1
2
nil
```
0 .. 2 print because those are the successive values of `sheep`, and these values are given to `puts` in the `n.times` block. The block does not complete its `n` iterations because of the `return` condition.

`nil` is printed because there is no return value specified for the `return`.  In the absence of a given value, `return` exits the method returning `nil`. `p count_sheep` allows this return value to be printed.


### Tricky Number
What will the following code print? Why? Don't run it until you've attempted to answer.

```ruby
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number
```

#### Solution:

The code will print
```ruby
1
```
because that is the value of the last line evaluated in the method. This is because 1 is the value of the variable assignment `number = 1`, and this assignment occurs because the `if` condition (i.e. `true`) given to the conditional statement is met because it evaluates to true.

