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

def paren_check (str)
  if str.count('(') != str.count(')')
    puts "unequal numbers of opening and closing parentheses."
    return
  end
  n = 1
  while n <= str.length
    if str[0, n].count('(') < str[0, n].count(')')
      puts "closing parentheses exceed opening parentheses at index #{n - 1}"
      break
    end
    n += 1
  end
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

def search(query)
  # implementation
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