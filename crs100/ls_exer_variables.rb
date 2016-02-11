def spacer(n)
  puts "\n"*n
end


puts "Exercise 1"
spacer(1)

#1 "Write a program called name.rb that asks the user to type in their name and then prints out a greeting message with their name included."

#name.rb
puts "What is your name?"
name = gets.chomp
puts "Hello #{name}.  Very nice to see you again."

spacer(3)

puts "Exercise 2"
spacer(1)

#Write a program called age.rb that asks a user how old they are and then tells them how old they will be in 10, 20, 30 and 40 years. Below is the output for someone 20 years old."

#age.rb

def age_add(age, inc)
  while inc <= 40
    puts "In #{inc} years, you will be #{age + inc}."
    inc = inc + 10
  end
end
puts "If you don't mind me asking, how old are you?"
age =  gets.chomp.to_i
age_add(age, 10)

spacer(3)

puts "Exercise 3"
spacer(1)

#3 "Add another section onto name.rb that prints the name of the user 10 times. You must do this without explicitly writing the puts method 10 times in a row. Hint: you can use the times method to do something repeatedly."

#name_2.rb

puts "What is your name?"
name = gets.chomp
puts "Hello #{name}.  Very nice to see you again."
10.times do
  puts name
end

spacer(3)

"Exercise 4"
spacer(1)

#4 "Modify name.rb again so that it first asks the user for their first name, saves it into a variable, and then does the same for the last name. Then outputs their full name all at once."

#name_3.rb

puts "What is your first name?"
first = gets.chomp
puts "And what is your last name?"
last = gets.chomp
full = first + ' ' + last
puts "Hello #{full}.  Very nice to see you again."
10.times do
  puts full
end

spacer(3)

puts "Exercise 5"
spacer(1)

#5 "Look at the following programs...

  #x = 0
  #3.times do
    #x += 1
  #end
  #puts x
  #and...

  #y = 0
  #3.times do
    #y += 1
    #x = y
  #end
  #puts x

  #What does x print to the screen in each case? Do they both give errors? Are the errors  #different? Why?"

  puts "The first program prints 3 to the screen.  The second program throws an exception because x receives its assignment only within do ... end, but it is called outside of that block."

  spacer(3)

  puts "Exercise 6"
  spacer(1)

  #6 "What does the following error message tell you?

  # NameError: undefined local variable or method `shoes' for main:Object
    # from (irb):3
    # from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'"

  puts "The message indicates that the program in question refers to 'shoes', but this term is neither assigned as a variable nor defined as a method."
