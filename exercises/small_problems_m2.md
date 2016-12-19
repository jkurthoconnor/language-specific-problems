101-109: Small Problems:
[Medium 2](https://launchschool.com/exercise_sets/4eba5cca)

### 1) Longest Sentence

Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

### Solution:
```ruby
def find_longest_sentence(text)
  sentences = text.split(/[.!?]\s/)
  hash = {}
  sentences.each { |sent| hash[sent.split.count] = sent }
  result = hash.assoc(hash.keys.max)
  size, sentence = result[0], result[1]
  "Longest sentence consists of #{size} words and is: '#{sentence}'"
end

content = File.read('scrap_sample_text.txt')
puts find_longest_sentence(content)
```
### 2) ABCs
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

### Solution:
```ruby
BLOCKS = {'B'=>'O', 'X'=>'K', 'D'=>'Q', 'C'=>'P', 'N'=>'A', 'G'=>'T',
         'R'=>'E', 'F'=>'S', 'J'=>'W', 'H'=>'U', 'V'=>'I', 'L'=>'Y',
         'Z'=>'M'}

def block_word?(string)
  blocks = BLOCKS.clone
  string.upcase.chars.each do |ltr|
    return false unless blocks.flatten.include?(ltr)
    blocks.delete(ltr) || blocks.delete(blocks.key(ltr))
  end
  true
end
```

### 3)
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples
```ruby
letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
```

### Solution:
```ruby
def letter_percentages(string)
  letters = string.chars.select { |char| char =~ /[a-z]/i }
  up = letters.count { |ltr| ltr == ltr.upcase }
  low = letters.size - up
  neither = string.size - letters.size

  { lowercase: (low.to_f/string.size) * 100,
    uppercase: (up.to_f/string.size) * 100,
    neither: (neither.to_f/string.size) * 100 }
end
```

### 4)

Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).


Examples:
```ruby
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
```

### Solution:
```ruby
def balanced?(string)
  opening_parens = 0
  closing_parens = 0
  string.chars.each do |char|
    opening_parens += 1 if char =~ /\(/
    closing_parens += 1 if char =~ /\)/
    return false if closing_parens > opening_parens
  end
  opening_parens == closing_parens
end
```
### 5)
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:
```ruby
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
```

### Solution:
```ruby
def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort

  return :invalid if (sides.any? { |n| n <= 0 }) ||
                     (sides[0] + sides[1] <= sides[2])

  if sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 2 && (sides[0] == sides[1] || sides[1] == sides[2])
    :isosocles
  elsif sides.uniq.size == 3
    :scalene
  end
end
```

### 6)
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

Examples:
```ruby
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
```

###Solution:
```ruby
def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid unless (angles.reduce(:+) == 180) && angles.none? { |a| a < 1 }

  if angles.any? { |a| a == 90 }
    :right
  elsif angles.any? { |a| a > 90 }
    :obtuse
  else
    :acute
  end
end
```

### 7)
Write a method that returns the number of Friday the 13ths in the year passed in as an argument. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom), and you may assume that the same calendar will remain in use for the foreseeable future.

Examples:
```ruby
friday_13th?(2015) == 3
friday_13th?(1986) == 1
friday_13th?(2019) == 2
```

### Solution:
```ruby
require 'date'

def friday_13th?(year)
  (1..12).each.with_object([0]) do |month, count|
    count[0] += 1 if Date.new(year, month, 13).friday?
  end.first
end
```

### 8)
### 9) Bubble Sort

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

Examples:

```ruby
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
```

#### Solution:

```ruby
def bubble_sort!(array)
  loop do
    initial_state = array.clone
    array.each_cons(2).with_index do |span, index|
      if span[0] > span[1]
        array.insert(index, array.delete_at(index + 1))
      end
    end
    break if initial_state == array
  end
  array  
end
```
### 10)
