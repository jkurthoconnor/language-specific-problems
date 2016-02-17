def spacer
  puts "\n"*3
end

puts 'Exercise 1:'
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq
puts numbers # displays `1, 2, 2, 3` one per line.  `uniq` is not a mutating method

spacer

puts 'Exercise 2:'

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios: 1. what is != and where should you use it? 2. put ! before something, like !user_name 3. put ! after something, like words.uniq! 4. put ? before something 5. put ? after something 6. put !! before something, like !!user_name

puts "1. `!=` is a Boolean comparison operator.  `a != b` returns the truth value of the expression 'a is not equal to b."
puts "2. Placing `!` before something changes its truth value."

puts "3. Placing `!` after something has mixed results.  Sometimes it calls a mutating version of a method, like `.uniq!`, but not every mutating method is named with a `!`.  Other times it throws an `undefined method` error.  Adding `!` to a method name doesn't change the existing method. Rather, some methods are named with `!`.  These tend to be mutating versions of other methods. '!' is really just part of some method names.  It isn't the user changing a method at the call."
puts "4. Placing `?` before something has mixed results. `?a` returns `a`; `?6` returns `6`.  But other used return syntax errors."
puts "5. Placing `?` after something has mixed results. `a?` returns an undefined method error.  But some methods are named with `?` at the end.  In those cases `?` is part of the name, much like in part #3."
puts "6. Putting '!!' before something changes its truth value twice, like a double negation."

spacer

puts 'Exercise 3:'
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.sub('important', 'urgent')

spacer

puts 'Exercise 4:'
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) #  deletes the element in slot 1, so it deletes '2'. numbers = [1, 3, 4, 5]
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # deletes the occurance of '1', so numbers = [2, 3, 4, 5]
p numbers

spacer

puts 'Exercise 5:'
# Programmatically determine if 42 lies between 10 and 100.

p (10..100).include?(42)

spacer

puts 'Exercise 6:'

# Starting with the string:
# famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.
famous_words = "seven years ago..."
famous_words_beginning = "Four score and "
famous_string = famous_words_beginning + famous_words
p famous_string
p famous_words_beginning.concat(famous_words) # or `p famous_words_beginning << (famous_words)`

spacer

puts 'Exercise 7:'
# Fun with gsub:

# def add_eight(number)
#   number + 8
# end

# number = 2

# how_deep = "number"
# 5.times { how_deep.gsub!("number", "add_eight(number)") }

# p how_deep

# # This gives us a string that looks like a "recursive" method call:

# "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

# If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call

# eval(how_deep)


# what will be the result?
puts "2 will be added to 8 * 5.  => 42"

spacer

puts 'Exercise 8'
# If we build an array like this:

# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:

# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
p flintstones
p flintstones.flatten

spacer

puts 'Exercise 9'
# Given the hash below

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, # "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
mr_rubble = flintstones.select { |k,v| k == "Barney" }.to_a.flatten # without modifying flintstones
p mr_rubble
flintstones.select! { |k,v| k == "Barney" }.to_a.flatten # modifying flintstones

spacer

puts 'Exercise 10'
# Given the array below

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in # the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones.map!.with_index{ |n, i| n + ' ' + i.to_s }
name_index = flintstones.map { |n| n.split }
flinstones_hsh = name_index.to_h
p flinstones_hsh

spacer
