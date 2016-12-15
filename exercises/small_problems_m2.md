101-109: Small Problems:
[Medium 2](https://launchschool.com/exercise_sets/4eba5cca)

### 1) Longest Sentence

Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

Example text:

### 2)
### 3)
### 4)
### 5)
### 6)
### 7)
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
