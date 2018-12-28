# final_introductory_exercises

def spacer(n)
  puts "\n"*n
end

puts "Exercise 1"
#1 Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.
  #1. (32 * 4) >= 129
  #2. false != !true
  #3. true == 4
  #4. false == (847 == '874')
  #5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false

puts "\nPredicton: (32 * 4) >= 129 will return false.  Actual return:  #{(32 * 4) >= 129}"
puts "Predicton: false != !true will return false.  Actual return: #{false != !true}"
puts "Predicton: true == 4 will return false.  Actual return: #{true == 4}"
puts "Predicton: false == (847 == '874') will return true.  Actual return: #{false == (847 == '874')}"
puts "Predicton: (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false will return true.  Actual return: #{(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false}"

spacer(3)

puts "Exercise 2"
#2 "Write a method that takes a string as argument. The method should return the all-caps version of the string, only if the string is longer than 10 characters. "

def caps_plus_10(str)
  if str.length > 10
    puts "\nBecause your string is longer that 10 characters, here it is in all caps: #{str.upcase}"
  else
    puts "\nYour string is too short.  No caps for you!"
  end
end

puts "\nPlease enter a string.\n"
str = gets.chomp
caps_plus_10(str)


spacer(3)

puts "Exercise 3"
#3 "Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100."

puts "\nPlease enter a number from 0 to 100.\n"
num = gets.chomp.to_i
if (num >= 0 && num <= 50)
  puts "\n#{num} is between 0 and 50."
elsif (num >= 51 && num <= 100)
  puts "\n#{num} is between 51 and 100."
elsif num > 100
  puts "\n#{num} is greater than 100. Please play by the rules."
else num < 0
  puts "\n#{num} is less than 0. Please play by the rules."
end

spacer(3)

puts "Exercise 4"
#4 "What will each block of code below print to the screen?"

#1. '4' == 4 ? puts("TRUE") : puts("FALSE")

#2. x = 2
#   if ((x * 3) / 2) == (4 + 4 - x - 3)
#     puts "Did you get it right?"
#   else
#     puts "Did you?"
#   end
#
#3. y = 9
#   x = 10
#   if (x + 1) <= (y)
#     puts "Alright."
#   elsif (x + 1) >= (y)
#     puts "Alright now!"
#   elsif (y + 1) == x
#     puts "ALRIGHT NOW!"
#   else
#     puts "Alrighty!"
#   end"

puts "\nPreciction: block 1 will return 'FALSE'"
puts "Predicton: block 2 will return 'Did you get it right?'"
puts "Predicton: block 3 will return 'Alright now!'"

spacer(3)

puts "Exercise 5"
#5 "Rewrite your program from exercise 3 using a case statement. Wrap each statement in a method and make sure they both still work."
puts "\nThis is the rewrite of \#3 using case a statement and wrapping each Boolean expression in a method:"

def evaluate(num)
  if (num >= 0) && (num <= 50)
    1
  elsif (num >= 51) && (num <= 100)
    2
  elsif num > 100
    3
  else
    4
  end
end

puts "\nPlease enter a number from 0 to 100.\n"
num = gets.chomp.to_i
evaluate(num)
case evaluate(num)
when 1
  puts "\n#{num} is between 0 and 50."
when 2
  puts "\n#{num} is between 51 and 100."
when 3
  puts "\n#{num} is greater than 100. Please play by the rules."
when 4
  puts "\n#{num} is less than 0. Please play by the rules."
end

spacer(3)

puts "Exercise 6"
#6 "When you run the following code...

    #def equal_to_four(x)
    #  if x == 4
    #    puts "yup"
    #  else
    #    puts "nope"
    #end

    #equal_to_four(5)
#You get the following error message..test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end
#Why do you get this error and how can you fix it?"
puts "\nThe error is thrown because the conditional sequence in the code lacks an 'end'.  The 'unexpected end-of-input' statement refers to encountering an end to the method definition before encountering and end to the contained conditional.  This can be fixed by adding 'end' on the next line following 'puts \"nope\"'."
