Small Problems: [Easy 7](https://launchschool.com/exercise_sets/fd50ae9d)

### 1. Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:
```ruby
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
```

### Solution:

```ruby
def interleave(array1, array2)
  interleft = []
  index = 0

  while index < array1.length
    interleft.push(array1[index], array2[index])
    index += 1
  end

  interleft
end
```

### Further Exploration
See if you can rewrite interleave to use zip.

### Solution:

```ruby
def interleave(array1, array2)
  array1.zip(array2).flatten
end
```

### 2. Lettercase Counter

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

Examples

```ruby
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
```

### Solution:

```ruby
def letter_case_count(string)
  count = { lowercase: 0, uppercase: 0, neither: 0 }

  string.each_char do |char|
    count[:lowercase] += 1 if char =~ /[a-z]/
    count[:uppercase] += 1 if char =~ /[A-Z]/
    count[:neither] += 1 if char =~ /[^a-z]/i
  end

  count
end
```

### 3. Capitalize Words

Write a method that takes a single String argument and returns a new string that contains the original value of the argument, but the first letter of every word is now capitalized.

You may assume that words are any sequence of non-blank characters, and that only the first character of each word must be considered.

Examples

```ruby
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
```

### Solution:

```ruby
def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end
```

### Further Exploration:
Solve without String#capitalize

```ruby
def word_cap(string)
  words = string.split.map(&:downcase)
  words.map { |word| word[0].upcase + word[1..-1] }.join(' ')
end
```

### 4.
Swap Case

Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:

```ruby
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
```

### Solution:

```ruby
def swapcase(string)
  holder = []
  string.each_char do |char|
    holder.push(char.upcase) if char =~ /[a-z]/
    holder.push(char.downcase) if char =~ /[A-Z]/
    holder.push(char) if char =~ /[^a-z]/i
  end
  holder.join
end
```
### 5. Staggered Caps (Part 1)

Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

Example:

```ruby
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
```

### Solution:

### 6.

### Solution:

### 7.

### Solution:

### 8.

### Solution:

### 9.

### Solution:

### 10.

### Solution:
