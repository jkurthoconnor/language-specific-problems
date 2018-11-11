puts "Enter a number from 0 to 100."
num = gets.chomp.to_i
answer = case
when num >= 0 && num <= 50
  "Your number (#{num}) is between 0 and 50."
when num >= 51 && num <= 100
  "Your number (#{num}) is between 51 and 100."
else
  "Your number (#{num}) is NOT between 0 and 100."
end
 puts answer

def compare (number)
  if number >= 0 && number <= 50
    1
  elsif number >= 51 && number <= 100
    2
  else
    3
  end
end

puts "Let's play again using a comparison method."
puts "Enter a number from 0 to 100."
num = gets.chomp.to_i
answer = case
when compare(num) == 1
  "Your number (#{num}) is between 0 and 50."
when compare(num) == 2
  "Your number (#{num}) is between 51 and 100."
when compare(num) == 3
  "Your number (#{num}) is NOT between 0 and 100."
end
puts answer
