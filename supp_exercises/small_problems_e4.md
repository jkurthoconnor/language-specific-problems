Small Problems: Easy 4
LaunchSchool
https://launchschool.com/exercise_sets/d357e52b

### Short Long Short
Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

Examples:
```ruby
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
```

#### Solution: 

```ruby
def short_long_short(str1, str2)
  if str1.length < str2.length
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

```

### What Century is That?
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Examples:

```ruby
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
```

#### Solution: 

```ruby
def century(year)
  century = (((year - 1) / 100) + 1).to_s
  
  if century[-2] == '1'
    century + 'th'
  elsif century[-1] == '1'
    century + 'st'
  elsif century[-1] == '2'
    century + 'nd'
  elsif century[-1] == '3'
    century + 'rd'
  else
    century + 'th'
  end
end
```



### Leap Years (pt 1)
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

```ruby
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
```

#### Solution: 

```ruby
def leap_year?(year)
  if (year % 400 != 0) && (year % 100 == 0)
    false  
  elsif year % 4 == 0
    true
  else
    false
  end
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
```
Further Explorations:
The order in which you perform tests for a leap year calculation is important. For what years will leap_year? fail if you rewrite it as:

```ruby
def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end
```
Answer: as written `leap_year` will incorrectly regard years divisible by 400 as not leap years.
 

Can you rewrite leap_year? to perform its tests in the opposite order of the above solution? That is, test whether the year is divisible by 4 first, then, if necessary, test whether it is divisible by 100, and finally, if necessary, test whether it is divisible by 400. Is this solution simpler or more complex than the original solution?

```ruby
def leap_year?(year)
  return false if (year % 4 != 0) # I don't know if it is 'simpler', but this approach excludes more with the first line than the other, so it would be more efficient in the majority of cases with a `false` return
  if (year % 100 == 0) && (year % 400 != 0)
    false
  else
    true
  end
end
```

### Leap Years (pt 2)
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

```ruby
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
```

#### Solution: 

```ruby
def leap_year?(year)
  if year >= 1752
    if (year % 400 != 0) && (year % 100 == 0)
      false  
    elsif year % 4 == 0
      true
    else
      false
    end
  else
    year % 4 == 0
  end
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
```

### Multiples of 3 and 5
Write a method that computes the sum of all numbers between 1 and some other number that are a multiple of 3 or 5. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Examples

```ruby
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
```

#### Solution: 

```ruby
def multisum(integer)
  multiples = []
  
  (1..integer).each do |n|
    multiples.push(n) if n % 3 == 0 || n % 5 == 0
  end
  
  sum = multiples[0]
  index = 1
  
  while index < multiples.length
    sum += multiples[index]
    index += 1
  end
  
  sum
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
```

Further Explorations:
Investigate Enumerable.inject (also known as Enumerable.reduce), How might this method be useful in solving this problem? (Note that Enumerable methods are available when working with Arrays.) Try writing such a solution. Which is clearer? Which is more succint?

Answer: using `.inject` is more succinct, but it is not as clear as the manual approach

```ruby
def multisum(integer)
  multiples = []
  
  (1..integer).each do |n|
    multiples.push(n) if n % 3 == 0 || n % 5 == 0
  end
  
  multiples.inject {|sum, n| sum + n }
end
```

### Running Totals
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Examples:

```ruby
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
```

#### Solution: 

```ruby

def running_total(array)
  running_totals = []
  sum = 0
  
  array.each do |n|
    running_totals.push(sum += n)
  end
  
  running_totals
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
```

Further Explorations:
Try solving this problem using Array#each_with_object or Enumerable#inject (note that Enumerable methods can be applied to Arrays).

```ruby
def running_total(array)
  running_totals = []
  index = 0
  
  until index == array.length
    running_totals.push(array[0..index].inject { |sum, n| sum + n })
    index += 1
  end
  
  running_totals
end
```

### Convert a String to a Number!
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_int and Integer behave similarly. In this exercise, you are going to create your own conversion method.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

```ruby
string_to_integer('4321') == 4321
string_to_integer('570') == 570
```

#### Solution: 

```ruby
def string_to_integer(string)
  equivs = { "0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9 }
  integers = []
  
  string.each_char do |digit|
    integers.push(equivs[digit])
  end
  
  sum = 0
  
  string.length.times do |n|
    sum += integers[n] * 10 ** (string.length - (1 + n))
  end
  
  sum
end

string_to_integer('4321') == 4321
string_to_integer('570') == 570
```

### Convert a String to a Signed Number!
In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Examples

```ruby
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
```

#### Solution: 

```ruby
NUM_EQUIVS = { "0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9 }

def string_to_integer(string)
  integers = []
  
  string.each_char do |digit|
    integers.push(NUM_EQUIVS[digit])
  end
  
  sum = 0
  
  string.length.times do |n|
    sum += integers[n] * 10 ** (string.length - (1 + n))
  end
  
  sum
end

def string_to_signed_integer(string)
   
  return string_to_integer(string) if NUM_EQUIVS.include?(string[0])
  
  sign = string.slice!(0)
  
  return string_to_integer(string) if sign == '+'
  string_to_integer(string) - string_to_integer(string) * 2
end

string_to_signed_integer('4321') == 4321
string_to_signed_integer('570') == 570
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
```

Further Explorations:
In our solution, 
```ruby
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end
```
we call string[1..-1] twice, and call string_to_integer three times. This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.

```ruby
def string_to_signed_integer(string)
  slice_conversion = string_to_integer(string[1..-1])
  
  case string[0]
  when '-' then -slice_conversion
  when '+' then slice_conversion
  else          string_to_integer(string)
  end
end
```

### Convert a Number to a String!
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples

```ruby
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
```

#### Solution: 

```ruby
STR_EQUIVS = { 0=>"0", 1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9" }

def integer_to_string(integer)
  return STR_EQUIVS[integer] if integer < 10
  
  str_digits = []
  power = 1
  
  until integer / 10 ** power < 10
    power += 1
  end
  
  until power < 0
    str_digits.push(STR_EQUIVS[integer / 10 ** power])
    integer = integer % 10 ** power
    power -= 1
  end
      
  str_digits.join   
end

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
```

### Convert a Signed Number to a String!
In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Examples

```ruby
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
```

#### Solution: 

```ruby
STR_EQUIVS = { 0=>"0", 1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9" }

def integer_to_string(integer)
  return STR_EQUIVS[integer] if integer < 10
  
  str_digits = []
  power = 1
  
  until integer / 10 ** power < 10
    power += 1
  end
  
  until power < 0
    str_digits.push(STR_EQUIVS[integer / 10 ** power])
    integer = integer % 10 ** power
    power -= 1
  end
      
  str_digits.join   
end

def signed_integer_to_string(integer)
  if integer > 0
    "+" + integer_to_string(integer)
  elsif integer < 0
    "-" + integer_to_string(integer.lcm(1))
  else
    integer_to_string(integer)
  end
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
```
Further Explorations:
Refactor our solution 

```ruby
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
```
to reduce the 3 integer_to_string calls to just one.

```ruby
STR_EQUIVS = { 0=>"0", 1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9" }

def integer_to_string(integer)
  return STR_EQUIVS[integer] if integer < 10
  
  str_digits = []
  power = 1
  
  until integer / 10 ** power < 10
    power += 1
  end
  
  until power < 0
    str_digits.push(STR_EQUIVS[integer / 10 ** power])
    integer = integer % 10 ** power
    power -= 1
  end
      
  str_digits.join   
end

def signed_integer_to_string(number)
  conversion = integer_to_string(number.lcm(1))
  case number <=> 0
  when -1 then "-#{conversion}"
  when +1 then "+#{conversion}"
  else         conversion
  end
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
```

