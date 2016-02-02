puts "Enter a number"
num = gets.chomp.to_i


if num == 5
  puts "Your number is 5"
elsif num == 6
  puts "Your number is 6"
else
  puts "Your number is neither 5 nor 6.  It is #{num}."
end

puts "As I said. Your number is neither 5 nor 6.  It is #{num}." if (num != 5) && (num != 6)

unless num == 5
  puts "Your number is NOT 5."
end

num == 5 || num == 6 ? puts("Your number is absolutely either 5 or 6.") : puts("Your number is in no way either 5 or 6.")

case num
when 5
  puts "Your number is 5"
when 6
  puts "Your number is 6"
else
  puts "Your number is neither 5 nor 6"
end

if num
  puts "In flow control, any expression evaluates to true unless it is nil or false.  That's why this string is appearing now.  The conditional was simply 'if num' !!!!"
end
