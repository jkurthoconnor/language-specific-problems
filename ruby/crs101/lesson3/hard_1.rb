def spacer
  puts "\n"*3
end

puts "Exercise 1"
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

puts "The code should return `nil` and print nothing to the screen."
if false
 greeting = “hello world”
end
greeting

spacer

puts "Exercise 2"
# What is the result of the last line in the code below?

puts "The code below will print a: 'hi there' to the screen.  This is because the `<<` mutates `informal_greeting` and `informal_greeting` has been assigned to the value of a in the greetings hash.  In other words, the code modifies the string stored as the value of greetings[:a]"

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
spacer

puts "Exercise 3"
# In other exercises we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)
puts "A will output\n one is: one\n two is: two\n three is three"

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
puts "\nA)"
puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# B)
puts "\nB will output\n one is: one\n two is: two\n three is three"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
puts "\nB)"
puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts "\nC will output\n one is: two\n two is: three\n three is one"

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
puts "\nC)"
puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

spacer

puts "Exercise 4"

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def make_uuid
  uuid = []
  hexdec = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
  uuid.push hexdec.sample(8).join
  3.times { uuid.push hexdec.sample(4).join }
  uuid.push hexdec.sample(12).join
  uuid.join('-')
end
puts make_uuid

spacer

puts "Exercise 5"

# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_a_number? to determine if a string is a number and asked Ben to use it.
# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

def dot_separated_ip_address?(input_string)
  return false if input_string.count('.') != 3
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_a_number?(word)
  end
  true
end
