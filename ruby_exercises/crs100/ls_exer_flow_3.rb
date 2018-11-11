puts "Enter a number from 0 to 100."
num = gets.chomp.to_i
if (num >= 0) && (num <= 50)
  puts "Your number (#{num}) is between 0 and 50."
elsif (num >= 51) && (num <= 100)
  puts puts "Your number (#{num}) is between 51 and 100."
else
  puts "Your number (#{num}) is NOT between 0 and 100."
end
