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

### 6.

```ruby

```

#### Solution: 

```ruby

```

Further Explorations

```ruby

```
### 

```ruby

```

#### Solution: 

```ruby

```

Further Explorations

```ruby

```
### 

```ruby

```

#### Solution: 

```ruby

```

Further Explorations

```ruby

```
### 

```ruby

```

#### Solution: 

```ruby

```

Further Explorations

```ruby

```
