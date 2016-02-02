a = [1, 2, 3, 4]

def mutate(array)
  array.pop
end
def not_mutated(array)
  array.last
end
p "Array before calling mutate method: #{a}"
mutate(a)
p "Array after calling mutate method: #{a}"
p "Array after calling the not_mutated method #{a}"


def say(text = "This string is the default parameter, used when no argument is passed with method call.")
  puts "#{text}!!!"
end

say("Hello world")
say
say("I'm using a say method")
say
# puts text # as expected, throws error: undefined method
