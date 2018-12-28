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


### 5. What does `shift` do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

#### Solution

When `shift` is called on a hash it removes the first key/value pair from the hash and returns this pair as an array where the key is array[0] and the value is array[1].  That is, it mutates the caller and returns the removed pair.  If we have any doubts we could run the code or check the docs.


### 6. What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

#### Solution

The return value is `11`. This is because `pop` will return the string `'caterpillar'`, which will then be the object upon which `size` is called. When `size` is called on a string it returns the number of characters in the string.  In this case 11.


### 7. What is the __block__'s return value in the following code? How is it determined? Also, what is the return value of `any?` in this code? What gets output by this code?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

#### Solution

The block will return `true` on the first iteration, i.e. when `num = 1`. It won't continue checking the other elements, as the `any?` short-circuits as soon as it has sufficient data to provide its own return value.

`any?` will return `true`.

The code will output `1`, as that is the side effect of `puts num`.


### 8. How does `take` work? Is it destructive? How can we find out?
```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

#### Solution

`take(num)` returns an array composed of the first `num` elements of the caller, but it does not mutate the caller.  In this case, `take` will return `[1, 2]` and `arr` will remain `[1, 2, 3, 4, 5]`.

### 9. What is the return value of `map` in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

#### Solution

`map` returns `[nil, 'bear']`. This is because `map` returns an array --even when called on a hash-- formed by the return value of running the block once for every element in the calling collection.  When the conditional statement returns false as in the case of evaluating 'ant', the entire conditional returns `nil`. Then, for the next element `'bear'.size > 3` returns `true`, so the conditional returns 'bear'.


### 10. What is the __block__'s return value in the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

#### Solution

The block returns `[1, nil, nil]` because for the first element, where ` num = 1`, the return value of the block is `num` or `1`.  The other elements / values for `num`, `2` and `3`, will trigger the `if` statement to `puts num`.  In these cases, the return value of the block will be the return value of the `puts` expression, which is always `nil`. 