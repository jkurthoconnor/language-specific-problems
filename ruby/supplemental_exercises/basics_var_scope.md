## Variable Scope, from Ruby Basics LaunchSchool exercises   (https://launchschool.com/exercise_sets/ece1c62b) 

### 1
```ruby
a = 7 # initialize variable

def my_value(b)
  b += 10 # equivalent to `b = b + 10`.  Thus b is (re)assigned.  Reassignment does not persist outside of method scope, hence the return below.
end

my_value(a)
puts a # =>7  because reassignment does not persist outside of method scope; also, numbers are immutable in Ruby
```

### 2
```ruby
a = 7 # init of variable

def my_value(a)
  a += 10 # equivalent to `a = a + 10`.  Thus `a` is (re)assigned.  Reassignment does not persist outside of method scope, hence the return below.
end

my_value(a)
puts a # =>7  because reassignment does not persist outside of method scope; also, numbers are immutable in Ruby
```


### 3
```ruby
a = 7

def my_value(b)
  a = b # `a` is initialized and assigned to point to the value of `b`; NB: the `a` in the method is not the `a` outside because the outside `a` is not passed in
end

my_value(a + 5)
puts a # => 7  the outside `a` is not passed into the method; even if it were, this would be a case of reassignment, hence not persistent
```


### 4
```ruby
a = "Xyzzy"

def my_value(b)
  b[2] = '-' # mutation of object `b`
end

my_value(a)
puts a  # =>"Xy-zy" because `a` was passed into the method (as `b`) and mutated
```


### 5
```ruby
a = "Xyzzy"

def my_value(b)
  b = 'yzzyX' # `b` is reassigned; it now points to a different object than when passed in 
end

my_value(a)
puts a # => "Xyzzy"  although `a` is passed into the method (as `b`), the method reassigns it to point to a new object/value.  Reassignment never mutates an object, and does not persist outside the scope of a method
```


### 6
```ruby
a = 7

def my_value(b)
  b = a + a # (re)assignment of `b`; reassignment points `b` to sum of new objects (`a`), does not persist outside of method...but these new objects (`a`) are not visible inside the method; exception will be raised
end

my_value(a)
puts a # => 7; although `a` is passed into the method (as `b`) it is immediately reassigned; this does not persist outside of the method...but the bigger problem is that this method raises an exception.  `a` in the method is an undefined local variable or method
```

### 7
```ruby
a = 7
array = [1, 2, 3]

array.each do |element|
  a = element # `a` is being reassigned to point to each (in succession) element
end

puts a # => 3 since `a` is initialized prior to the block, it is available to the block;  reassignment in this case (in a block) will persist outside of the block (block rules differ from those of user-defined methods)
```


### 8
```ruby
array = [1, 2, 3]

array.each do |element|
  a = element # `a` is being initialized / assigned within the block;  as such, it is not available outside the block
end

puts a  # raises an exception.  undefined variable
```

### 9
```ruby
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1  # `a` is merely a block variable; it is not the `a` initialized prior to the block; has no effect on `a` outside of block; e.g. of _shadowing_
end

puts a #=> 7
```

### Example 10

```ruby
a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b # this should raise an exception; 'a' is being reassigned to 'a + b', but 'a' is not passed in
  end
end

my_value(array)
puts a 