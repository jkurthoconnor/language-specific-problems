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

### 6. Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

#### Solution:
```ruby
assert_raises(NoExperienceError) {employee.hire}
```

### 7. Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

#### Solution:
```ruby
assert_instance_of(Numeric, value)
```

### 8. Write a minitest assertion that will fail if the class of value is not Numeric or one of its superclasses.

#### Solution:
```ruby
assert_kind_of(Numeric, value, 'That is not Numeric!')
```

### 9. Write a unit test that will fail if list and the return value of list.process are different objects.

#### Solution:
```ruby
def test_same_list_and_listprocess
  return_value = list.process
  assert_same(list, return_value)
end
```

### 10. Write a unit test that will fail if 'xyz' is one of the elements in the Array list

#### Solution:
```ruby
def test_list_not_include_xyz
  refute_includes(list, 'xyz')
end
```
