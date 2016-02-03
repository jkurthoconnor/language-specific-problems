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
