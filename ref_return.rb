#Ruby returns evaluated result of the last line of expression UNLESS explicit return precedes it; so all four versions of add_three method below return the same integer (return in v.2 def is redundant, but in v.3 it is essential because it 'interrupts' and returns a value obtained before the last line of expression). NB: v.4, where nothing is put to screen.  Although the method returns a value, the code doesn't ask it to remember it or otherwise pay attention, so computer adds 3 to 4 and moves on.

#NB: puts returns nil, so be wary!

#v1
def add_three(number)
  number + 3
end
returned_value = add_three(4)
puts returned_value

#v2
def add_three_return(number)
  return number + 3
end
returned_value = add_three_return(4)
puts returned_value

#v3
def add_three_return_plus(number)
  return number + 3
  number + 4
end
returned_value = add_three_return_plus(4)
puts returned_value

#v4
def add_three_sans_returncapture(number)
	number + 3
end
