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
# or
arr.each do |n|
  arr_reversed.unshift n
end
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
def delete_vowels(arr)
  arr.map { |element| element.delete('aeiou') }
end

pets = [ 'dog', 'cat', 'bird', 'turtle', 'lizard' ]

delete_vowels(pets)

# or without `map`

# non-destructive:
def vowel_deleter(arr)
  removed = []
  n = 0
  while n + 1 <= arr.length
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

array.select do |color|
  fib.include?(array.index(color))
end
# or
array = ["red", "green", "orange", "tan", "purple", "magenta", "yellow", "blue"] 
a = 0
b = 1
fib = [0, 1]
while b <= array.length
  c = a + b
  fib.push c
  a = b
  b = c
end

array.select do |color|
  fib.include?(array.index(color))
end

# or 
def display_indices(stop)
  arr = []
  fib = []
  a= 0
  b = 1
  fib.push a, b
  while b <= stop -1
    c = a + b
    fib.push c
    a = b
    b = c
  end
  (1..stop).each { |n| arr.push n }
  arr.each_index do |i| 
    p arr[i] if fib.include?(i)
  end
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

def ordered_parens?(string)
  opened = 0
  closed = 0
  
  chars = string.split('')
  chars.each do |char|
    if char == '('
      opened += 1
    elsif char == ')'
      closed += 1
    end
    if opened < closed
      puts "closed parens before opened!"
      return false
    end
  end
  opened == closed
end
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
 
 search_or(food, 'red', 100)
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
  n = 0
  str.split('').each do |char|
    if char == match
      match_indexes.push n
    end
    n += 1
  end
  match_indexes
end
```

### write a method that takes an array and returns the indices of all elements matching a pattern

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
def prime?(n)
  divisors = []
  (2...n).each do |divisor|
    divisors.push divisor if n % divisor == 0
  end
  divisors.length == 0
end
```

### write a method to output all primes between a start and stop point

```ruby
def primes_btwn(start, stop)
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
def factor(number)
  factors = []
  (1..number).each do |fac|
    factors.push fac if number % fac == 0
  end  
  factors
end
```

### return the indices of duplicates in an array

```ruby
#NB: the challenge is that `.index` only returns the  index of first occurrence

arr = [ 1, 3, 2, 4, 2, 5, 6, 5, 6, 1 ]
indices = []
multiples = arr.select { |n| arr.count(n) > 1 }.uniq

index = 0
while index < arr.length
  indices.push index if multiples.include?(arr[index])
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

max = arr[0]
min = arr[0]

arr.each do |n|
  max = n if n > max
  min = n if n < min
end

p "max value is #{max}"
p "min value is #{min}"

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
arr = [ 1, 4, 3, 5, 4, 10, 11, 10, 1, 4, 3, 5, 4, 10, 11, 10 ]
element = 10
target_occurrence = 4
occurrence = 0
index = 0

while index < arr.length
  if arr[index] == element
    occurrence += 1
  end
  if occurrence == target_occurrence
    p index
    break 
  end
  index += 1
end
```