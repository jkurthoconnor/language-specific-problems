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
    @digits = string.chars.map(&:to_i)
  end
  
def slices(slice_size)
  raise ArgumentError if slice_size > @digits.size

  results = []
  index = 0

  until index + slice_size > @digits.size
    results << @digits[index, slice_size]
    index += 1
  end

  results
end

end
