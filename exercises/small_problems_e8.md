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

  holder.flatten.reduce(&:+)
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
      puts "Please enter a #{key.to_s}"
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

### 1. 


### Solution:

```ruby

```

### 1. 


### Solution:

```ruby

```

### 1. 


### Solution:

```ruby

```

### 1. 


### Solution:

```ruby

```

### 1. 


### Solution:

```ruby

```

### 1. 


### Solution:

```ruby

```

