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

### 2.

```ruby
```
### Solution:

```ruby
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
