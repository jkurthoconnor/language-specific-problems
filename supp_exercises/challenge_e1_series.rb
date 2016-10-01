# Challenges: [Easy 1: Series](https://launchschool.com/exercises/3db163fb)

# Write a program that will take a string of digits and give you all the possible consecutive number slices of length n in that string.
# 
# For example, the string "01234" has the following 3-digit slices:
# 
# - 012
# - 123
# - 234
# And the following 4-digit slices:
# 
# - 0123
# - 1234
# And if you ask for a 6-digit slices from a 5-digit string, you deserve whatever you get.
# 

class Series
  def initialize(string)
    @string = string
  end
  
def slices(slice_size)
  results = []
  index = 0
  until index + slice_size > @string.length
    results.push([@string[index, slice_size]]) # need to return integers, not strings
    index += 1
  end
  results
end

end

to_four = Series.new("1234")
to_eight = Series.new("12345678")
to_four_too = Series.new("1234")
to_zero = Series.new("1234567890")

puts to_four.slices(2)
puts to_four_too.slices(4)
puts to_eight.slices(3)
puts to_zero.slices(5)