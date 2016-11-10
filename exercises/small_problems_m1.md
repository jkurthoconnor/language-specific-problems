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


```ruby
```
### Solution:

```ruby
def rotate_rightmost_digits(digits, place)
  chars = digits.to_s.chars
  chars.push(chars.delete_at(-place)).join.to_i
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
```

### 4.

```ruby
```
### Solution:

```ruby
```

### 5.

```ruby
```
### Solution:

```ruby
```

### 6.

```ruby
```
### Solution:

```ruby
```

### 7.

```ruby
```
### Solution:

```ruby
```

### 8.

```ruby
```
### Solution:

```ruby
```

### 9.

```ruby
```
### Solution:

```ruby
```

### 10.

```ruby
```
### Solution:

```ruby
```
