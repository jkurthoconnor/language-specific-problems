Small Problems: Easy 3
LaunchSchool
https://launchschool.com/exercise_sets/d357e52b

### Searching 101

Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongs the first 5 numbers.

Examples:
```ruby
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

```

#### Solution: 

```ruby
numbers = {}
keys = ['1st', '2nd', '3rd', '4th', '5th', 'last']

keys.each do |k|
  puts "==> Enter the #{k} number:"
  n = gets.chomp
  numbers[k] = n
end

source = numbers.values.first(5)
sought = numbers.values.last

if source.include?(sought)
  puts "The number #{sought} appears in #{source}."
else
  puts "The number #{sought} does not appear in #{source}."
end
```

### Arithmetic Integer

Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

```ruby
Example

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
```

#### Solution: 

```ruby
puts "Enter the first number:"
first_n = gets.chomp.to_i
puts "Enter the second number:"
second_n = gets.chomp.to_i

puts "==> #{first_n} + #{second_n} = #{first_n + second_n}"
puts "==> #{first_n} -  #{second_n} = #{first_n - second_n}"
puts "==> #{first_n} * #{second_n} = #{first_n * second_n}"
puts "==> #{first_n} / #{second_n} = #{first_n / second_n}"
puts "==> #{first_n} % #{second_n} = #{first_n % second_n}"
puts "==> #{first_n} ** #{second_n} = #{first_n ** second_n}"
```
Discussion:

If we wanted to use floats instead, the input could be converted using `.to_f`.  This would change the functioning of the division operations, however.


### Counting the Number of Characters
Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# input:
Please write word or multiple words: walk

# output:
There are 4 characters in "walk".

# input:
Please write word or multiple words: walk, don't run

# output:
There are 13 characters in "walk, don't run".

#### Solution: 

```ruby
print "Please write word or multiple words: "
string = gets.chomp
characters = string.delete(' ').length
puts "There are #{characters} characters in \"#{string}\" "
```

### Multiplying Two Numbers
Create a method that takes two arguments, multiplies them together, and returns the result.
Example:

```ruby
multiply(5, 3) == 15
```

#### Solution: 

```ruby
def multiply(n1, n2)
  n1 * n2
end
```

Further Explorations:
For fun: what happens if the first argument is an Array? What do you think is happening here?

```ruby
multiply([1, 2, 3, 4], 2) => [1, 2, 3, 4, 1, 2, 3, 4]
```
Just as `"Hi" * 2` returns the string "HiHi" (i.e. "Hi" two times), `[1, 2] * 2` returns `[1, 2, 1, 2]`, the original array containing 2 times itself.  It seems that when the left hand expression is not an integer or float, `*` is multiplying in the broad sense of 'repeating'.

### Squaring an Argument
Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

Example:

```ruby
square(5) == 25
square(-8) == 64
```

#### Solution: 

```ruby
def multiply(n1, n2)
  n1 * n2
end

def square(n)
  multiply(n, n)
end
```

Further Explorations:
What if we wanted generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

```ruby

```

### Exclusive Or
The || operator returns true if either or both of its operands are true, false if both operands are false. The && operator returns true if both of its operands are true, and false if either operand is false. This works great until you need only one of two conditions to be true, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is true, false otherwise.

Examples:

```ruby
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
```

#### Solution: 

```ruby
def xor?(arg1, arg2)
  (arg1 || arg2) && !(arg1 && arg2)
end
```

Further Explorations:
|| and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?

Response:
Since `xor` requires one or the other operand to be true, but not both, it cannot perform a short-circuit operation: there is no value (true/false) for the first operand that would make it unnecessary to check the value of the second.

However, evaluating the value of an `xor` expression requires the evaluation of a compound expression consisting of || and && expressions. So at this 'lower' level, `xor` is evaluated using short-circuit operators.

### Odd Lists
Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Examples:

```ruby
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
```

#### Solution: 

```ruby
def oddities(array)
  array.select.with_index { |element, index| index.even? }
end
```

Further Explorations:

Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

```ruby
def evens(array)
  array.select.with_index { |element, index| index.odd? }
end
```

Try to solve this exercise in at least 2 additional ways.
```ruby
def oddities(array)
  results = []
  index = 0
  
  while index < array.length
    results.push(array[index])
    index += 2
  end
  
  results
end

# or 

def oddities(array)
  results = []
  
  array.each_with_index do |element, index|
    results.push(element) if index.even?
  end
  
  results
end
```

### Palindromic Strings (pt 1)

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. (A palindrome reads the same forwards and backwards.) Case matters, and all characters should be considered.

Examples:
```ruby
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
```

#### Solution: 

```ruby
def palindrome?(string)
  string == string.reverse
end
```

Further Explorations:
Write a method that determines whether or not an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether or not an array or a string is palindromic. You may not use an if, unless, or case statement or modifier.

```ruby
def palindrome?(array)
  array == array.reverse
end
```

```ruby
def palindrome?(subject)
  subject == subject.reverse
end
```
### 
```ruby
```

#### Solution: Palindromic Strings (pt 2)
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

Examples:

```ruby
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
```

Further Explorations:


```ruby
def real_palindrome(string)
  test_string = string.downcase.delete('^a-z0-9')
  test_string == test_string.reverse
end


real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
```

### Palindromic Numbers
Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

Examples:
```ruby
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
```

#### Solution: 

```ruby
def palindromic_number?(integer)
  integer.to_s == integer.to_s.reverse
end


palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
```

Further Explorations:

Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?

Response:

If the number begins with a 0 and it is input as such, it will be interpreted as an invalid octal digit and throw an exception. Because of this, we can't process the integer with a leading zero without inserting some sort of override or escape for the 'invalid octal digit'.  

There is a work-around.  We could write a method to add leading zeros if any are needed, like this: 

```ruby
def palindromic_number?(integer, num_leading_zeros = 0)
  zeros = '0' * num_leading_zeros
  zeros + integer.to_s == (zeros + integer.to_s).reverse
end

p palindromic_number?(34543) #== true
p palindromic_number?(123210) #== false
p palindromic_number?(22) #== true
p palindromic_number?(50, 1) #== true
```


