#recursion: "the act of calling a method from within itself"
def doubler(start)
  puts start * 2
end


def doubler_recursive(start)
  puts start
  if start < 100
    doubler_recursive(start * 2)
  end
end

doubler_recursive(1)


def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end
number = 6
fibonacci(number)
puts "Integer number #{number} in the fibonacci sequence is #{fibonacci(6)}"


puts "Let's try factorials using a recursive method!"
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
