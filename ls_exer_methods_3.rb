def multiply(n1, n2)
  n1 * n2
end
puts "Enter the first number you'd like to multiply."
number_1 = gets.chomp.to_i
puts "Enter the second number you'd like to multiply."
number_2 = gets.chomp.to_i
#multiply(number_1, number_2)
puts "#{number_1} times #{number_2} equals #{multiply(number_1, number_2)}."
