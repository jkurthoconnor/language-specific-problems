Small Problems [Easy 9](https://launchschool.com/exercise_sets/7d8e9f76)

### 1. Welcome Stranger

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title.

Example:

```ruby
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.
```

### Solution

```ruby
def greetings(names, titles)
  "Hello, #{names.join(' ')}! Nice to have a #{titles[:title]} #{titles[:occupation]} around."
end
```

### Further Exploration
What is the best way to keep the line length to less than 80 characters?

### Solution

```ruby 
def greetings(names, titles)
  "Hello, #{names.join(' ')}!"\
  "Nice to have a #{titles[:title]} #{titles[:occupation]} around."
end
```

### 2. Double Doubles

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Examples:

```ruby
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
```

### Solution

```ruby
def twice(int)
  return int if double_dig?(int)
  int * 2
end

def double_dig?(int)
  chars = int.to_s.chars
  half = chars.count / 2
  chars.count.even? && (chars[0, half] == chars[half, half])
end
```