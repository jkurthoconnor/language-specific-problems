## Larger Data Manipulation


### "reverse an array without using the built-in reverse method."
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
# or
arr.each do |n|
  arr_reversed.unshift n
end
```

  - Bonus: do so without sending elements to another array
  
```ruby
arr = ['this', 'is', 'my', 'array']
index = 0

while index < arr.length
  arr.insert(0, arr.delete_at(index))
  index += 1
end
p arr

# or 
def reverse(array)
  array.each_with_index do |n, ind|
    array.unshift(array.delete_at(ind))
  end
  array
end
```
 

### FizzBuzz: write a FizzBuzz method that takes a start and end number as parameters
```ruby
def fizzbuzz(start, stop)
  fb = []
  (start..stop).each do |n|
    if n % 3 == 0 && n % 5 == 0
      fb.push('FizzBuzz')
    elsif n % 3 == 0
      fb.push('Fizz')
    elsif n % 5 == 0
      fb.push('Buzz')
    else
    fb.push n
    end
  end 
  fb 
end

puts fizzbuzz(1, 100)

# or use a manual while loop
def fizzbuzz(start, stop)
  fb = []
  n = start
  while n <= stop
    if n % 3 == 0 && n % 5 == 0
      fb.push('FizzBuzz')
    elsif n % 3 == 0
      fb.push('Fizz')
    elsif n % 5 == 0
      fb.push('Buzz')
    else
    fb.push n
    end
    n += 1
  end 
  fb 
end

puts fizzbuzz(1, 100)

# or take a range directly as parameter and print

def fizzbuzz(range)
  range.each do |n|
    if n % 3 == 0 && n % 5 == 0
      p 'fizzbuzz'
    elsif n % 3 == 0
      p 'fizz'
    elsif n % 5 == 0
      p 'buzz'
    else
      p n
    end
  end
end

fizzbuzz(1..50)
```


### write a method that takes an array and returns an array of the same string values except with the vowels removed
```ruby
def delete_vowels(arr)
  arr.map {|element| element.downcase.gsub(/[aeiou]/, '')}
  # or  `arr.map { |element| element.delete('aeiou') }`
end

pets = [ 'dog', 'cat', 'bird', 'turtle', 'lizard' ]

delete_vowels(pets)

# or without `map`

# non-destructive:
def vowel_deleter(arr)
  removed = []
  n = 0
  while n < arr.length
    removed.push arr[n].delete('aeiou')
    n += 1
  end  
  p removed
end

pets = [ 'dog', 'cat', 'bird', 'turtle', 'lizard' ]

# destructive:

def vowel_deleter(arr)
  removed = []
  while arr.length > 0
    removed.push arr.pop.delete('aeiou')
  end  
  p removed
end

pets = [ 'dog', 'cat', 'bird', 'turtle', 'lizard' ]
```


### "write a method to generate fibonacci numbers between 0 and a stop point"
```ruby
def fib(start, stop)
  fib = [start, start + 1]
  until fib[-2] + fib[-1] > stop
    fib.push(fib[-2] + fib[-1])
  end
  fib
end

p fib(0, 1000)

# or

def fibonacci(stop)
  a = 0
  b = 1
  puts a
  puts b
  loop do
    c = a + b
    break if c >= stop
    puts c
    a = b
    b = c
  end
end

# or 

def make_fib(start, stop)
  fib = [start, start + 1]
  a = fib[0]
  b = fib[1]
  while a + b < stop
    c = a + b
    fib.push c
    a = b
    b = c
  end
  fib
  end
end

p make_fib(0, 100)

```


### "select the element out of the array if its index is a fibonacci number"

```ruby
array = ["red", "green", "orange", "tan", "purple", "magenta", "yellow", "blue"] 
fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

array.select.with_index do |color, ind| 
  fib.include?(ind) 
end

# or

array = ["red", "green", "orange", "orange", "tan", "purple", "magenta", "yellow", "blue"] 
fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
fib_ind = []
ind = 0

while ind < array.length
  fib_ind.push array[ind] if fib.include?(ind)
  ind += 1
end

p fib_ind

# or

def fib_indices(array)
  fibon = [0, 1]
  until fibon[-2] + fibon[-1] > array.length - 1
    fibon.push(fibon[-2] + fibon[-1])
  end
  array.select.with_index { |ele, ind| fibon.include?(ind) }
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
  
```ruby
def balanced_paren?(str)
  str.count('(') == str.count(')')
end

string = 'This (is) my (st)rin)g'
balanced_paren?(str)
```

  - Bonus:  
```ruby
def parens_check(string)
  if string.count('(') != string.count(')')
    return "Tested string does not have a balanced number of opening and closing parentheses."
  end
  index = 0
  open_paren = 0
  close_paren = 0
  while index < string.length
    open_paren += 1 if string[index] == ('(')
    close_paren += 1 if string[index] ==(')')
    if close_paren > open_paren
      return "parentheses out of order at index #{index}"
    end
    index += 1
  end
  "Looks like parentheses are correctly paired and ordered!"
end

# or without manual counting

def balanced_ordered(string)
  if string.count('(') != string.count(')')
    return 'unequal number of opening and closing parens'
  end
  index = 0
  until index == string.length
    if string[0..index].count('(') < string[0..index].count(')')
      return "closing parens exceed opening at index: #{index}"
    end
    index +=1
  end
  "good job!"
end
  
p balanced_ordered('(this is balanced)')
p balanced_ordered('(this is(not balanced)')
p balanced_ordered('(((balanced, not ordered))))(')
p balanced_ordered(')(((balanced, not ordered))))((')

```


### write a search method that returns all elements in a hash matching a set of conditions

```ruby
food = {
  grape: {color: 'red', cost: 75}, 
  pear: {color: 'green', cost: 50},
  carrot: {color: 'orange', cost: 100},
  potato: {color: 'tan', cost: 150}
 }
 
 def search_or(hash, color, cost)
   hash.select do |item_name, data|
     data[:color] == color || data[:cost] == cost
   end
 end
 
p search_or(food, 'red', 100)
```


### challenge from video 4: implement this search method
```ruby
PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]
# filtering criteria
query = {
  price_min: 240, 
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(criteria)
  PRODUCTS.each do |product|
    if (product[:name].downcase.include?(criteria[:q])) && (product[:price] >= criteria[:price_min]) && (product[:price] <= criteria[:price_max])
      p product
    end
  end
end

search(query)
# => [ { name: 'Thinkpad x220', price: 250 } ]

search(query2)
# => [{name: 'Dell Inspiron", price: 300}, {name: 'Dell Inspiron', price: 450}]


# or

def search(items, criteria)
  items.select {|product| product[:name].downcase.include?(criteria[:q]) && product[:price] >= criteria[:price_min] && 
  product[:price] <= criteria[:price_max] }
end

p search(PRODUCTS, query)

p search(PRODUCTS, query2)
```

### write a title case method

```ruby
title = 'tHis is MY sample TItlE'

def title_case(string)
  title_words = string.split
  title_words.each do |word|
    word.capitalize!
  end
  title_words.join(' ')
end
```


### write a method that takes a string and returns an array of the indices of single characters that match a pattern. bonus: do same with matched of multi-char strings
```ruby
str = "ThiS is the String to uSe for single ChAr paTTernS matches"

def indexer(str, match)
  match_indexes = []
  str.split('').each_with_index do |char, ind|
    match_indexes.push ind if char == match
  end
  match_indexes
end

```
Bonus

```ruby
def indices(string, pattern) 
  indices = []
  index = 0
  while index < string.length
    indices.push index if string[index, pattern.length] == pattern
    index += 1
  end
  indices
end

str = "thIS IS nOt, IS not, a string?"
p indices(str, 'IS')

# or

def indices(string, match)
  indices = []
  ind = 0
  while ind < string.length
    range = ind...(ind + match.length)
    indices.push(ind) if string[range] == match
    ind += 1
  end
  indices
end

str = "thIS IS nOt, IS not, a string?"
p indices(str, 'IS')
```


### write a method that takes an array and returns the indices of all elements meeting given criteria (e.g. odd)

```ruby
arr = [1, 5, 2, 3, 1, 2, 4, 1, 4, 6, 3 ]

def odds(array)
  indices = []
  index = 0
  while index < array.length
    indices.push(index) if array[index].odd?
    index += 1
  end
  indices
end

# or invoking an iterator

def indices(array)
  indices = []
  array.each_with_index do |element, index|
    if element.include?('n')
      indices.push([index, element])
    end
  end
  indices
end

arr2 = [ 'van', 'boat', 'plane', 'van', 'car', 'bike', 'van', 'skateboard', 'roller skates', 'skateboard']

p indices(arr2)
```


### write a method that takes an array and an object to match, and returns the indices of all matches

```ruby
arr = [1, 2, 6, 4, 1, 55, 4, 1, 5 ]

def return_indexes(arr, match)
  indexes = []
  ind = 0
  arr.each do |n| 
    if n == match 
      indexes.push ind
    end
    ind += 1
  end
  indexes
end
```


### write a method to check if a number is a prime

```ruby
def prime?(n) ###add guard clauses for 1 and 2!!
  divisors = []
  (2...n).each do |divisor|
    divisors.push divisor if n % divisor == 0
  end
  divisors.length == 0
end
```


### write a method to output all primes between a start and stop point

```ruby  
def primes_btwn(start, stop) ###add guard clauses for 1 and 2!!
  primes = []
  (start..stop).each do |n|
    divisors = []
    (2...n).each do |divisor|
      divisors.push divisor if n % divisor == 0
    end
    primes.push n if divisors.length == 0
  end
  p "The prime numbers between #{start} and #{stop} are: #{primes}"
end

primes_btwn(2, 100)
```


### write a method that takes a number and returns all of its factors

```ruby
def factor(integer)
  factors = []
  (1..integer/2).each do |n|
    factors.push n if integer % n == 0
  end
  factors.push(integer)
  factors
end

# or to save 2 iterations b/c results are known

def factor(integer)
  factors = [1, integer]
  (2..integer/2).each do |fac|
    factors.insert(-2, fac) if integer % fac == 0
  end
  factors
end
```


### return the indices of duplicates in an array

```ruby
#NB: the challenge is that `.index` only returns the  index of first occurrence

arr = [ 1, 2, 3, 1, 2, 3, 4, 5, 6, 7, 1]
ele_ind = {} # keys: elements; values: indices in arrays
arr.each_with_index do |n, ind|
  if arr.count(n) > 1 && ele_ind.include?(n)
    ele_ind[n].push ind
  elsif arr.count(n) > 1 
    ele_ind[n] = [ind]
  end
end
p ele_ind  

#or if pairing indices with the elements isn't important:

arr = [ 1, 3, 2, 4, 2, 5, 6, 5, 6, 1 ]
indices = []
index = 0
while index < arr.length
  indices.push index if arr.count(arr[index]) > 1
  index += 1
end
p indices

# or

def index_duplicates(array)
  array.each_with_index { |n, ind| p ind if array.count(n) > 1 }
end

arr = [ 1, 3, 2, 4, 2, 5, 6, 5, 6, 1 ]

index_duplicates(arr)
```


### return the max and min values in a array without invoking `.max` or `.min`

```ruby
arr = [ 1, 4, 3, 5, 4, 10, 11, 10, 1, 4, 3, 5, 4, 10, -1, 11, 10 ]
def max_min(array)
  max = array[0]
  min = array[0]
  array.each do |n|
    max = n if n > max
    min = n if n < min
  end
  {:maximum=>max, :minimum=>min} # also: `[max, min]`
end

p max_min(arr)
# or

arr = [ 1, 4, 3, 5, 4, 10, 11, 10 ]
index = 0
max = arr[index]
min = arr[index]

while index < arr.length
  if arr[index] > max
    max = arr[index]
  end
  if arr[index] < min
    min = arr[index]
  end
  index += 1
end
puts "The collection examined is:\n#{arr}"
p "The largest value in the collection is #{max}."
p "The smallest value in the collection is #{min}."
```

### return the index of the nth occurrence of an element in an array

```ruby

def find_index(series, sought, occurrence)
  counted = 0
  series.each_with_index do |n, index| 
    counted += 1 if n == sought
    if counted == occurrence
      puts "occurrence #{occurrence} of #{sought} is at index #{index}"
      return
    end
  end
  puts "the instance you are looking for does not occur in the series"
end

arr = [1, 2, 3, 2, 3, 5, 4, 6, 2]

find_index(arr, 3, 3) # => instance does not exist
find_index(arr, 2, 3) # => at 8

# or 
arr = [ 1, 4, 3, 5, 4, 10, 11, 10, 1, 4, 3, 5, 4, 10, 11, 10 ]
element = 10
target_occurrence = 4
occurrence = 0
index = 0

while index < arr.length
  occurrence += 1 if arr[index] == element
  break if occurrence == target_occurrence
  index += 1
end

if occurrence == target_occurrence
  p index
else
  p "item sought does not occur #{target_occurrence} times"
end

# or as method with dialogue

def find_index(series, sought, occurrence)
  ind = 0
  counted = 0
  
  while ind < series.length
    if series[ind] == sought
      counted += 1
    end
    if counted == occurrence
      puts "the #{occurrence} occurrence of #{sought} is at index #{ind}"
      return
    end
    ind += 1
  end
  puts "the instance you are looking for does not occur in the series"
end

arr = [1, 2, 3, 2, 3, 5, 4, 6, 2]
find_index(arr, 3, 2)
```

### reverse order of a string by iterating through string directly (i.e. without changing to an array or using a holder) 

```ruby
#most terse
str = "Well, Hello This Is nOt Is nOt my string...well"

str.each_char.with_index { |char, index| str.prepend(str.slice!(index))}
p str

# manual looping
str = "Well, Hello This Is nOt Is nOt my string...well"

index = 1
while index < str.length
  str.insert(0, str.slice!(index))
  index += 1
end

p str
```

### write a method to sort an array

```ruby
# inefficient but effective
def sort_array(array)
  sorted = []
  while array.length > 0
    current_max = array[0]
    for n in array
      if n > current_max
        current_max = n
      end
    end
    array.count(current_max).times {sorted.unshift(current_max)}
    array.delete(current_max)
  end
  sorted 
end

arr = [1, 21, 5, 8, 21, 5, 6, 1, 6]

p sort_array(arr)

# or (also inefficient)


def sort_this(array)
  sorted = []
  while array.length > 0
    min = array[0]
    index = 1
    while index < array.length
      min = array[index] if array[index] < min  
      index += 1
    end
    array.count(min).times {sorted.push(min)}
    array.delete(min)
  end 
  sorted
end
  

arr = [1, 21, 5, 8, 21, 5, 6, 1, 6]
p sort_this(arr)
```

### Write a method to turn an integer into an array of its digits.  Expand on this method to make a method to convert an integer into a string without using the standard conversion methods.

```ruby
# returning the array
def integer_to_digits(integer)
  numbers = []
  value = integer
  loop do 
    quotient, remainder = value.divmod(10)
    numbers.unshift(remainder)
    value = quotient
    break if value == 0
  end
  numbers
end

# returning the string
def integer_to_string(integer)
  string = ''
  value = integer
  loop do
    quotient, remainder = value.divmod(10)
    string.prepend(DIGITS[remainder])
    value = quotient
    break if value == 0
  end
  string
end


p integer_to_string(100)
p integer_to_string(1001)
p integer_to_string(5673)
p integer_to_string(96)
p integer_to_string(0)
```