puts "How old are you?"
age = gets.chomp
n = 10
while n <= 100
  puts "In #{n} years, you will be #{age.to_i + n} years old."
  n = n + 10
end
puts "In #{n} years, you will almost certainly NOT be."
