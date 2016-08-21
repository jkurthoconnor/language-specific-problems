Small Problems: Easy 5
LaunchSchool
https://launchschool.com/exercise_sets/0d6d6521

### ASCII String Value
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


### After Midnight (pt 1)
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

#### Solution: ***in progress***

```ruby
# handle negative minute values

def time_of_day(minutes)
  hours, mins = minutes.divmod(60)
  hours = (hours / 24) if hours > 24
  "#{format( "%02d", hours)}:#{format("%02d", mins)}"
end


p time_of_day(0) # == "00:00"
p time_of_day(-3) # == "23:57"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) # == "00:03"
p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"

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
### 

```ruby

```

#### Solution: 

```ruby

```

Further Explorations

```ruby

```
