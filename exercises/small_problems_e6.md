Small Problems: [Easy 6](https://launchschool.com/exercise_sets/cee7784e)

### 1. Cute angles

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes, and seconds. You should use a degree symbol (˚) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.

Examples:

```ruby
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
```

### Solution:

```ruby
DEGREE_SYMBOL = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(float_degrees)
  total_seconds = float_degrees * SECONDS_PER_DEGREE
  total_minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = total_minutes.divmod(MINUTES_PER_DEGREE)

  "#{degrees}#{DEGREE_SYMBOL}#{format('%02d', minutes)}'#{format('%02d', seconds)}\""
end
```

### 2. Delete vowels

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

Example:

```ruby
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
```

### Solution:

```ruby
def remove_vowels(array)
  array.map { |string| string.gsub(/[aeiou]/i, '') }
end
```

### 3. Fibonacci Number Location By Length

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Examples:
```ruby
find_fibonacci_index_by_length(2) == 7
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
```

You may assume that the argument is always greater than or equal to 2.

```ruby
def find_fibonacci_index_by_length(length)
  exponent = length - 1
  series = [1, 1]
  a, b = series[0], series[1]

  loop do
    c = a + b
    series.push(c)
    return series.length if (c / 10**exponent) >= 1
    a = b
    b = c
  end
end
```
### 4. Reversed Arrays (Part 1)

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed in to this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:

```ruby
list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
list == ["abc"]

list = []
reverse!([]) # => []
list == []
```

### Solution:

```ruby
def reverse!(array)
  index = 0
  while index < array.length
    array.unshift(array.delete_at(index))
    index += 1
  end
  array
end
```

### 5. Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

Examples:
```ruby
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b c d e)) == %w(e d c b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true
```

### Solution:

```ruby
def reverse(array)
  reversed = []
  array.each { |element| reversed.unshift(element) }
  reversed
end
```

### Further Exploration

An even shorter solution is possible by using either inject or each_with_object. Just for fun, read about these methods in the Enumerable module documentation, and try using one in your reverse method.

### Solution

```ruby
def reverse(array)
  array.each_with_object([]) { |element, object| object.unshift(element) }
end
```

### 6. Combining Arrays

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

Example

```ruby
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
```

### Solution:

```ruby
def merge(array1, array2)
  (array1 + array2).uniq
end
```

### 7. Halvsies

Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

Examples:

```ruby
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
```

### Solution:

```ruby
def halvsies(array)
  half = array.length / 2

  if array.length.even?
    [ array[0, half], array[half, half] ]
  else
    [ array[0, half + 1], array[half + 1, half + 1] ]
  end
end
```

### 8. Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

Examples:

```ruby
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
```

### Solution:

```ruby
def find_dup(array)
  array.each { |ele| return ele if array.count(ele) > 1 }
  "no dupe"
end

# or without reliance on `count`

def find_dup(array)
  counter = Hash.new(0)

  array.each do |ele|
    counter[ele] += 1
    return ele if counter[ele] == 2
  end
end
```

### 9. Does My List Include This?

Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

```ruby
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
```

### Solution:

```ruby
def include?(array, value)
  array.each do |element|
    return true if element == value
  end
  false
end
```

### 10. Right Triangles

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:

```ruby
triangle(5)

    *
   **
  ***
 ****
*****
triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
```

### Solution:

```ruby
def triangle(side_size)
  num_stars = 1

  until num_stars > side_size
    puts " " * (side_size - num_stars) + "*" * num_stars
    num_stars += 1
  end
end
```

### Further Exploration

Try modifying your solution so it prints the triangle upside down from its current orientation. Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

### Solution 1: Upside Down

```ruby
def triangle(side_size)
  num_stars = 1
  
  until num_stars > side_size
    puts "*" * (num_stars) + " " * (side_size - num_stars)
    num_stars += 1
  end
end
```

### Solution 2: Any Orientation

```ruby

```