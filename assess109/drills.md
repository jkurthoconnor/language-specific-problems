# Ruby fluency drills
Practice until these patterns and their explanations are second nature

## Basic Data Manipulation

### (string) return length/ number of characters in string
```ruby
str = 'This is my string.'

str.length
```

### (string) return number of specified characters in string
```ruby
str = 'This is my string.'

str.count('i')
```

### (string) delete specified characters in string
```ruby
str = 'This is my string.'

str.delete('is')
# or 
str.delete!('is')
# or 
str.delete('a-z', '^i-s')
```

### (string) delete characters at specified indices in string
```ruby
str = 'This is my string.'

str.slice(1)
# or 
str.slice!(1)
# or
str.slice(1, 4) 
# or 
str.slice(1..4)
```

### (string) return index of specified characters
```ruby
str = 'This is my string.'

str.index('m')
```

### (string) add specified characters to start of string
```ruby
str = 'Hey, it is Friday!'

str.prepend('!!')
```

### (string) add specified characters to end of string
```ruby
str = 'Hey, it is Friday!'

str.concat(' Yes')
# or
str << ' yes'
```

### (string) add / insert specified characters at specified indices in string
```ruby
str = 'Hey, it is Friday!'

str.insert(3, 'eee')
# or 
str.insert(-2, 'aaa')
```

### (string) substitute given character for another
```ruby
str = 'Hey, now it is not Friday.'

str.gsub('i', '!!!')
# or 
str.gsub!('i', '!!!')
```

### (string) reverse character order in string
```ruby
str = 'Hey, now it is not Friday.'
str.reverse
```

   - bonus: reverse without using .reverse on array
   ```ruby
   str = 'Hey, now it is not Friday.'
   
   reversed = []
   split = str.split('')
   while split.length > 0
     reversed.push split.pop
   end
   reversed.join
   
   ```
   
### (string) determine if given characters are present in string
```ruby

```

### (string) return array of characters matching a pattern
```ruby

```


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

p arr + arr3
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
arr = [1, 2, 67, 19]
total = 0
counter = 0

while counter <= arr.length - 1
  total += arr[counter]
  counter += 1
end
# or
arr = [1, 2, 67, 19]

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

