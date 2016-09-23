
# typical behavior of `reduce` to mimic

# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end
# 
# # => 6
# 
# [1, 2, 3].reduce(10) do |acc, num|
#   acc + num
# end
# 
# # => 16


# method implementation

def reduce(array, collector=0)
  index = 0

  while index < array.length
    collector = yield(collector, array[index])
    index += 1
  end
  
  collector
end

# method invocation
array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # 15
p reduce(array, 10) { |acc, num| acc + num }                # 25
p reduce(array, 15) { |acc, num| acc + num }                # 30
p reduce(array) { |acc, num| acc + num if num.odd? }        # NoMethodError: undefined method `+' for nil:NilClass