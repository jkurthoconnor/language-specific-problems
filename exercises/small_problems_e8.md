Small Problems: [Easy 8](https://launchschool.com/exercise_sets/a5137f5a)

### 1. Sum of Sums

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

Examples:

```ruby
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
```


### Solution:

```ruby
def sum_of_sums(array)
  holder = []
  size = 1

  loop do
    holder.push(array[0, size])
    size += 1
    break if size > array.length
  end


# or
def sum_of_sums(array)
  array.map.with_index { |_, ind| array[0..ind] }.flatten.reduce(:+)
end
```

### 2. Madlibs

Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

### Solution:

```ruby
def madlibs
  words = { :noun => '', :verb => '', :adverb => '', :adjective => '' }

  words.each_key do |key|
    word = ''
    loop do
      puts "Please enter a #{key}"
      word = gets.chomp
      if word =~ /[a-z]/i
        words[key] = word
        break
      end
    end
  end

  puts "Your #{words[:adjective]} #{words[:noun]} #{words[:verb]} #{words[:adverb]}!"
end
```

### 3. Leading Substrings

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

Examples:

```ruby
substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
```


### Solution:

```ruby
def substrings_at_start(string)
  substrings = []

  size = 1
  while size <= string.length
    substrings.push(string[0, size])
    size += 1
  end

  substrings
end
```

### 4. All Substrings

Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the previous exercise:

Examples:

```ruby
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
```

### Solution:

```ruby
def substrings(string)
  start = 0
  subs = []

  while start < string.length
    size = 1
    while size + start <= string.length
      subs.push(string[start, size])
      size += 1
    end
    start += 1
  end

  subs
end
```

### 5. Palindromic Substrings

Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

Examples:

```ruby
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
] 
```

### Solution:

```ruby
def substrings(string)
  start = 0
  subs = []

  while start < string.length
    size = 1
    while size + start <= string.length
      subs.push(string[start, size])
      size += 1
    end
    start += 1
  end

  subs
end

def palindromes(string)
  subs = substrings(string)
  subs.select { |sub| (sub.length > 1) && (sub == sub.reverse) }
end
```

### 6. fizzbuzz

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Example:

```ruby
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
```

### Solution:

```ruby
def fizzbuzz(start, stop)
  result = []
  (start..stop).each do |n|
    if (n % 3).zero? && (n % 5).zero?
      result.push('FizzBuzz')
    elsif (n % 3).zero? 
      result.push('Fizz')
    elsif (n % 5).zero?
      result.push('Buzz')
    else
      result.push(n)
    end 
  end
  result.join(', ')
end
```

### 7. Double Char (Part 1)

Write a method that takes a string, and returns a new string in which every character is doubled.

Examples:
```ruby
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == '' 
```

### Solution:

```ruby
def repeater(string)
  index = 0
  end_point = string.length * 2

  while index < end_point
    string.insert(index, string[index])
    index += 2
  end

  string
end

# or

def repeater(string)
  doubled = ''
  string.each_char do |char|
    doubled << (char*2)
  end

  doubled
end
```

### 8. Double Char (Part 2)

Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:

```ruby
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
```

### Solution:

```ruby
def double_consonants(string)
  doubled = ''

  string.each_char do |char|
    if char =~(/[a-z&&[^aeiou]]/i)
      doubled << (char *2)
    else
      doubled << (char)
    end
  end

  doubled
end
```

### 9. Convert number to reversed array of digits

Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

```ruby
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # Note that zeros get dropped!
reversed_number(1) == 1
```

### Solution:

```ruby
def reversed_number(int)
  int.to_s.reverse.to_i
end
```

### Further Exploration
See if you can transform our solution into a one-liner.

### Solution:
My original solution seems to meet the requirements of the Further Exploration, so here's another way:

```ruby
def reversed_number(int)
  reversed = ''
  digits = int.to_s

  digits.each_char { |char| reversed.prepend(char) }
  reversed.to_i
end
```

### 10. Get The Middle Character

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

Examples:

```ruby
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
```

### Solution:

```ruby
def center_of(string)
  base_index = string.size / 2
  string.size.odd? ? string[base_index] : string[base_index - 1, 2]
end
```

