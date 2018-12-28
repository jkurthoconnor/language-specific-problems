def spacer
  puts "\n"*3
end

puts "Exercise 1"
# Show an easier way to write this array: flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
spacer

puts "Exercise 2"
#How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push 'Dino'
p flintstones
spacer

puts "Exercise 3"
# # In the previous exercise we added Dino to our array like this:
# # How can we add multiple items to our array? (Dino and Hoppy)
flintstones.push('Tony', 'Hoppy')
p flintstones

spacer

puts "Exercise 4"
# Shorten this sentence: ....remove everything starting from "house"
# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".
# As a bonus, what happens if you use the String#slice method instead?

advice = "Few things in life are as important as house training your pet dinosaur."
shortened = advice[0..37]
p shortened
p advice.slice!(0..38)
p advice
puts 'Using .slice returns the specified portion but leaves the original intact.'

spacer


puts "Exercise 5"
# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"
p statement.count('t')


spacer

puts "Exercise 6"
# Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 # character wide table of Flintstone family members, how could we easily center that title above # the table with spaces?

title = "Flintstone Family Members"
lineWidth = 40
puts title.center(lineWidth)

spacer
