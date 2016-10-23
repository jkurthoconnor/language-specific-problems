Small Problems: [Easy 6](https://launchschool.com/exercise_sets/cee7784e)

### 1. Cute angles

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes, and seconds. You should use a degree symbol (˚) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.

Examples:

```ruby
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
```

### Solution:

```ruby
DEGREE_SYMBOL = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(float_degrees)
  total_seconds = float_degrees * SECONDS_PER_DEGREE
  total_minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = total_minutes.divmod(MINUTES_PER_DEGREE)

  "#{degrees}#{DEGREE_SYMBOL}#{format('%02d', minutes)}'#{format('%02d', seconds)}\""
end
```

### 2. Delete vowels

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

Example:

```ruby
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
```

### Solution:

```ruby
def remove_vowels(array)
  array.map { |string| string.gsub(/[aeiou]/i, '') }
end
```

### 3.
### 4.
### 5.
### 6.
### 7.
### 8.
### 9.
### 10.