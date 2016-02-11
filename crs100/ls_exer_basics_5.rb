f5 = 5 * 4 * 3 * 2 * 1
f6 = 6 * f5
f7 = 7 * f6
f8 = 8 * f7
puts "The factorial of 5 is: #{f5}"
puts "The factorial of 6 is: #{f6}"
puts "The factorial of 7 is: #{f7}"
puts "The factorial of 8 is: #{f8}"

puts "Now let's try the same sequence using a recursive method!"
def factorial(number)
  if number <= 1
    1
  elsif number < 0
    "How do you expect me to provide the factorial for a number less than 0?"
  else
    number * factorial(number - 1)
  end
end
puts factorial(5)
puts factorial(6)
puts factorial(7)
puts factorial(8)
