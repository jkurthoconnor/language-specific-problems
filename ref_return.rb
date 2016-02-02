#Ruby returns evaluated result of the last line of expression UNLESS explicit return precedes it; so all three variotions on add_three method below return the same integer (return in v.2 def is redundant, but in v.4 it is essential because it 'interrupts' and returns a value obtained before the last line of expression)

def add_three(number)
  number + 3
end

returned_value = add_three(4)
puts returned_value

def add_three_return(number)
  return number + 3
end

returned_value = add_three_return(4)
puts returned_value

def add_three_return_plus(number)
  return number + 3
  number + 4
end
returned_value = add_three_return_plus(4)
puts returned
