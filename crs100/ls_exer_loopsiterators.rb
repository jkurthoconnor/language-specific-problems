def spacer(n)
  puts "\n"*n
end


puts "Exercise 1"
#1 "What does the each method in the following program return after it is finished executing?
    #x = [1, 2, 3, 4, 5]
    #x.each do |a|
    #  a + 1
    #end
puts "The each method returns the original array after completion, so => [1, 2, 3, 4, 5]."

puts "Exercise 2"
#2 "Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user."

while true
  puts "Have you heard enough from me yet?"
  response = gets.chomp
  if response == 'STOP'
    puts "Fine. I can take a hint."
    break
  end
end


puts "Exercise 3"
#3 "Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array."
arr = ["apples", "potatoes", "onions"]
arr.each_with_index { |item, index| puts "Array slot #{index} contains '#{item}'" }


puts "Exercise 4"
#4 "Write a method that counts down to zero using recursion."

def recursive_countdown(number)
    puts number
    if number > 0
      recursive_countdown(number - 1)
    end
end
recursive_countdown(100)

def countdown(number)
  while true
    puts number
    if number <= 0
      break
    else
      number -= 1
    end
  end
end
countdown(10)
#
