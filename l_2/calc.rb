
# ask for 2 numbers
# ask for operation
# perform operation on numbers
# output result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to the calculator")

Kernel.puts("What's the first number you wish to use?")
num_1 = Kernel.gets().chomp
Kernel.puts("The first number is #{num_1}!")

Kernel.puts("What is the second number?")
num_2 = Kernel.gets().chomp
Kernel.puts("The second number is #{num_2}")

Kernel.puts("What operation would you like to perform? Type '1' for addition.  Type '2' for subtraction. Type '3' for multiplication.  Type '4' for division.")
operation = Kernel.gets().chomp

if operation == "1"
  puts "The result is #{num_1.to_i + num_2.to_i}"
elsif operation == "2"
  puts "The result is #{num_1.to_i - num_2.to_i}"
elsif operation == "3"
  puts "The result is #{num_1.to_i * num_2.to_i}"
else
  puts "The result is #{num_1.to_f / num_2.to_f}"
end
