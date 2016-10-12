# Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.
# 
# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6 and 9, 10, 12, 15, and 18. The sum of these multiples is 78.
# 
# Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

class SumOfMultiples
  @@default = [3, 5]

  def initialize(numbers = [3, 5])
    @numbers = numbers
  end
  
  def self.to(limit)
    multiples = (0...limit).select do |n| 
      (n % @@default[0]).zero? || (n % @@default[1]).zero?
    end
    multiples.reduce(&:+)
  end
end

# SumOfMultiples.new
