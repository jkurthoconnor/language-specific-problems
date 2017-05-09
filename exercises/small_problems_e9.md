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

### 3. Always Return Negative

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

Examples;
```ruby
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby
```

### Solution

```ruby
def negative(n)
  n.positive? ? -n : n
end
```

### 4. Counting Up

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

Examples:

```ruby
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
```

### Solution

```ruby
def sequence(integer)
  (1..integer).to_a
end
```

### 5. Uppercase Check

Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

Examples:

```ruby
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
```

### Solution

```ruby
def uppercase?(string)
  string.each_char do |char|
    return false if char =~ /[a-z]/
  end

  true
end
```

### 6. How long are you?

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

Examples

```ruby
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
```

### Solution

```ruby
def word_lengths(string)
  string.split.map { |word| word + ' ' + word.size.to_s }
  # or            `{ |word| "#{word} #{word.size}" }`
end
```

### 7. Name Swapping

Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

Examples

```ruby
swap_name('Joe Roberts') == 'Roberts, Joe'
```

### Solution

```ruby
def swap_name(fullname)
  names = fullname.split
  "#{names.last}, #{names.first}"
end
```

### 8. Sequence Count

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

Examples:

```ruby
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
```

### Solution

```ruby
def sequence(number, factor)
  (1..number).map { |rep| rep * factor }
end
```

### 9. Grade book

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter Grade 90 <= score <= 100 'A' 80 <= score < 90 'B' 70 <= score < 80 'C' 60 <= score < 70 'D' 0 <= score < 60 'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Example:

```ruby
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
```

### Solution
```ruby
def get_grade(grade1, grade2, grade3)
  mean = (grade1 + grade2 + grade3) / 3

  case mean
  when 90..100 then "A"
  when 80..89  then "B"
  when 70..79  then "C"
  when 60..69  then "D"
  else              "F"
  end
end

# or if the number of grades is undetermined:

def get_grade(*grades)
 
  case mean(grades)
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

def mean(grades)
  grades.reduce(&:+) / grades.size
end
```

### 10. Grocery List

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

Example:

```ruby
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
```

### Solution

```ruby
def buy_fruit(list)
  full_list = []

  list.each do |specs|
    specs[-1].times { full_list.push(specs[0]) }
  end

  full_list
end

# or 
def buy_fruit
  list.map { |food, n| [food]*n }.flatten
end
```
