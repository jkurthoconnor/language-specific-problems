def spacer(n)
  puts "\n"*n
end


puts "Exercise 1"
spacer(1)
#1 "Add two strings together that, when concatenated, return your first and last name as your full name in one string."

first = 'Tony'
last = 'Stark'
puts "#{first} #{last}"
spacer(3)

puts "Exercise 2"
spacer(1)

#2 "Use the modulo operator, division, or a combination of both to take a 4 digit number and find 1) the thousands number 2) the hundreds 3) the tens and 4) and the ones."

puts "Enter a four digit number."
num = gets.chomp.to_i
thousands = num / 1000
hundreds = (num % 1000) / 100
tens = (num % 100) / 10
ones = (num % 10)
puts "The thousands unit of #{num} is: #{thousands}"
puts "The hundreds unit of #{num} is: #{hundreds}"
puts "The tens unit of #{num} is: #{tens}"
puts "The ones unit of #{num} is: #{ones}"


spacer(3)

puts "Exercise 3"
spacer(1)
#3 "Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen."

movies = {movie_1: 1924, movie_2: 1967, movie_3: 2001, movie_4: 2016}
movies.each { |k, v| puts v}

spacer(3)

puts "Exercise 4"
spacer(1)
#4 "Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3."

dates = []
movies.each do |k, v|
  dates.push v
end
puts dates

spacer(3)

puts "Exercise 5"
spacer(1)
#5 "Write a program that outputs the factorial of the numbers 5, 6, 7, and 8."

def factorial(num)
  if num < 0
    puts "I can't create the factorial for a negative number."
  elsif num <= 1
    1
  else
    num * factorial(num - 1)
  end
end

puts factorial(5)
puts factorial(6)
puts factorial(7)
puts factorial(8)

spacer(3)

puts "Exercise 6"
spacer(1)
#6 "Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen."
ruby ls_exer_basics.rb

spacer(3)

puts "Exercise 7"
spacer(1)

spacer(3)
