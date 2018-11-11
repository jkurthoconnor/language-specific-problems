def spacer(n)
  puts "\n"*n
end


puts "Exercise 1"
#1 "Write a program that prints a greeting message. This program should contain a method called greeting that takes a name as its parameter and returns a string."

def greeting(name)
  puts "\nHi, #{name}, very nice to meet you."
end

puts "\nPlease enter your name."
name = gets.chomp
greeting(name)

spacer(3)

puts "Exercise 2"
#2"What do the following expressions evaluate to?"

#1. x = 2

#2. puts x = 2

#3. p name = "Joe"

#4. four = "four"

#5. print something = "nothing"

a = "x = 2"
b = ["puts x = 2"]
c = ["p name = 'Joe'"]
d = "four = 'four'"
e = "print something = 'nothing'"

puts "\n#{a} evaluates to 2."
puts "\n#{b} evaluates to nil."
puts "\n#{c} evaluates to Joe."
puts "\n#{d} evaluates to four."
puts "\n#{e} evaluates to nil."

spacer(3)

puts "Exercise 3"
#3 "Write a program that includes a method called multiply that takes two arguments and returns the product of the two numbers."

def multiply(n1, n2)
  p n1 * n2
end

puts "\nEnter the first number you would like to multiply."
n1 = gets.chomp.to_i
puts "\nEnter the second number you would like to multiply."
n2 = gets.chomp.to_i
puts "\n#{n1} x #{n2} equals #{multiply(n1, n2)}"

spacer(3)

puts "Exercise 4"
#4 "What will the following code print to the screen?"
  #def scream(words)
  #  words = words + "!!!!"
  #  return
  #  puts words
  #end
  #
  #scream("Yippeee")
puts "\nThe code will *not* print 'Yippeee!!!!''  'Return' occurs before the 'puts', so nothing is put on the screen."

spacer(3)

puts "Exercise 5"
#5 "1) Edit the method in exercise #4 so that it does print words on the screen. 2) What does it return now?"

def scream(words)
  words = words + "!!!!"
  puts "\n#{words}"
end
scream("Yippeee")
puts "\nAlthough the method prints to screen now (see above) it returns nil."

spacer(3)

puts "Exercise 6"
#6 "What does the following error message tell you?"
  #ArgumentError: wrong number of arguments (1 for 2)
  #  from (irb):1:in `calculate_product'
  #  from (irb):4
  #  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
puts "'calculate_product' requires two argumets but the code only passed one."
