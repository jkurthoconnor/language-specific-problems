Small Problems: Easy 1
LaunchSchool
https://launchschool.com/exercise_sets/3adc7fa4

### Repeat Yourself
Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example:

```ruby
repeat('Hello', 3)
```
Output:

```ruby
Hello
Hello
Hello
```

#### Solution:

```ruby
def repeat(string, number)
  number.times { puts string }
end

repeat('Hello', 3)
```


### Odd
Write a method that takes one argument in the form of an integer or a float; this argument may be either positive or negative. This method should check if a number is odd, returning true if its absolute value is odd. Floats should only return true if the number is equal to its integer part and the integer is odd.

Keep in mind that you're not allowed to use #odd? or #even? in your solution.
Examples:

```ruby
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(7.1)  # => false
puts is_odd?(-5.0) # => true
```

#### Solution:

```ruby
def is_odd?(n)
  return false if n != n.to_i
  n % 2 != 0
end

# solution provided is more elegant; uses only one line inside def: `n % 2 == 1`

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(7.1)  # => false
puts is_odd?(-5.0) # => true
```

### List of Digits
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

All of the tests above [below] should print true.

Examples:

```ruby
puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
```

#### Solution:

```ruby
def digit_list(integer)
  numerals = integer.to_s.chars
  numerals.map { |numeral| numeral.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
```

### How Many?
Write a method that counts the number of occurrences of each element in a given array.

Once counted, print each element alongside the number of occurrences.

```ruby
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

# Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2
```

#### Solution:

```ruby
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)  
  array.uniq.each do |vehicle|
    puts "#{vehicle} => #{array.count(vehicle)}"
  end
end

count_occurrences(vehicles)
```

Further Explorations:
Can you write a solution for this exercise that only iterates over array once? Hint: Array#fetch or Array::new will be handy

```ruby

```


### Reverse It (pt 1)
Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

The tests above [below] should print true.

```ruby
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
```

#### Solution:

```ruby
def reverse_sentence(string)
  reversed_words = []
  string.split.each { |word| reversed_words.unshift(word) }
  reversed_words.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
```

### Reverse It (pt 2)
Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:

```ruby
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
```

#### Solution:

```ruby
def reverse_words(string)
  words = string.split
  
  words.each do |word|
    word.reverse! if word.length >= 5
  end
  
    words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
```

### Stringy Strings
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

The tests above [below] should print true.

```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```

#### Solution:

```ruby
def stringy(integer)
  string = ''
  
  integer.times do |n|
    string << '1' if n.even? 
    string << '0' if n.odd?
  end
  
  string  
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```

Further Explorations

```ruby
def stringy(integer, initial = 1)
  string = ''
  
  case initial
  when 1 
    even = '1'
    odd = '0'
  when 0
    even = '0'
    odd = '1'
  end
  
  integer.times do |n|
    string << even if n.even? 
    string << odd if n.odd?
  end
  
  string  
end

puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4, 0) == '0101'
puts stringy(7) == '1010101'
```

### Array Average
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

The tests above [below] should print true.

```ruby
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```

#### Solution:

```ruby
def average(array)
  array.inject { |sum, n| sum + n } / array.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```

Further Explorations
Currently, the return value of average is an Integer. When dividing numbers, sometimes the quotient isn't a whole number, therefore, it might make more sense to return a Float. Can you change the return value of average from an Integer to a Float?

```ruby
def average(array)
  array.inject { |sum, n| sum + n.to_f } / array.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333336
```

### Sum of Digits
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

The tests above [below] should print true.

```ruby
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
```

#### Solution:

```ruby
def sum(integer)
  digits = integer.to_s.chars.map { |n| n.to_i }
  digits.inject { |sum, n| sum + n }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
```

### What's My Bonus?
Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

The tests above [below] should print true.

```ruby
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
```

#### Solution:

```ruby
def calculate_bonus(salary, bonus_status)
  return salary / 2 if bonus_status
  0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
```


