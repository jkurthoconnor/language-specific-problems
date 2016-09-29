130: Ruby Foundations: More Topics
[Easy Testing](https://launchschool.com/exercise_sets/94a0efb0)

### 1. Write a minitest assertion that will fail if the `value.odd?` is not true.

#### Solution:

```ruby
assert_equal(true, value.odd?)
```

### 2. Write a minitest assertion that will fail if value.downcase does not return 'XYZ'

#### Solution:
```ruby
assert_equal('XYZ', value.downcase)
```

### 3. Write a minitest assertion that will fail if value is not nil.

#### Solution:
```ruby
assert_nil(value)
```

### 4. Write a minitest assertion that will fail if the Array list is not empty.

#### Solution:
```ruby
assert_equal(true, list.empty?)
# or
assert_empty(list)
```

### 5. Write a minitest assertion that will fail if the 'xyz' is not in the Array list

#### Solution:
```ruby
assert_includes(list, 'xyz')
```