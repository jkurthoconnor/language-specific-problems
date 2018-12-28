# method intended to mirror behavior of Array#select.

def select(array)
  selected = []
  index = 0
  while index < array.length
    selected.push array[index] if yield(array[index])
    index += 1
  end
  
  selected
end

puts "using select() method:"
p select(['apple', 'banana', 'plum']) { |food| food.include?('a') }

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

puts "using Array#select:"

p ['apple', 'banana', 'plum'].select { |food| food.include?('a') }

array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }      # => [1, 3, 5]
p array.select { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p array.select { |num| num + 1 }