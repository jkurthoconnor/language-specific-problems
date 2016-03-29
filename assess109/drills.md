# Ruby fluency drills
Practice until these patterns and their explanations are second nature

## Basic Data Manipulation

### (array) iterate over array of numbers and print out each value (iterators v. loops)
```ruby
arr = [1, 2, 3, 4, 5]

arr.each { |number| p number }
# or
arr.each do |number|
  p number
end
```

### (array) iterate over array of numbers and print out only those matching certain conditions
```ruby
arr = [1, 2, 3, 4, 5]

arr.each { |number| p number if number >   2.3 }


arr2 = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data']

arr2.each { |droid| p droid if droid.include?('O') }
```


### (array) append n to end of array

```ruby
arr = [1, 2, 3, 4, 5]

arr.push 101
# or 
arr << 102

# if one does not wish to modify the array...

arr3 = [103]

p arr3 + arr
```


### (array) prepend n to beginning of array

```ruby
arr = [1, 2, 3, 4, 5]

arr.unshift 0
# or
arr.insert(0, -1)
```


### (array) remove specified objects

```ruby
arr = [1, 2, 3, 4, 5]

arr.delete(2)
# or
arr.delete_at(-1)

```


### (array) remove objects at specified indices

```ruby
arr = [1, 2, 3, 4, 5]

arr.delete_at(-1)
```


### (array) remove duplicates using one method

```ruby
arr = [1, 2, 3, 4, 5, 5, 2, 1]

arr.uniq!
```


### (array) extract all odds (or evens, or other criteria) into new array
```ruby
arr = [1, 2, 3, 4, 5, 5, 2, 1]
new_arr = []

arr.each do |number|
  if number.odd?
    new_arr.push number
  end
end

# or

new_arr = arr.select { |number| number.even? }
```


### (array) increment all numbers by 1
```ruby
arr = [1, 2, 3, 4, 5, 5, 2, 1]

arr.map { |number| number + 1 }
# or
arr.map { |number| number.next }
# or
incremented_arr = []

arr.each do |number|
  incremented_arr.push number + 1
end

```


### (array) find sum of all numbers
```ruby
arr = [1, 2, 3, 4, 5]

total = 0
arr.each do |number|
  total += number
end

p total
# or
arr.inject { |sum, number| sum += number }
```

### (hash) get value of specified key
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh[:pear]
# or
hsh.values_at(:pear)
# or
hsh.fetch(:pear)
```

### (hash) add key/value pair 
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh[:berry] = 'blue'
# or
hsh.store(:potato, 'white')

```
### (hash) print out all keys
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

p hsh.keys

```
### (hash) print out all values

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

p hsh.values

```

### (hash) print out all key/value pairs

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh.each { |food, color| p food.to_s + ' ' + color }
# or 
hsh.each { |food, color| puts "a fresh #{food} is #{color}" }
```


### (hash) print out all key/value pairs where value meets certain conditions

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan' }

hsh.each { |food, color| puts "#{fruit} is #{color}" if color.length > 3 }
 # or
 
hsh.each do |food, color|
  if color.length > 3
    p food.to_s + ' ' + color
  end
end
```

### (hash) return new hash of pairs meeting certain criteria
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan'}

hsh.select { |food, color| food.to_s.include?('r') }

```
### (hash) delete all key/value pairs where value meets certain conditions

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan'}

hsh.delete_if { |food, color| color.length > 3 }
# or
hsh.keep_if { |food, color| food.to_s.include?('r') }
```

## Larger Data Manipulation

### "reverse an array without using the built-in reverse method"
```ruby
arr = [1, 2, 3, 4, 5]
arr_reversed = []

while arr.length > 0
  arr_reversed.push arr.pop
end
# or
while arr.length > 0
  arr_reversed.unshift arr.shift
end

# NONE OF THESE WORK, appear to have incomplete iteration through array
# arr.each do |number|
#   arr_reversed.push arr.pop
# end

# arr.each do |number|
#   arr_reversed.unshift arr.shift
# end

# arr.map do |number|
#   arr_reversed.push arr.pop
# end
``` 

### FizzBuzz: write a FizzBuzz method that takes a start and end number as parameters
```ruby
def fizzbuzz(start, stop)
  n = start
  while n <= stop
    if n % 3 == 0 && n % 5 == 0
      puts 'FizzBuzz'
    elsif n % 3 == 0
      puts 'Fizz'
    elsif n % 5 == 0 
      puts 'Buzz'
    else
      puts n
    end
    n += 1
  end
end

fizzbuzz(1, 50)
```

### write a method that takes an array and returns an array of the same string values except with the vowels removed
```ruby
def remove_vowels(arr)
  arr.map { |element| element.delete('aeiou') }
end

array = ["red", "green", "orange", "tan"]
p remove_vowels(array)

```


### "select the element out of the array if its index is a fibonacci number"
```ruby
array = ["red", "green", "orange", "tan", "purple", "magenta", "yellow"] 
fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

array.select do |color|
  fib.include?(array.index(color))
end
```  

### "write a method to determine if a word is a palindrome, without using the reverse method"
```ruby
def palindrome?(word)
  reversed_ltrs = []
  ltrs = word.split('')

  while ltrs.length > 0
    reversed_ltrs.push ltrs.pop
  end
  reversed_word = reversed_ltrs.join
  word == reversed_word
end
```

### write method that determines if there is a balanced number of parentheses
  - bonus: add check to ensure parentheses are in correct order