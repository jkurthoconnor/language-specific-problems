#since all methods return a value, methods can be chained together.
def add_three(number)
  number + 3
end

add_three(5).times {puts "This will print 8 times"} #add_three(5) returns value 8; .times is called on the returned value 8, which executes the code block in its argument 8 times

#but NB: methods must be able to work with the value passed along; without ending the method with 'number + 3' the code below won't work ***because puts returns nil*** and .times can't operate on nil

def add_three_puts(number)
  puts number + 3
  number + 3
end

add_three_puts(5).times {puts "This code worked because the 1st method call ended with 'number + 3', thus passing 8 to .times.  Had method ended with a puts, it would break trying to pass nil to .times!"}

#written differently, methods can also take the return of other methods as arguments
def add(n1, n2)
  n1 + n2
end

def subtract(n1, n2)
  n1 - n2
end

def multiply(n1, n2)
  n1 * n2
end

puts multiply(add(1, 5), subtract(500, 400))
puts subtract(add(multiply(5, 100), add(99, 1)), add(100, 200))
