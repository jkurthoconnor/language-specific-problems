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

### 3.

```ruby
```
### Solution:

```ruby
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
