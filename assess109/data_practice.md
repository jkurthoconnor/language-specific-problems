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
def balanced_paren?(string)
  string.count('(') == string.count(')')
end

str = 'This (is) my (st)rin)g'
balanced_paren?(str)

def balanced_and_ordered_paren?(string)
  if str.count('(') != str.count(')')
    puts "unbalanced number of parentheses"
  else
      
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
