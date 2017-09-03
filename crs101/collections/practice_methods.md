# Practice Problems: [Methods and More Methods](https://launchschool.com/lessons/85376b6d/assignments/fd13de08)

### 1. What is the return value of the `select` method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

#### Solution
`select` will here return an array: `[1, 2, 3]` because `hi` is the final expression evaluated in the block, and `hi` is truthy. `select` returns an array of all elements for which the block returns `true`.


### 2. How does `count` treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

#### Solution
If the block returns true for an element, `str`, it will count it.  After evaluating each element, the method will return the final count, i.e. it will return the number of times the block returned true. So it uses truthiness as a condition for counting. We can of course read the docs to find this out.


### 3 . What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

#### Solution
This method call will return `[1, 2, 3]` because it rejects all elements for which the block returns true.  That is, it will return an array composed of all elements for which the block does not return true.  In this case, the return value for each element will be `nil`, so no element is rejected. 


### 4. What is the return value of `each_with _object` in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

#### Solution
The return value will be `{'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }`. This is because `each_with_object` returns the object passed in as an argument after it has been modified (if at all) by the block having been run once for each element in the collection.