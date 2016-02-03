i = 0
loop do #loop  returns nil
  i += 2
  if i == 4
    next #skip rest of current iteration
  end
  puts i
  if i == 10
    break #break out of loop
  end
end

puts "From what number would you like to count down to 0?"
number = gets.chomp.to_i
same_number = number
puts "Here's the countdown using a while loop."
while number >= 0 #while loop returns nil
  puts number
  number -= 1
end
puts "Done!!"
puts "Here's the same countdown using an until loop."
until same_number < 0 #until  loop
  puts same_number
  same_number -= 1
end
puts "Done, again."

loop do #do/while loop used when code should run at least once before a condition is evaluated; returns nil
  puts "Do you want to see this again?"
  answer = gets.chomp.downcase
  if (answer != 'y') && (answer != 'yes')
    break
  end
end

array = [1, 2, 3, 4, 5]
for i in array do #for loop, loops over a collection; returns the collection of elements
  puts i
end
puts "Done"

# conditionals in loops
x = 0
while x <= 15
  if x == 7
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end
