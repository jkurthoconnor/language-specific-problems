## Ruby fluency drills
Practice until these patterns and their explanations are second nature

- [x] (array) iterate over array of numbers and print out each value (iterators v. loops)

```ruby
arr = [1, 2, 3, 4, 5]

arr.each { |number| p number }
# or
arr.each do |number|
  p number
end
```


- [x] (array) iterate over array of numbers and print out only those matching certain conditions

```ruby
arr = [1, 2, 3, 4, 5]

arr.each { |number| p number if number >   2.3 }


arr2 = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data']

arr2.each { |droid| p droid if droid.include?('O') }
```


- [x] (array) append n to end of array

```ruby
arr = [1, 2, 3, 4, 5]

arr.push 101
# or 
arr << 102

# if one does not wish to modify the array...

arr3 = [103]

p arr3 + arr
```


- [x] (array) prepend n to beginning of array

```ruby
arr = [1, 2, 3, 4, 5]

arr.unshift 0
# or
arr.insert(0, -1)
```


- [x] (array) remove specified objects

```ruby
arr = [1, 2, 3, 4, 5]

arr.delete(2)
# or
arr.delete_at(-1)

```


- [x] (array) remove objects at specified indices

```ruby
arr = [1, 2, 3, 4, 5]

arr.delete_at(-1)
```


- [x] (array) remove duplicates using one method

```ruby
arr = [1, 2, 3, 4, 5, 5, 2, 1]

arr.uniq!
```


- [x] (array) extract all odds (or evens, or other criteria) into new array

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


- [x] (array) increment all numbers by 1

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


- [x] (array) find sum of all numbers

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


- [x] (hash) get value of specified key

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh[:pear]
# or
hsh.values_at(:pear)
# or
hsh.fetch(:pear)
```

- [x] (hash) add key/value pair 

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh[:berry] = 'blue'
# or
hsh.store(:potato, 'white')

```
- [x] (hash) print out all keys

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

p hsh.keys

```
- [x] (hash) print out all values

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

p hsh.values

```

- [] (hash) print out all key/value pairs

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh.each { |food, color| p food.to_s + ' ' + color }
# or 
hsh.each { |food, color| puts "a fresh #{food} is #{color}" }
```
- [] (hash) print out all key/value pairs where value meets certain conditions



```ruby


```
- [] (hash) return new hash of pairs meeting certain criteria



```ruby


```
- [] (hash) delete all key/value pairs where value meets certain conditions



```ruby


```

- [] "reverse an array without using the built-in reverse method"



```ruby


```  
- [] "select the element out of the array if its index is a fibonacci number"



```ruby


```  
- [] "write a method to determine if a word is a palindrome, without using the reverse method"



```ruby


```