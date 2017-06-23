Small Problems: [Medium 1](https://launchschool.com/exercise_sets/48585137)

### 1. Rotation (Part 1)

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:

```ruby
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
```
### Solution:

```ruby
def rotate_array(array)
  array[1..-1] << array[0]
end
```

### Further Exploration
Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.

### Solution
```ruby
def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integers(n)
  rotate_array(n.to_s.chars).join.to_i
end
```

### 2. Rotation (Part 2)

Write a method that can rotate the last n digits of a number. For example:

```ruby
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
```

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

### Solution:

```ruby
def rotate_rightmost_digits(digits, place)
  chars = digits.to_s.chars
  chars.push(chars.delete_at(-place)).join.to_i
end

# or

def rotate_rightmost_digits(integer, digit)
  str = integer.to_s
  last = str.slice!(-digit)
  (str << last).to_i
end

# or
def rotate_rightmost_digits(digits, n)
  return digits if n == 1
  numerals = digits.to_s.chars
  rotated = numerals[0...-n] + numerals[-(n - 1)..-1] << numerals[-n]
  rotated.join.to_i
end

# or keeping with the suggestion to call a separate non-destructive rotate_array method

def rotate_array(array, n=1)
  return array if n == 1
  array[0...-n] + array[(-n + 1)..-1] << array[-n]
end

def rotate_rightmost_digits(digits, n=1)
  digit_chars = digits.to_s.chars
  rotate_array(digit_chars, n).join.to_i
end
```

### 3. Rotation (Part 3)

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Example:

```ruby
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
```
### Solution:

```ruby
# using custom `rotate`
def rotate(chars, index)
  chars.push(chars.delete_at(index))
end

def max_rotation(number)
  digits = number.to_s.chars
  idx = 0

  while idx < digits.size - 1
    rotate(digits, idx)
    idx += 1
  end

  digits.join.to_i
end
```

### Further Exploration:
Assume you do not have the rotate_rightmost_digits or rotate_array methods. How would you approach this problem?

### Solution:

```ruby
def max_rotation(number)
  digits = number.to_s.chars
  idx = 0

  while idx < digits.size - 1
    digits.push(digits.delete_at(idx))
    idx += 1
  end
  digits.join.to_i
end

# or

def max_rotation(integer)
  digits = integer.to_s.chars
  index = 0

  while index < digits.size - 1
    last = digits.delete_at(index)
    digits = digits << last
    index += 1
  end

  digits.join.to_i
end

# or

def max_rotation(n)
  digits = n.to_s.chars

  (0...(digits.size - 1)).each do |ind|
    digits.push(digits.delete_at(ind))
  end

  digits.join.to_i
end
```

### 4. 1000 Lights

You have a bank of switches before you numbered from 1 to 1000. Each switch is connected to exactly one light that is initially off. You walk down the row of switches, and turn every one of them on. Then, you go back to the beginning and toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and so on, and keep going until you have been through 1000 repetitions of this process.

Write a program that determines how many lights are on at the end, and which lights are off.

Example with 5 lights:
round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4.

With 10 lights, 3 lights are left on: lights 1, 4, and 9.

### Solution:

```ruby
def toggle_lights(lights_number)
  bulbs = {}
  (1..lights_number).each { |n| bulbs[n] = false }

  (1..lights_number).each do |rep|
    bulbs.map do |bulb, state|
      bulbs[bulb] = !state if (bulb % rep).zero?
    end
  end

  report_status(bulbs)
end

def report_status(lights)
  "#{lights.values.count(true)} lights are now on.\n" \
  "The following lights are off: #{ lights.select { |_, v| v == false }.keys }"
end
```

### Further Exploration
What are some alternatives for solving this exercise?

```ruby
# using a class
class Lights
  def initialize(light_count)
    @count = light_count
    @lights = prepare_lights
  end

  def prepare_lights
    light_set = {}
    1.upto(@count) { |key| light_set[key] = false }
    light_set
  end

  def toggle_switches
    n = 1
    until n > @count
      @lights.each do |k,v|
        @lights[k] = !@lights[k] if (k % n).zero?
      end
      n += 1
    end
    report_light_status
  end
  
  def report_light_status
    off_lights = @lights.select { |k, v| v == false }.keys
    on_lights = @lights.keys - off_lights
    "#{@lights.values.count(true)} lights are on.\n"\
    "The following lights are off: #{off_lights}.\n"\
    "The following lights are on: #{on_lights}."
  end
end

# using an array
# using array:
def toggle_lights(array_size)
  bulbs = Array.new(array_size, false)
  round = 1

  until round > array_size
    bulbs.each_with_index do |bulb, idx|
      bulbs[idx] = !bulb if ((idx + 1) % round).zero?
    end
    round += 1
  end

  report_status(bulbs)
end

def report_status(lights)
  off_bulbs = []
  lights.each_with_index { |ele, idx| off_bulbs.push(idx + 1) if !ele }

  "#{lights.count(true)} lights are now on."
  "The following lights are off: #{off_bulbs}"
end
```

### 5. Diamonds!

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

```ruby
diamond(1)

*
```

```ruby
diamond(3)

 *
***
 *
 ```

 ```ruby
diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
```
### Solution:

```ruby
def diamond(n)
  top = (1..n).step(2).to_a
  bottom = top[0...-1].reverse
  diamonds = top + bottom

  diamonds.each do |diamond_count|
    space_count = (n - diamond_count) / 2
    puts " " * space_count + "*" * diamond_count
  end
end
```

### 6.

```ruby
```
### Solution:

```ruby
```

### 7. Word to Digit

Write a method that takes a sentence string as input, and returns a new string that contains the original string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
```ruby
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.')
```
### Solution:

```ruby
DIGITS = {
  'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
  'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9
}.freeze

def word_to_digit(string)
  words = string.split(/\b/)
  words.map { |word| DIGITS[word] || word }.join
end

#or
def word_to_digit(string)
  capture = /(zero|one|two|three|four|five|six|seven|eight|nine)/
  string.gsub(capture, DIGITS)
end
```

### Further Explorations
Can you modify this so that spaces between the inserted numbers are eliminated? If the sentence already contains 2 or more space separated numbers (not words), don't delete the space between them: only the spaces between the converted number words should be eliminated.

What about dealing with phone numbers? Is there any easy way to format our string to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890".

### Solution

```ruby
DIGITS = {
  'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
  'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9
}.freeze

def word_to_digit(string)
  words = string.split(/\b/)
  converted = words.map { |word| DIGITS[word.downcase] || word }.join
  digits_to_phone(converted)
end

def digits_to_phone(string)
  stripped_digits = string.gsub(/(\d)\s/, '\1')
  stripped_digits.gsub(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3')
end
```

### 8. Fibonacci (Recursive)

```ruby
def sum(n) # calculates sum of integers btwn 1 and n
  return 1 if n == 1
  n + sum(n - 1)
end
```
A good recursive method has 3 main qualities:

  - it calls itself at least once
  - it has an ending condition (if n == 1 above)
  - the results of each recursion are used in each step (n + sum(n - 1) uses sum(n - 1)).


Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

### Solution:

```ruby
def fibonacci(n)
  return 1 if n < 3
  fibonacci(n - 1) + fibonacci(n - 2)
end
```

### 9. Fibonacci (Procedural)

Rewrite your recursive fibonacci method so that it computes its results without recursion.

Examples:
```ruby
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

```
### Solution:

```ruby
def fibonacci(n)
  a, b = [1, 1]
  (3..n).each do
    a, b = [b, a + b]
  end
  b
end
```

### 10.
compute a method that returns the last digit of the nth Fibonacci number.

Examples:
```ruby
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

```

### Solution:

```ruby
def fibonacci(n)
  a, b = [1, 1]
  (3..n).each do
    a, b = [b, a + b]
  end
  b
end

def fibonacci_last(n)
  fibonacci(n) % 10
end

# or faster

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end
```
