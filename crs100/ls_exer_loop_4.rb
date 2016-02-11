def recursive_countdown(number)
  puts number
  if number > 0
    recursive_countdown(number - 1)
  end
end

puts "From what number would you like to countdown?"
number = gets.chomp.to_i
puts "Here you go:"
recursive_countdown(number)

#the non-recursive approach
def countdown(number)
  while number >= 0
    puts number
    number -=1
  end
end

puts "From what number would you like to countdown?"
number = gets.chomp.to_i
puts "Here you go:"
countdown(number)
