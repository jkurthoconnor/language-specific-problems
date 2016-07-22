Small Problems: Easy 4
LaunchSchool
https://launchschool.com/exercise_sets/d357e52b

### Short Long Short
Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

Examples:
```ruby
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
```

#### Solution: 

```ruby
def short_long_short(str1, str2)
  if str1.length < str2.length
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

### 
```ruby


```

#### Solution: 

```ruby

```

Further Explorations:

```ruby

```

