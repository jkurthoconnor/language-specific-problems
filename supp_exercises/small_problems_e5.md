Small Problems: Easy 5
LaunchSchool
https://launchschool.com/exercise_sets/0d6d6521

### 1. ASCII String Value
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

```ruby
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
```

#### Solution: 

```ruby
def ascii_value(string)
  value = 0
  string.each_char { |char| value += char.ord }
  value
end


ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
```

Further Explorations
There is an Integer method such that:

```ruby
char.ord.mystery == char
```
where mystery is our mystery method. Can you determine what method name should be used in place of mystery? What happens if you try this with a longer string instead of a single character?

Response:
`int.chr` is the method in question.

If one were to invoke `char.ord.chr` on a multi-character string the return would be the first character in the string.  `.ord` only returns the order/value for the first character in the calling string, so this is what is passed on to the `.chr` call.


### 2. After Midnight (pt 1)
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Disregard Daylight Savings and Standard Time and other complications.

Examples:

```ruby
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
```

#### Solution:
```ruby
def time_of_day(total_minutes)
  full_hours, display_minutes = total_minutes.divmod(60)
  display_hour = full_hours % 24

  h = format("%02d", display_hour)
  m = format("%02d", display_minutes)
  "#{h}:#{m}"
end

p time_of_day(0) # == "00:00"
p time_of_day(-3) # == "23:57"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) # == "00:03"
p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"

```

### 3. After Midnight (pt 2)

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

```ruby
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
```

#### Solution: 

```ruby
def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  hours_after = hours % 24
  hours_after * 60 + minutes
end

def before_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  hours_before = (24 - hours) % 24
  hours_before * 60 - minutes
end
```


### 4. Letter Swap

Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

Examples:

```ruby
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
```

#### Solution: 

```ruby
def swap(string)
  words = string.split
  holder = []
  words.each do |word|
    word[0], word[-1] = word[-1], word[0]
    holder.push(word)
  end
  holder.join(' ')
end
```

### 5. Clean up the words

Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

Examples:

```ruby
cleanup("---what's my +*& line?") == ' what s my line '
```

#### Solution: 

```ruby
def cleanup(string)
  clean = string.gsub(/\W/, ' ').chars

  index = 0
  while index + 1 < clean.length
    if clean[index, 2].uniq == [' ']
      clean.delete_at(index)
      next
    end
    index += 1
  end

  clean.join
end
```

Further Explorations
```ruby
def cleanup(string)
  clean = string.gsub(/\W/, ' ').squeeze(' ')
end
```

### 6. Letter Counter (Part 1)

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Examples
```ruby
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
```

#### Solution: 

```ruby
def word_sizes(string)
  counter = {}
  words = string.split

  words.each do |word|
    if counter.keys.include?(word.size)
      counter[word.size] += 1 
    else
      counter[word.size] = 1
    end
  end

  counter
end
```

### 7. Letter Counter (Part 2)

Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

Examples

```ruby
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
```

#### Solution: 

```ruby
def word_sizes(string)
  counter = Hash.new(0)
  words = string.split

  words.each do |word|
    size = word.delete('^a-zA-Z').size
    counter[size] += 1
  end

  counter
end
```

### 8. Alphabetical Numbers

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

```ruby
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
```

#### Solution: 

```ruby
EQUIVALENTS = {
              0=>'zero', 1=>'one', 2=>'two', 3=>'three', 4=>'four', 5=>'five',
              6=>'six', 7=>'seven', 8=>'eight', 9=>'nine', 10=>'ten',
              11=>'eleven', 12=>'twelve', 13=>'thirteen', 14=>'fourteen',
              15=>'fifteen', 16=>'sixteen', 17=>'seventeen', 18=>'eighteen',
              19=>'nineteen'
            }

def alphabetic_number_sort(array)

  words = array.map { |n| EQUIVALENTS[n] }

  words.sort.map { |word| EQUIVALENTS.key(word) }
end
```

### 9. ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

Examples:

```ruby
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
```

#### Solution: 

```ruby
def crunch(string)
  string.squeeze
end
```

Further Explorations

```ruby
def crunch(string)
  return string if string.empty?

  chars = string.chars
  index = 0

  until index + 1 == chars.length
    if chars[index] == chars[index + 1]
      chars.delete_at(index)
      next
    end
    index += 1
  end
  chars.join
end
```

### 10. Bannerizer

Write a method that will take a short line of text, and print it within a box.

Example:

```ruby
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
print_in_box('')
+--+
|  |
|  |
|  |
+--+
```
You may assume that the input will always fit in your terminal window.

### Solution:

```ruby
def print_in_box(string)
  puts '+-' + '-' * string.length + '-+'
  puts '| ' + ' ' * string.length + ' |'
  puts '| ' + string + ' |'
  puts '| ' + ' ' * string.length + ' |'
  puts '+-' + '-' * string.length + '-+'
end
```
