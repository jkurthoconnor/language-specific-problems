def spacer
  puts "\n"*3
end

puts "Exercise 1"
# For this exercise, write a one-line program that creates the following output 10 times, with # the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

str = "The Flintstones Rock!"
space = " "
n = 0
30.times do
  puts "#{(space*n) + str}"
  n += 1
end
# one line? OK
30.times { |n| puts (' ' * n) + "The Flintstones Rock!" }
spacer

puts "Exercise 2"
# Create a hash that expresses the frequency with which each letter occurs in this string:
# statement = "The Flintstones Rock"
# ex: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"
frequency = {}
letters = statement.split('').sort
letters.each do |ltr|
  if frequency.key?(ltr)
    frequency[ltr].push ltr
  else
    frequency[ltr] = [ltr]
  end
end
frequency.delete_if { |k| k == ' ' }
frequency.each { |k, v| frequency[k] = v.length }
p frequency


spacer

puts "Exercise 3"
# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?
puts "The problem is that the original code tried to append the result of a mathematical operation to the end of a string using '+'.  '+' can be used as either a numerical operator OR a string operator.  The interpreter can't make sense of the line of code; which way is '+' supposed to be used?  The fix is to add '.to_s' to the end of the equation.  Here are results of the corrected code: '#{"the value of 40 + 2 is " + (40 + 2).to_s}'"


spacer

puts "Exercise 4"
# What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index} #{numbers.inspect} #{number}"
  numbers.shift(1)
end

puts "\nBefore checking in irb I thought this would print each number and then remove it from the numbers array, so at the end of each iteration it would return the most recently 'shifted' number. Now that I've run it and read the solution I understand what is happening.  The array size changes immediately with the .shift call, but when the 3rd iteration begins, the interpreter find noting in the 2 index.  Basically, with the immediate shift, numbers 2 and 4 are skipped because they slide into the index that had just had its element removed with the .shift call."

# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

puts "\nHaving understood the previous explanation, I was able to predict correctly that the second block of code would return \n1\n2."

spacer


puts "Exercise 5"
# Alan wrote the following method, which was intended to show all of the factors of the input number:

# def factors(number)
#   dividend = number
#   divisors = []
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end
# Alyssa noticed that this will fail if you call this with an input of 0 or a negative number and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

# Bonus 1

# What is the purpose of the number % dividend == 0 ?

# Bonus 2

# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?


spacer

puts "Exercise 6"
# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element
#   buffer.shift if buffer.size >= max_buffer_size
#   buffer
# end

# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   buffer = input_array + [new_element]
#   buffer.shift if buffer.size >= max_buffer_size
#   buffer
# end
puts "The return value of each method is the same, but the effect is accomplished differently. In the first case, the use of `<<` mutates buffer, so it actually changes the content of memory to which `buffer` points. So if there were, say a `buffer_copy` which had been assigned like `buffer_copy = buffer`, then `buffer_copy` would hold the new value as well.\nIn the second case, `buffer = input_array + [new_element]` actually reassigns the memory to which `buffer` is pointing. So, e.g. `buffer_copy`, would return the old value."

spacer

puts "Exercise 7"
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

# limit = 15

# def fib(first_num, second_num)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
# result = fib(0, 1)
# puts "result is #{result}"
# How would you fix this so that it works?

puts "`limit` is assigned prior to/outside the method definition and it is not passed into the method as an argument.  As a result, `fib` has no idea what `limit` is supposed to refer to and the interpreter returns an undefined local variable error. Adding `limit` as one of the arguments passed into `fib` fixes this error, but unless the goal is to simply print the last digit in defined sequence we'll need to capture each sum in an array. My changes do this."


def fib(first_num, second_num, limit, destination)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
    destination.push sum
  end
  destination
end
sequence = []
puts fib(0, 1, 15, sequence)
spacer


puts "Exercise 8"
# In another example we used some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize! This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.

# Write your own version of the rails titleize implementation.
# iterate oneach word (split...each do)
# capitalize 1st word in split array
# unless word is a preposition, capitalize it

title = "this is the title of a famous book or film"
exceptions = ['a', 'an', 'the', 'then', 'but','for', 'or', 'of', 'in', 'if', 'is']
def titleize!(string, exceptions)
  capitalized = string.split.each { |wrd| wrd.capitalize! }
  capitalized.each do |wrd|
    if exceptions.include?(wrd)
      wrd.downcase!
    end
  end
  capitalized.join(' ')
end
p titleize!(title, exceptions) # why aren't the exceptions downcased in the output?





spacer


puts "Exercise 9"
# Given the munsters hash below

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# hint: try using a case statement along with Ruby Range objects in your solution

## pseudocode: .each_pair do |k, v|
# if v at k  == range, then add hash[k] = new v}

spacer
